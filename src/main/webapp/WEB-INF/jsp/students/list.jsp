<%@ page pageEncoding="UTF-8" %>
<%-- 学生一覧（画面02）。担任は自クラス固定（クラス絞り込みを出さない） --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">学生一覧</h1>
<div class="page-breadcrumb">JMS / 学生</div>

<c:if test="${param.msg == 'deleted'}"><div class="msg-info">削除しました。</div></c:if>

<div class="card">
  <form method="get" action="${pageContext.request.contextPath}/app/students/list" class="filter-bar">
    <%-- ★方針変更：担任も全クラスを扱えるようになったため、クラス絞り込みを全ロールで表示 --%>
      <select name="classId">
        <option value="0">クラス：すべて</option>
        <c:forEach var="c" items="${classes}">
          <option value="${c.id}" ${classId == c.id ? 'selected' : ''}><c:out value="${c.name}"/></option>
        </c:forEach>
      </select>
    <select name="statusId">
      <option value="0">在籍状況：すべて</option>
      <c:forEach var="st" items="${statuses}">
        <option value="${st.id}" ${statusId == st.id ? 'selected' : ''}><c:out value="${st.name}"/></option>
      </c:forEach>
    </select>
    <input type="text" name="q" value="<c:out value='${q}'/>" placeholder="氏名・かな 部分一致">
    <button type="submit" class="btn btn-secondary">検索</button>
    <span class="spacer"></span>
    <a class="btn" href="${pageContext.request.contextPath}/app/students/register">＋ 学生を登録</a>
  </form>

  <table class="list">
    <tr>
      <th>学籍番号</th><th>クラス</th><th>出席</th><th>氏名</th><th>フリガナ</th>
      <th>在籍状況</th><th>状態</th><th></th>
    </tr>
    <c:forEach var="s" items="${students}">
      <tr>
        <td class="mono"><c:out value="${s.studentNo}"/></td>
        <td><c:out value="${s.className}"/></td>
        <td class="mono">${s.attendanceNo}</td>
        <td>
          <a href="${pageContext.request.contextPath}/app/students/view?no=${s.studentNo}">
            <c:out value="${s.name}"/>
          </a>
        </td>
        <td><c:out value="${s.nameKana}"/></td>
        <td><c:out value="${s.enrollmentStatusName}"/></td>
        <td>
          <c:if test="${s.hasAcceptedOffer}"><span class="chip chip-offer">承諾</span></c:if>
          <c:if test="${s.hasOffer && !s.hasAcceptedOffer}"><span class="chip chip-stage">内定</span></c:if>
          <c:if test="${s.refusesPlacement}"><span class="chip chip-deadline">あっせん辞退</span></c:if>
        </td>
        <td style="text-align:right;">
          <a class="btn btn-secondary" style="padding:4px 10px; font-size:11px;"
             href="${pageContext.request.contextPath}/app/students/edit?no=${s.studentNo}">変更</a>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty students}">
      <tr><td colspan="8" style="color:var(--muted); text-align:center; padding:24px;">該当する学生がいません。</td></tr>
    </c:if>
  </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
