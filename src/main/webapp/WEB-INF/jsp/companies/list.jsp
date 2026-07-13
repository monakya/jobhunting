<%@ page pageEncoding="UTF-8" %>
<%-- 企業一覧（画面10）。U-11: 業種 / U-13: 採用実績あり・なし / U-14: 年度表記なし --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">企業一覧</h1>
<div class="page-breadcrumb">JMS / 企業</div>

<c:if test="${param.msg == 'deleted'}"><div class="msg-info">削除しました。</div></c:if>

<div class="card">
  <form method="get" action="${pageContext.request.contextPath}/app/companies/list" class="filter-bar">
    <select name="industryId">
      <option value="0">業種：すべて</option>
      <c:forEach var="i" items="${industries}">
        <option value="${i.id}" ${industryId == i.id ? 'selected' : ''}><c:out value="${i.name}"/></option>
      </c:forEach>
    </select>
    <select name="statusId">
      <option value="0">状態：すべて</option>
      <c:forEach var="st" items="${statuses}">
        <option value="${st.id}" ${statusId == st.id ? 'selected' : ''}><c:out value="${st.name}"/></option>
      </c:forEach>
    </select>
    <select name="regionId">
      <option value="0">所在地：すべて</option>
      <c:forEach var="r" items="${regions}">
        <option value="${r.id}" ${regionId == r.id ? 'selected' : ''}><c:out value="${r.subName}"/> <c:out value="${r.name}"/></option>
      </c:forEach>
    </select>
    <input type="text" name="q" value="<c:out value='${q}'/>" placeholder="企業名・会社名・かな 部分一致">
    <button type="submit" class="btn btn-secondary">検索</button>
    <span class="spacer"></span>
    <c:if test="${sessionScope.account.canEditCompanies}">
      <a class="btn" href="${pageContext.request.contextPath}/app/companies/register">＋ 企業を登録</a>
    </c:if>
  </form>

  <table class="list">
    <tr>
      <th>企業名</th><th>業種</th><th>状態</th><th>所在地</th>
      <th>募集職種 / 人数</th><th>勤務地</th><th>採用実績</th><th></th>
    </tr>
    <c:forEach var="c" items="${companies}">
      <tr>
        <td>
          <a href="${pageContext.request.contextPath}/app/companies/view?id=${c.companyId}">
            <c:out value="${c.companyName}"/>
          </a>
          <div class="field-hint"><c:out value="${c.corporateName}"/></div>
        </td>
        <td><c:out value="${c.industryName}"/></td>
        <td>
          <c:choose>
            <c:when test="${c.companyStatusName == '募集中'}"><span class="chip chip-offer">募集中</span></c:when>
            <c:when test="${c.companyStatusName == '連携終了'}"><span class="chip chip-fail">連携終了</span></c:when>
            <c:otherwise><span class="chip chip-stage"><c:out value="${c.companyStatusName}"/></span></c:otherwise>
          </c:choose>
        </td>
        <td><c:out value="${c.regionLabel}"/></td>
        <td>
          <c:forEach var="r" items="${c.recruitments}">
            <div class="rec-line"><c:out value="${r.jobTypeName}"/> <span class="mono">${r.headcount}名</span></div>
          </c:forEach>
          <c:if test="${empty c.recruitments}"><span class="field-hint">（募集なし）</span></c:if>
        </td>
        <td>
          <c:forEach var="r" items="${c.recruitments}">
            <div class="rec-line"><c:out value="${r.regionJoined}"/></div>
          </c:forEach>
        </td>
        <td><c:out value="${c.hasHiringRecord ? 'あり' : 'なし'}"/></td>
        <td style="text-align:right;">
          <c:if test="${sessionScope.account.canEditCompanies}">
            <a class="btn btn-secondary" style="padding:4px 10px; font-size:11px;"
               href="${pageContext.request.contextPath}/app/companies/edit?id=${c.companyId}">変更</a>
          </c:if>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty companies}">
      <tr><td colspan="8" style="color:var(--muted); text-align:center; padding:24px;">該当する企業がありません。</td></tr>
    </c:if>
  </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
