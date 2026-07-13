package jms.servlet.students;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.LookupDao;
import jms.dao.StudentDao;
import jms.model.Account;
import jms.model.Student;
import jms.service.StudentService;

/**
 * 学生 登録／変更（画面04）。register / edit を1つの Servlet と1枚の JSP で共用する。
 * GET  /app/students/register        … 空フォーム
 * GET  /app/students/edit?no=XXXX    … 既存値入りフォーム
 * POST（hidden の mode で分岐）       … Service を呼んで一覧 or 閲覧へ PRG
 */
@WebServlet({"/app/students/register", "/app/students/edit"})
public class StudentFormServlet extends HttpServlet {

    private final StudentDao dao = new StudentDao();
    private final LookupDao lookupDao = new LookupDao();
    private final StudentService service = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        boolean edit = req.getRequestURI().endsWith("/edit");
        try {
            if (edit) {
                Student s = dao.findByNo(req.getParameter("no"));
                if (s == null) { res.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                Integer scope = account.scopeClassId();
                if (scope != null && s.getClassId() != scope) {
                    res.sendError(HttpServletResponse.SC_FORBIDDEN); return;
                }
                req.setAttribute("s", s);
                req.setAttribute("prefRegions", dao.findPreferredRegions(s.getStudentNo()));
                req.setAttribute("prefJobTypes", dao.findPreferredJobTypes(s.getStudentNo()));
            }
            setLookups(req);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("mode", edit ? "edit" : "register");
        req.setAttribute("pageTitle", edit ? "学生変更" : "学生登録");
        req.setAttribute("activeNav", "students");
        req.getRequestDispatcher("/WEB-INF/jsp/students/form.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Account account = (Account) req.getSession().getAttribute("account");
        boolean edit = "edit".equals(req.getParameter("mode"));

        Student s = bindFromRequest(req);
        String error = validate(s, edit);

        // 行スコープ：担任は自クラス以外を登録・変更できない
        Integer scope = account.scopeClassId();
        if (scope != null && s.getClassId() != scope) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        if (error != null) {
            req.setAttribute("errorMessage", error);
            req.setAttribute("s", s);
            try { setLookups(req); } catch (SQLException e) { throw new ServletException(e); }
            req.setAttribute("mode", edit ? "edit" : "register");
            req.setAttribute("pageTitle", edit ? "学生変更" : "学生登録");
            req.setAttribute("activeNav", "students");
            req.setAttribute("pageCss", "student");
            req.getRequestDispatcher("/WEB-INF/jsp/students/form.jsp").forward(req, res);
            return;
        }

        try {
            List<Integer> regions = ids(req, "region1", "region2", "region3");
            List<Integer> jobTypes = ids(req, "jobtype1", "jobtype2", "jobtype3");
            if (edit) {
                service.update(s, regions, jobTypes);
            } else {
                String pw = req.getParameter("password");
                if (pw == null || pw.isBlank()) pw = "password";  // 初期パスワード
                service.register(s, pw, regions, jobTypes);
            }
            res.sendRedirect(req.getContextPath() + "/app/students/view?no="
                    + s.getStudentNo() + "&msg=saved");           // PRG
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            req.setAttribute("errorMessage",
                "登録できませんでした。学籍番号の重複、または同クラスに同じ出席番号が存在します。");
            req.setAttribute("s", s);
            try { setLookups(req); } catch (SQLException ex) { throw new ServletException(ex); }
            req.setAttribute("mode", edit ? "edit" : "register");
            req.setAttribute("pageTitle", edit ? "学生変更" : "学生登録");
            req.setAttribute("activeNav", "students");
            req.getRequestDispatcher("/WEB-INF/jsp/students/form.jsp").forward(req, res);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void setLookups(HttpServletRequest req) throws SQLException {
        req.setAttribute("classes", lookupDao.classes());
        req.setAttribute("statuses", lookupDao.enrollmentStatuses());
        req.setAttribute("genders", lookupDao.genders());
        req.setAttribute("regions", lookupDao.regions());
        req.setAttribute("jobTypes", lookupDao.jobTypes());
    }

    /** フォーム値 → Student。数値変換の失敗は 0 にして validate で拾う */
    private Student bindFromRequest(HttpServletRequest req) {
        Student s = new Student();
        s.setStudentNo(trim(req.getParameter("studentNo")));
        s.setClassId(parseInt(req.getParameter("classId")));
        s.setAttendanceNo(parseInt(req.getParameter("attendanceNo")));
        s.setName(trim(req.getParameter("name")));
        s.setNameKana(trim(req.getParameter("nameKana")));
        s.setGenderId(parseInt(req.getParameter("genderId")));
        s.setBirthDate(trim(req.getParameter("birthDate")));
        s.setAdmissionYm(trim(req.getParameter("admissionYm")));
        s.setEnrollmentStatusId(parseInt(req.getParameter("enrollmentStatusId")));
        s.setEmail(trim(req.getParameter("email")));
        s.setPhone(trim(req.getParameter("phone")));
        s.setAddress(trim(req.getParameter("address")));
        s.setRefusesPlacement(req.getParameter("refusesPlacement") != null);
        s.setRemarks(trim(req.getParameter("remarks")));
        return s;
    }

    private String validate(Student s, boolean edit) {
        if (s.getStudentNo().isEmpty()) return "学籍番号を入力してください。";
        if (!edit && !s.getStudentNo().matches("[0-9A-Za-z_-]{1,20}"))
            return "学籍番号は半角英数字 20 文字以内で入力してください。";
        if (s.getClassId() <= 0) return "クラスを選択してください。";
        if (s.getAttendanceNo() <= 0) return "出席番号を入力してください。";
        if (s.getName().isEmpty()) return "氏名を入力してください。";
        if (s.getNameKana().isEmpty()) return "フリガナを入力してください。";
        // フリガナは全角カタカナのみ許可（長音符ー・中点・・全角/半角スペースは可）
        if (!s.getNameKana().matches("[ァ-ヶー・\\u3000 ]+"))
            return "フリガナは全角カタカナで入力してください。（ひらがな・漢字・半角カナは使えません）";
        if (s.getGenderId() <= 0) return "性別を選択してください。";
        if (s.getEnrollmentStatusId() <= 0) return "在籍状況を選択してください。";
        if (!s.getBirthDate().isEmpty() && !s.getBirthDate().matches("\\d{4}-\\d{2}-\\d{2}"))
            return "生年月日の形式が正しくありません。";
        if (!s.getAdmissionYm().isEmpty() && !s.getAdmissionYm().matches("\\d{4}-\\d{2}"))
            return "入学年月は YYYY-MM 形式で入力してください。";
        return null;
    }

    /** 志望プルダウン（最大3件）→ 重複と未選択を除いた ID リスト */
    private List<Integer> ids(HttpServletRequest req, String... names) {
        List<Integer> list = new ArrayList<>();
        for (String n : names) {
            int v = parseInt(req.getParameter(n));
            if (v > 0 && !list.contains(v)) list.add(v);
        }
        return list;
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }
    private static int parseInt(String s) {
        try { return s == null || s.isBlank() ? 0 : Integer.parseInt(s.trim()); }
        catch (NumberFormatException e) { return 0; }
    }
}
