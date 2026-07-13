package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jms.model.MasterItem;
import jms.util.Db;

/** 業種マスタ（U-10）。usage1 = 職種数, usage2 = 企業数 */
public class IndustryDao {

    public List<MasterItem> findAllWithUsage() throws SQLException {
        String sql =
            "SELECT i.industry_id, i.industry_name, i.sort_order, " +
            "       (SELECT COUNT(*) FROM job_type j WHERE j.industry_id = i.industry_id) AS job_type_count, " +
            "       (SELECT COUNT(*) FROM company c WHERE c.industry_id = i.industry_id) AS company_count " +
            "FROM industry i ORDER BY i.sort_order";
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MasterItem m = new MasterItem();
                m.setId(rs.getInt("industry_id"));
                m.setName(rs.getString("industry_name"));
                m.setSortOrder(rs.getInt("sort_order"));
                m.setUsage1(rs.getLong("job_type_count"));
                m.setUsage2(rs.getLong("company_count"));
                list.add(m);
            }
        }
        return list;
    }

    public void insert(String name) throws SQLException {
        String sql = "INSERT INTO industry (sort_order, industry_name) " +
                     "SELECT COALESCE(MAX(sort_order), 0) + 1, ? FROM industry";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.executeUpdate();
        }
    }

    /** 使用中（職種・企業から参照）の行は呼び出し側で弾く前提。FK でも守られる */
    public void delete(int id) throws SQLException {
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "DELETE FROM industry WHERE industry_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
