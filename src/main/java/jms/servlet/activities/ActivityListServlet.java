package jms.servlet.activities;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.ApplicationDao;
import jms.dao.LookupDao;
import jms.model.Account;

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
            req.setAttribute("applications",
                    dao.search(account.scopeClassId(), stageId, resultId, q,
                               eventDate, deadlineWithin));
            req.setAttribute("stages", lookupDao.selectionStages());
            req.setAttribute("results", lookupDao.selectionResults());
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
        req.setAttribute("pageCss", "activities");
        req.getRequestDispatcher("/WEB-INF/jsp/activities/list.jsp").forward(req, res);
    }

    private static int parseInt(String s) {
        try { return s == null || s.isBlank() ? 0 : Integer.parseInt(s); }
        catch (NumberFormatException e) { return 0; }
    }
}
