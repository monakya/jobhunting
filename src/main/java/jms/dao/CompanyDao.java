package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import jms.model.Company;
import jms.model.Recruitment;
import jms.util.Db;

/** 企業 DAO。更新系は Service の Connection を受け取る */
public class CompanyDao {

    /**
     * 一覧検索（画面10）。
     * @param industryId 0=指定なし / statusId 0=指定なし / regionId 0=指定なし
     * @param keyword 企業名・会社名・かな 部分一致
     */
    public List<Company> search(int industryId, int statusId, int regionId, String keyword)
            throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT c.company_id, c.company_name, c.company_name_kana, c.corporate_name, " +
            "       c.has_hiring_record, i.industry_name, cs.company_status_name, " +
            "       CONCAT(p.prefecture_name, ' ', COALESCE(r.city, '（県全域）')) AS region_label " +
            "FROM company c " +
            "JOIN industry i ON i.industry_id = c.industry_id " +
            "JOIN company_status cs ON cs.company_status_id = c.company_status_id " +
            "JOIN region r ON r.region_id = c.region_id " +
            "JOIN prefecture p ON p.prefecture_id = r.prefecture_id " +
            "WHERE 1=1 ");
        List<Object> params = new ArrayList<>();
        if (industryId > 0) { sql.append("AND c.industry_id = ? "); params.add(industryId); }
        if (statusId > 0)   { sql.append("AND c.company_status_id = ? "); params.add(statusId); }
        if (regionId > 0)   { sql.append("AND c.region_id = ? "); params.add(regionId); }
        if (keyword != null && !keyword.isBlank()) {
            sql.append("AND (c.company_name LIKE ? OR c.company_name_kana LIKE ? OR c.corporate_name LIKE ?) ");
            String like = "%" + keyword.trim() + "%";
            params.add(like); params.add(like); params.add(like);
        }
        sql.append("ORDER BY c.sort_order, c.company_id");

        Map<Integer, Company> map = new LinkedHashMap<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Company c = new Company();
                    c.setCompanyId(rs.getInt("company_id"));
                    c.setCompanyName(rs.getString("company_name"));
                    c.setCompanyNameKana(rs.getString("company_name_kana"));
                    c.setCorporateName(rs.getString("corporate_name"));
                    c.setHasHiringRecord(rs.getBoolean("has_hiring_record"));
                    c.setIndustryName(rs.getString("industry_name"));
                    c.setCompanyStatusName(rs.getString("company_status_name"));
                    c.setRegionLabel(rs.getString("region_label"));
                    map.put(c.getCompanyId(), c);
                }
            }
            if (!map.isEmpty()) attachRecruitments(con, map);
        }
        return new ArrayList<>(map.values());
    }

    /** 一覧の各企業に募集（職種・人数・勤務地）をまとめて付与する（N+1 回避） */
    private void attachRecruitments(Connection con, Map<Integer, Company> map) throws SQLException {
        String in = String.join(",", java.util.Collections.nCopies(map.size(), "?"));
        String sql =
            "SELECT rec.company_id, rec.recruitment_id, rec.headcount, j.job_type_name, " +
            "       CONCAT(p.prefecture_name, ' ', COALESCE(r.city, '（県全域）')) AS region_label " +
            "FROM recruitment rec " +
            "JOIN job_type j ON j.job_type_id = rec.job_type_id " +
            "LEFT JOIN recruitment_region rr ON rr.recruitment_id = rec.recruitment_id " +
            "LEFT JOIN region r ON r.region_id = rr.region_id " +
            "LEFT JOIN prefecture p ON p.prefecture_id = r.prefecture_id " +
            "WHERE rec.company_id IN (" + in + ") " +
            "ORDER BY rec.company_id, rec.recruitment_id, r.sort_order";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            int i = 1;
            for (Integer id : map.keySet()) ps.setInt(i++, id);
            try (ResultSet rs = ps.executeQuery()) {
                Recruitment cur = null;
                while (rs.next()) {
                    int recId = rs.getInt("recruitment_id");
                    if (cur == null || cur.getRecruitmentId() != recId) {
                        cur = new Recruitment();
                        cur.setRecruitmentId(recId);
                        cur.setJobTypeName(rs.getString("job_type_name"));
                        cur.setHeadcount(rs.getInt("headcount"));
                        map.get(rs.getInt("company_id")).getRecruitments().add(cur);
                    }
                    String label = rs.getString("region_label");
                    if (label != null && !label.isBlank() && !label.equals("null （県全域）")) {
                        if (rs.getString("region_label") != null) {
                            cur.getRegionLabels().add(label);
                        }
                    }
                }
            }
        }
    }

    /** 1件取得（募集・勤務地込み） */
    public Company findById(int companyId) throws SQLException {
        String sql =
            "SELECT c.*, i.industry_name, cs.company_status_name, " +
            "       CONCAT(p.prefecture_name, ' ', COALESCE(r.city, '（県全域）')) AS region_label " +
            "FROM company c " +
            "JOIN industry i ON i.industry_id = c.industry_id " +
            "JOIN company_status cs ON cs.company_status_id = c.company_status_id " +
            "JOIN region r ON r.region_id = c.region_id " +
            "JOIN prefecture p ON p.prefecture_id = r.prefecture_id " +
            "WHERE c.company_id = ?";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, companyId);
            Company c;
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                c = new Company();
                c.setCompanyId(rs.getInt("company_id"));
                c.setCompanyName(rs.getString("company_name"));
                c.setCompanyNameKana(rs.getString("company_name_kana"));
                c.setCorporateName(rs.getString("corporate_name"));
                c.setCorporateNameKana(rs.getString("corporate_name_kana"));
                c.setIndustryId(rs.getInt("industry_id"));
                c.setIndustryName(rs.getString("industry_name"));
                c.setCompanyStatusId(rs.getInt("company_status_id"));
                c.setCompanyStatusName(rs.getString("company_status_name"));
                c.setRegionId(rs.getInt("region_id"));
                c.setRegionLabel(rs.getString("region_label"));
                long cap = rs.getLong("capital");
                c.setCapital(rs.wasNull() ? null : cap);
                int emp = rs.getInt("employee_count");
                c.setEmployeeCount(rs.wasNull() ? null : emp);
                int est = rs.getInt("established_year");
                c.setEstablishedYear(rs.wasNull() ? null : est);
                c.setWebsiteUrl(rs.getString("website_url"));
                c.setPostalCode(rs.getString("postal_code"));
                c.setAddress(rs.getString("address"));
                c.setTel(rs.getString("tel"));
                c.setEmail(rs.getString("email"));
                c.setContactPerson(rs.getString("contact_person"));
                c.setHasHiringRecord(rs.getBoolean("has_hiring_record"));
                c.setRemarks(rs.getString("remarks"));
            }
            c.setRecruitments(findRecruitments(con, companyId));
            return c;
        }
    }

    /** 企業の募集一覧（勤務地 ID/ラベル、応募数付き） */
    public List<Recruitment> findRecruitments(Connection con, int companyId) throws SQLException {
        String sql =
            "SELECT rec.recruitment_id, rec.job_type_id, rec.headcount, j.job_type_name, " +
            "       (SELECT COUNT(*) FROM job_application a WHERE a.recruitment_id = rec.recruitment_id) AS app_count " +
            "FROM recruitment rec " +
            "JOIN job_type j ON j.job_type_id = rec.job_type_id " +
            "WHERE rec.company_id = ? ORDER BY rec.recruitment_id";
        List<Recruitment> list = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, companyId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Recruitment r = new Recruitment();
                    r.setRecruitmentId(rs.getInt("recruitment_id"));
                    r.setJobTypeId(rs.getInt("job_type_id"));
                    r.setJobTypeName(rs.getString("job_type_name"));
                    r.setHeadcount(rs.getInt("headcount"));
                    r.setApplicationCount(rs.getLong("app_count"));
                    list.add(r);
                }
            }
        }
        String rsql =
            "SELECT rr.region_id, CONCAT(p.prefecture_name, ' ', COALESCE(rg.city, '（県全域）')) AS label " +
            "FROM recruitment_region rr " +
            "JOIN region rg ON rg.region_id = rr.region_id " +
            "JOIN prefecture p ON p.prefecture_id = rg.prefecture_id " +
            "WHERE rr.recruitment_id = ? ORDER BY rg.sort_order";
        try (PreparedStatement ps = con.prepareStatement(rsql)) {
            for (Recruitment r : list) {
                ps.setInt(1, r.getRecruitmentId());
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        r.getRegionIds().add(rs.getInt("region_id"));
                        r.getRegionLabels().add(rs.getString("label"));
                    }
                }
            }
        }
        return list;
    }

    /** この企業に紐づく受験（就活）件数。削除ガード用 */
    public long countApplications(int companyId) throws SQLException {
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT COUNT(*) FROM job_application WHERE company_id = ?")) {
            ps.setInt(1, companyId);
            try (ResultSet rs = ps.executeQuery()) {
                rs.next();
                return rs.getLong(1);
            }
        }
    }

    // ---- 更新系（Service のトランザクション内） ----

    /** INSERT して採番された company_id を返す */
    public int insert(Connection con, Company c) throws SQLException {
        String sql = "INSERT INTO company (sort_order, company_name, company_name_kana, " +
                     " corporate_name, corporate_name_kana, industry_id, company_status_id, region_id, " +
                     " capital, employee_count, established_year, website_url, postal_code, address, " +
                     " tel, email, contact_person, has_hiring_record, remarks) " +
                     "VALUES ((SELECT COALESCE(MAX(c2.sort_order),0)+1 FROM company c2), " +
                     " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            bind(ps, c);
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                keys.next();
                return keys.getInt(1);
            }
        }
    }

    public void update(Connection con, Company c) throws SQLException {
        String sql = "UPDATE company SET company_name = ?, company_name_kana = ?, " +
                     " corporate_name = ?, corporate_name_kana = ?, industry_id = ?, " +
                     " company_status_id = ?, region_id = ?, capital = ?, employee_count = ?, " +
                     " established_year = ?, website_url = ?, postal_code = ?, address = ?, " +
                     " tel = ?, email = ?, contact_person = ?, has_hiring_record = ?, remarks = ? " +
                     "WHERE company_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            int last = bind(ps, c);
            ps.setInt(last, c.getCompanyId());
            ps.executeUpdate();
        }
    }

    /** 共通のバインド。次のパラメータ位置を返す */
    private int bind(PreparedStatement ps, Company c) throws SQLException {
        int i = 1;
        ps.setString(i++, c.getCompanyName());
        ps.setString(i++, c.getCompanyNameKana());
        setStr(ps, i++, c.getCorporateName());
        setStr(ps, i++, c.getCorporateNameKana());
        ps.setInt(i++, c.getIndustryId());
        ps.setInt(i++, c.getCompanyStatusId());
        ps.setInt(i++, c.getRegionId());
        if (c.getCapital() == null) ps.setNull(i++, java.sql.Types.BIGINT);
        else ps.setLong(i++, c.getCapital());
        if (c.getEmployeeCount() == null) ps.setNull(i++, java.sql.Types.INTEGER);
        else ps.setInt(i++, c.getEmployeeCount());
        if (c.getEstablishedYear() == null) ps.setNull(i++, java.sql.Types.SMALLINT);
        else ps.setInt(i++, c.getEstablishedYear());
        setStr(ps, i++, c.getWebsiteUrl());
        setStr(ps, i++, c.getPostalCode());
        setStr(ps, i++, c.getAddress());
        setStr(ps, i++, c.getTel());
        setStr(ps, i++, c.getEmail());
        setStr(ps, i++, c.getContactPerson());
        ps.setBoolean(i++, c.isHasHiringRecord());
        setStr(ps, i++, c.getRemarks());
        return i;
    }

    private static void setStr(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, java.sql.Types.VARCHAR);
        else ps.setString(idx, v.trim());
    }

    public void delete(Connection con, int companyId) throws SQLException {
        try (PreparedStatement ps = con.prepareStatement(
                "DELETE FROM company WHERE company_id = ?")) {
            ps.setInt(1, companyId);
            ps.executeUpdate();
        }
    }
}
