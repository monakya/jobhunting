package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jms.model.MasterItem;
import jms.util.Db;

/** フォームのドロップダウン用の小さな一覧をまとめて提供する */
public class LookupDao {

    private List<MasterItem> query(String sql) throws SQLException {
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MasterItem m = new MasterItem();
                m.setId(rs.getInt(1));
                m.setName(rs.getString(2));
                if (rs.getMetaData().getColumnCount() >= 3) {
                    m.setSubName(rs.getString(3));
                }
                list.add(m);
            }
        }
        return list;
    }

    public List<MasterItem> classes() throws SQLException {
        return query("SELECT class_id, class_name FROM school_class ORDER BY sort_order");
    }

    public List<MasterItem> enrollmentStatuses() throws SQLException {
        return query("SELECT enrollment_status_id, enrollment_status_name FROM enrollment_status ORDER BY sort_order");
    }

    public List<MasterItem> genders() throws SQLException {
        return query("SELECT gender_id, gender_name FROM gender ORDER BY sort_order");
    }

    /** 地域（県名付き） */
    public List<MasterItem> regions() throws SQLException {
        return query("SELECT r.region_id, COALESCE(r.city, '（県全域）'), p.prefecture_name " +
                     "FROM region r JOIN prefecture p ON p.prefecture_id = r.prefecture_id " +
                     "ORDER BY p.sort_order, r.sort_order");
    }


    public List<MasterItem> companyStatuses() throws SQLException {
        return query("SELECT company_status_id, company_status_name FROM company_status ORDER BY sort_order");
    }

    public List<MasterItem> jobTypes() throws SQLException {
        return query("SELECT job_type_id, job_type_name FROM job_type ORDER BY sort_order");
    }

    // ---- フェーズ5（就活）で追加 ----

    /** 選考ステージ。subName に allows_attendance（'1'/'0'）を入れ、「参加」選択可否の判定に使う */
    public List<MasterItem> selectionStages() throws SQLException {
        return query("SELECT selection_stage_id, selection_stage_name, CAST(allows_attendance AS CHAR) " +
                     "FROM selection_stage ORDER BY sort_order");
    }

    public List<MasterItem> selectionResults() throws SQLException {
        return query("SELECT selection_result_id, selection_result_name FROM selection_result ORDER BY sort_order");
    }

    public List<MasterItem> referralTypes() throws SQLException {
        return query("SELECT referral_type_id, referral_type_name FROM referral_type ORDER BY sort_order");
    }

    public List<MasterItem> offerAcceptances() throws SQLException {
        return query("SELECT offer_acceptance_id, offer_acceptance_name FROM offer_acceptance ORDER BY sort_order");
    }
}
