package jms.servlet.report;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.ReportDao;
import jms.model.DeptGroup;
import jms.model.ReportRow;

/**
 * 活動状況報告（画面14）。読み取り専用ダッシュボード。
 * 校長・教務部長がアクセスできる唯一の画面（AuthFilter が canViewReport で許可）。
 *
 * ReportDao からクラス別の集計を受け取り、学科ごとにまとめて小計を作り、全体合計も出す。
 * 更新が無い読み取り集計なので Service 層は挟まず、積み上げだけここで行う。
 */
@WebServlet("/app/report")
public class ReportServlet extends HttpServlet {

    private final ReportDao dao = new ReportDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            List<ReportRow> classRows = dao.classStats();

            List<DeptGroup> groups = new ArrayList<>();
            ReportRow overall = new ReportRow();
            overall.setLabel("全体");

            DeptGroup current = null;
            for (ReportRow row : classRows) {
                if (current == null || !current.getDeptName().equals(row.getDeptName())) {
                    current = new DeptGroup(row.getDeptName());
                    groups.add(current);
                }
                current.add(row);      // クラス行追加 + 学科小計に加算
                overall.accumulate(row);
            }

            req.setAttribute("groups", groups);
            req.setAttribute("overall", overall);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        req.setAttribute("pageTitle", "活動状況報告");
        req.setAttribute("activeNav", "report");
        req.getRequestDispatcher("/WEB-INF/jsp/report/report.jsp").forward(req, res);
    }
}
