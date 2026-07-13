package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import jms.model.ReportRow;
import jms.util.Db;

/**
 * 活動状況報告（画面14）の集計 DAO。読み取り専用。
 *
 * 内定・承諾は student のキャッシュ列ではなく offer テーブルから直接数える（集計の正は offer）。
 * これにより has_offer/has_accepted_offer の再計算をしていなくても数値が正しくなる。
 *
 * 集計は「クラス単位」で1回のクエリにまとめ、活動中件数（応募単位）だけ別クエリで取り、
 * Java 側でクラスIDをキーに合流させる。学科・全体への積み上げは Servlet 側で行う。
 */
public class ReportDao {

    /** クラス別の集計行（学科 sort → 学年 → クラス sort の順） */
    public List<ReportRow> classStats() throws SQLException {
        String sql =
            "SELECT sc.class_id, ad.academic_department_name AS dep_name, ad.sort_order AS dep_sort, " +
            "       sc.grade, sc.class_name, sc.sort_order AS class_sort, " +
            "       COUNT(t.student_no) AS total, " +
            "       COALESCE(SUM(t.in_denom), 0) AS denom, " +
            "       COALESCE(SUM(CASE WHEN t.in_denom=1 AND t.has_offer=1  THEN 1 ELSE 0 END), 0) AS offered, " +
            "       COALESCE(SUM(CASE WHEN t.in_denom=1 AND t.has_accept=1 THEN 1 ELSE 0 END), 0) AS accepted, " +
            "       COALESCE(SUM(CASE WHEN t.in_denom=1 AND t.need_follow=1 THEN 1 ELSE 0 END), 0) AS need_follow " +
            "FROM school_class sc " +
            "JOIN academic_department ad ON ad.academic_department_id = sc.academic_department_id " +
            "LEFT JOIN ( " +
            "   SELECT s.student_no, s.class_id, " +
            "     CASE WHEN es.enrollment_status_name = '在籍中' AND s.refuses_placement = FALSE " +
            "          THEN 1 ELSE 0 END AS in_denom, " +
            "     CASE WHEN EXISTS (SELECT 1 FROM offer o WHERE o.student_no = s.student_no) " +
            "          THEN 1 ELSE 0 END AS has_offer, " +
            "     CASE WHEN EXISTS ( " +
            "            SELECT 1 FROM offer o " +
            "            JOIN offer_acceptance oa ON oa.offer_acceptance_id = o.offer_acceptance_id " +
            "            WHERE o.student_no = s.student_no AND oa.offer_acceptance_name = '承諾') " +
            "          THEN 1 ELSE 0 END AS has_accept, " +
            "     CASE WHEN NOT EXISTS (SELECT 1 FROM offer o WHERE o.student_no = s.student_no) " +
            "           AND NOT EXISTS (SELECT 1 FROM job_application ja " +
            "                           WHERE ja.student_no = s.student_no AND ja.is_closed = FALSE) " +
            "          THEN 1 ELSE 0 END AS need_follow " +
            "   FROM student s " +
            "   JOIN enrollment_status es ON es.enrollment_status_id = s.enrollment_status_id " +
            ") t ON t.class_id = sc.class_id " +
            "GROUP BY sc.class_id, ad.academic_department_name, ad.sort_order, " +
            "         sc.grade, sc.class_name, sc.sort_order " +
            "ORDER BY ad.sort_order, sc.grade, sc.sort_order";

        Map<Integer, ReportRow> byClass = new LinkedHashMap<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ReportRow r = new ReportRow();
                r.setDeptName(rs.getString("dep_name"));
                r.setGrade(rs.getInt("grade"));
                r.setLabel(rs.getString("class_name"));
                r.setTotal(rs.getInt("total"));
                r.setDenom(rs.getInt("denom"));
                r.setOffered(rs.getInt("offered"));
                r.setAccepted(rs.getInt("accepted"));
                r.setNeedFollow(rs.getInt("need_follow"));
                byClass.put(rs.getInt("class_id"), r);
            }
        }

        // 活動中の応募件数（is_closed=FALSE）をクラス単位で取り、合流させる
        String activeSql =
            "SELECT s.class_id, COUNT(*) AS active_cnt " +
            "FROM job_application ja JOIN student s ON s.student_no = ja.student_no " +
            "WHERE ja.is_closed = FALSE GROUP BY s.class_id";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(activeSql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ReportRow r = byClass.get(rs.getInt("class_id"));
                if (r != null) r.setActive(rs.getInt("active_cnt"));
            }
        }
        return new ArrayList<>(byClass.values());
    }
}
