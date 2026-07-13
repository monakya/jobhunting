package jms.servlet.companies;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.CompanyDao;
import jms.dao.IndustryDao;
import jms.dao.LookupDao;
import jms.model.Account;
import jms.model.Company;
import jms.model.Recruitment;
import jms.service.CompanyService;

/**
 * 企業 登録／変更（画面12）。企業本体 + 募集明細行を1画面で編集する。
 *
 * 募集明細行の受け渡し方式：
 *   フォームは recId_1, jobType_1, headcount_1, regions_1（複数選択）,
 *              recId_2, jobType_2, ... のように行番号付きの名前で送る。
 *   行数は rowCount で受け取り、jobType が未選択の行は無視する。
 *   recId_n が 0 より大きければ既存行の更新、0 なら新規行。
 */
@WebServlet({"/app/companies/register", "/app/companies/edit"})
public class CompanyFormServlet extends HttpServlet {

    private static final int MAX_ROWS = 10;

    private final CompanyDao dao = new CompanyDao();
    private final IndustryDao industryDao = new IndustryDao();
    private final LookupDao lookupDao = new LookupDao();
    private final CompanyService service = new CompanyService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // 企業の編集は就職指導部と管理者のみ（AuthFilter でも制御しているが明示）
        Account account = (Account) req.getSession().getAttribute("account");
        if (!account.getCanEditCompanies()) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        boolean edit = req.getRequestURI().endsWith("/edit");
        try {
            if (edit) {
                Company c = dao.findById(parseInt(req.getParameter("id")));
                if (c == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                req.setAttribute("c", c);
            }
            setLookups(req);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("mode", edit ? "edit" : "register");
        req.setAttribute("pageTitle", edit ? "企業変更" : "企業登録");
        req.setAttribute("activeNav", "companies");
        req.getRequestDispatcher("/WEB-INF/jsp/companies/form.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        if (!account.getCanEditCompanies()) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        boolean edit = "edit".equals(req.getParameter("mode"));
        Company c = bindFromRequest(req);
        String error = validate(c);

        if (error != null) {
            req.setAttribute("errorMessage", error);
            req.setAttribute("c", c);
            try { setLookups(req); } catch (SQLException e) { throw new ServletException(e); }
            req.setAttribute("mode", edit ? "edit" : "register");
            req.setAttribute("pageTitle", edit ? "企業変更" : "企業登録");
            req.setAttribute("activeNav", "companies");
            req.getRequestDispatcher("/WEB-INF/jsp/companies/form.jsp").forward(req, res);
            return;
        }

        try {
            int id;
            if (edit) {
                service.update(c);
                id = c.getCompanyId();
            } else {
                id = service.register(c);
            }
            res.sendRedirect(req.getContextPath() + "/app/companies/view?id=" + id + "&msg=saved");
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            req.setAttribute("errorMessage",
                "保存できませんでした。同じ職種の募集が重複しているか、参照整合性エラーです。");
            req.setAttribute("c", c);
            try { setLookups(req); } catch (SQLException ex) { throw new ServletException(ex); }
            req.setAttribute("mode", edit ? "edit" : "register");
            req.setAttribute("pageTitle", edit ? "企業変更" : "企業登録");
            req.setAttribute("activeNav", "companies");
            req.getRequestDispatcher("/WEB-INF/jsp/companies/form.jsp").forward(req, res);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void setLookups(HttpServletRequest req) throws SQLException {
        req.setAttribute("industries", industryDao.findAllWithUsage());
        req.setAttribute("statuses", lookupDao.companyStatuses());
        req.setAttribute("regions", lookupDao.regions());
        req.setAttribute("jobTypes", lookupDao.jobTypes());
        req.setAttribute("maxRows", MAX_ROWS);
    }

    private Company bindFromRequest(HttpServletRequest req) {
        Company c = new Company();
        c.setCompanyId(parseInt(req.getParameter("companyId")));
        c.setCompanyName(trim(req.getParameter("companyName")));
        c.setCompanyNameKana(trim(req.getParameter("companyNameKana")));
        c.setCorporateName(trim(req.getParameter("corporateName")));
        c.setCorporateNameKana(trim(req.getParameter("corporateNameKana")));
        c.setIndustryId(parseInt(req.getParameter("industryId")));
        c.setCompanyStatusId(parseInt(req.getParameter("companyStatusId")));
        c.setRegionId(parseInt(req.getParameter("regionId")));
        c.setCapital(parseLongOrNull(req.getParameter("capital")));
        c.setEmployeeCount(parseIntOrNull(req.getParameter("employeeCount")));
        c.setEstablishedYear(parseIntOrNull(req.getParameter("establishedYear")));
        c.setWebsiteUrl(trim(req.getParameter("websiteUrl")));
        c.setPostalCode(trim(req.getParameter("postalCode")));
        c.setAddress(trim(req.getParameter("address")));
        c.setTel(trim(req.getParameter("tel")));
        c.setEmail(trim(req.getParameter("email")));
        c.setContactPerson(trim(req.getParameter("contactPerson")));
        c.setHasHiringRecord(req.getParameter("hasHiringRecord") != null);
        c.setRemarks(trim(req.getParameter("remarks")));

        // ---- 募集明細行 ----
        for (int n = 1; n <= MAX_ROWS; n++) {
            int jobTypeId = parseInt(req.getParameter("jobType_" + n));
            if (jobTypeId <= 0) continue;                     // 職種未選択の行は無視
            Recruitment r = new Recruitment();
            r.setRecruitmentId(parseInt(req.getParameter("recId_" + n)));
            r.setJobTypeId(jobTypeId);
            r.setHeadcount(parseInt(req.getParameter("headcount_" + n)));
            String[] regs = req.getParameterValues("regions_" + n);
            if (regs != null) {
                List<Integer> ids = new ArrayList<>();
                for (String s : regs) {
                    int v = parseInt(s);
                    if (v > 0 && !ids.contains(v)) ids.add(v);
                }
                r.setRegionIds(ids);
            }
            c.getRecruitments().add(r);
        }
        return c;
    }

    private String validate(Company c) {
        if (c.getCompanyName().isEmpty()) return "企業名を入力してください。";
        if (c.getCompanyNameKana().isEmpty()) return "企業名のフリガナを入力してください。";
        if (c.getIndustryId() <= 0) return "業種を選択してください。";
        if (c.getCompanyStatusId() <= 0) return "状態を選択してください。";
        if (c.getRegionId() <= 0) return "所在地（地域）を選択してください。";
        java.util.Set<Integer> seen = new java.util.HashSet<>();
        for (Recruitment r : c.getRecruitments()) {
            if (r.getHeadcount() <= 0) return "募集人数は1以上で入力してください。";
            if (!seen.add(r.getJobTypeId())) return "同じ職種の募集行が重複しています。";
            if (r.getRegionIds().isEmpty()) return "各募集に勤務地を1つ以上選択してください。";
        }
        return null;
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }
    private static int parseInt(String s) {
        try { return s == null || s.isBlank() ? 0 : Integer.parseInt(s.trim()); }
        catch (NumberFormatException e) { return 0; }
    }
    private static Integer parseIntOrNull(String s) {
        try { return s == null || s.isBlank() ? null : Integer.valueOf(s.trim()); }
        catch (NumberFormatException e) { return null; }
    }
    private static Long parseLongOrNull(String s) {
        try { return s == null || s.isBlank() ? null : Long.valueOf(s.trim().replace(",", "")); }
        catch (NumberFormatException e) { return null; }
    }
}
