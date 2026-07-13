package jms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.AdminAccountDao;

/** 管理 / アカウント一覧（画面19）。閲覧のみ */
@WebServlet("/app/admin/accounts")
public class AdminAccountsServlet extends HttpServlet {

    private final AdminAccountDao dao = new AdminAccountDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            req.setAttribute("accounts", dao.findAll());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "アカウント");
        req.setAttribute("activeNav", "admin");
        req.setAttribute("activeTab", "accounts");
        req.setAttribute("pageCss", "admin");
        req.getRequestDispatcher("/WEB-INF/jsp/admin/accounts.jsp").forward(req, res);
    }
}
