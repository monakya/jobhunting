<%-- メインメニュー（画面16）。デザイン準拠のKPIストリップ＋ロール別の機能カード --%>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">メインメニュー</h1>
<div class="page-breadcrumb">JMS</div>

<%-- サマリーストリップ（U-14：年度表記なし） --%>
<div class="kpi-grid" style="grid-template-columns:repeat(auto-fit, minmax(160px, 1fr));">
  <div class="kpi kpi-sm">
    <div class="kpi-label">募集中</div>
    <div class="kpi-value" style="color:var(--navy);">${summary.recruitingCompanies}<span class="kpi-unit">社</span></div>
  </div>
  <div class="kpi kpi-sm">
    <div class="kpi-label">受験中</div>
    <div class="kpi-value">${summary.applyingCompanies}<span class="kpi-unit">社</span></div>
  </div>
  <div class="kpi kpi-sm">
    <div class="kpi-label">内定あり</div>
    <div class="kpi-value" style="color:var(--accept);">${summary.offeredStudents}<span class="kpi-unit">名</span></div>
  </div>
  <div class="kpi kpi-sm">
    <div class="kpi-label">連携終了</div>
    <div class="kpi-value" style="color:var(--muted);">${summary.endedCompanies}<span class="kpi-unit">社</span></div>
  </div>
</div>

<%-- 機能カード（ヘッダと同じ can〜 で出し分け） --%>
<div style="display:flex; gap:14px; flex-wrap:wrap;">

  <c:if test="${sessionScope.account.canViewStudents}">
    <a class="card" style="flex:1; min-width:220px; text-decoration:none; color:inherit; display:block; margin-bottom:0;"
       href="${pageContext.request.contextPath}/app/students/list">
      <h2 class="section-title">学生管理</h2>
      <p style="color:var(--sub); margin:0 0 12px; font-size:13px;">学生の登録・検索・就活状況の確認。</p>
      <span class="chip chip-stage">在籍中 ${summary.enrolledStudents} 名</span>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.canViewCompanies}">
    <a class="card" style="flex:1; min-width:220px; text-decoration:none; color:inherit; display:block; margin-bottom:0;"
       href="${pageContext.request.contextPath}/app/companies/list">
      <h2 class="section-title">企業管理</h2>
      <p style="color:var(--sub); margin:0 0 12px; font-size:13px;">求人企業と募集職種の管理。</p>
      <span class="chip chip-stage">募集中 ${summary.recruitingCompanies} 社</span>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.canViewActivities}">
    <a class="card" style="flex:1; min-width:220px; text-decoration:none; color:inherit; display:block; margin-bottom:0;"
       href="${pageContext.request.contextPath}/app/activities/list">
      <h2 class="section-title">就職活動</h2>
      <p style="color:var(--sub); margin:0 0 12px; font-size:13px;">応募・選考の記録と内定管理。</p>
      <span class="chip chip-stage">活動中 ${summary.activeApplications} 件</span>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.canViewReport}">
    <a class="card" style="flex:1; min-width:220px; text-decoration:none; color:inherit; display:block; margin-bottom:0;"
       href="${pageContext.request.contextPath}/app/report">
      <h2 class="section-title">活動状況報告</h2>
      <p style="color:var(--sub); margin:0 0 12px; font-size:13px;">内定率や要フォローの集計ダッシュボード。</p>
      <span class="chip chip-offer">内定率 <c:out value="${summary.ratePercent}"/> %</span>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.admin}">
    <a class="card" style="flex:1; min-width:220px; text-decoration:none; color:inherit; display:block; margin-bottom:0;"
       href="${pageContext.request.contextPath}/app/admin/accounts">
      <h2 class="section-title">管理</h2>
      <p style="color:var(--sub); margin:0 0 12px; font-size:13px;">アカウント・業種/職種・地域などのマスタ管理。</p>
      <span class="chip">システム管理者</span>
    </a>
  </c:if>

</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
