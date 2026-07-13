package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import jms.model.ApplicationHistory;

/**
 * 選考履歴 DAO。
 *
 * ★設計を「構造」で守らせるため、公開メソッドは意図的に次の3つだけに絞っている：
 *   - insert        … 新しい選考イベントを1行足す（履歴は追記が基本）
 *   - updateResult  … 既存行のうち「結果・結果判明日・備考」だけを UPDATE
 *   - logicalDelete … is_deleted = TRUE（物理 DELETE はしない）
 *
 * これにより「event_at や stage を後から書き換える」「行を消す」といった
 * 規約違反（§3-1）を、そもそもコードで書けないようにしている。
 * 参照系（一覧の最新行導出・タイムライン取得）は ApplicationDao 側に置く。
 */
public class ApplicationHistoryDao {

    /** 選考イベントを1行 INSERT し、採番された history_id を返す */
    public long insert(Connection con, ApplicationHistory h) throws SQLException {
        String sql =
            "INSERT INTO application_history " +
            " (application_id, selection_stage_id, selection_result_id, is_final_selection, " +
            "  event_at, place, interviewer_count, result_date, remarks, is_deleted) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, FALSE)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setLong(1, h.getApplicationId());
            ps.setInt(2, h.getSelectionStageId());
            ps.setInt(3, h.getSelectionResultId());
            ps.setBoolean(4, h.isFinalSelection());
            ps.setString(5, toDbDateTime(h.getEventAt()));
            setStr(ps, 6, h.getPlace());
            if (h.getInterviewerCount() == null) ps.setNull(7, Types.INTEGER);
            else ps.setInt(7, h.getInterviewerCount());
            setDate(ps, 8, h.getResultDate());
            setStr(ps, 9, h.getRemarks());
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                keys.next();
                return keys.getLong(1);
            }
        }
    }

    /** 「現在の選考状況の結果を確定する」＝結果・結果判明日・備考のみ UPDATE（規約 §3-1） */
    public void updateResult(Connection con, long historyId,
                             int selectionResultId, String resultDate, String remarks)
            throws SQLException {
        String sql = "UPDATE application_history " +
                     "SET selection_result_id = ?, result_date = ?, remarks = ? " +
                     "WHERE history_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, selectionResultId);
            setDate(ps, 2, resultDate);
            setStr(ps, 3, remarks);
            ps.setLong(4, historyId);
            ps.executeUpdate();
        }
    }

    /** 誤登録の論理削除。物理削除はしない */
    public void logicalDelete(Connection con, long historyId) throws SQLException {
        try (PreparedStatement ps = con.prepareStatement(
                "UPDATE application_history SET is_deleted = TRUE WHERE history_id = ?")) {
            ps.setLong(1, historyId);
            ps.executeUpdate();
        }
    }

    /** タイムライン用：is_deleted を除いた全履歴を時系列で返す（ApplicationDao から委譲される） */
    List<ApplicationHistory> findTimeline(Connection con, long applicationId) throws SQLException {
        String sql =
            "SELECT h.history_id, h.application_id, h.selection_stage_id, ss.selection_stage_name, " +
            "       h.selection_result_id, sr.selection_result_name, h.is_final_selection, " +
            "       h.event_at, h.place, h.interviewer_count, h.result_date, h.remarks " +
            "FROM application_history h " +
            "JOIN selection_stage ss ON ss.selection_stage_id = h.selection_stage_id " +
            "JOIN selection_result sr ON sr.selection_result_id = h.selection_result_id " +
            "WHERE h.application_id = ? AND h.is_deleted = FALSE " +
            "ORDER BY h.event_at DESC, h.history_id DESC";
        List<ApplicationHistory> list = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, applicationId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ApplicationHistory h = new ApplicationHistory();
                    h.setHistoryId(rs.getLong("history_id"));
                    h.setApplicationId(rs.getLong("application_id"));
                    h.setSelectionStageId(rs.getInt("selection_stage_id"));
                    h.setStageName(rs.getString("selection_stage_name"));
                    h.setSelectionResultId(rs.getInt("selection_result_id"));
                    h.setResultName(rs.getString("selection_result_name"));
                    h.setFinalSelection(rs.getBoolean("is_final_selection"));
                    h.setEventAt(fromDbDateTime(rs.getString("event_at")));
                    h.setPlace(rs.getString("place"));
                    int ic = rs.getInt("interviewer_count");
                    h.setInterviewerCount(rs.wasNull() ? null : ic);
                    h.setResultDate(rs.getString("result_date"));
                    h.setRemarks(rs.getString("remarks"));
                    list.add(h);
                }
            }
        }
        return list;
    }

    // ---- 小物 ----

    /** datetime-local（YYYY-MM-DDTHH:mm）→ DB の DATETIME 文字列（空白区切り） */
    private static String toDbDateTime(String v) {
        if (v == null || v.isBlank()) return null;
        return v.trim().replace('T', ' ');
    }

    private static String fromDbDateTime(String v) {
        if (v == null) return null;
        return v.length() >= 16 ? v.substring(0, 16).replace(' ', 'T') : v.replace(' ', 'T');
    }

    private static void setStr(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, Types.VARCHAR);
        else ps.setString(idx, v.trim());
    }

    private static void setDate(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, Types.DATE);
        else ps.setString(idx, v.trim());
    }
}
