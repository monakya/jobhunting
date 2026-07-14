package jms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.MenuDao;

/**
 * メインメニュー（画面 16）。
 * フェーズ7で、サマリーバナー（募集中／受験中／内定あり／連携終了）と
 * 各カードのチップに実数を入れる集計を追加した。
 * メニュー項目の出し分けはヘッダ JSP（Account の can〜プロパティ）が行う。
 */
@WebServlet("/app/menu")
public class MenuServlet extends HttpServlet {

    private final MenuDao dao = new MenuDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            req.setAttribute("summary", dao.summary());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "メインメニュー");
        req.setAttribute("activeNav", "menu");
        req.getRequestDispatcher("/WEB-INF/jsp/menu.jsp").forward(req, res);
    }
}
