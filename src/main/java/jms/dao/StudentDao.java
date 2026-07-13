package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jms.model.MasterItem;
import jms.model.Student;
import jms.util.Db;

/**
 * 学生 DAO。
 * 検索系は自分で接続を開く。更新系は Service からトランザクション用の
 * Connection を受け取る（複数テーブル更新を1つの commit にまとめるため）。
 */
public class StudentDao {

    /**
     * 一覧検索（画面02）。
     * @param scopeClassId 担任の自クラス制限。null なら全クラス（開発規約 §5, §6）
     * @param classId      フィルタ：クラス。0 なら指定なし
     * @param statusId     フィルタ：在籍状況。0 なら指定なし
     * @param keyword      氏名・かな部分一致。null/空なら指定なし
     */
    public List<Student> search(Integer scopeClassId, int classId, int statusId, String keyword)
            throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT s.student_no, s.attendance_no, s.name, s.name_kana, " +
            "       s.refuses_placement, s.has_offer, s.has_accepted_offer, " +
            "       c.class_id, c.class_name, es.enrollment_status_id, es.enrollment_status_name " +
            "FROM student s " +
            "JOIN school_class c ON c.class_id = s.class_id " +
            "JOIN enrollment_status es ON es.enrollment_status_id = s.enrollment_status_id " +
            "WHERE 1=1 ");
        List<Object> params = new ArrayList<>();

        if (scopeClassId != null) {                 // 担任は自クラスに固定
            sql.append("AND s.class_id = ? ");
            params.add(scopeClassId);
        } else if (classId > 0) {                   // 全体閲覧者だけがクラスで絞れる
            sql.append("AND s.class_id = ? ");
            params.add(classId);
        }
        if (statusId > 0) {
            sql.append("AND s.enrollment_status_id = ? ");
            params.add(statusId);
        }
        if (keyword != null && !keyword.isBlank()) {
            sql.append("AND (s.name LIKE ? OR s.name_kana LIKE ?) ");
            String like = "%" + keyword.trim() + "%";
            params.add(like);
            params.add(like);
        }
        sql.append("ORDER BY c.sort_order, s.attendance_no");

        List<Student> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Student s = new Student();
                    s.setStudentNo(rs.getString("student_no"));
                    s.setAttendanceNo(rs.getInt("attendance_no"));
                    s.setName(rs.getString("name"));
                    s.setNameKana(rs.getString("name_kana"));
                    s.setRefusesPlacement(rs.getBoolean("refuses_placement"));
                    s.setHasOffer(rs.getBoolean("has_offer"));
                    s.setHasAcceptedOffer(rs.getBoolean("has_accepted_offer"));
                    s.setClassId(rs.getInt("class_id"));
                    s.setClassName(rs.getString("class_name"));
                    s.setEnrollmentStatusId(rs.getInt("enrollment_status_id"));
                    s.setEnrollmentStatusName(rs.getString("enrollment_status_name"));
                    list.add(s);
                }
            }
        }
        return list;
    }

    /** 1件取得（画面03・04・05） */
    public Student findByNo(String studentNo) throws SQLException {
        String sql =
            "SELECT s.*, c.class_name, g.gender_name, es.enrollment_status_name " +
            "FROM student s " +
            "JOIN school_class c ON c.class_id = s.class_id " +
            "JOIN gender g ON g.gender_id = s.gender_id " +
            "JOIN enrollment_status es ON es.enrollment_status_id = s.enrollment_status_id " +
            "WHERE s.student_no = ?";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, studentNo);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                Student s = new Student();
                s.setStudentNo(rs.getString("student_no"));
                s.setAccountId(rs.getString("account_id"));
                s.setClassId(rs.getInt("class_id"));
                s.setClassName(rs.getString("class_name"));
                s.setAttendanceNo(rs.getInt("attendance_no"));
                s.setName(rs.getString("name"));
                s.setNameKana(rs.getString("name_kana"));
                s.setGenderId(rs.getInt("gender_id"));
                s.setGenderName(rs.getString("gender_name"));
                java.sql.Date bd = rs.getDate("birth_date");
                s.setBirthDate(bd == null ? "" : bd.toString());
                String ym = rs.getString("admission_ym");
                s.setAdmissionYm(ym == null ? "" : ym);
                s.setEnrollmentStatusId(rs.getInt("enrollment_status_id"));
                s.setEnrollmentStatusName(rs.getString("enrollment_status_name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setRefusesPlacement(rs.getBoolean("refuses_placement"));
                s.setHasOffer(rs.getBoolean("has_offer"));
                s.setHasAcceptedOffer(rs.getBoolean("has_accepted_offer"));
                s.setRemarks(rs.getString("remarks"));
                return s;
            }
        }
    }

    // ---- ここから下は Service のトランザクション内で呼ばれる（Connection を受け取る） ----

    public void insert(Connection con, Student s) throws SQLException {
        String sql = "INSERT INTO student (student_no, account_id, class_id, attendance_no, " +
                     " name, name_kana, gender_id, birth_date, admission_ym, enrollment_status_id, " +
                     " email, phone, address, refuses_placement, remarks) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            bind(ps, s);
            ps.executeUpdate();
        }
    }

    public void update(Connection con, Student s) throws SQLException {
        String sql = "UPDATE student SET class_id = ?, attendance_no = ?, name = ?, name_kana = ?, " +
                     " gender_id = ?, birth_date = ?, admission_ym = ?, enrollment_status_id = ?, " +
                     " email = ?, phone = ?, address = ?, refuses_placement = ?, remarks = ? " +
                     "WHERE student_no = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            int i = 1;
            ps.setInt(i++, s.getClassId());
            ps.setInt(i++, s.getAttendanceNo());
            ps.setString(i++, s.getName());
            ps.setString(i++, s.getNameKana());
            ps.setInt(i++, s.getGenderId());
            setDateOrNull(ps, i++, s.getBirthDate());
            setStrOrNull(ps, i++, s.getAdmissionYm());
            ps.setInt(i++, s.getEnrollmentStatusId());
            setStrOrNull(ps, i++, s.getEmail());
            setStrOrNull(ps, i++, s.getPhone());
            setStrOrNull(ps, i++, s.getAddress());
            ps.setBoolean(i++, s.isRefusesPlacement());
            setStrOrNull(ps, i++, s.getRemarks());
            ps.setString(i++, s.getStudentNo());
            ps.executeUpdate();
        }
    }

    private void bind(PreparedStatement ps, Student s) throws SQLException {
        int i = 1;
        ps.setString(i++, s.getStudentNo());
        ps.setString(i++, s.getAccountId());
        ps.setInt(i++, s.getClassId());
        ps.setInt(i++, s.getAttendanceNo());
        ps.setString(i++, s.getName());
        ps.setString(i++, s.getNameKana());
        ps.setInt(i++, s.getGenderId());
        setDateOrNull(ps, i++, s.getBirthDate());
        setStrOrNull(ps, i++, s.getAdmissionYm());
        ps.setInt(i++, s.getEnrollmentStatusId());
        setStrOrNull(ps, i++, s.getEmail());
        setStrOrNull(ps, i++, s.getPhone());
        setStrOrNull(ps, i++, s.getAddress());
        ps.setBoolean(i++, s.isRefusesPlacement());
        setStrOrNull(ps, i++, s.getRemarks());
    }

    private static void setStrOrNull(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, java.sql.Types.VARCHAR);
        else ps.setString(idx, v.trim());
    }

    private static void setDateOrNull(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, java.sql.Types.DATE);
        else ps.setDate(idx, java.sql.Date.valueOf(v.trim()));
    }

    // ---- 志望勤務地・志望職種 ----

    /** 志望勤務地（志望度順）。subName = 県名 + 市区町村 */
    public List<MasterItem> findPreferredRegions(String studentNo) throws SQLException {
        String sql = "SELECT pr.priority, r.region_id, COALESCE(r.city, '（県全域）') AS city, p.prefecture_name " +
                     "FROM preferred_region pr " +
                     "JOIN region r ON r.region_id = pr.region_id " +
                     "JOIN prefecture p ON p.prefecture_id = r.prefecture_id " +
                     "WHERE pr.student_no = ? ORDER BY pr.priority";
        return findPrefs(sql, studentNo, true);
    }

    /** 志望職種（志望度順） */
    public List<MasterItem> findPreferredJobTypes(String studentNo) throws SQLException {
        String sql = "SELECT pj.priority, j.job_type_id, j.job_type_name " +
                     "FROM preferred_job_type pj " +
                     "JOIN job_type j ON j.job_type_id = pj.job_type_id " +
                     "WHERE pj.student_no = ? ORDER BY pj.priority";
        return findPrefs(sql, studentNo, false);
    }

    private List<MasterItem> findPrefs(String sql, String studentNo, boolean withPref) throws SQLException {
        List<MasterItem> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, studentNo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MasterItem m = new MasterItem();
                    m.setSortOrder(rs.getInt(1));   // priority を sortOrder に入れて運ぶ
                    m.setId(rs.getInt(2));
                    m.setName(rs.getString(3));
                    if (withPref) m.setSubName(rs.getString(4));
                    list.add(m);
                }
            }
        }
        return list;
    }

    /** 志望を洗い替え（全削除 → 入れ直し）。Service のトランザクション内で使用 */
    public void replacePreferredRegions(Connection con, String studentNo, List<Integer> regionIds)
            throws SQLException {
        try (PreparedStatement del = con.prepareStatement(
                "DELETE FROM preferred_region WHERE student_no = ?")) {
            del.setString(1, studentNo);
            del.executeUpdate();
        }
        String ins = "INSERT INTO preferred_region (student_no, priority, region_id) VALUES (?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(ins)) {
            int priority = 1;
            for (Integer id : regionIds) {
                ps.setString(1, studentNo);
                ps.setInt(2, priority++);
                ps.setInt(3, id);
                ps.executeUpdate();
            }
        }
    }

    public void replacePreferredJobTypes(Connection con, String studentNo, List<Integer> jobTypeIds)
            throws SQLException {
        try (PreparedStatement del = con.prepareStatement(
                "DELETE FROM preferred_job_type WHERE student_no = ?")) {
            del.setString(1, studentNo);
            del.executeUpdate();
        }
        String ins = "INSERT INTO preferred_job_type (student_no, priority, job_type_id) VALUES (?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(ins)) {
            int priority = 1;
            for (Integer id : jobTypeIds) {
                ps.setString(1, studentNo);
                ps.setInt(2, priority++);
                ps.setInt(3, id);
                ps.executeUpdate();
            }
        }
    }
}
