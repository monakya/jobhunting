package jms.servlet.companies;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.CompanyDao;
import jms.dao.IndustryDao;
import jms.dao.LookupDao;

/** 企業一覧（画面10） */
@WebServlet("/app/companies/list")
public class CompanyListServlet extends HttpServlet {

    private final CompanyDao dao = new CompanyDao();
    private final IndustryDao industryDao = new IndustryDao();
    private final LookupDao lookupDao = new LookupDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int industryId = parseInt(req.getParameter("industryId"));
        int statusId = parseInt(req.getParameter("statusId"));
        int regionId = parseInt(req.getParameter("regionId"));
        String q = req.getParameter("q");
        try {
            req.setAttribute("companies", dao.search(industryId, statusId, regionId, q));
            req.setAttribute("industries", industryDao.findAllWithUsage());
            req.setAttribute("statuses", lookupDao.companyStatuses());
            req.setAttribute("regions", lookupDao.regions());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("industryId", industryId);
        req.setAttribute("statusId", statusId);
        req.setAttribute("regionId", regionId);
        req.setAttribute("q", q == null ? "" : q);
        req.setAttribute("pageTitle", "企業一覧");
        req.setAttribute("activeNav", "companies");
        req.setAttribute("pageCss", "company");
        req.getRequestDispatcher("/WEB-INF/jsp/companies/list.jsp").forward(req, res);
    }

    private static int parseInt(String s) {
        try { return s == null || s.isBlank() ? 0 : Integer.parseInt(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
