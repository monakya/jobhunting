package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jms.model.Account;
import jms.util.Db;

public class AccountDao {

    /**
     * ID とパスワードで認証。成功時 Account、失敗時 null。
     * 表示名は 教職員 → 学生 → account_id の順で解決する。
     * 担任なら担当クラス ID も取得する（自クラススコープに使用）。
     *
     * 開発中はパスワード平文比較。ハッシュ化する場合はここを変更する。
     */
    public Account findByLogin(String accountId, String password) throws SQLException {
        String sql =
            "SELECT a.account_id, a.role_id, r.role_name, " +
            "       t.name AS teacher_name, t.class_id AS homeroom_class_id, " +
            "       s.name AS student_name " +
            "FROM account a " +
            "JOIN role r ON r.role_id = a.role_id " +
            "LEFT JOIN teacher t ON t.account_id = a.account_id " +
            "LEFT JOIN student s ON s.account_id = a.account_id " +
            "WHERE a.account_id = ? AND a.password = ?";
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, accountId);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                String name = rs.getString("teacher_name");
                if (name == null) name = rs.getString("student_name");
                if (name == null) name = rs.getString("account_id");
                Integer homeroom = (Integer) rs.getObject("homeroom_class_id");
                return new Account(
                    rs.getString("account_id"),
                    rs.getInt("role_id"),
                    rs.getString("role_name"),
                    name,
                    homeroom);
            }
        }
    }
}
