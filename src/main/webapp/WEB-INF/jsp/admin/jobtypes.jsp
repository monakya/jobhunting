<%-- 管理 / 職種マスタ（画面20）。U-10 により業種に紐づく --%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jspf"%>

<h1 class="page-title">管理</h1>
<div class="page-breadcrumb">JMS / 管理 / 職種マスタ</div>

<%@ include file="/WEB-INF/jsp/admin/admin_tabs.jspf"%>

<div class="card">
  <div class="msg-info" style="font-size:12px;">
    業種は分類・絞り込み用のタグです。企業の業種と募集職種の業種が一致している必要はありません。
  </div>

  <form method="post" action="${pageContext.request.contextPath}/app/admin/jobtypes" class="master-add-form">
    <input type="hidden" name="action" value="add">
    <select name="industryId">
      <option value="">業種を選択</option>
      <c:forEach var="i" items="${industries}">
        <option value="${i.id}"><c:out value="${i.name}"/></option>
      </c:forEach>
    </select>
    <input type="text" name="name" placeholder="職種名（例：SE / プログラマ）" maxlength="50">
    <button type="submit" class="btn">＋ 職種を追加</button>
  </form>

  <table class="list">
    <tr><th>ID</th><th>業種</th><th>職種名</th><th>募集での使用</th><th>志望・就活での使用</th><th></th></tr>
    <c:forEach var="m" items="${items}">
      <tr>
        <td class="mono">J-<c:out value="${m.id}"/></td>
        <td><span class="pill-static"><c:out value="${m.subName}"/></span></td>
        <td><c:out value="${m.name}"/></td>
        <td class="mono">${m.usage1}</td>
        <td class="mono">${m.usage2}</td>
        <td style="text-align:right;">
          <c:choose>
            <c:when test="${m.inUse}">
              <span class="field-hint">使用中</span>
            </c:when>
            <c:otherwise>
              <form method="post" action="${pageContext.request.contextPath}/app/admin/jobtypes"
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
