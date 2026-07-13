package jms.servlet.activities;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.ApplicationDao;
import jms.dao.LookupDao;
import jms.model.Account;
import jms.model.ApplicationHistory;
import jms.model.JobApplication;
import jms.model.MasterItem;
import jms.service.ApplicationService;

/**
 * 就職活動 登録（画面08）／変更（08 の編集モード）。
 *
 * GET /app/activities/register        … 新規応募フォーム
 * GET /app/activities/edit?id=XXX      … 変更フォーム（選考の進行）
 * POST … hidden の action で分岐：
 *   register       … 応募ヘッダ + 最初の選考イベントを作成
 *   updateResult   … 現在の選考状況の結果を確定（→ 内定判定）
 *   addNext        … 次の選考予定を新しい履歴として追加
 *   acceptance     … 内定への回答（承諾/辞退/保留）
 *   toggleClosed   … 終了フラグ切り替え
 *   deleteHistory  … 誤登録の選考履歴を論理削除
 */
@WebServlet({"/app/activities/register", "/app/activities/edit"})
public class ActivityFormServlet extends HttpServlet {

    private final ApplicationDao dao = new ApplicationDao();
    private final LookupDao lookupDao = new LookupDao();
    private final ApplicationService service = new ApplicationService();

    // ---- GET ----

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        boolean edit = req.getRequestURI().endsWith("/edit");
        try {
            if (edit) {
                JobApplication a = dao.findById(parseLong(req.getParameter("id")));
                if (a == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                if (denied(account, a)) { res.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
                req.setAttribute("a", a);
                setEditLookups(req);
                req.setAttribute("mode", "edit");
                req.setAttribute("pageTitle", "就職活動変更");
                req.setAttribute("activeNav", "activities");
                req.getRequestDispatcher("/WEB-INF/jsp/activities/edit.jsp").forward(req, res);
            } else {
                setRegisterLookups(req, account);
                req.setAttribute("mode", "register");
                req.setAttribute("pageTitle", "就職活動登録");
                req.setAttribute("activeNav", "activities");
                req.getRequestDispatcher("/WEB-INF/jsp/activities/form.jsp").forward(req, res);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    // ---- POST ----

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        String action = req.getParameter("action");
        try {
            if ("register".equals(action)) {
                doRegister(req, res, account);
            } else {
                doEditAction(req, res, account, action);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    /** 新規応募 + 最初の選考イベント */
    private void doRegister(HttpServletRequest req, HttpServletResponse res, Account account)
            throws SQLException, ServletException, IOException {
        JobApplication a = bindApplication(req);
        ApplicationHistory first = bindHistory(req);
        String acceptDeadline = trim(req.getParameter("acceptDeadline"));

        // 行スコープ：担任は自クラスの学生にしか応募を作れない
        Integer scope = account.scopeClassId();
        String error = validateRegister(a, first);
        if (error == null && scope != null && !inScope(req, a.getStudentNo(), scope)) {
            error = "担当クラス以外の学生には登録できません。";
        }
        if (error != null) {
            req.setAttribute("errorMessage", error);
            req.setAttribute("a", a);
            req.setAttribute("fh", first);
            req.setAttribute("acceptDeadlineVal", acceptDeadline);
            setRegisterLookups(req, account);
            req.setAttribute("mode", "register");
            req.setAttribute("pageTitle", "就職活動登録");
            req.setAttribute("activeNav", "activities");
            req.getRequestDispatcher("/WEB-INF/jsp/activities/form.jsp").forward(req, res);
            return;
        }
        try {
            long id = service.register(a, first, acceptDeadline);
            res.sendRedirect(req.getContextPath() + "/app/activities/view?id=" + id + "&msg=saved");
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            req.setAttribute("errorMessage",
                "登録できませんでした。募集情報と応募先企業の対応、または入力値をご確認ください。");
            req.setAttribute("a", a);
            req.setAttribute("fh", first);
            req.setAttribute("acceptDeadlineVal", acceptDeadline);
            setRegisterLookups(req, account);
            req.setAttribute("mode", "register");
            req.setAttribute("pageTitle", "就職活動登録");
            req.setAttribute("activeNav", "activities");
            req.getRequestDispatcher("/WEB-INF/jsp/activities/form.jsp").forward(req, res);
        }
    }

    /** 変更画面の各アクション（結果確定・次の選考・内定回答・終了・履歴取消） */
    private void doEditAction(HttpServletRequest req, HttpServletResponse res,
                              Account account, String action)
            throws SQLException, ServletException, IOException {
        long id = parseLong(req.getParameter("id"));
        JobApplication a = dao.findById(id);
        if (a == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
        if (denied(account, a)) { res.sendError(HttpServletResponse.SC_FORBIDDEN); return; }

        String msg;
        switch (action == null ? "" : action) {
            case "updateResult": {
                long historyId = parseLong(req.getParameter("historyId"));
                int resultId = parseInt(req.getParameter("selectionResultId"));
                String resultDate = trim(req.getParameter("resultDate"));
                String remarks = trim(req.getParameter("remarks"));
                String acceptDeadline = trim(req.getParameter("acceptDeadline"));
                service.updateCurrentResult(id, a.getStudentNo(), a.getCompanyId(),
                        historyId, resultId, resultDate, remarks, acceptDeadline);
                msg = "result";
                break;
            }
            case "addNext": {
                ApplicationHistory h = bindHistory(req);
                String acceptDeadline = trim(req.getParameter("acceptDeadline"));
                service.addNextSelection(id, a.getStudentNo(), a.getCompanyId(), h, acceptDeadline);
                msg = "added";
                break;
            }
            case "acceptance": {
                long offerId = parseLong(req.getParameter("offerId"));
                Integer acceptanceId = parseIntOrNull(req.getParameter("offerAcceptanceId"));
                String acceptedDate = trim(req.getParameter("acceptedDate"));
                String acceptDeadline = trim(req.getParameter("acceptDeadline"));
                service.recordAcceptance(offerId, a.getStudentNo(), acceptanceId, acceptedDate, acceptDeadline);
                msg = "offer";
                break;
            }
            case "toggleClosed": {
                boolean closed = req.getParameter("closed") != null;
                service.setClosed(id, closed);
                msg = "closed";
                break;
            }
            case "deleteHistory": {
                long historyId = parseLong(req.getParameter("historyId"));
                service.logicalDeleteHistory(historyId);
                msg = "hdeleted";
                break;
            }
            default:
                res.sendError(HttpServletResponse.SC_BAD_REQUEST);
                return;
        }
        res.sendRedirect(req.getContextPath() + "/app/activities/edit?id=" + id + "&msg=" + msg);
    }

    // ---- lookups ----

    private void setRegisterLookups(HttpServletRequest req, Account account) throws SQLException {
        req.setAttribute("students", dao.studentsForDropdown(account.scopeClassId()));
        req.setAttribute("companies", dao.companiesForDropdown());
        req.setAttribute("recruitmentLabels", dao.recruitmentLabels());
        req.setAttribute("recruitmentIndexJson", toRecruitmentJson(dao.recruitmentIndex()));
        req.setAttribute("jobTypes", lookupDao.jobTypes());
        req.setAttribute("referralTypes", lookupDao.referralTypes());
        req.setAttribute("stages", lookupDao.selectionStages());
        req.setAttribute("results", lookupDao.selectionResults());
    }

    private void setEditLookups(HttpServletRequest req) throws SQLException {
        req.setAttribute("stages", lookupDao.selectionStages());
        req.setAttribute("results", lookupDao.selectionResults());
        req.setAttribute("acceptances", lookupDao.offerAcceptances());
    }

    /** recruitment_index を [recId,companyId,jobTypeId] の JSON 配列にする（企業選択での JS 絞り込み用） */
    private String toRecruitmentJson(List<int[]> idx) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < idx.size(); i++) {
            int[] r = idx.get(i);
            if (i > 0) sb.append(',');
            sb.append('[').append(r[0]).append(',').append(r[1]).append(',').append(r[2]).append(']');
        }
        return sb.append(']').toString();
    }

    // ---- binding ----

    private JobApplication bindApplication(HttpServletRequest req) {
        JobApplication a = new JobApplication();
        a.setStudentNo(trim(req.getParameter("studentNo")));
        a.setCompanyId(parseInt(req.getParameter("companyId")));
        a.setRecruitmentId(parseIntOrNull(req.getParameter("recruitmentId")));
        a.setJobTypeId(parseInt(req.getParameter("jobTypeId")));
        a.setReferralTypeId(parseInt(req.getParameter("referralTypeId")));
        a.setEntryDate(trim(req.getParameter("entryDate")));
        a.setClosed(req.getParameter("isClosed") != null);
        return a;
    }

    private ApplicationHistory bindHistory(HttpServletRequest req) {
        ApplicationHistory h = new ApplicationHistory();
        h.setSelectionStageId(parseInt(req.getParameter("selectionStageId")));
        h.setSelectionResultId(parseInt(req.getParameter("selectionResultId")));
        h.setFinalSelection(req.getParameter("isFinalSelection") != null);
        h.setEventAt(trim(req.getParameter("eventAt")));
        h.setPlace(trim(req.getParameter("place")));
        h.setInterviewerCount(parseIntOrNull(req.getParameter("interviewerCount")));
        h.setResultDate(trim(req.getParameter("resultDate")));
        h.setRemarks(trim(req.getParameter("remarks")));
        return h;
    }

    // ---- validation ----

    private String validateRegister(JobApplication a, ApplicationHistory first) throws SQLException {
        if (a.getStudentNo().isEmpty()) return "学生を選択してください。";
        if (a.getCompanyId() <= 0)      return "企業を選択してください。";
        if (a.getJobTypeId() <= 0)      return "応募職種を選択してください。";
        if (a.getReferralTypeId() <= 0) return "紹介区分を選択してください。";
        if (a.getEntryDate().isEmpty()) return "エントリー日を入力してください。";
        if (first.getSelectionStageId() <= 0)  return "最初の選考ステージを選択してください。";
        if (first.getSelectionResultId() <= 0) return "結果を選択してください（未定なら「未判明」）。";
        if (first.getEventAt().isEmpty())       return "選考日時を入力してください。";
        // 「参加」は説明会（allows_attendance=TRUE）のときだけ選べる（U-4）
        String err = validateAttendanceRule(first.getSelectionStageId(), first.getSelectionResultId());
        if (err != null) return err;
        return null;
    }

    /** result が「参加」なら stage が allows_attendance=TRUE であることを要求 */
    private String validateAttendanceRule(int stageId, int resultId) throws SQLException {
        int attendResultId = -1;
        for (MasterItem r : lookupDao.selectionResults()) {
            if ("参加".equals(r.getName())) { attendResultId = r.getId(); break; }
        }
        if (resultId != attendResultId) return null; // 「参加」以外はチェック不要
        for (MasterItem s : lookupDao.selectionStages()) {
            if (s.getId() == stageId) {
                boolean allows = "1".equals(s.getSubName());
                return allows ? null : "「参加」は説明会のときのみ選択できます。";
            }
        }
        return null;
    }

    // ---- helpers ----

    /** 担任のクラススコープ内に指定学生が居るか（登録時の行スコープ検査） */
    private boolean inScope(HttpServletRequest req, String studentNo, int scopeClassId) throws SQLException {
        for (MasterItem m : dao.studentsForDropdown(scopeClassId)) {
            if (studentNo.equals(m.getSubName())) return true;
        }
        return false;
    }

    private boolean denied(Account account, JobApplication a) {
        Integer scope = account.scopeClassId();
        return scope != null && a.getClassId() != scope;
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }

    private static int parseInt(String s) {
        try { return s == null || s.isBlank() ? 0 : Integer.parseInt(s.trim()); }
        catch (NumberFormatException e) { return 0; }
    }

    private static Integer parseIntOrNull(String s) {
        try { return (s == null || s.isBlank()) ? null : Integer.valueOf(s.trim()); }
        catch (NumberFormatException e) { return null; }
    }

    private static long parseLong(String s) {
        try { return s == null || s.isBlank() ? 0 : Long.parseLong(s.trim()); }
        catch (NumberFormatException e) { return 0; }
    }
}
