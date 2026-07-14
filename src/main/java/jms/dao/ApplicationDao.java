package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jms.model.ApplicationHistory;
import jms.model.JobApplication;
import jms.model.MasterItem;
import jms.model.Offer;
import jms.util.Db;

/**
 * 就活（応募）DAO。参照系はここ、履歴の書き込みは ApplicationHistoryDao に分離。
 * 「現在の選考状況」は最新の application_history から導出する。一覧では N+1 を避けるため
 * ウィンドウ関数 ROW_NUMBER() で application ごとの最新1行に畳み込んでから JOIN する。
 */
public class ApplicationDao {

    private final ApplicationHistoryDao historyDao = new ApplicationHistoryDao();

    /**
     * 一覧検索（画面06）。
     * @param scopeClassId 担任の自クラス制限。null なら全クラス（規約 §4 の行スコープ）
     * @param stageId  現在の選考状況での絞り込み（0=指定なし）
     * @param resultId 現在の結果での絞り込み（0=指定なし）
     * @param keyword  学生氏名・かな・企業名の部分一致
     * @param eventDate 指定日に選考イベント（削除済み除く）がある応募に絞る（null=指定なし）。
     *                  メニューKPI「本日/明日の予定」からの遷移用（フェーズ7E）
     * @param deadlineWithin 承諾期限が今日から n 日以内で未回答（承諾・辞退以外）の内定を持つ
     *                  応募に絞る。期限超過も含む（0=指定なし）。メニューKPI「承諾期限」からの遷移用
     */
    public List<JobApplication> search(Integer scopeClassId, int stageId, int resultId, String keyword,
                                       LocalDate eventDate, int deadlineWithin)
            throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT a.application_id, a.student_no, s.name AS student_name, sc.class_name, " +
            "       a.company_id, co.company_name, ind.industry_name, " +
            "       a.job_type_id, jt.job_type_name, a.referral_type_id, rt.referral_type_name, " +
            "       a.entry_date, a.is_closed, " +
            "       cur.selection_stage_id, ss.selection_stage_name AS current_stage_name, " +
            "       cur.selection_result_id, sr.selection_result_name AS current_result_name, " +
            "       cur.is_final_selection AS current_final, cur.result_date AS current_result_date, " +
            "       o.offer_id, o.accept_deadline, oa.offer_acceptance_name " +
            "FROM job_application a " +
            "JOIN student s ON s.student_no = a.student_no " +
            "JOIN school_class sc ON sc.class_id = s.class_id " +
            "JOIN company co ON co.company_id = a.company_id " +
            "JOIN industry ind ON ind.industry_id = co.industry_id " +
            "JOIN job_type jt ON jt.job_type_id = a.job_type_id " +
            "JOIN referral_type rt ON rt.referral_type_id = a.referral_type_id " +
            // 応募ごとの「最新の有効な履歴」だけを 1 行に畳み込む（N+1 回避）
            "LEFT JOIN ( " +
            "   SELECT t.* FROM ( " +
            "     SELECT h.*, ROW_NUMBER() OVER ( " +
            "       PARTITION BY h.application_id " +
            "       ORDER BY h.event_at DESC, h.history_id DESC) AS rn " +
            "     FROM application_history h WHERE h.is_deleted = FALSE " +
            "   ) t WHERE t.rn = 1 " +
            ") cur ON cur.application_id = a.application_id " +
            "LEFT JOIN selection_stage ss ON ss.selection_stage_id = cur.selection_stage_id " +
            "LEFT JOIN selection_result sr ON sr.selection_result_id = cur.selection_result_id " +
            "LEFT JOIN offer o ON o.student_no = a.student_no AND o.company_id = a.company_id " +
            "LEFT JOIN offer_acceptance oa ON oa.offer_acceptance_id = o.offer_acceptance_id " +
            "WHERE 1=1 ");
        List<Object> params = new ArrayList<>();
        if (scopeClassId != null) { sql.append("AND s.class_id = ? "); params.add(scopeClassId); }
        if (stageId > 0)  { sql.append("AND cur.selection_stage_id = ? ");  params.add(stageId); }
        if (resultId > 0) { sql.append("AND cur.selection_result_id = ? "); params.add(resultId); }
        if (keyword != null && !keyword.isBlank()) {
            sql.append("AND (s.name LIKE ? OR s.name_kana LIKE ? OR co.company_name LIKE ?) ");
            String like = "%" + keyword.trim() + "%";
            params.add(like); params.add(like); params.add(like);
        }
        // フェーズ7E: メニューKPIからの遷移フィルタ
        // 「その日にイベントがある」判定は最新履歴(cur)ではなく全履歴を見る必要があるため
        // EXISTS サブクエリで書く（cur は最新1行しか持っていない。今日の説明会の後に
        // 明日の面接を登録済みだと cur は明日の行になり、今日の分が漏れる）
        if (eventDate != null) {
            sql.append("AND EXISTS (SELECT 1 FROM application_history he " +
                       "  WHERE he.application_id = a.application_id " +
                       "    AND he.is_deleted = FALSE AND DATE(he.event_at) = ?) ");
            params.add(java.sql.Date.valueOf(eventDate));
        }
        if (deadlineWithin > 0) {
            // offer / offer_acceptance は既に LEFT JOIN 済み（o / oa）なので条件を足すだけ。
            // 判定はメニューの fillDeadline と同じ: 未回答（NULL or 承諾・辞退以外）+ 期限超過も含む
            sql.append("AND o.accept_deadline IS NOT NULL " +
                       "AND o.accept_deadline <= DATE_ADD(CURDATE(), INTERVAL ? DAY) " +
                       "AND (o.offer_acceptance_id IS NULL OR oa.offer_acceptance_name NOT IN ('承諾','辞退')) ");
            params.add(deadlineWithin);
        }
        sql.append("ORDER BY a.is_closed, s.class_id, s.attendance_no, a.application_id");

        List<JobApplication> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    JobApplication a = new JobApplication();
                    a.setApplicationId(rs.getLong("application_id"));
                    a.setStudentNo(rs.getString("student_no"));
                    a.setStudentName(rs.getString("student_name"));
                    a.setClassName(rs.getString("class_name"));
                    a.setCompanyId(rs.getInt("company_id"));
                    a.setCompanyName(rs.getString("company_name"));
                    a.setIndustryName(rs.getString("industry_name"));
                    a.setJobTypeId(rs.getInt("job_type_id"));
                    a.setJobTypeName(rs.getString("job_type_name"));
                    a.setReferralTypeId(rs.getInt("referral_type_id"));
                    a.setReferralTypeName(rs.getString("referral_type_name"));
                    a.setEntryDate(rs.getString("entry_date"));
                    a.setClosed(rs.getBoolean("is_closed"));

                    String stage = rs.getString("current_stage_name");
                    a.setHasHistory(stage != null);
                    a.setCurrentStageName(stage);
                    a.setCurrentResultName(rs.getString("current_result_name"));
                    a.setCurrentFinal(rs.getBoolean("current_final"));
                    a.setCurrentResultDate(rs.getString("current_result_date"));

                    long offerId = rs.getLong("offer_id");
                    a.setHasOffer(!rs.wasNull());
                    a.setAcceptDeadline(rs.getString("accept_deadline"));
                    a.setOfferAcceptanceName(rs.getString("offer_acceptance_name"));
                    list.add(a);
                }
            }
        }
        return list;
    }

    /** 1件取得（ヘッダ + タイムライン + 内定情報）。閲覧・削除確認・変更で使う */
    public JobApplication findById(long applicationId) throws SQLException {
        String sql =
            "SELECT a.application_id, a.student_no, s.name AS student_name, s.name_kana, " +
            "       s.class_id, sc.class_name, " +
            "       a.company_id, co.company_name, ind.industry_name, " +
            "       a.recruitment_id, a.job_type_id, jt.job_type_name, " +
            "       a.referral_type_id, rt.referral_type_name, a.entry_date, a.is_closed " +
            "FROM job_application a " +
            "JOIN student s ON s.student_no = a.student_no " +
            "JOIN school_class sc ON sc.class_id = s.class_id " +
            "JOIN company co ON co.company_id = a.company_id " +
            "JOIN industry ind ON ind.industry_id = co.industry_id " +
            "JOIN job_type jt ON jt.job_type_id = a.job_type_id " +
            "JOIN referral_type rt ON rt.referral_type_id = a.referral_type_id " +
            "WHERE a.application_id = ?";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, applicationId);
            JobApplication a;
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                a = new JobApplication();
                a.setApplicationId(rs.getLong("application_id"));
                a.setStudentNo(rs.getString("student_no"));
                a.setStudentName(rs.getString("student_name"));
                a.setClassId(rs.getInt("class_id"));
                a.setClassName(rs.getString("class_name"));
                a.setCompanyId(rs.getInt("company_id"));
                a.setCompanyName(rs.getString("company_name"));
                a.setIndustryName(rs.getString("industry_name"));
                int recId = rs.getInt("recruitment_id");
                a.setRecruitmentId(rs.wasNull() ? null : recId);
                a.setJobTypeId(rs.getInt("job_type_id"));
                a.setJobTypeName(rs.getString("job_type_name"));
                a.setReferralTypeId(rs.getInt("referral_type_id"));
                a.setReferralTypeName(rs.getString("referral_type_name"));
                a.setEntryDate(rs.getString("entry_date"));
                a.setClosed(rs.getBoolean("is_closed"));
            }
            // タイムライン（is_deleted 除外・時系列降順）
            List<ApplicationHistory> timeline = historyDao.findTimeline(con, applicationId);
            a.getHistories().addAll(timeline);
            if (!timeline.isEmpty()) {
                ApplicationHistory latest = timeline.get(0);
                a.setHasHistory(true);
                a.setCurrentStageName(latest.getStageName());
                a.setCurrentResultName(latest.getResultName());
                a.setCurrentFinal(latest.isFinalSelection());
                a.setCurrentResultDate(latest.getResultDate());
            }
            // 内定情報
            Offer offer = new OfferDao().findByStudentAndCompany(con, a.getStudentNo(), a.getCompanyId());
            if (offer != null) { a.setHasOffer(true); a.setOffer(offer); }
            return a;
        }
    }

    /** 内定判定・結果更新の対象になる「最新の有効な履歴」を返す（なければ null） */
    public ApplicationHistory findLatestHistory(Connection con, long applicationId) throws SQLException {
        String sql =
            "SELECT h.history_id, h.application_id, h.selection_stage_id, h.selection_result_id, " +
            "       h.is_final_selection, h.event_at, h.place, h.interviewer_count, h.result_date, h.remarks " +
            "FROM application_history h " +
            "WHERE h.application_id = ? AND h.is_deleted = FALSE " +
            "ORDER BY h.event_at DESC, h.history_id DESC LIMIT 1";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, applicationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                ApplicationHistory h = new ApplicationHistory();
                h.setHistoryId(rs.getLong("history_id"));
                h.setApplicationId(rs.getLong("application_id"));
                h.setSelectionStageId(rs.getInt("selection_stage_id"));
                h.setSelectionResultId(rs.getInt("selection_result_id"));
                h.setFinalSelection(rs.getBoolean("is_final_selection"));
                h.setResultDate(rs.getString("result_date"));
                return h;
            }
        }
    }

    /** 応募ヘッダを INSERT し application_id を返す（履歴は Service が続けて足す） */
    public long insert(Connection con, JobApplication a) throws SQLException {
        String sql = "INSERT INTO job_application " +
                     " (student_no, company_id, recruitment_id, job_type_id, referral_type_id, entry_date, is_closed) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, a.getStudentNo());
            ps.setInt(2, a.getCompanyId());
            if (a.getRecruitmentId() == null) ps.setNull(3, Types.INTEGER);
            else ps.setInt(3, a.getRecruitmentId());
            ps.setInt(4, a.getJobTypeId());
            ps.setInt(5, a.getReferralTypeId());
            ps.setString(6, a.getEntryDate());
            ps.setBoolean(7, a.isClosed());
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                keys.next();
                return keys.getLong(1);
            }
        }
    }

    /** is_closed の切り替え（変更画面の手動チェック） */
    public void updateClosed(Connection con, long applicationId, boolean closed) throws SQLException {
        try (PreparedStatement ps = con.prepareStatement(
                "UPDATE job_application SET is_closed = ? WHERE application_id = ?")) {
            ps.setBoolean(1, closed);
            ps.setLong(2, applicationId);
            ps.executeUpdate();
        }
    }

    /** 応募ヘッダの物理削除。application_history は FK CASCADE で消える */
    public void delete(Connection con, long applicationId) throws SQLException {
        try (PreparedStatement ps = con.prepareStatement(
                "DELETE FROM job_application WHERE application_id = ?")) {
            ps.setLong(1, applicationId);
            ps.executeUpdate();
        }
    }

    // ---- フォーム用ルックアップ ----

    /** 登録フォームの学生プルダウン（担任は自クラスのみ）。id 代わりに studentNo を使うため MasterItem.subName に格納 */
    public List<MasterItem> studentsForDropdown(Integer scopeClassId) throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT s.student_no, CONCAT(sc.class_name, ' / ', s.name) AS label " +
            "FROM student s JOIN school_class sc ON sc.class_id = s.class_id WHERE 1=1 ");
        List<Object> params = new ArrayList<>();
        if (scopeClassId != null) { sql.append("AND s.class_id = ? "); params.add(scopeClassId); }
        sql.append("ORDER BY s.class_id, s.attendance_no");
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MasterItem m = new MasterItem();
                    m.setName(rs.getString("label")); // 表示名
                    m.setSubName(rs.getString("student_no")); // 値（学籍番号）
                    list.add(m);
                }
            }
        }
        return list;
    }

    /** 企業プルダウン（company_id / 企業名） */
    public List<MasterItem> companiesForDropdown() throws SQLException {
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT company_id, company_name FROM company ORDER BY sort_order, company_id");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MasterItem m = new MasterItem();
                m.setId(rs.getInt("company_id"));
                m.setName(rs.getString("company_name"));
                list.add(m);
            }
        }
        return list;
    }

    /**
     * 全募集の一覧（企業選択に応じた JS 絞り込み用）。
     * recruitment_id / company_id / job_type_id / 表示ラベルを返す。
     */
    public List<int[]> recruitmentIndex() throws SQLException {
        // [recruitment_id, company_id, job_type_id]
        List<int[]> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT recruitment_id, company_id, job_type_id FROM recruitment ORDER BY company_id, recruitment_id");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new int[]{rs.getInt(1), rs.getInt(2), rs.getInt(3)});
            }
        }
        return list;
    }

    /** 募集の表示ラベル（JS 用）。recruitment_id -> "職種名（募集n名）" */
    public List<MasterItem> recruitmentLabels() throws SQLException {
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT rec.recruitment_id, CONCAT(j.job_type_name, '（募集', rec.headcount, '名）') AS label " +
                 "FROM recruitment rec JOIN job_type j ON j.job_type_id = rec.job_type_id " +
                 "ORDER BY rec.company_id, rec.recruitment_id");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MasterItem m = new MasterItem();
                m.setId(rs.getInt("recruitment_id"));
                m.setName(rs.getString("label"));
                list.add(m);
            }
        }
        return list;
    }
}
