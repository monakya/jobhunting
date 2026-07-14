<%@ page pageEncoding="UTF-8" %>
<%-- 就職活動 一覧（画面06）。担任は自クラスのみ（サーブレットの scopeClassId で制限済み） --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">就職活動一覧</h1>
<div class="page-breadcrumb">JMS / 就職活動</div>

<c:if test="${param.msg == 'deleted'}"><div class="msg-info">削除しました。</div></c:if>

<%-- フェーズ7E: メニューKPIからの遷移フィルタが有効な場合の表示 --%>
<c:if test="${not empty eventDateLabel or deadlineWithin > 0}">
  <div class="msg-info">
    <c:if test="${not empty eventDateLabel}">
      「<c:out value="${eventDateLabel}"/>」がある応募だけを表示しています。
    </c:if>
    <c:if test="${deadlineWithin > 0}">
      承諾期限が ${deadlineWithin} 日以内で未回答の応募だけを表示しています（期限超過を含む）。
    </c:if>
    <a href="${pageContext.request.contextPath}/app/activities/list">絞り込みを解除</a>
  </div>
</c:if>

<div class="card">
  <form method="get" action="${pageContext.request.contextPath}/app/activities/list" class="filter-bar">
    <%-- KPIフィルタ有効中に検索しても絞り込みが外れないよう hidden で引き継ぐ --%>
    <c:if test="${not empty eventDateParam}">
      <input type="hidden" name="eventDate" value="<c:out value='${eventDateParam}'/>">
    </c:if>
    <c:if test="${deadlineWithin > 0}">
      <input type="hidden" name="deadlineWithin" value="${deadlineWithin}">
    </c:if>
    <select name="stageId">
      <option value="0">選考状況：すべて</option>
      <c:forEach var="s" items="${stages}">
        <option value="${s.id}" ${stageId == s.id ? 'selected' : ''}><c:out value="${s.name}"/></option>
      </c:forEach>
    </select>
    <select name="resultId">
      <option value="0">結果：すべて</option>
      <c:forEach var="r" items="${results}">
        <option value="${r.id}" ${resultId == r.id ? 'selected' : ''}><c:out value="${r.name}"/></option>
      </c:forEach>
    </select>
    <input type="text" name="q" value="<c:out value='${q}'/>" placeholder="学生氏名・かな・企業名 部分一致">
    <button type="submit" class="btn btn-secondary">検索</button>
    <span class="spacer"></span>
    <a class="btn" href="${pageContext.request.contextPath}/app/activities/register">＋ 応募を登録</a>
  </form>

  <table class="list">
    <tr>
      <th>学生 / クラス</th><th>企業（業種・紹介）</th><th>応募職種</th>
      <th>現在の選考状況</th><th>結果</th><th>承諾期限</th><th>状態</th>
    </tr>
    <c:forEach var="a" items="${applications}">
      <tr onclick="location.href='${pageContext.request.contextPath}/app/activities/view?id=${a.applicationId}'"
          style="cursor:pointer;">
        <td>
          <c:out value="${a.studentName}"/>
          <div class="mono" style="font-size:11px; color:#888;"><c:out value="${a.className}"/></div>
        </td>
        <td>
          <c:out value="${a.companyName}"/>
          <div style="font-size:11px; color:#888;">
            <c:out value="${a.industryName}"/> ・ <c:out value="${a.referralTypeName}"/>
          </div>
        </td>
        <td><c:out value="${a.jobTypeName}"/></td>
        <td>
          <c:choose>
            <c:when test="${a.hasHistory}">
              <c:out value="${a.currentStageName}"/>
              <c:if test="${a.currentFinal}"><span class="chip chip-final">最終</span></c:if>
            </c:when>
            <c:otherwise><span style="color:#aaa;">未着手</span></c:otherwise>
          </c:choose>
        </td>
        <td>
          <c:if test="${a.hasHistory}">
            <c:choose>
              <c:when test="${a.currentResultName == '不合格'}"><span class="chip chip-fail">不合格</span></c:when>
              <c:when test="${a.currentResultName == '合格' && a.currentFinal}"><span class="chip chip-offer">内定</span></c:when>
              <c:otherwise><c:out value="${a.currentResultName}"/></c:otherwise>
            </c:choose>
          </c:if>
        </td>
        <td>
          <c:if test="${a.hasOffer && not empty a.acceptDeadline}">
            <c:choose>
              <c:when test="${empty a.offerAcceptanceName}">
                <span class="chip chip-deadline"><c:out value="${a.acceptDeadline}"/></span>
              </c:when>
              <c:otherwise><c:out value="${a.acceptDeadline}"/></c:otherwise>
            </c:choose>
          </c:if>
        </td>
        <td>
          <c:choose>
            <c:when test="${a.closed}"><span class="chip">終了</span></c:when>
            <c:otherwise><span class="chip chip-stage">進行中</span></c:otherwise>
          </c:choose>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty applications}">
      <tr><td colspan="7" style="text-align:center; color:#aaa; padding:24px;">該当する応募がありません。</td></tr>
    </c:if>
  </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
