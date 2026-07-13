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

/** 企業閲覧（画面11） */
@WebServlet("/app/companies/view")
public class CompanyViewServlet extends HttpServlet {

    private final CompanyDao dao = new CompanyDao();

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
        req.setAttribute("pageTitle", "企業閲覧");
        req.setAttribute("activeNav", "companies");
        req.getRequestDispatcher("/WEB-INF/jsp/companies/view.jsp").forward(req, res);
    }

    private static int parseInt(String s) {
        try { return s == null ? 0 : Integer.parseInt(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
