<%@ page pageEncoding="UTF-8" %>
<%-- 就職活動 削除確認（画面09） --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">就職活動削除</h1>
<div class="page-breadcrumb">
  JMS / <a href="${pageContext.request.contextPath}/app/activities/list">就職活動</a> /
  <a href="${pageContext.request.contextPath}/app/activities/view?id=${a.applicationId}">閲覧</a> / 削除
</div>

<div class="card">
  <h2 class="section-title">次の応募を削除します</h2>
  <table class="list">
    <tr><th style="width:160px;">学生</th><td><c:out value="${a.studentName}"/>（<c:out value="${a.className}"/>）</td></tr>
    <tr><th>企業</th><td><c:out value="${a.companyName}"/></td></tr>
    <tr><th>応募職種</th><td><c:out value="${a.jobTypeName}"/></td></tr>
    <tr><th>エントリー日</th><td class="mono"><c:out value="${a.entryDate}"/></td></tr>
    <tr><th>選考履歴</th><td>${fn:length(a.histories)} 件（この応募に紐づく履歴も一緒に削除されます）</td></tr>
  </table>

  <div class="msg-error" style="margin-top:14px;">
    この操作は取り消せません。応募ヘッダを削除すると、選考履歴（application_history）が
    <strong>すべて物理削除</strong>されます（外部キーの CASCADE）。
  </div>

  <c:if test="${a.hasOffer}">
    <div class="msg-info" style="margin-top:12px;">
      この学生には <strong><c:out value="${a.companyName}"/></strong> の内定（offer）が登録されています。
      内定は「学生×企業」に紐づくため、応募を消しても<strong>自動では消えません</strong>。
      応募だけ消すと内定が取り残される場合があります。
    </div>
  </c:if>

  <form method="post" action="${pageContext.request.contextPath}/app/activities/delete"
        onsubmit="return confirm('本当に削除しますか？この操作は取り消せません。');">
    <input type="hidden" name="id" value="${a.applicationId}">
    <c:if test="${a.hasOffer}">
      <div class="form-row" style="margin-top:14px;">
        <label style="font-weight:normal;">
          <input type="checkbox" name="alsoDeleteOffer" value="1">
          この企業の内定（offer）も同時に削除する
        </label>
      </div>
    </c:if>
    <div style="margin-top:16px;">
      <button type="submit" class="btn btn-danger">削除する</button>
      <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/activities/view?id=${a.applicationId}">キャンセル</a>
    </div>
  </form>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
