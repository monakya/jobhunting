package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jms.model.MenuSummary;
import jms.util.Db;

/**
 * メインメニュー（画面16）のサマリー集計。読み取り専用。
 * メニュー表示は頻度が低いので、1接続で複数の小さな集計を順に実行する。
 * 内定・母数は offer / student から直接数える（集計の正は offer テーブル）。
 */
public class MenuDao {

    public MenuSummary summary() throws SQLException {
        MenuSummary s = new MenuSummary();
        try (Connection con = Db.open()) {

            // 募集中 / 連携終了 の企業数
            try (PreparedStatement ps = con.prepareStatement(
                    "SELECT " +
                    " SUM(CASE WHEN cs.company_status_name='募集中'   THEN 1 ELSE 0 END) AS recruiting, " +
                    " SUM(CASE WHEN cs.company_status_name='連携終了' THEN 1 ELSE 0 END) AS ended " +
                    "FROM company c JOIN company_status cs ON cs.company_status_id = c.company_status_id");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s.setRecruitingCompanies(rs.getInt("recruiting"));
                    s.setEndedCompanies(rs.getInt("ended"));
                }
            }

            // 受験中：進行中の応募がある企業数
            s.setApplyingCompanies(scalar(con,
                "SELECT COUNT(DISTINCT company_id) FROM job_application WHERE is_closed = FALSE"));

            // 内定あり：offer を持つ学生数
            s.setOfferedStudents(scalar(con,
                "SELECT COUNT(DISTINCT student_no) FROM offer"));

            // 在籍中の学生数
            s.setEnrolledStudents(scalar(con,
                "SELECT COUNT(*) FROM student s " +
                "JOIN enrollment_status es ON es.enrollment_status_id = s.enrollment_status_id " +
                "WHERE es.enrollment_status_name = '在籍中'"));

            // 活動中の応募件数
            s.setActiveApplications(scalar(con,
                "SELECT COUNT(*) FROM job_application WHERE is_closed = FALSE"));

            // 内定率の母数と、母数のうち内定ありの学生数
            try (PreparedStatement ps = con.prepareStatement(
                    "SELECT " +
                    " COUNT(*) AS denom, " +
                    " SUM(CASE WHEN EXISTS (SELECT 1 FROM offer o WHERE o.student_no = s.student_no) " +
                    "          THEN 1 ELSE 0 END) AS offered " +
                    "FROM student s " +
                    "JOIN enrollment_status es ON es.enrollment_status_id = s.enrollment_status_id " +
                    "WHERE es.enrollment_status_name = '在籍中' AND s.refuses_placement = FALSE");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s.setDenom(rs.getInt("denom"));
                    s.setOfferedInDenom(rs.getInt("offered"));
                }
            }
        }
        return s;
    }

    private int scalar(Connection con, String sql) throws SQLException {
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }
}
