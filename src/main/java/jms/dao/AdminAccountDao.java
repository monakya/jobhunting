package jms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jms.model.AccountRow;
import jms.util.Db;

/** アカウント一覧（画面19）。U-15 により状態・最終ログイン等は持たない */
public class AdminAccountDao {

    public List<AccountRow> findAll() throws SQLException {
        String sql =
            "SELECT a.account_id, r.role_name, d.department_name, " +
            "       COALESCE(t.name, s.name) AS name, " +
            "       COALESCE(t.name_kana, s.name_kana) AS name_kana, " +
            "       c.class_name " +
            "FROM account a " +
            "JOIN role r ON r.role_id = a.role_id " +
            "LEFT JOIN department d ON d.department_id = a.department_id " +
            "LEFT JOIN teacher t ON t.account_id = a.account_id " +
            "LEFT JOIN student s ON s.account_id = a.account_id " +
            "LEFT JOIN school_class c ON c.class_id = t.class_id " +
            "ORDER BY r.sort_order, a.account_id";
        List<AccountRow> list = new ArrayList<>();
        try (Connection con = Db.open();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                AccountRow row = new AccountRow();
                row.setAccountId(rs.getString("account_id"));
                row.setRoleName(rs.getString("role_name"));
                row.setDepartmentName(rs.getString("department_name"));
                row.setName(rs.getString("name"));
                row.setNameKana(rs.getString("name_kana"));
                row.setClassName(rs.getString("class_name"));
                list.add(row);
            }
        }
        return list;
    }
}
