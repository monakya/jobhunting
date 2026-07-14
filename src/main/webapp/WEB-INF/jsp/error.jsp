<%-- 共通エラーページ（web.xml の error-page から参照）。
     403 / 404 / それ以外（500系）で見出しと文言を出し分ける。 --%>
<%@ page pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- ステータスコード。エラーディスパッチ経由なら errorData から取れる。無ければ 500 扱い --%>
<c:set var="sc" value="${pageContext.errorData.statusCode}" />
<c:if test="${empty sc || sc == 0}"><c:set var="sc" value="500" /></c:if>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>JMS — エラー（${sc}）</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
</head>
<body>
<div class="app-main" style="max-width:640px;">
  <c:choose>
    <c:when test="${sc == 403}">
      <h1 class="page-title">アクセス権限がありません（403）</h1>
      <div class="card">
        <div class="msg-error">
          この画面または操作を行う権限がありません。<br>
          必要な場合は、権限をお持ちの担当者またはシステム管理者へご相談ください。
        </div>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/menu">メニューへ戻る</a>
      </div>
    </c:when>
    <c:when test="${sc == 404}">
      <h1 class="page-title">ページが見つかりません（404）</h1>
      <div class="card">
        <div class="msg-error">
          お探しのページは存在しないか、移動・削除された可能性があります。<br>
          アドレスをご確認のうえ、メニューから操作し直してください。
        </div>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/menu">メニューへ戻る</a>
      </div>
    </c:when>
    <c:otherwise>
      <h1 class="page-title">エラーが発生しました（${sc}）</h1>
      <div class="card">
        <div class="msg-error">
          処理を完了できませんでした。時間をおいて再度お試しください。<br>
          解決しない場合はシステム管理者へ連絡してください。
        </div>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/menu">メニューへ戻る</a>
      </div>
    </c:otherwise>
  </c:choose>
</div>
</body>
</html>
