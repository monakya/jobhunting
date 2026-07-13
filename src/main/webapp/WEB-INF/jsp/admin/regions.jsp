<%-- 管理 / 地域マスタ（画面21）。U-7 により読み仮名なし --%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jspf"%>

<h1 class="page-title">管理</h1>
<div class="page-breadcrumb">JMS / 管理 / 地域マスタ</div>

<%@ include file="/WEB-INF/jsp/admin/admin_tabs.jspf"%>

<div class="msg-info" style="font-size:12px;">
  都道府県 → 市区町村の階層。学生の「志望勤務地」、企業の「所在地」、募集の「勤務地」で使用されます。
</div>

<div class="region-layout">
  <%-- 左：都道府県リスト --%>
  <div class="card region-side">
    <form method="post" action="${pageContext.request.contextPath}/app/admin/regions" class="master-add-form">
      <input type="hidden" name="action" value="addPref">
      <input type="text" name="name" placeholder="都道府県名" maxlength="10" style="width:120px;">
      <button type="submit" class="btn btn-secondary" style="padding:6px 10px;">＋</button>
    </form>
    <c:forEach var="p" items="${prefectures}">
      <a class="pref-row ${selectedPref == p.id ? 'active' : ''}"
         href="${pageContext.request.contextPath}/app/admin/regions?pref=${p.id}">
        <span><c:out value="${p.name}"/></span>
        <span class="mono">${p.usage1} 市区</span>
      </a>
    </c:forEach>
  </div>

  <%-- 右：選択中の県の市区町村 --%>
  <div class="card region-main">
    <form method="post" action="${pageContext.request.contextPath}/app/admin/regions" class="master-add-form">
      <input type="hidden" name="action" value="add">
      <input type="hidden" name="prefId" value="${selectedPref}">
      <input type="text" name="city" placeholder="市区町村名（空欄で県全域）" maxlength="50">
      <button type="submit" class="btn">＋ 地域を追加</button>
    </form>

    <table class="list">
      <tr><th>ID</th><th>市区町村名</th><th>志望者数</th><th>企業・募集での使用</th><th></th></tr>
      <c:forEach var="m" items="${regions}">
        <tr>
          <td class="mono">R-<c:out value="${m.id}"/></td>
          <td><c:out value="${m.name}"/></td>
          <td class="mono">${m.usage1}</td>
          <td class="mono">${m.usage2}</td>
          <td style="text-align:right;">
            <c:choose>
              <c:when test="${m.inUse}">
                <span class="field-hint">使用中</span>
              </c:when>
              <c:otherwise>
                <form method="post" action="${pageContext.request.contextPath}/app/admin/regions"
                      style="display:inline;"
                      onsubmit="return confirm('「${fn:escapeXml(m.name)}」を削除しますか？');">
                  <input type="hidden" name="action" value="delete">
                  <input type="hidden" name="id" value="${m.id}">
                  <input type="hidden" name="prefId" value="${selectedPref}">
                  <button type="submit" class="btn btn-secondary" style="padding:4px 10px; font-size:11px;">削除</button>
                </form>
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf"%>
