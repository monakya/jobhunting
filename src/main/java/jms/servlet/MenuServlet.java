package jms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jms.dao.MenuDao;
import jms.model.Account;

/**
 * メインメニュー（画面 16）。
 * フェーズ7D で KPI バナーを「本日の予定／明日の予定／承諾期限7日以内／内定率」に刷新。
 *
 * スコープの考え方:
 * - 担任（homeroomClassId あり）でログイン → KPI 4種は自クラスの値。ラベルは「クラス内定率」
 * - それ以外のロール → 全体の値。ラベルは「内定率」
 * - カードのチップは常に全体の値（MenuDao 側で固定）
 * メニュー項目の出し分けはヘッダ JSP（Account の can〜プロパティ）が行う。
 */
@WebServlet("/app/menu")
public class MenuServlet extends HttpServlet {

    private final MenuDao dao = new MenuDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Account account = (Account) req.getSession().getAttribute("account");

        // 担任なら自クラスに KPI を絞る（アクセス制御ではなく「関心の範囲」の絞り込み。
        //  scopeClassId() は全クラス閲覧の方針変更で常に null を返すため、
        //  ここでは表示用に保持している homeroomClassId を直接使う）
        Integer kpiClassId = null;
        if (account != null && account.isTeacher() && account.getHomeroomClassId() != null) {
            kpiClassId = account.getHomeroomClassId();
        }

        try {
            req.setAttribute("summary", dao.summary(kpiClassId));
            if (kpiClassId != null) {
                req.setAttribute("homeroomClassName", dao.className(kpiClassId));
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        req.setAttribute("kpiScoped", kpiClassId != null);
        req.setAttribute("pageTitle", "メインメニュー");
        req.setAttribute("activeNav", "menu");
        req.setAttribute("pageCss", "menu");
        req.getRequestDispatcher("/WEB-INF/jsp/menu.jsp").forward(req, res);
    }
}
