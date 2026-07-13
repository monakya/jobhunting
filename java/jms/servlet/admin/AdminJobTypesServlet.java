package jms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.IndustryDao;
import jms.dao.JobTypeDao;
import jms.model.MasterItem;

/** 管理 / 職種マスタ（画面20）。U-10 により業種に紐づく */
@WebServlet("/app/admin/jobtypes")
public class AdminJobTypesServlet extends HttpServlet {

    private final JobTypeDao dao = new JobTypeDao();
    private final IndustryDao industryDao = new IndustryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            req.setAttribute("items", dao.findAllWithUsage());
            req.setAttribute("industries", industryDao.findAllWithUsage());
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "職種マスタ");
        req.setAttribute("activeNav", "admin");
        req.setAttribute("activeTab", "jobtypes");
        req.getRequestDispatcher("/WEB-INF/jsp/admin/jobtypes.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String redirect = req.getContextPath() + "/app/admin/jobtypes";
        try {
            if ("add".equals(action)) {
                String name = trim(req.getParameter("name"));
                String industryId = req.getParameter("industryId");
                if (name.isEmpty() || industryId == null || industryId.isEmpty()) {
                    redirect += "?err=empty";
                } else {
                    dao.insert(Integer.parseInt(industryId), name);
                    redirect += "?msg=added";
                }
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                boolean inUse = dao.findAllWithUsage().stream()
                        .filter(m -> m.getId() == id).anyMatch(MasterItem::isInUse);
                if (inUse) { redirect += "?err=inuse"; }
                else { dao.delete(id); redirect += "?msg=deleted"; }
            }
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            redirect += "?err=dup";
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        res.sendRedirect(redirect);
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }
}
