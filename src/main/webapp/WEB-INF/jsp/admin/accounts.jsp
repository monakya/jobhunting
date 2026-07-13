<%-- 管理 / アカウント一覧（画面19）。U-15 により状態・最終ログイン列なし --%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jspf"%>

<h1 class="page-title">管理</h1>
<div class="page-breadcrumb">JMS / 管理 / アカウント</div>

<%@ include file="/WEB-INF/jsp/admin/admin_tabs.jspf"%>

<div class="card">
  <table class="list">
    <tr>
      <th>ユーザーID</th><th>氏名</th><th>ふりがな</th><th>部門</th><th>ロール</th>
    </tr>
    <c:forEach var="a" items="${accounts}">
      <tr>
        <td class="mono"><c:out value="${a.accountId}"/></td>
        <td><c:out value="${a.name}"/></td>
        <td><c:out value="${a.nameKana}"/></td>
        <td>
          <c:choose>
            <c:when test="${not empty a.className}">担任（<c:out value="${a.className}"/>）</c:when>
            <c:otherwise><c:out value="${a.departmentName}"/></c:otherwise>
          </c:choose>
        </td>
        <td><span class="chip chip-stage"><c:out value="${a.roleName}"/></span></td>
      </tr>
    </c:forEach>
  </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf"%>
