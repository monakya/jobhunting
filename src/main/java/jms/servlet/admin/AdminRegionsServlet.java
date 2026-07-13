package jms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.RegionDao;
import jms.model.MasterItem;

/** 管理 / 地域マスタ（画面21）。都道府県 → 市区町村の2階層。U-7 により読み仮名なし */
@WebServlet("/app/admin/regions")
public class AdminRegionsServlet extends HttpServlet {

    private final RegionDao dao = new RegionDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            List<MasterItem> prefs = dao.findPrefectures();
            req.setAttribute("prefectures", prefs);

            // 選択中の県。指定なしなら先頭
            int prefId = 0;
            String p = req.getParameter("pref");
            if (p != null && !p.isEmpty()) {
                prefId = Integer.parseInt(p);
            } else if (!prefs.isEmpty()) {
                prefId = prefs.get(0).getId();
            }
            req.setAttribute("selectedPref", prefId);
            if (prefId > 0) {
                req.setAttribute("regions", dao.findRegions(prefId));
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "地域マスタ");
        req.setAttribute("activeNav", "admin");
        req.setAttribute("activeTab", "regions");
        req.setAttribute("pageCss", "admin");
        req.getRequestDispatcher("/WEB-INF/jsp/admin/regions.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String pref = req.getParameter("prefId");
        String redirect = req.getContextPath() + "/app/admin/regions"
                + (pref != null && !pref.isEmpty() ? "?pref=" + Integer.parseInt(pref) : "");
        String sep = redirect.contains("?") ? "&" : "?";
        try {
            if ("addPref".equals(action)) {
                String name = trim(req.getParameter("name"));
                if (name.isEmpty()) { redirect += sep + "err=empty"; }
                else { dao.insertPrefecture(name); redirect += sep + "msg=added"; }
            } else if ("add".equals(action)) {
                dao.insert(Integer.parseInt(pref), req.getParameter("city"));
                redirect += sep + "msg=added";
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                boolean inUse = dao.findRegions(Integer.parseInt(pref)).stream()
                        .filter(m -> m.getId() == id).anyMatch(MasterItem::isInUse);
                if (inUse) { redirect += sep + "err=inuse"; }
                else { dao.delete(id); redirect += sep + "msg=deleted"; }
            }
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {
            redirect += sep + "err=dup";
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        res.sendRedirect(redirect);
    }

    private static String trim(String s) { return s == null ? "" : s.trim(); }
}
