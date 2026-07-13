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
import jms.service.StudentService;

/**
 * 学生削除（画面05）。GET = 確認画面、POST = 実行。
 * 物理削除：account を消すと CASCADE で student・志望・就活・履歴・内定が消える。
 */
@WebServlet("/app/students/delete")
public class StudentDeleteServlet extends HttpServlet {

    private final StudentDao dao = new StudentDao();
    private final StudentService service = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Student s = load(req, res);
        if (s == null) return;
        req.setAttribute("s", s);
        req.setAttribute("pageTitle", "学生削除");
        req.setAttribute("activeNav", "students");
        req.getRequestDispatcher("/WEB-INF/jsp/students/delete.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Student s = load(req, res);
        if (s == null) return;
        try {
            service.delete(s.getStudentNo(), s.getAccountId());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        res.sendRedirect(req.getContextPath() + "/app/students/list?msg=deleted");  // PRG
    }

    /** 取得 + 行スコープ検査（担任は自クラス以外 403）。null を返したら応答済み */
    private Student load(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        String no = req.getParameter("no");
        try {
            Student s = (no == null) ? null : dao.findByNo(no);
            if (s == null) {
                res.sendError(HttpServletResponse.SC_NOT_FOUND);
                return null;
            }
            Integer scope = account.scopeClassId();
            if (scope != null && s.getClassId() != scope) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return null;
            }
            return s;
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
