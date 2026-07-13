package jms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.IndustryDao;
import jms.model.MasterItem;

/** 管理 / 業種マスタ（U-10 で新設） */
@WebServlet("/app/admin/industries")
public class AdminIndustriesServlet extends HttpServlet {

    private final IndustryDao dao = new IndustryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            req.setAttribute("items", dao.findAllWithUsage());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "業種マスタ");
        req.setAttribute("activeNav", "admin");
        req.setAttribute("activeTab", "industries");
        req.setAttribute("pageCss", "admin");
        req.getRequestDispatcher("/WEB-INF/jsp/admin/industries.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String redirect = req.getContextPath() + "/app/admin/industries";
        try {
            if ("add".equals(action)) {
                String name = trim(req.getParameter("name"));
                if (name.isEmpty()) { redirect += "?err=empty"; }
                else { dao.insert(name); redirect += "?msg=added"; }
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                // 使用中チェック（正確な判定は一覧の使用件数と同じクエリで再確認）
                boolean inUse = dao.findAllWithUsage().stream()
                        .filter(m -> m.getId() == id).anyMatch(MasterItem::isInUse);
                if (inUse) { redirect += "?err=inuse"; }
                else { dao.delete(id); redirect += "?msg=deleted"; }
            }
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            // UNIQUE 違反（重複名）または FK 違反（使用中）
            redirect += "?err=dup";
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        res.sendRedirect(redirect);   // PRG: POST 後は必ずリダイレクト
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }
}
