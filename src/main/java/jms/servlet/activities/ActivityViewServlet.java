package jms.servlet.activities;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.ApplicationDao;
import jms.model.Account;
import jms.model.JobApplication;

/** 就職活動 閲覧（画面07）。ヘッダ + 選考タイムライン + 内定情報 */
@WebServlet("/app/activities/view")
public class ActivityViewServlet extends HttpServlet {

    private final ApplicationDao dao = new ApplicationDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        try {
            JobApplication a = dao.findById(parseLong(req.getParameter("id")));
            if (a == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
            // 行スコープ：担任は自クラス以外を閲覧できない（scope が null なら全許可）
            Integer scope = account.scopeClassId();
            if (scope != null && a.getClassId() != scope) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN); return;
            }
            req.setAttribute("a", a);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "就職活動閲覧");
        req.setAttribute("activeNav", "activities");
        req.getRequestDispatcher("/WEB-INF/jsp/activities/view.jsp").forward(req, res);
    }

    private static long parseLong(String s) {
        try { return s == null ? 0 : Long.parseLong(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
