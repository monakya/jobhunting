package jms.servlet.students;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.StudentDao;
import jms.model.Account;
import jms.model.Student;

/** 学生閲覧（画面03）。行スコープ：担任は自クラスの学生以外 403 */
@WebServlet("/app/students/view")
public class StudentViewServlet extends HttpServlet {

    private final StudentDao dao = new StudentDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        String no = req.getParameter("no");
        try {
            Student s = (no == null) ? null : dao.findByNo(no);
            if (s == null) {
                res.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            // 行レベルのスコープ検査：URL の no を書き換えても他クラスは見えない
            Integer scope = account.scopeClassId();
            if (scope != null && s.getClassId() != scope) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
            req.setAttribute("s", s);
            req.setAttribute("prefRegions", dao.findPreferredRegions(no));
            req.setAttribute("prefJobTypes", dao.findPreferredJobTypes(no));
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "学生閲覧");
        req.setAttribute("activeNav", "students");
        req.setAttribute("pageCss", "student");
        req.getRequestDispatcher("/WEB-INF/jsp/students/view.jsp").forward(req, res);
    }
}
