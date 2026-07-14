package jms.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import jms.model.MenuSummary;
import jms.util.Db;

/**
 * メインメニュー（画面16）のサマリー集計。読み取り専用。
 *
 * フェーズ7D: KPI バナーを「本日の予定／明日の予定／承諾期限7日以内／内定率」に刷新。
 * - KPI 4種は classId を渡すと自クラスに絞る（担任向け）。null なら全体
 * - カードのチップ用集計は常に全体
 * - 内定・母数は offer / student から直接数える（キャッシュ列 has_offer 等は使わない。
 *   集計の正は offer テーブル — 開発規約 §3-5）
 */
public class MenuDao {

    /** 予定の内訳カテゴリ（表示順もこの順で固定） */
    private static final String[] CATEGORIES = { "説明会", "書類・適性", "面接", "その他" };

    /** selection_stage_name をカテゴリに割り当てる CASE 式（SQL 内で共用） */
    private static final String CAT_CASE =
        "CASE WHEN ss.selection_stage_name = '説明会' THEN '説明会' " +
        "     WHEN ss.selection_stage_name IN ('書類選考','適性検査') THEN '書類・適性' " +
        "     WHEN ss.selection_stage_name LIKE '%面接' THEN '面接' " +
        "     ELSE 'その他' END";

    /**
     * @param classId 担任の担当クラスID。null なら全体集計
     */
    public MenuSummary summary(Integer classId) throws SQLException {
        MenuSummary s = new MenuSummary();
        LocalDate today = LocalDate.now();

        try (Connection con = Db.open()) {
            // --- KPI 1・2: 本日／明日の予定 ---
            s.setTodayTotal(dayTotal(con, today, classId));
            s.setTodayBreakdown(dayBreakdown(con, today, classId));
            s.setTomorrowTotal(dayTotal(con, today.plusDays(1), classId));
            s.setTomorrowBreakdown(dayBreakdown(con, today.plusDays(1), classId));

            // --- KPI 3: 承諾期限 7日以内 ---
            fillDeadline(con, s, today, classId);

            // --- KPI 4: 内定率（スコープ付き） ---
            fillRate(con, s, classId, /* forChip = */ false);

            // --- カードチップ用（常に全体） ---
            fillChips(con, s);
            fillRate(con, s, null, /* forChip = */ true); // 全体内定率（報告カード用）
        }
        return s;
    }

    /** 担任の担当クラス名（ヘッダ・ウェルカム帯の "S2A1" 表示用）。見つからなければ null */
    public String className(int classId) throws SQLException {
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT class_name FROM school_class WHERE class_id = ?")) {
            ps.setInt(1, classId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getString(1) : null;
            }
        }
    }

    // =====================================================================
    // 本日／明日の予定
    // =====================================================================

    /** 指定日に選考イベント（削除済みを除く）が入っている学生数（重複なし） */
    private int dayTotal(Connection con, LocalDate day, Integer classId) throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT COUNT(DISTINCT ja.student_no) " +
            "FROM application_history h " +
            "JOIN job_application ja ON ja.application_id = h.application_id " +
            "JOIN student st ON st.student_no = ja.student_no " +
            "WHERE h.is_deleted = FALSE AND DATE(h.event_at) = ?");
        List<Object> params = new ArrayList<>();
        params.add(Date.valueOf(day));
        if (classId != null) { sql.append(" AND st.class_id = ?"); params.add(classId); }
        return scalar(con, sql.toString(), params);
    }

    /** 指定日のイベント内訳。表示順は 説明会 → 書類・適性 → 面接 → その他。0件のカテゴリは含めない */
    private List<String> dayBreakdown(Connection con, LocalDate day, Integer classId) throws SQLException {
        // LinkedHashMap で表示順を固定
        Map<String, Integer> counts = new LinkedHashMap<>();
        for (String c : CATEGORIES) counts.put(c, 0);

        StringBuilder sql = new StringBuilder(
            "SELECT " + CAT_CASE + " AS cat, COUNT(*) AS cnt " +
            "FROM application_history h " +
            "JOIN job_application ja ON ja.application_id = h.application_id " +
            "JOIN selection_stage ss ON ss.selection_stage_id = h.selection_stage_id " +
            "JOIN student st ON st.student_no = ja.student_no " +
            "WHERE h.is_deleted = FALSE AND DATE(h.event_at) = ?");
        List<Object> params = new ArrayList<>();
        params.add(Date.valueOf(day));
        if (classId != null) { sql.append(" AND st.class_id = ?"); params.add(classId); }
        sql.append(" GROUP BY cat");

        try (PreparedStatement ps = prepare(con, sql.toString(), params);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) counts.put(rs.getString("cat"), rs.getInt("cnt"));
        }

        List<String> out = new ArrayList<>();
        for (Map.Entry<String, Integer> e : counts.entrySet()) {
            if (e.getValue() > 0) out.add(e.getKey() + " " + e.getValue());
        }
        return out;
    }

    // =====================================================================
    // 承諾期限 7日以内
    // =====================================================================

    /**
     * 未回答（承諾も辞退もしていない）の内定のうち、承諾期限が今日から7日以内のもの。
     * 期限を過ぎて未回答のものも含める（見落としの方が危険なため）。
     */
    private void fillDeadline(Connection con, MenuSummary s, LocalDate today, Integer classId)
            throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT COUNT(DISTINCT o.student_no) AS cnt, MIN(o.accept_deadline) AS min_d " +
            "FROM offer o " +
            "JOIN student st ON st.student_no = o.student_no " +
            "LEFT JOIN offer_acceptance oa ON oa.offer_acceptance_id = o.offer_acceptance_id " +
            "WHERE o.accept_deadline IS NOT NULL " +
            "  AND o.accept_deadline <= ? " +
            "  AND (o.offer_acceptance_id IS NULL " +
            "       OR oa.offer_acceptance_name NOT IN ('承諾','辞退'))");
        List<Object> params = new ArrayList<>();
        params.add(Date.valueOf(today.plusDays(7)));
        if (classId != null) { sql.append(" AND st.class_id = ?"); params.add(classId); }

        try (PreparedStatement ps = prepare(con, sql.toString(), params);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                s.setDeadlineCount(rs.getInt("cnt"));
                Date minD = rs.getDate("min_d");
                if (s.getDeadlineCount() > 0 && minD != null) {
                    LocalDate d = minD.toLocalDate();
                    long days = ChronoUnit.DAYS.between(today, d);
                    String when = days > 0 ? "（あと" + days + "日）"
                                : days == 0 ? "（本日）"
                                : "（期限超過）";
                    s.setDeadlineNote("最短 " + d.getMonthValue() + "/" + d.getDayOfMonth() + when);
                }
            }
        }
    }

    // =====================================================================
    // 内定率（母数・内定者・承諾済み）
    // =====================================================================

    /**
     * 母数 = 在籍中 かつ あっせん辞退でない学生（フェーズ6 と同じ定義）。
     * 内定者 = offer を持つ学生。承諾済み = offer_acceptance が「承諾」の学生。
     * forChip=true のときは全体値としてチップ用フィールドに入れる。
     */
    private void fillRate(Connection con, MenuSummary s, Integer classId, boolean forChip)
            throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT COUNT(*) AS denom, " +
            " SUM(CASE WHEN EXISTS (SELECT 1 FROM offer o WHERE o.student_no = st.student_no) " +
            "          THEN 1 ELSE 0 END) AS offered, " +
            " SUM(CASE WHEN EXISTS (SELECT 1 FROM offer o " +
            "            JOIN offer_acceptance oa ON oa.offer_acceptance_id = o.offer_acceptance_id " +
            "            WHERE o.student_no = st.student_no AND oa.offer_acceptance_name = '承諾') " +
            "          THEN 1 ELSE 0 END) AS accepted " +
            "FROM student st " +
            "JOIN enrollment_status es ON es.enrollment_status_id = st.enrollment_status_id " +
            "WHERE es.enrollment_status_name = '在籍中' AND st.refuses_placement = FALSE");
        List<Object> params = new ArrayList<>();
        if (classId != null) { sql.append(" AND st.class_id = ?"); params.add(classId); }

        try (PreparedStatement ps = prepare(con, sql.toString(), params);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                if (forChip) {
                    s.setDenomAll(rs.getInt("denom"));
                    s.setOfferedAll(rs.getInt("offered"));
                } else {
                    s.setDenom(rs.getInt("denom"));
                    s.setOffered(rs.getInt("offered"));
                    s.setAccepted(rs.getInt("accepted"));
                }
            }
        }
    }

    // =====================================================================
    // カードチップ用（常に全体）
    // =====================================================================

    private void fillChips(Connection con, MenuSummary s) throws SQLException {
        // 在籍学生数とクラス数
        try (PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) AS c, COUNT(DISTINCT st.class_id) AS k " +
                "FROM student st " +
                "JOIN enrollment_status es ON es.enrollment_status_id = st.enrollment_status_id " +
                "WHERE es.enrollment_status_name = '在籍中'");
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                s.setEnrolledStudents(rs.getInt("c"));
                s.setClassCount(rs.getInt("k"));
            }
        }

        // 企業数（全体・募集中）
        try (PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) AS total, " +
                " SUM(CASE WHEN cs.company_status_name = '募集中' THEN 1 ELSE 0 END) AS recruiting " +
                "FROM company c JOIN company_status cs ON cs.company_status_id = c.company_status_id");
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                s.setCompanyCount(rs.getInt("total"));
                s.setRecruitingCompanies(rs.getInt("recruiting"));
            }
        }

        // 活動中の応募件数
        s.setActiveApplications(scalar(con,
            "SELECT COUNT(*) FROM job_application WHERE is_closed = FALSE", List.of()));

        // 要フォロー: 母数のうち、内定がなく、進行中の応募も1件もない学生
        s.setFollowUpCount(scalar(con,
            "SELECT COUNT(*) FROM student st " +
            "JOIN enrollment_status es ON es.enrollment_status_id = st.enrollment_status_id " +
            "WHERE es.enrollment_status_name = '在籍中' AND st.refuses_placement = FALSE " +
            "  AND NOT EXISTS (SELECT 1 FROM offer o WHERE o.student_no = st.student_no) " +
            "  AND NOT EXISTS (SELECT 1 FROM job_application ja " +
            "                  WHERE ja.student_no = st.student_no AND ja.is_closed = FALSE)",
            List.of()));
    }

    // =====================================================================
    // 小道具
    // =====================================================================

    private PreparedStatement prepare(Connection con, String sql, List<Object> params)
            throws SQLException {
        PreparedStatement ps = con.prepareStatement(sql);
        for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
        return ps;
    }

    private int scalar(Connection con, String sql, List<Object> params) throws SQLException {
        try (PreparedStatement ps = prepare(con, sql, params);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }
}
