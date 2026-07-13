package jms.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jms.model.Account;

/**
 * /app/* 配下はログイン必須。未ログインならログイン画面へ。
 * ロール別のアクセス制御もここで行う（ロール権限はコードで保持する方針）。
 *
 *   /app/students/*    … 担任(全クラス) / 就職指導部 / 管理者
 *   /app/companies/*   … 閲覧: 担任・就職指導部・管理者 / 編集: 担任・就職指導部・管理者
 *   /app/activities/*  … 担任(自クラスのみ) / 就職指導部 / 管理者
 *   /app/report        … 担任 / 就職指導部 / 校長・教務部長 / 管理者
 *   /app/admin/*       … 管理者のみ
 *
 * クラススコープ（担任の自クラス制限）は URL では判定できないため、
 * 各 DAO が Account#scopeClassId() を WHERE 句に反映して実現する。
 */
@WebFilter("/app/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);
        Account account = (session == null) ? null : (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String path = request.getRequestURI().substring(request.getContextPath().length());
        if (!allowed(account, path, request.getMethod())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        chain.doFilter(req, res);
    }

    private boolean allowed(Account a, String path, String method) {
        if (a.isAdmin()) return true;

        if (path.startsWith("/app/admin/"))      return false; // 管理者のみ（上で return 済み）
        if (path.startsWith("/app/students/"))   return a.getCanViewStudents();
        if (path.startsWith("/app/activities/")) return a.getCanViewActivities();
        if (path.startsWith("/app/report"))      return a.getCanViewReport();
        if (path.startsWith("/app/companies/")) {
            boolean write = !"GET".equalsIgnoreCase(method)
                    || path.contains("/register") || path.contains("/edit") || path.contains("/delete");
            return write ? a.getCanEditCompanies() : a.getCanViewCompanies();
        }
        // メニューなどその他の /app/* はログイン済みなら可
        return true;
    }
}
