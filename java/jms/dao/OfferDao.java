package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import jms.model.Offer;

/** 内定 DAO。更新系は Service のトランザクション内 Connection を受け取る */
public class OfferDao {

    /** student×company の内定を1件取得（無ければ null）。内定の二重生成防止に使う */
    public Offer findByStudentAndCompany(Connection con, String studentNo, int companyId)
            throws SQLException {
        String sql =
            "SELECT o.offer_id, o.student_no, o.company_id, o.offer_date, o.offer_acceptance_id, " +
            "       o.accepted_date, o.accept_deadline, co.company_name, oa.offer_acceptance_name " +
            "FROM offer o " +
            "JOIN company co ON co.company_id = o.company_id " +
            "LEFT JOIN offer_acceptance oa ON oa.offer_acceptance_id = o.offer_acceptance_id " +
            "WHERE o.student_no = ? AND o.company_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, studentNo);
            ps.setInt(2, companyId);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                return map(rs);
            }
        }
    }

    private Offer map(ResultSet rs) throws SQLException {
        Offer o = new Offer();
        o.setOfferId(rs.getLong("offer_id"));
        o.setStudentNo(rs.getString("student_no"));
        o.setCompanyId(rs.getInt("company_id"));
        o.setOfferDate(rs.getString("offer_date"));
        int oaId = rs.getInt("offer_acceptance_id");
        o.setOfferAcceptanceId(rs.wasNull() ? null : oaId);
        o.setAcceptedDate(rs.getString("accepted_date"));
        o.setAcceptDeadline(rs.getString("accept_deadline"));
        o.setCompanyName(rs.getString("company_name"));
        o.setOfferAcceptanceName(rs.getString("offer_acceptance_name"));
        return o;
    }

    /** 内定を INSERT し offer_id を返す */
    public long insert(Connection con, Offer o) throws SQLException {
        String sql = "INSERT INTO offer " +
                     " (student_no, company_id, offer_date, offer_acceptance_id, accepted_date, accept_deadline) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, o.getStudentNo());
            ps.setInt(2, o.getCompanyId());
            ps.setString(3, o.getOfferDate());
            if (o.getOfferAcceptanceId() == null) ps.setNull(4, Types.INTEGER);
            else ps.setInt(4, o.getOfferAcceptanceId());
            setDate(ps, 5, o.getAcceptedDate());
            setDate(ps, 6, o.getAcceptDeadline());
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                keys.next();
                return keys.getLong(1);
            }
        }
    }

    /** 承諾/辞退/保留の回答を反映（承諾期限も同時更新可） */
    public void updateAcceptance(Connection con, long offerId,
                                 Integer offerAcceptanceId, String acceptedDate, String acceptDeadline)
            throws SQLException {
        String sql = "UPDATE offer SET offer_acceptance_id = ?, accepted_date = ?, accept_deadline = ? " +
                     "WHERE offer_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            if (offerAcceptanceId == null) ps.setNull(1, Types.INTEGER);
            else ps.setInt(1, offerAcceptanceId);
            setDate(ps, 2, acceptedDate);
            setDate(ps, 3, acceptDeadline);
            ps.setLong(4, offerId);
            ps.executeUpdate();
        }
    }

    public void delete(Connection con, long offerId) throws SQLException {
        try (PreparedStatement ps = con.prepareStatement("DELETE FROM offer WHERE offer_id = ?")) {
            ps.setLong(1, offerId);
            ps.executeUpdate();
        }
    }

    private static void setDate(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, Types.DATE);
        else ps.setString(idx, v.trim());
    }
}
