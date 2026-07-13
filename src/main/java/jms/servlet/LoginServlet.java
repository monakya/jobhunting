package jms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jms.dao.AccountDao;
import jms.model.Account;

/**
 * ログイン（画面 15）。
 * GET  … ログインフォーム表示
 * POST … 認証。成功時はセッションを張り直してメニューへ、失敗時はフォームに戻す。
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String id = trim(req.getParameter("accountId"));
        String pw = req.getParameter("password") == null ? "" : req.getParameter("password");

        Account account = null;
        if (!id.isEmpty() && !pw.isEmpty()) {
            try {
                account = accountDao.findByLogin(id, pw);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
        if (account == null) {
            req.setAttribute("errorMessage", "ユーザーIDまたはパスワードが正しくありません。");
            req.setAttribute("accountId", id);
            req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, res);
            return;
        }

        // セッション固定化対策：ログイン成功時に張り直す
        HttpSession old = req.getSession(false);
        if (old != null) old.invalidate();
        HttpSession session = req.getSession(true);
        session.setAttribute("account", account);

        res.sendRedirect(req.getContextPath() + "/app/menu");
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }
}
