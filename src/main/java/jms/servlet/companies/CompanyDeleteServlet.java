package jms.servlet.companies;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.CompanyDao;
import jms.model.Company;
import jms.service.CompanyService;

/**
 * 企業削除（画面13）。受験履歴のある企業は削除不可 →「連携終了」への変更を促す（P-5）。
 */
@WebServlet("/app/companies/delete")
public class CompanyDeleteServlet extends HttpServlet {

    private final CompanyDao dao = new CompanyDao();
    private final CompanyService service = new CompanyService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            Company c = dao.findById(parseInt(req.getParameter("id")));
            if (c == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
            req.setAttribute("c", c);
            req.setAttribute("applicationCount", dao.countApplications(c.getCompanyId()));
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "企業削除");
        req.setAttribute("activeNav", "companies");
        req.setAttribute("pageCss", "company");
        req.getRequestDispatcher("/WEB-INF/jsp/companies/delete.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int id = parseInt(req.getParameter("id"));
        try {
            Company c = dao.findById(id);
            if (c == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
            // 削除ガード：受験履歴がある企業は削除不可
            if (dao.countApplications(id) > 0) {
                res.sendRedirect(req.getContextPath()
                        + "/app/companies/view?id=" + id + "&err=inuse");
                return;
            }
            service.delete(id);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        res.sendRedirect(req.getContextPath() + "/app/companies/list?msg=deleted");
    }

    private static int parseInt(String s) {
        try { return s == null ? 0 : Integer.parseInt(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
