package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jms.model.MasterItem;
import jms.util.Db;

/** 職種マスタ（画面20）。usage1 = 募集での使用数, usage2 = 志望+就活での使用数 */
public class JobTypeDao {

    public List<MasterItem> findAllWithUsage() throws SQLException {
        String sql =
            "SELECT j.job_type_id, j.job_type_name, j.sort_order, i.industry_name, " +
            "       (SELECT COUNT(*) FROM recruitment r WHERE r.job_type_id = j.job_type_id) AS rec_count, " +
            "       (SELECT COUNT(*) FROM preferred_job_type p WHERE p.job_type_id = j.job_type_id) " +
            "     + (SELECT COUNT(*) FROM job_application a WHERE a.job_type_id = j.job_type_id) AS use_count " +
            "FROM job_type j " +
            "JOIN industry i ON i.industry_id = j.industry_id " +
            "ORDER BY j.sort_order";
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MasterItem m = new MasterItem();
                m.setId(rs.getInt("job_type_id"));
                m.setName(rs.getString("job_type_name"));
                m.setSubName(rs.getString("industry_name"));
                m.setSortOrder(rs.getInt("sort_order"));
                m.setUsage1(rs.getLong("rec_count"));
                m.setUsage2(rs.getLong("use_count"));
                list.add(m);
            }
        }
        return list;
    }

    public void insert(int industryId, String name) throws SQLException {
        String sql = "INSERT INTO job_type (industry_id, sort_order, job_type_name) " +
                     "SELECT ?, COALESCE(MAX(sort_order), 0) + 1, ? FROM job_type";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, industryId);
            ps.setString(2, name);
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "DELETE FROM job_type WHERE job_type_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
