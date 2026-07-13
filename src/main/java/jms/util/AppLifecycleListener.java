package jms.util;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

/**
 * アプリ停止時に JDBC ドライバーを登録解除する。
 * これを行わないと Tomcat の再起動時に MySQL ドライバーの残留スレッドが
 * 停止処理を妨げ、「開始中」のまま固まる原因になる。
 */
@WebListener
public class AppLifecycleListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // MySQL ドライバーの接続掃除スレッドを止める
        AbandonedConnectionCleanupThread.checkedShutdown();

        // このアプリのクラスローダーが登録したドライバーを解除する
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            if (driver.getClass().getClassLoader() == getClass().getClassLoader()) {
                try {
                    DriverManager.deregisterDriver(driver);
                } catch (SQLException ignore) {
                }
            }
        }
    }
}