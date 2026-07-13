<%@ page pageEncoding="UTF-8" %>
<%-- 学生閲覧（画面03） --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title"><c:out value="${s.name}"/></h1>
<div class="page-breadcrumb">JMS / 学生 / <c:out value="${s.studentNo}"/></div>

<c:if test="${param.msg == 'saved'}"><div class="msg-info">保存しました。</div></c:if>

<div class="view-actions">
  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/students/list">← 一覧へ</a>
  <span class="spacer"></span>
  <a class="btn" href="${pageContext.request.contextPath}/app/students/edit?no=${s.studentNo}">変更</a>
  <a class="btn btn-danger" href="${pageContext.request.contextPath}/app/students/delete?no=${s.studentNo}">削除</a>
</div>

<div class="view-grid">
  <div class="card">
    <h2 class="section-title">基本情報</h2>
    <table class="list">
      <tr><th style="width:130px;">学籍番号</th><td class="mono"><c:out value="${s.studentNo}"/></td></tr>
      <tr><th>クラス / 出席</th><td><c:out value="${s.className}"/> / ${s.attendanceNo} 番</td></tr>
      <tr><th>フリガナ</th><td><c:out value="${s.nameKana}"/></td></tr>
      <tr><th>性別</th><td><c:out value="${s.genderName}"/></td></tr>
      <tr><th>生年月日</th><td class="mono"><c:out value="${empty s.birthDate ? '—' : s.birthDate}"/></td></tr>
      <tr><th>入学年月</th><td class="mono"><c:out value="${empty s.admissionYm ? '—' : s.admissionYm}"/></td></tr>
      <tr><th>在籍状況</th><td><c:out value="${s.enrollmentStatusName}"/></td></tr>
      <tr><th>状態</th><td>
        <c:if test="${s.hasAcceptedOffer}"><span class="chip chip-offer">内定承諾済み</span></c:if>
        <c:if test="${s.hasOffer && !s.hasAcceptedOffer}"><span class="chip chip-stage">内定あり</span></c:if>
        <c:if test="${s.refusesPlacement}"><span class="chip chip-deadline">あっせん辞退</span></c:if>
        <c:if test="${!s.hasOffer && !s.refusesPlacement}">—</c:if>
      </td></tr>
    </table>
  </div>

  <div class="card">
    <h2 class="section-title">連絡先</h2>
    <table class="list">
      <tr><th style="width:130px;">メール</th><td><c:out value="${empty s.email ? '—' : s.email}"/></td></tr>
      <tr><th>電話番号</th><td class="mono"><c:out value="${empty s.phone ? '—' : s.phone}"/></td></tr>
      <tr><th>住所</th><td><c:out value="${empty s.address ? '—' : s.address}"/></td></tr>
    </table>

    <h2 class="section-title" style="margin-top:20px;">志望</h2>
    <table class="list">
      <tr><th style="width:130px;">志望勤務地</th><td>
        <c:forEach var="r" items="${prefRegions}">
          <span class="pill-static">第${r.sortOrder}志望：<c:out value="${r.subName}"/> <c:out value="${r.name}"/></span>
        </c:forEach>
        <c:if test="${empty prefRegions}">—</c:if>
      </td></tr>
      <tr><th>志望職種</th><td>
        <c:forEach var="j" items="${prefJobTypes}">
          <span class="pill-static">第${j.sortOrder}志望：<c:out value="${j.name}"/></span>
        </c:forEach>
        <c:if test="${empty prefJobTypes}">—</c:if>
      </td></tr>
    </table>

    <h2 class="section-title" style="margin-top:20px;">担任メモ</h2>
    <div class="remarks-box"><c:out value="${empty s.remarks ? '—' : s.remarks}"/></div>
  </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
