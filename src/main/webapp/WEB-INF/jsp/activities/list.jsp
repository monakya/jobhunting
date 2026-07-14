<%@ page pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<div class="va-page">

  <!-- 上部ナビ -->
  <div class="va-topbar">
    <div class="va-topbar-title">JMS</div>
    <div class="va-topbar-sub">Job Hunting Management System</div>

<<<<<<< HEAD
    <div class="va-topbar-menu">
      <span>学生</span>
      <span>企業</span>
      <span class="active">就職活動</span>
      <span>活動状況報告</span>
      <span>管理</span>
    </div>
=======
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
>>>>>>> branch 'master' of https://github.com/monakya/jobhunting

    <div class="va-topbar-user">
      <span>${className} 担任</span>
      <div class="va-user-icon">${userInitial}</div>
    </div>
  </div>

  <!-- ページヘッダー -->
  <div class="va-page-header">
    <div>
      <div class="va-page-label">就職活動管理</div>
      <div class="va-page-title">就職活動 一覧</div>
    </div>

    <div class="va-header-buttons">
      <button class="va-btn-outline">出力</button>
      <button class="va-btn-outline">列のカスタマイズ</button>
      <a href="${pageContext.request.contextPath}/app/activities/register" class="va-btn-primary">＋ 受験情報を追加</a>
    </div>
  </div>

  <!-- KPI -->
  <div class="va-kpi-strip">
    <div class="va-kpi-box">
      <div class="va-kpi-label">在籍中</div>
      <div class="va-kpi-value">${kpi.enrolled}<span>名</span></div>
    </div>
    <div class="va-kpi-box">
      <div class="va-kpi-label">活動中</div>
      <div class="va-kpi-value">${kpi.active}<span>名</span></div>
    </div>
    <div class="va-kpi-box">
      <div class="va-kpi-label">内定</div>
      <div class="va-kpi-value">${kpi.offers}<span>名</span></div>
    </div>
    <div class="va-kpi-box">
      <div class="va-kpi-label">内定承諾</div>
      <div class="va-kpi-value">${kpi.accepted}<span>名</span></div>
    </div>
    <div class="va-kpi-box">
      <div class="va-kpi-label">未活動</div>
      <div class="va-kpi-value">${kpi.inactive}<span>名</span></div>
    </div>
    <div class="va-kpi-box va-warn">
      <div class="va-kpi-label">承諾期限7日以内</div>
      <div class="va-kpi-value">${kpi.deadlineSoon}<span>名</span></div>
    </div>
  </div>

  <!-- フィルタ表示 -->
  <div class="va-filter-display">
    <div class="va-filter-chip"><span>クラス</span><strong>${className}</strong></div>
    <div class="va-filter-chip"><span>在籍</span><strong>${statusName}</strong></div>
    <div class="va-filter-chip"><span>紹介区分</span><strong>${referralTypeName}</strong></div>
    <div class="va-filter-chip"><span>選考状況</span><strong>${stageName}</strong></div>
    <div class="va-filter-chip"><span>期間</span><strong>${from} — ${to}</strong></div>

    <div class="va-filter-search">
      <span class="va-icon">⌕</span>
      <span class="va-placeholder">学生・企業名で検索</span>
    </div>
  </div>

  <!-- テーブルヘッダー -->
  <div class="va-table-header">
    <div></div>
    <div>クラス</div>
    <div>学籍</div>
    <div>氏名</div>
    <div>企業名</div>
    <div>業種</div>
    <div>紹介</div>
    <div>選考状況</div>
    <div>次回日時 / 場所</div>
    <div>結果</div>
    <div>結果判明日</div>
    <div>承諾期限</div>
    <div></div>
  </div>

  <!-- テーブル本体 -->
  <div class="va-table-body">

    <c:forEach var="a" items="${applications}">
      <div class="va-row" onclick="location.href='${pageContext.request.contextPath}/app/activities/view?id=${a.applicationId}'">

        <div class="va-cell cb"></div>

        <div class="va-cell mono">${a.className}</div>

        <div class="va-cell mono">${a.studentCode}</div>

        <div class="va-cell">
          <div class="va-name">${a.studentName}</div>
          <div class="va-name-sub">${a.studentKana}</div>
        </div>

        <div class="va-cell">
          <div class="va-company">${a.companyName}</div>
          <div class="va-company-sub">${a.companyLocation}</div>
        </div>

        <div class="va-cell">${a.industryName}</div>

        <div class="va-cell">
          <span class="va-chip va-chip-ref">${a.referralTypeName}</span>
        </div>

        <div class="va-cell">
          <span class="va-chip va-chip-stage">
            <span class="va-dot"></span>
            ${a.currentStageName}
          </span>
        </div>

        <div class="va-cell">
          <div class="mono">${a.currentEventAt}</div>
          <div class="va-company-sub">${a.currentPlace}</div>
        </div>

        <div class="va-cell">
          <c:choose>
            <c:when test="${a.currentResultName == '内定'}">
              <span class="va-chip va-chip-offer">内定</span>
            </c:when>
            <c:when test="${a.currentResultName == '不合格'}">
              <span class="va-chip va-chip-fail">不合格</span>
            </c:when>
            <c:otherwise>
              <span class="va-chip va-chip-neutral">${a.currentResultName}</span>
            </c:otherwise>
          </c:choose>
        </div>

        <div class="va-cell mono">${a.currentResultDate}</div>

        <div class="va-cell">
          <c:if test="${not empty a.acceptDeadline}">
            <span class="va-chip va-chip-deadline">${a.acceptDeadline}</span>
          </c:if>
        </div>

        <div class="va-cell menu">⋯</div>

      </div>
    </c:forEach>

  </div>

</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
