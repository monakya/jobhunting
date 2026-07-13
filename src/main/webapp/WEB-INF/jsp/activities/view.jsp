<%@ page pageEncoding="UTF-8" %>
<%-- 就職活動 閲覧（画面07）。ヘッダ + 選考タイムライン + 内定情報 --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">就職活動閲覧</h1>
<div class="page-breadcrumb">
  JMS / <a href="${pageContext.request.contextPath}/app/activities/list">就職活動</a> / 閲覧
</div>

<c:if test="${param.msg == 'saved'}"><div class="msg-info">保存しました。</div></c:if>

<div class="card">
  <div style="display:flex; align-items:center;">
    <h2 class="section-title" style="margin:0;">
      <c:out value="${a.studentName}"/>
      <span style="font-size:13px; color:#888;">（<c:out value="${a.className}"/>）</span>
      → <c:out value="${a.companyName}"/>
    </h2>
    <span class="spacer"></span>
    <c:choose>
      <c:when test="${a.closed}"><span class="chip">終了</span></c:when>
      <c:otherwise><span class="chip chip-stage">進行中</span></c:otherwise>
    </c:choose>
  </div>

  <table class="list" style="margin-top:12px;">
    <tr><th style="width:160px;">企業 / 業種</th>
        <td><c:out value="${a.companyName}"/> ・ <c:out value="${a.industryName}"/></td></tr>
    <tr><th>応募職種</th><td><c:out value="${a.jobTypeName}"/></td></tr>
    <tr><th>紹介区分</th><td><c:out value="${a.referralTypeName}"/></td></tr>
    <tr><th>募集情報</th>
        <td><c:choose><c:when test="${empty a.recruitmentId}">募集なし（直接応募）</c:when>
            <c:otherwise>募集ID <span class="mono">${a.recruitmentId}</span> に紐づく</c:otherwise></c:choose></td></tr>
    <tr><th>エントリー日</th><td class="mono"><c:out value="${a.entryDate}"/></td></tr>
  </table>

  <div style="margin-top:16px;">
    <a class="btn" href="${pageContext.request.contextPath}/app/activities/edit?id=${a.applicationId}">選考を進める / 変更</a>
    <a class="btn btn-danger" href="${pageContext.request.contextPath}/app/activities/delete?id=${a.applicationId}">削除</a>
  </div>
</div>

<%-- 内定情報 --%>
<c:if test="${a.hasOffer}">
  <div class="card">
    <h2 class="section-title">内定情報</h2>
    <table class="list">
      <tr><th style="width:160px;">内定日</th><td class="mono"><c:out value="${a.offer.offerDate}"/></td></tr>
      <tr><th>承諾期限</th><td class="mono"><c:out value="${a.offer.acceptDeadline}"/></td></tr>
      <tr><th>回答</th>
          <td><c:choose>
            <c:when test="${empty a.offer.offerAcceptanceName}"><span class="chip chip-deadline">未回答</span></c:when>
            <c:when test="${a.offer.offerAcceptanceName == '承諾'}"><span class="chip chip-offer">承諾</span>
                <span class="mono" style="color:#888;"><c:out value="${a.offer.acceptedDate}"/></span></c:when>
            <c:otherwise><span class="chip"><c:out value="${a.offer.offerAcceptanceName}"/></span></c:otherwise>
          </c:choose></td></tr>
    </table>
  </div>
</c:if>

<%-- 選考タイムライン --%>
<div class="card">
  <h2 class="section-title">選考タイムライン</h2>
  <c:choose>
    <c:when test="${empty a.histories}">
      <p style="color:#aaa;">まだ選考履歴がありません。「選考を進める / 変更」から登録できます。</p>
    </c:when>
    <c:otherwise>
      <table class="list">
        <tr><th>選考日時</th><th>ステージ</th><th>結果</th><th>結果判明日</th><th>場所 / 面接官</th><th>備考</th></tr>
        <c:forEach var="h" items="${a.histories}">
          <tr>
            <td class="mono"><c:out value="${fn:replace(h.eventAt, 'T', ' ')}"/></td>
            <td>
              <c:out value="${h.stageName}"/>
              <c:if test="${h.finalSelection}"><span class="chip chip-final">最終</span></c:if>
            </td>
            <td>
              <c:choose>
                <c:when test="${h.resultName == '不合格'}"><span class="chip chip-fail">不合格</span></c:when>
                <c:when test="${h.resultName == '合格' && h.finalSelection}"><span class="chip chip-offer">合格（内定）</span></c:when>
                <c:otherwise><c:out value="${h.resultName}"/></c:otherwise>
              </c:choose>
            </td>
            <td class="mono"><c:out value="${h.resultDate}"/></td>
            <td>
              <c:out value="${h.place}"/>
              <c:if test="${not empty h.interviewerCount}"><span style="color:#888;">／面接官 ${h.interviewerCount}名</span></c:if>
            </td>
            <td><c:out value="${h.remarks}"/></td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
