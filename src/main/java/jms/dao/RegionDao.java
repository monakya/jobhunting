package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jms.model.MasterItem;
import jms.util.Db;

/**
 * 地域マスタ（画面21）。都道府県 → 市区町村の2階層。
 * 市区町村行: usage1 = 志望者数, usage2 = 企業数 + 募集勤務地数
 */
public class RegionDao {

    /** 都道府県一覧。usage1 = 市区町村数 */
    public List<MasterItem> findPrefectures() throws SQLException {
        String sql =
            "SELECT p.prefecture_id, p.prefecture_name, p.sort_order, " +
            "       (SELECT COUNT(*) FROM region r WHERE r.prefecture_id = p.prefecture_id " +
            "         AND r.city IS NOT NULL) AS city_count " +
            "FROM prefecture p ORDER BY p.sort_order";
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MasterItem m = new MasterItem();
                m.setId(rs.getInt("prefecture_id"));
                m.setName(rs.getString("prefecture_name"));
                m.setSortOrder(rs.getInt("sort_order"));
                m.setUsage1(rs.getLong("city_count"));
                list.add(m);
            }
        }
        return list;
    }

    /** 指定県の地域一覧（県全域 NULL 行を含む） */
    public List<MasterItem> findRegions(int prefectureId) throws SQLException {
        String sql =
            "SELECT r.region_id, r.city, r.sort_order, " +
            "       (SELECT COUNT(*) FROM preferred_region pr WHERE pr.region_id = r.region_id) AS pref_count, " +
            "       (SELECT COUNT(*) FROM company c WHERE c.region_id = r.region_id) " +
            "     + (SELECT COUNT(*) FROM recruitment_region rr WHERE rr.region_id = r.region_id) AS use_count " +
            "FROM region r WHERE r.prefecture_id = ? ORDER BY r.sort_order";
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, prefectureId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MasterItem m = new MasterItem();
                    m.setId(rs.getInt("region_id"));
                    String city = rs.getString("city");
                    m.setName(city == null ? "（県全域）" : city);
                    m.setSortOrder(rs.getInt("sort_order"));
                    m.setUsage1(rs.getLong("pref_count"));
                    m.setUsage2(rs.getLong("use_count"));
                    list.add(m);
                }
            }
        }
        return list;
    }

    /** city が空文字なら県全域（NULL）として登録 */
    public void insert(int prefectureId, String city) throws SQLException {
        String sql = "INSERT INTO region (prefecture_id, sort_order, city) " +
                     "SELECT ?, COALESCE(MAX(sort_order), 0) + 1, ? FROM region WHERE prefecture_id = ?";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, prefectureId);
            if (city == null || city.isBlank()) {
                ps.setNull(2, java.sql.Types.VARCHAR);
            } else {
                ps.setString(2, city.trim());
            }
            ps.setInt(3, prefectureId);
            ps.executeUpdate();
        }
    }

    public void insertPrefecture(String name) throws SQLException {
        String sql = "INSERT INTO prefecture (sort_order, prefecture_name) " +
                     "SELECT COALESCE(MAX(sort_order), 0) + 1, ? FROM prefecture";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.executeUpdate();
        }
    }

    public void delete(int regionId) throws SQLException {
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "DELETE FROM region WHERE region_id = ?")) {
            ps.setInt(1, regionId);
            ps.executeUpdate();
        }
    }
}
