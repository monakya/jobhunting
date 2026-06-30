<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // DB 接続
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/jms?characterEncoding=UTF-8",
        "root", "password"
    );

    // 都道府県一覧
    PreparedStatement psPref = conn.prepareStatement(
        "SELECT id, name, city_count FROM regions_pref ORDER BY sort"
    );
    ResultSet pref = psPref.executeQuery();

    // 選択中の都道府県（初期は福岡県=40）
    String prefId = request.getParameter("pref");
    if (prefId == null) prefId = "40";

    PreparedStatement psCity = conn.prepareStatement(
        "SELECT id, name, kana, wish_count, company_count " +
        "FROM regions_city WHERE pref_id = ? ORDER BY sort"
    );
    psCity.setString(1, prefId);
    ResultSet city = psCity.executeQuery();
%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>地域マスタ</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./21-admin-regions.css">
</head>
<body>

<div class="page-label">JMS / 管理 地域マスタ</div>

<div class="screen-frame">

  <!-- 左：都道府県 -->
  <div class="left-pane">
    <div class="pane-title">都道府県</div>

    <%
      while(pref.next()){
        String id = pref.getString("id");
        String name = pref.getString("name");
        String count = pref.getString("city_count");
    %>

      <a class="pref-item <%= id.equals(prefId) ? "active" : "" %>"
         href="?pref=<%= id %>">
        <%= name %>
        <span><%= count %> 市区</span>
      </a>

    <% } %>
  </div>

  <!-- 右：市区町村 -->
  <div class="right-pane">
    <table class="city-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>市区町村名</th>
          <th>志望者</th>
          <th>企業数</th>
        </tr>
      </thead>
      <tbody>

        <%
          while(city.next()){
        %>
        <tr>
          <td><%= city.getString("id") %></td>
          <td>
            <div class="city-name"><%= city.getString("name") %></div>
            <div class="city-kana"><%= city.getString("kana") %></div>
          </td>
          <td><%= city.getInt("wish_count") %></td>
          <td><%= city.getInt("company_count") %></td>
        </tr>
        <% } %>

      </tbody>
    </table>
  </div>

</div>

</body>
</html>

<%
    conn.close();
%>
