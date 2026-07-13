package jms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import jms.dao.StudentDao;
import jms.model.Student;
import jms.util.Db;

/**
 * 学生の登録・変更・削除。
 * 複数テーブル（account / student / preferred_*）を1つのトランザクションで
 * 更新するのが Service 層の役割（開発規約 §3）。
 * 片方だけ成功して片方が失敗すると孤児データが生まれるため、
 * すべて成功 → commit / どこかで失敗 → rollback で「全部か無か」を保証する。
 */
public class StudentService {

    private final StudentDao studentDao = new StudentDao();

    /**
     * 新規登録：account を作り、同じトランザクションで student と志望を作る。
     * アカウントIDは学籍番号と同一、ロールは「学生」。
     */
    public void register(Student s, String password,
                         List<Integer> regionIds, List<Integer> jobTypeIds) throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);           // ← ここからトランザクション

            insertAccount(con, s.getStudentNo(), password);
            s.setAccountId(s.getStudentNo());
            studentDao.insert(con, s);
            studentDao.replacePreferredRegions(con, s.getStudentNo(), regionIds);
            studentDao.replacePreferredJobTypes(con, s.getStudentNo(), jobTypeIds);

            con.commit();                        // 全部成功したときだけ確定
        } catch (SQLException e) {
            con.rollback();                      // どれか失敗したら全部取り消し
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /** 変更：student 本体と志望の洗い替えを同一トランザクションで行う */
    public void update(Student s, List<Integer> regionIds, List<Integer> jobTypeIds)
            throws SQLException {
        Connection con = Db.open();
        try {
            con.setAutoCommit(false);
            studentDao.update(con, s);
            studentDao.replacePreferredRegions(con, s.getStudentNo(), regionIds);
            studentDao.replacePreferredJobTypes(con, s.getStudentNo(), jobTypeIds);
            con.commit();
        } catch (SQLException e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    /**
     * 削除：account を消すと FK の ON DELETE CASCADE により
     * student → 志望・就活・履歴・内定 が連鎖削除される（スキーマ設計どおり）。
     */
    public void delete(String studentNo, String accountId) throws SQLException {
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(
                 "DELETE FROM account WHERE account_id = ?")) {
            ps.setString(1, accountId);
            ps.executeUpdate();
        }
    }

    private void insertAccount(Connection con, String accountId, String password) throws SQLException {
        String sql = "INSERT INTO account (account_id, password, role_id) " +
                     "SELECT ?, ?, role_id FROM role WHERE role_name = '学生'";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, accountId);
            ps.setString(2, password);
            ps.executeUpdate();
        }
    }
}
