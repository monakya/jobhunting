package jms.servlet.activities;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
<<<<<<< HEAD
import java.util.HashSet;
import java.util.List;
import java.util.Set;
=======
>>>>>>> branch 'master' of https://github.com/monakya/jobhunting

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

/**
 * 就職活動 一覧（画面06）。担任は自クラスのみ（scopeClassId）。
 * フェーズ7E: メニューKPIからの遷移フィルタを追加。
 *   ?eventDate=today|tomorrow … その日に選考イベントがある応募
 *   ?deadlineWithin=7         … 承諾期限が7日以内で未回答の内定がある応募
 */
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

        // --- メニューKPIからの遷移フィルタ（フェーズ7E） ---
        // eventDate は "today" / "tomorrow" のみ受け付ける（それ以外は無視 = フィルタなし）。
        // 日付そのものを受けない理由: リンク元がメニューの2セルだけなので、
        // 任意日付を受ける口を今は開けない（必要になったら追加する）
        String eventDateParam = req.getParameter("eventDate");
        LocalDate eventDate = null;
        String eventDateLabel = null;
        if ("today".equals(eventDateParam)) {
            eventDate = LocalDate.now();
            eventDateLabel = "本日の予定";
        } else if ("tomorrow".equals(eventDateParam)) {
            eventDate = LocalDate.now().plusDays(1);
            eventDateLabel = "明日の予定";
        }
        int deadlineWithin = parseInt(req.getParameter("deadlineWithin"));

        try {
<<<<<<< HEAD
            List<JobApplication> applications = dao.search(account.scopeClassId(), stageId, resultId, q);
            req.setAttribute("applications", applications);
=======
            req.setAttribute("applications",
                    dao.search(account.scopeClassId(), stageId, resultId, q,
                               eventDate, deadlineWithin));
>>>>>>> branch 'master' of https://github.com/monakya/jobhunting
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
        // JSP のフィルタ表示・hidden 保持用（正規化済みの値だけを渡す）
        req.setAttribute("eventDateParam", eventDate == null ? "" : eventDateParam);
        req.setAttribute("eventDateLabel", eventDateLabel);
        req.setAttribute("deadlineWithin", deadlineWithin);
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
