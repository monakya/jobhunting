<%@ page pageEncoding="UTF-8" %>
<%-- 活動状況報告（画面14）。デザイン原本準拠：内定率＝墨のヒーローカード＋KPIカード＋内訳表 --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">活動状況報告</h1>
<div class="page-breadcrumb">JMS / 活動状況報告</div>

<%-- KPI カード列 --%>
<div class="kpi-grid">

  <div class="kpi kpi-hero">
    <div class="kpi-label">内定率</div>
    <div class="kpi-value"><c:out value="${overall.ratePercent}"/><span class="kpi-unit">%</span></div>
    <div class="bar"><i style="width:${overall.rateValue}%;"></i></div>
    <div class="kpi-sub">内定 <b>${overall.offered}</b> 名 / 母数 <b>${overall.denom}</b> 名（在籍中かつあっせん辞退でない学生）</div>
  </div>

  <div class="kpi kpi-green">
    <div class="kpi-label">内定者</div>
    <div class="kpi-value">${overall.offered}<span class="kpi-unit">名 / ${overall.denom} 名</span></div>
    <div class="kpi-sub">うち承諾済 <b style="color:var(--accept);">${overall.accepted}</b> 名 ・ 未承諾 <b style="color:var(--deadline);">${overall.unaccepted}</b> 名</div>
  </div>

  <div class="kpi">
    <div class="kpi-label">活動中の応募</div>
    <div class="kpi-value">${overall.active}<span class="kpi-unit">件</span></div>
    <div class="kpi-sub">is_closed でない応募の件数</div>
  </div>

  <div class="kpi kpi-amber">
    <div class="kpi-label">要フォロー</div>
    <div class="kpi-value">${overall.needFollow}<span class="kpi-unit">名</span></div>
    <div class="kpi-sub">応募がまだ無い、または全応募が終了して内定が無い学生（在籍中・あっせん辞退を除く）</div>
  </div>

</div>

<%-- 学科 → 学年 → クラス の内訳 --%>
<div class="card">
  <h2 class="section-title">学科・学年・クラス別</h2>
  <table class="list">
    <tr>
      <th>学科 / クラス</th><th>学年</th>
      <th class="num">母数</th>
      <th class="num">内定</th>
      <th class="num">内定率</th>
      <th class="num">承諾</th>
      <th class="num">未承諾</th>
      <th class="num">活動中</th>
      <th class="num">要フォロー</th>
    </tr>

    <c:forEach var="g" items="${groups}">
      <%-- 学科の小計（見出し行） --%>
      <tr class="row-subtotal">
        <td><c:out value="${g.deptName}"/></td>
        <td></td>
        <td class="num">${g.subtotal.denom}</td>
        <td class="num">${g.subtotal.offered}</td>
        <td class="num"><c:out value="${g.subtotal.ratePercent}"/> %</td>
        <td class="num">${g.subtotal.accepted}</td>
        <td class="num">${g.subtotal.unaccepted}</td>
        <td class="num">${g.subtotal.active}</td>
        <td class="num" style="color:${g.subtotal.needFollow > 0 ? 'var(--deadline)' : 'inherit'};">${g.subtotal.needFollow}</td>
      </tr>
      <%-- クラス行 --%>
      <c:forEach var="c" items="${g.classes}">
        <tr>
          <td style="padding-left:22px;"><c:out value="${c.label}"/></td>
          <td>${c.grade} 年</td>
          <td class="num">${c.denom}</td>
          <td class="num">${c.offered}</td>
          <td class="num"><c:out value="${c.ratePercent}"/> %</td>
          <td class="num">${c.accepted}</td>
          <td class="num">${c.unaccepted}</td>
          <td class="num">${c.active}</td>
          <td class="num" style="color:${c.needFollow > 0 ? 'var(--deadline)' : 'inherit'};">${c.needFollow}</td>
        </tr>
      </c:forEach>
    </c:forEach>

    <%-- 全体合計 --%>
    <tr class="row-total">
      <td>全体</td>
      <td></td>
      <td class="num">${overall.denom}</td>
      <td class="num">${overall.offered}</td>
      <td class="num"><c:out value="${overall.ratePercent}"/> %</td>
      <td class="num">${overall.accepted}</td>
      <td class="num">${overall.unaccepted}</td>
      <td class="num">${overall.active}</td>
      <td class="num" style="color:${overall.needFollow > 0 ? 'var(--deadline)' : 'inherit'};">${overall.needFollow}</td>
    </tr>
  </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
