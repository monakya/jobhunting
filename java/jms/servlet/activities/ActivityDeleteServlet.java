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
import jms.service.ApplicationService;

/**
 * 就職活動 削除確認（画面09）。
 * 応募ヘッダを物理削除すると、紐づく選考履歴が CASCADE で全削除される（確認画面で明示）。
 * 内定（offer）は student×company 紐付けのため自動では消えない。
 * 応募だけ消すと offer が取り残される不整合が起きうるので、
 * 同時削除するかをチェックボックスで選べるようにする（規約 §5）。
 */
@WebServlet("/app/activities/delete")
public class ActivityDeleteServlet extends HttpServlet {

    private final ApplicationDao dao = new ApplicationDao();
    private final ApplicationService service = new ApplicationService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        try {
            JobApplication a = dao.findById(parseLong(req.getParameter("id")));
            if (a == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
            if (denied(account, a)) { res.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
            req.setAttribute("a", a);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "就職活動削除");
        req.setAttribute("activeNav", "activities");
        req.getRequestDispatcher("/WEB-INF/jsp/activities/delete.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        long id = parseLong(req.getParameter("id"));
        boolean alsoOffer = req.getParameter("alsoDeleteOffer") != null;
        try {
            JobApplication a = dao.findById(id);
            if (a == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
            if (denied(account, a)) { res.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
            service.delete(id, a.getStudentNo(), a.getCompanyId(), alsoOffer);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        res.sendRedirect(req.getContextPath() + "/app/activities/list?msg=deleted");
    }

    /** 行スコープ拒否判定（scope が null なら常に許可） */
    private boolean denied(Account account, JobApplication a) {
        Integer scope = account.scopeClassId();
        return scope != null && a.getClassId() != scope;
    }

    private static long parseLong(String s) {
        try { return s == null ? 0 : Long.parseLong(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
