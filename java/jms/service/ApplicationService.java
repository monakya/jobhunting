package jms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import jms.dao.ApplicationDao;
import jms.dao.ApplicationHistoryDao;
import jms.dao.OfferDao;
import jms.model.ApplicationHistory;
import jms.model.JobApplication;
import jms.model.Offer;
import jms.util.Db;

/**
 * 就活のトランザクション境界。
 * 「内定 = is_final_selection=TRUE の履歴が『合格』になった状態」を検知し、
 * offer の生成と student.has_offer の更新を必ず同一トランザクションで行う（規約 §3-4）。
 */
public class ApplicationService {

    private final ApplicationDao applicationDao = new ApplicationDao();
    private final ApplicationHistoryDao historyDao = new ApplicationHistoryDao();
    private final OfferDao offerDao = new OfferDao();

    /** 登録（08）：応募ヘッダ + 最初の選考イベントを1トランザクションで作る */
    public long register(JobApplication a, ApplicationHistory first, String acceptDeadline)
            throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            long appId = applicationDao.insert(con, a);
            first.setApplicationId(appId);
            historyDao.insert(con, first);
            // 最初のイベントがいきなり「最終選考＋合格」なら内定確定
            evaluateOffer(con, a.getStudentNo(), a.getCompanyId(), first, acceptDeadline);
            con.commit();
            return appId;
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /** 変更：次の選考予定を新しい履歴として追加（通過時のみ運用） */
    public void addNextSelection(long applicationId, String studentNo, int companyId,
                                 ApplicationHistory h, String acceptDeadline) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            h.setApplicationId(applicationId);
            historyDao.insert(con, h);
            evaluateOffer(con, studentNo, companyId, h, acceptDeadline);
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /** 変更：現在の選考状況の「結果」を確定する（結果・結果判明日・備考のみ UPDATE → 内定判定） */
    public void updateCurrentResult(long applicationId, String studentNo, int companyId,
                                    long historyId, int resultId, String resultDate,
                                    String remarks, String acceptDeadline) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            historyDao.updateResult(con, historyId, resultId, resultDate, remarks);
            // 更新後の最新履歴で内定判定（この履歴が最終選考かつ合格なら offer）
            ApplicationHistory latest = applicationDao.findLatestHistory(con, applicationId);
            if (latest != null) {
                evaluateOffer(con, studentNo, companyId, latest, acceptDeadline);
            }
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /** 変更：内定への回答（承諾/辞退/保留）を反映し has_accepted_offer を同期 */
    public void recordAcceptance(long offerId, String studentNo, Integer acceptanceId,
                                 String acceptedDate, String acceptDeadline) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            offerDao.updateAcceptance(con, offerId, acceptanceId, acceptedDate, acceptDeadline);
            recomputeStudentOfferCache(con, studentNo);
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /** 変更：誤登録した選考履歴を論理削除する */
    public void logicalDeleteHistory(long historyId) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            historyDao.logicalDelete(con, historyId);
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /** 変更：終了フラグの切り替え */
    public void setClosed(long applicationId, boolean closed) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            applicationDao.updateClosed(con, applicationId, closed);
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /**
     * 削除（09）：応募ヘッダを消す（履歴は CASCADE）。
     * offer は student×company 紐付けなので自動では消えない。alsoDeleteOffer=true のときだけ削除。
     * 最後に student のキャッシュ列を再計算して不整合を残さない。
     */
    public void delete(long applicationId, String studentNo, int companyId, boolean alsoDeleteOffer)
            throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            applicationDao.delete(con, applicationId);
            if (alsoDeleteOffer) {
                Offer o = offerDao.findByStudentAndCompany(con, studentNo, companyId);
                if (o != null) offerDao.delete(con, o.getOfferId());
            }
            recomputeStudentOfferCache(con, studentNo);
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    // ---- 内定判定の中核 ----

    /**
     * 指定履歴が「最終選考フラグ TRUE かつ 結果 = 合格」なら内定を確定する。
     * すでに offer があれば二重生成せず、承諾期限だけ補完更新する。
     */
    private void evaluateOffer(Connection con, String studentNo, int companyId,
                               ApplicationHistory h, String acceptDeadline) throws SQLException {
        if (h == null || !h.isFinalSelection()) return;
        int passId = resultIdByName(con, "合格");
        if (h.getSelectionResultId() != passId) return;

        Offer existing = offerDao.findByStudentAndCompany(con, studentNo, companyId);
        if (existing == null) {
            Offer o = new Offer();
            o.setStudentNo(studentNo);
            o.setCompanyId(companyId);
            // 内定日は結果判明日、無ければ今日
            o.setOfferDate((h.getResultDate() == null || h.getResultDate().isBlank())
                    ? LocalDate.now().toString() : h.getResultDate());
            o.setOfferAcceptanceId(null);
            o.setAcceptDeadline(nullIfBlank(acceptDeadline));
            offerDao.insert(con, o);
        } else if (acceptDeadline != null && !acceptDeadline.isBlank()) {
            // 既存内定に承諾期限を補完（回答状態は変えない）
            offerDao.updateAcceptance(con, existing.getOfferId(),
                    existing.getOfferAcceptanceId(), existing.getAcceptedDate(), acceptDeadline);
        }
        // has_offer キャッシュを立てる
        recomputeStudentOfferCache(con, studentNo);
    }

    /** student.has_offer / has_accepted_offer を offer テーブルの実態から再計算（キャッシュの正を offer 側に置く） */
    private void recomputeStudentOfferCache(Connection con, String studentNo) throws SQLException {
        String sql =
            "UPDATE student s SET " +
            " s.has_offer = EXISTS (SELECT 1 FROM offer o WHERE o.student_no = s.student_no), " +
            " s.has_accepted_offer = EXISTS ( " +
            "   SELECT 1 FROM offer o JOIN offer_acceptance oa ON oa.offer_acceptance_id = o.offer_acceptance_id " +
            "   WHERE o.student_no = s.student_no AND oa.offer_acceptance_name = '承諾') " +
            "WHERE s.student_no = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, studentNo);
            ps.executeUpdate();
        }
    }

    /** 結果マスタ名 → id（「合格」の id をハードコードせず名前で引く） */
    private int resultIdByName(Connection con, String name) throws SQLException {
        try (PreparedStatement ps = con.prepareStatement(
                "SELECT selection_result_id FROM selection_result WHERE selection_result_name = ?")) {
            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
                throw new SQLException("selection_result に「" + name + "」がありません。マスタを確認してください。");
            }
        }
    }

    private static String nullIfBlank(String v) {
        return (v == null || v.isBlank()) ? null : v.trim();
    }
}
