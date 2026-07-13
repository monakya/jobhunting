<%@ page pageEncoding="UTF-8" %>
<%-- 学生削除 確認（画面05）。物理削除の連鎖範囲を明示する --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">学生削除</h1>
<div class="page-breadcrumb">JMS / 学生 / 削除確認</div>

<div class="card" style="max-width:640px;">
  <div class="msg-error">
    <strong><c:out value="${s.className}"/> ${s.attendanceNo}番 <c:out value="${s.name}"/></strong>
    （<span class="mono"><c:out value="${s.studentNo}"/></span>）を削除します。<br><br>
    削除した学生は元に戻せません。この学生に紐づく<strong>アカウント・志望情報・
    就職活動・選考履歴・内定情報がすべて削除</strong>されます。<br>
    在籍記録を残したい場合は、削除ではなく在籍状況の変更（休学・退学・卒業）を検討してください。
  </div>

  <form method="post" action="${pageContext.request.contextPath}/app/students/delete">
    <input type="hidden" name="no" value="<c:out value='${s.studentNo}'/>">
    <div class="form-actions">
      <a class="btn btn-secondary"
         href="${pageContext.request.contextPath}/app/students/view?no=${s.studentNo}">キャンセル</a>
      <button type="submit" class="btn btn-danger">削除する</button>
    </div>
  </form>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
