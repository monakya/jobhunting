package jms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import jms.dao.CompanyDao;
import jms.model.Company;
import jms.model.Recruitment;
import jms.util.Db;

/**
 * 企業の登録・変更・削除。
 * 企業本体 + 募集（recruitment）+ 募集勤務地（recruitment_region）を
 * 1トランザクションで更新する。
 *
 * 募集の更新戦略：
 *   応募（job_application.recruitment_id）から参照されている可能性があるため、
 *   志望のような単純な洗い替え（全 DELETE → INSERT）はできない。
 *   既存の募集は UPDATE、画面から消えた募集は DELETE、新しい行は INSERT に分ける。
 *   勤務地（recruitment_region）は参照されないので洗い替えでよい。
 */
public class CompanyService {

    private final CompanyDao companyDao = new CompanyDao();

    public int register(Company c) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            int id = companyDao.insert(con, c);
            for (Recruitment r : c.getRecruitments()) {
                int recId = insertRecruitment(con, id, r);
                replaceRecruitmentRegions(con, recId, r.getRegionIds());
            }
            con.commit();
            return id;
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    public void update(Company c) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            companyDao.update(con, c);

            // 既存の募集一覧を取得して、画面の内容と突き合わせる
            List<Recruitment> existing = companyDao.findRecruitments(con, c.getCompanyId());

            // 画面から消えた募集を削除（応募がある募集は Servlet 側で温存済み）
            for (Recruitment old : existing) {
                boolean stillThere = c.getRecruitments().stream()
                        .anyMatch(n -> n.getRecruitmentId() == old.getRecruitmentId());
                if (!stillThere) {
                    deleteRecruitment(con, old.getRecruitmentId());
                }
            }
            // 残す/追加する募集を UPDATE / INSERT
            for (Recruitment r : c.getRecruitments()) {
                if (r.getRecruitmentId() > 0) {
                    updateRecruitment(con, r);
                    replaceRecruitmentRegions(con, r.getRecruitmentId(), r.getRegionIds());
                } else {
                    int recId = insertRecruitment(con, c.getCompanyId(), r);
                    replaceRecruitmentRegions(con, recId, r.getRegionIds());
                }
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

    /** 受験履歴のない企業のみ削除可（呼び出し側で件数チェック済み）。募集は CASCADE で消える */
    public void delete(int companyId) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            companyDao.delete(con, companyId);
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    // ---- recruitment ----

    private int insertRecruitment(Connection con, int companyId, Recruitment r) throws SQLException {
        String sql = "INSERT INTO recruitment (company_id, job_type_id, headcount) VALUES (?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql,
                java.sql.Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, companyId);
            ps.setInt(2, r.getJobTypeId());
            ps.setInt(3, r.getHeadcount());
            ps.executeUpdate();
            try (java.sql.ResultSet keys = ps.getGeneratedKeys()) {
                keys.next();
                return keys.getInt(1);
            }
        }
    }

    private void updateRecruitment(Connection con, Recruitment r) throws SQLException {
        String sql = "UPDATE recruitment SET job_type_id = ?, headcount = ? WHERE recruitment_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, r.getJobTypeId());
            ps.setInt(2, r.getHeadcount());
            ps.setInt(3, r.getRecruitmentId());
            ps.executeUpdate();
        }
    }

    private void deleteRecruitment(Connection con, int recruitmentId) throws SQLException {
        // recruitment_region は FK CASCADE で消える
        try (PreparedStatement ps = con.prepareStatement(
                "DELETE FROM recruitment WHERE recruitment_id = ?")) {
            ps.setInt(1, recruitmentId);
            ps.executeUpdate();
        }
    }

    /** 勤務地は参照されないので洗い替え */
    private void replaceRecruitmentRegions(Connection con, int recruitmentId, List<Integer> regionIds)
            throws SQLException {
        try (PreparedStatement del = con.prepareStatement(
                "DELETE FROM recruitment_region WHERE recruitment_id = ?")) {
            del.setInt(1, recruitmentId);
            del.executeUpdate();
        }
        try (PreparedStatement ps = con.prepareStatement(
                "INSERT INTO recruitment_region (recruitment_id, region_id) VALUES (?, ?)")) {
            for (Integer id : regionIds) {
                ps.setInt(1, recruitmentId);
                ps.setInt(2, id);
                ps.executeUpdate();
            }
        }
    }
}
