<%-- メインメニュー（画面16）フェーズ7D版。
     ウェルカム帯 + KPIバナー（本日/明日の予定・承諾期限・内定率）+ リッチカード。
     KPI は担任なら自クラス、他ロールは全体（kpiScoped で判定）。
     KPI セルはクリックで就職活動一覧（フィルタ付き）/ 活動状況報告へ遷移する。 --%>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%-- ===== ウェルカム帯 ===== --%>
<div class="menu-welcome">
  <div class="menu-hello">こんにちは</div>
  <div class="menu-name">
    <c:out value="${sessionScope.account.displayName}"/>
    <span class="menu-name-sub">
      <c:if test="${not empty homeroomClassName}"><c:out value="${homeroomClassName}"/>&nbsp;</c:if>
      <c:out value="${sessionScope.account.roleName}"/>
    </span>
  </div>
</div>

<%-- ===== KPI バナー ===== --%>
<div class="menu-kpi">

  <a class="mk-cell" href="${ctx}/app/activities/list?eventDate=today">
    <div class="mk-label">本日の予定</div>
    <div class="mk-flex">
      <div class="mk-num">${summary.todayTotal}<span class="mk-unit">名</span></div>
      <c:if test="${not empty summary.todayBreakdown}">
        <div class="mk-break">
          <c:forEach var="b" items="${summary.todayBreakdown}"><span><c:out value="${b}"/></span></c:forEach>
        </div>
      </c:if>
    </div>
  </a>

  <a class="mk-cell" href="${ctx}/app/activities/list?eventDate=tomorrow">
    <div class="mk-label">明日の予定</div>
    <div class="mk-flex">
      <div class="mk-num">${summary.tomorrowTotal}<span class="mk-unit">名</span></div>
      <c:if test="${not empty summary.tomorrowBreakdown}">
        <div class="mk-break">
          <c:forEach var="b" items="${summary.tomorrowBreakdown}"><span><c:out value="${b}"/></span></c:forEach>
        </div>
      </c:if>
    </div>
  </a>

  <a class="mk-cell mk-amber" href="${ctx}/app/activities/list?deadlineWithin=7">
    <div class="mk-label">承諾期限 7日以内</div>
    <div class="mk-flex">
      <div class="mk-num">${summary.deadlineCount}<span class="mk-unit">名</span></div>
      <c:if test="${not empty summary.deadlineNote}">
        <div class="mk-break"><span><c:out value="${summary.deadlineNote}"/></span></div>
      </c:if>
    </div>
  </a>

  <a class="mk-cell" href="${ctx}/app/report">
    <div class="mk-label">
      <c:choose>
        <c:when test="${kpiScoped}">クラス内定率</c:when>
        <c:otherwise>内定率</c:otherwise>
      </c:choose>
    </div>
    <div class="mk-flex">
      <div class="mk-ratio">
        <span class="mk-ratio-big">${summary.offered}</span><span class="mk-ratio-small">/${summary.denom}名</span>
        <span class="mk-ratio-pct">(<c:out value="${summary.ratePercent}"/>%)</span>
      </div>
      <c:if test="${summary.offered > 0}">
        <div class="mk-break">
          <span>承諾済 ${summary.accepted}</span>
          <span>未承諾 ${summary.notAccepted}</span>
        </div>
      </c:if>
    </div>
  </a>

</div>

<%-- ===== メニューカード ===== --%>
<div class="menu-section-label">メニュー</div>
<div class="menu-tiles">

  <c:if test="${sessionScope.account.canViewStudents}">
    <a class="tile" href="${ctx}/app/students/list">
      <div class="tile-head">
        <div class="tile-icon">⚀</div>
        <div class="tile-titles">
          <div class="tile-title">学生</div>
          <div class="tile-en">Students</div>
        </div>
        <div class="tile-arrow">›</div>
      </div>
      <p class="tile-desc">学生情報の閲覧・登録・変更。就活状況の確認。</p>
      <div class="tile-chips">
        <span class="chip">在籍 ${summary.enrolledStudents} 名</span>
        <span class="chip">${summary.classCount} クラス</span>
      </div>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.canViewCompanies}">
    <a class="tile" href="${ctx}/app/companies/list">
      <div class="tile-head">
        <div class="tile-icon">◨</div>
        <div class="tile-titles">
          <div class="tile-title">企業</div>
          <div class="tile-en">Companies</div>
        </div>
        <div class="tile-arrow">›</div>
      </div>
      <p class="tile-desc">採用企業の一元管理。募集職種、採用実績。</p>
      <div class="tile-chips">
        <span class="chip">${summary.companyCount} 社</span>
        <span class="chip chip-stage">募集中 ${summary.recruitingCompanies} 社</span>
      </div>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.canViewActivities}">
    <a class="tile tile-dark" href="${ctx}/app/activities/list">
      <div class="tile-head">
        <div class="tile-icon">◉</div>
        <div class="tile-titles">
          <div class="tile-title">就職活動</div>
          <div class="tile-en">Job Hunting</div>
        </div>
        <div class="tile-arrow">›</div>
      </div>
      <p class="tile-desc">受験情報の記録。選考・結果・承諾期限を一元管理。</p>
      <div class="tile-chips">
        <span class="chip">活動中 ${summary.activeApplications} 件</span>
        <c:if test="${summary.deadlineCount > 0}">
          <span class="chip chip-deadline">承諾期限 ${summary.deadlineCount} 名</span>
        </c:if>
      </div>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.canViewReport}">
    <a class="tile" href="${ctx}/app/report">
      <div class="tile-head">
        <div class="tile-icon tile-icon-green">▰</div>
        <div class="tile-titles">
          <div class="tile-title">活動状況報告</div>
          <div class="tile-en">Report</div>
        </div>
        <div class="tile-arrow">›</div>
      </div>
      <p class="tile-desc">学科全体の状況をダッシュボードで可視化。クラス別ドリルダウン。</p>
      <div class="tile-chips">
        <span class="chip chip-offer">内定率 <c:out value="${summary.ratePercentAll}"/>%</span>
        <span class="chip">要フォロー ${summary.followUpCount}</span>
      </div>
    </a>
  </c:if>

  <c:if test="${sessionScope.account.admin}">
    <a class="tile" href="${ctx}/app/admin/accounts">
      <div class="tile-head">
        <div class="tile-icon tile-icon-neutral">⚙</div>
        <div class="tile-titles">
          <div class="tile-title">管理</div>
          <div class="tile-en">Admin</div>
        </div>
        <div class="tile-arrow">›</div>
      </div>
      <p class="tile-desc">アカウント、業種・職種・地域マスタの管理。</p>
      <div class="tile-chips">
        <span class="chip chip-muted">システム管理者のみ</span>
      </div>
    </a>
  </c:if>

</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
