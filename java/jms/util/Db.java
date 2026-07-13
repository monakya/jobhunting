package jms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DB 接続ユーティリティ。
 * 環境に合わせて URL / USER / PASS を変更してください。
 * MySQL Connector/J の jar を WEB-INF/lib に配置しておくこと。
 */
public final class Db {

    private static final String URL =
        "jdbc:mysql://localhost:3306/jms"
        + "?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Tokyo";
    private static final String USER = "root";
    private static final String PASS = "kcsf";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private Db() {}

    public static Connection open() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
