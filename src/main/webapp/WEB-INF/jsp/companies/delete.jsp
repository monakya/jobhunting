<%@ page pageEncoding="UTF-8" %>
<%-- 企業削除 確認（画面13）。P-5: 受験履歴ありは削除不可 → 連携終了を推奨 --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">企業削除</h1>
<div class="page-breadcrumb">JMS / 企業 / 削除確認</div>

<div class="card" style="max-width:640px;">
  <c:choose>
    <c:when test="${applicationCount > 0}">
      <div class="msg-error">
        <strong><c:out value="${c.companyName}"/></strong> には受験履歴が ${applicationCount} 件あるため削除できません。<br>
        履歴を保存したい場合は、状態を「連携終了」へ変更してください。
      </div>
      <div class="form-actions">
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/companies/view?id=${c.companyId}">戻る</a>
        <a class="btn" href="${pageContext.request.contextPath}/app/companies/edit?id=${c.companyId}">変更画面へ（状態を連携終了に）</a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="msg-error">
        <strong><c:out value="${c.companyName}"/></strong>（<c:out value="${c.corporateName}"/>）を削除します。<br><br>
        削除した企業は元に戻せません。<strong>募集情報（職種・勤務地）もあわせて削除</strong>されます。
      </div>
      <form method="post" action="${pageContext.request.contextPath}/app/companies/delete">
        <input type="hidden" name="id" value="${c.companyId}">
        <div class="form-actions">
          <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/companies/view?id=${c.companyId}">キャンセル</a>
          <button type="submit" class="btn btn-danger">削除する</button>
        </div>
      </form>
    </c:otherwise>
  </c:choose>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
