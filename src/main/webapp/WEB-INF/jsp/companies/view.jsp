<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%-- 企業閲覧（画面11） --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title"><c:out value="${c.companyName}"/></h1>
<div class="page-breadcrumb">JMS / 企業 / <c:out value="${c.corporateName}"/></div>

<c:if test="${param.msg == 'saved'}"><div class="msg-info">保存しました。</div></c:if>
<c:if test="${param.err == 'inuse'}">
  <div class="msg-error">受験履歴が登録されている企業は削除できません。履歴を保存したい場合は「連携終了」状態への変更を推奨します。</div>
</c:if>

<div class="view-actions">
  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/companies/list">← 一覧へ</a>
  <span class="spacer"></span>
  <c:if test="${sessionScope.account.canEditCompanies}">
    <a class="btn" href="${pageContext.request.contextPath}/app/companies/edit?id=${c.companyId}">変更</a>
    <a class="btn btn-danger" href="${pageContext.request.contextPath}/app/companies/delete?id=${c.companyId}">削除</a>
  </c:if>
</div>

<div class="view-grid">
  <div class="card">
    <h2 class="section-title">企業情報</h2>
    <table class="list">
      <tr><th style="width:120px;">会社名</th><td><c:out value="${empty c.corporateName ? '—' : c.corporateName}"/>
        <div class="field-hint"><c:out value="${c.corporateNameKana}"/></div></td></tr>
      <tr><th>業種</th><td><c:out value="${c.industryName}"/></td></tr>
      <tr><th>状態</th><td><c:out value="${c.companyStatusName}"/></td></tr>
      <tr><th>所在地</th><td><c:out value="${c.regionLabel}"/></td></tr>
      <tr><th>設立</th><td class="mono"><c:out value="${empty c.establishedYear ? '—' : c.establishedYear}"/></td></tr>
      <tr><th>資本金</th><td class="mono"><c:if test="${not empty c.capital}"><fmt:formatNumber value="${c.capital}"/> 円</c:if><c:if test="${empty c.capital}">—</c:if></td></tr>
      <tr><th>従業員数</th><td class="mono"><c:out value="${empty c.employeeCount ? '—' : c.employeeCount}"/></td></tr>
      <tr><th>採用実績</th><td><c:out value="${c.hasHiringRecord ? 'あり' : 'なし'}"/></td></tr>
      <tr><th>受験履歴</th><td class="mono">${applicationCount} 件</td></tr>
    </table>
  </div>

  <div class="card">
    <h2 class="section-title">連絡先</h2>
    <table class="list">
      <tr><th style="width:120px;">住所</th><td>
        <c:if test="${not empty c.postalCode}">〒<c:out value="${c.postalCode}"/><br></c:if>
        <c:out value="${empty c.address ? '—' : c.address}"/></td></tr>
      <tr><th>TEL</th><td class="mono"><c:out value="${empty c.tel ? '—' : c.tel}"/></td></tr>
      <tr><th>URL</th><td><c:out value="${empty c.websiteUrl ? '—' : c.websiteUrl}"/></td></tr>
      <tr><th>担当者</th><td><c:out value="${empty c.contactPerson ? '—' : c.contactPerson}"/></td></tr>
      <tr><th>担当メール</th><td><c:out value="${empty c.email ? '—' : c.email}"/></td></tr>
    </table>

    <h2 class="section-title" style="margin-top:20px;">募集職種</h2>
    <table class="list">
      <tr><th>職種</th><th>募集人数</th><th>勤務地</th></tr>
      <c:forEach var="r" items="${c.recruitments}">
        <tr>
          <td><c:out value="${r.jobTypeName}"/></td>
          <td class="mono">${r.headcount} 名</td>
          <td>
            <c:forEach var="lbl" items="${r.regionLabels}">
              <span class="pill-static"><c:out value="${lbl}"/></span>
            </c:forEach>
          </td>
        </tr>
      </c:forEach>
      <c:if test="${empty c.recruitments}">
        <tr><td colspan="3" style="color:var(--muted);">（募集なし）</td></tr>
      </c:if>
    </table>

    <h2 class="section-title" style="margin-top:20px;">備考</h2>
    <div class="remarks-box"><c:out value="${empty c.remarks ? '—' : c.remarks}"/></div>
  </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
