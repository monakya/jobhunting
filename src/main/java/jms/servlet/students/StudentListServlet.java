package jms.servlet.students;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.LookupDao;
import jms.dao.StudentDao;
import jms.model.Account;

/** 学生一覧（画面02）。担任は自クラスのみ（DAO の scope 引数で制御） */
@WebServlet("/app/students/list")
public class StudentListServlet extends HttpServlet {

    private final StudentDao studentDao = new StudentDao();
    private final LookupDao lookupDao = new LookupDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");

        int classId = parseInt(req.getParameter("classId"));
        int statusId = parseInt(req.getParameter("statusId"));
        String q = req.getParameter("q");

        try {
            req.setAttribute("students",
                studentDao.search(account.scopeClassId(), classId, statusId, q));
            req.setAttribute("classes", lookupDao.classes());
            req.setAttribute("statuses", lookupDao.enrollmentStatuses());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("classId", classId);
        req.setAttribute("statusId", statusId);
        req.setAttribute("q", q == null ? "" : q);
        req.setAttribute("pageTitle", "学生一覧");
        req.setAttribute("activeNav", "students");
        req.setAttribute("pageCss", "student");
        req.getRequestDispatcher("/WEB-INF/jsp/students/list.jsp").forward(req, res);
    }

    private static int parseInt(String s) {
        try { return s == null ? 0 : Integer.parseInt(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
