<%-- 管理 / 業種マスタ（U-10 で新設）--%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jspf"%>

<h1 class="page-title">管理</h1>
<div class="page-breadcrumb">JMS / 管理 / 業種マスタ</div>

<%@ include file="/WEB-INF/jsp/admin/admin_tabs.jspf"%>

<div class="card">
  <form method="post" action="${pageContext.request.contextPath}/app/admin/industries" class="master-add-form">
    <input type="hidden" name="action" value="add">
    <input type="text" name="name" placeholder="業種名（例：情報通信業）" maxlength="50">
    <button type="submit" class="btn">＋ 業種を追加</button>
  </form>

  <table class="list">
    <tr><th>ID</th><th>業種名</th><th>職種数</th><th>企業数</th><th></th></tr>
    <c:forEach var="m" items="${items}">
      <tr>
        <td class="mono">I-<c:out value="${m.id}"/></td>
        <td><c:out value="${m.name}"/></td>
        <td class="mono">${m.usage1}</td>
        <td class="mono">${m.usage2}</td>
        <td style="text-align:right;">
          <c:choose>
            <c:when test="${m.inUse}">
              <span class="field-hint">使用中</span>
            </c:when>
            <c:otherwise>
              <form method="post" action="${pageContext.request.contextPath}/app/admin/industries"
                    style="display:inline;"
                    onsubmit="return confirm('「${fn:escapeXml(m.name)}」を削除しますか？');">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${m.id}">
                <button type="submit" class="btn btn-secondary" style="padding:4px 10px; font-size:11px;">削除</button>
              </form>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf"%>
