package jms.servlet.activities;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.ApplicationDao;
import jms.dao.LookupDao;
import jms.model.Account;

/** 就職活動 一覧（画面06）。担任は自クラスのみ（scopeClassId） */
@WebServlet("/app/activities/list")
public class ActivityListServlet extends HttpServlet {

    private final ApplicationDao dao = new ApplicationDao();
    private final LookupDao lookupDao = new LookupDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        int stageId = parseInt(req.getParameter("stageId"));
        int resultId = parseInt(req.getParameter("resultId"));
        String q = req.getParameter("q");
        try {
            req.setAttribute("applications",
                    dao.search(account.scopeClassId(), stageId, resultId, q));
            req.setAttribute("stages", lookupDao.selectionStages());
            req.setAttribute("results", lookupDao.selectionResults());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("stageId", stageId);
        req.setAttribute("resultId", resultId);
        req.setAttribute("q", q == null ? "" : q);
        req.setAttribute("pageTitle", "就職活動一覧");
        req.setAttribute("activeNav", "activities");
        req.getRequestDispatcher("/WEB-INF/jsp/activities/list.jsp").forward(req, res);
    }

    private static int parseInt(String s) {
        try { return s == null || s.isBlank() ? 0 : Integer.parseInt(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
