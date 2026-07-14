package jms.servlet.activities;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.ApplicationDao;
import jms.dao.LookupDao;
import jms.dao.StudentDao;
import jms.model.Account;
import jms.model.JobApplication;
import jms.model.Student;

/** 就職活動 一覧（画面06）。担任は自クラスのみ（scopeClassId） */
@WebServlet("/app/activities/list")
public class ActivityListServlet extends HttpServlet {

    private final ApplicationDao dao = new ApplicationDao();
    private final LookupDao lookupDao = new LookupDao();
    private final StudentDao studentDao = new StudentDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        int stageId = parseInt(req.getParameter("stageId"));
        int resultId = parseInt(req.getParameter("resultId"));
        String q = req.getParameter("q");
        try {
            List<JobApplication> applications = dao.search(account.scopeClassId(), stageId, resultId, q);
            req.setAttribute("applications", applications);
            req.setAttribute("stages", lookupDao.selectionStages());
            req.setAttribute("results", lookupDao.selectionResults());
            computeKpis(req, account, applications);
            LocalDate today = LocalDate.now();
            req.setAttribute("todayStr", today.toString());
            req.setAttribute("urgentCutoff", today.plusDays(3).toString());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("stageId", stageId);
        req.setAttribute("resultId", resultId);
        req.setAttribute("q", q == null ? "" : q);
        req.setAttribute("pageTitle", "就職活動一覧");
        req.setAttribute("activeNav", "activities");
        req.setAttribute("pageCss", "activities-list");
        req.getRequestDispatcher("/WEB-INF/jsp/activities/list.jsp").forward(req, res);
    }

    /**
     * KPIストリップ（在籍中・活動中・内定・内定承諾・未活動・承諾期限7日以内）を
     * 「絞り込み前の全件」から算出して request にセットする（フィルタの影響を受けない校内全体の数字）。
     */
    private void computeKpis(HttpServletRequest req, Account account, List<JobApplication> filteredIgnored)
            throws SQLException {
        List<Student> students = studentDao.search(account.scopeClassId(), 0, 0, null);
        List<JobApplication> all = dao.search(account.scopeClassId(), 0, 0, null);

        Set<String> studentsWithApplication = new HashSet<>();
        for (JobApplication a : all) studentsWithApplication.add(a.getStudentNo());

        int enrolled = 0, active = 0, offered = 0, accepted = 0, inactive = 0;
        for (Student s : students) {
            if (!"在籍中".equals(s.getEnrollmentStatusName())) continue;
            enrolled++;
            if (studentsWithApplication.contains(s.getStudentNo())) active++; else inactive++;
            if (s.isHasOffer()) offered++;
            if (s.isHasAcceptedOffer()) accepted++;
        }

        int deadlineSoon = 0;
        LocalDate today = LocalDate.now();
        for (JobApplication a : all) {
            if (a.isHasOffer() && a.getAcceptDeadline() != null && isEmpty(a.getOfferAcceptanceName())) {
                try {
                    LocalDate dl = LocalDate.parse(a.getAcceptDeadline());
                    if (!dl.isBefore(today) && !dl.isAfter(today.plusDays(7))) deadlineSoon++;
                } catch (Exception ignore) { /* 不正な日付は無視 */ }
            }
        }

        req.setAttribute("kpiEnrolled", enrolled);
        req.setAttribute("kpiActive", active);
        req.setAttribute("kpiOffered", offered);
        req.setAttribute("kpiAccepted", accepted);
        req.setAttribute("kpiInactive", inactive);
        req.setAttribute("kpiDeadlineSoon", deadlineSoon);
    }

    private static boolean isEmpty(String s) { return s == null || s.isBlank(); }

    private static int parseInt(String s) {
        try { return s == null || s.isBlank() ? 0 : Integer.parseInt(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
