<%@ page pageEncoding="UTF-8" %>
<%-- 企業 登録／変更（画面12）。募集明細行（最大10行）を JS で追加する --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">${mode == 'edit' ? '企業変更' : '企業登録'}</h1>
<div class="page-breadcrumb">JMS / 企業 / ${mode == 'edit' ? '変更' : '登録'}</div>

<c:if test="${not empty errorMessage}">
  <div class="msg-error"><c:out value="${errorMessage}"/></div>
</c:if>

<form method="post"
      action="${pageContext.request.contextPath}/app/companies/${mode == 'edit' ? 'edit' : 'register'}">
  <input type="hidden" name="mode" value="${mode}">
  <input type="hidden" name="companyId" value="${c.companyId}">

  <div class="view-grid">
    <div class="card">
      <h2 class="section-title">企業情報</h2>
      <div class="form-row">
        <label class="req">企業名</label>
        <input type="text" name="companyName" value="<c:out value='${c.companyName}'/>" maxlength="100" style="flex:1;">
      </div>
      <div class="form-row">
        <label class="req">フリガナ</label>
        <input type="text" name="companyNameKana" value="<c:out value='${c.companyNameKana}'/>" maxlength="200" placeholder="カタカナ" style="flex:1;">
      </div>
      <div class="form-row">
        <label>会社名（正式）</label>
        <input type="text" name="corporateName" value="<c:out value='${c.corporateName}'/>" maxlength="100" placeholder="株式会社〇〇" style="flex:1;">
      </div>
      <div class="form-row">
        <label>会社名 フリガナ</label>
        <input type="text" name="corporateNameKana" value="<c:out value='${c.corporateNameKana}'/>" maxlength="200" style="flex:1;">
      </div>
      <div class="form-row">
        <label class="req">業種</label>
        <select name="industryId">
          <option value="">選択してください</option>
          <c:forEach var="i" items="${industries}">
            <option value="${i.id}" ${c.industryId == i.id ? 'selected' : ''}><c:out value="${i.name}"/></option>
          </c:forEach>
        </select>
      </div>
      <div class="form-row">
        <label class="req">状態</label>
        <select name="companyStatusId">
          <option value="">選択してください</option>
          <c:forEach var="st" items="${statuses}">
            <option value="${st.id}" ${c.companyStatusId == st.id ? 'selected' : ''}><c:out value="${st.name}"/></option>
          </c:forEach>
        </select>
      </div>
      <div class="form-row">
        <label class="req">所在地（地域）</label>
        <select name="regionId">
          <option value="">選択してください</option>
          <c:forEach var="r" items="${regions}">
            <option value="${r.id}" ${c.regionId == r.id ? 'selected' : ''}><c:out value="${r.subName}"/> <c:out value="${r.name}"/></option>
          </c:forEach>
        </select>
      </div>
      <div class="form-row">
        <label>設立年</label>
        <input type="number" name="establishedYear" value="${c.establishedYear}" min="1800" max="2100" style="width:100px;">
        <label style="width:auto;">資本金（円）</label>
        <input type="text" name="capital" value="${c.capital}" style="width:140px;">
      </div>
      <div class="form-row">
        <label>従業員数</label>
        <input type="number" name="employeeCount" value="${c.employeeCount}" min="1" style="width:100px;">
        <label style="width:auto;">採用実績</label>
        <label style="width:auto; font-weight:400;">
          <input type="checkbox" name="hasHiringRecord" ${c.hasHiringRecord ? 'checked' : ''}> あり
        </label>
      </div>
      <div class="form-row">
        <label>郵便番号</label>
        <input type="text" name="postalCode" value="<c:out value='${c.postalCode}'/>" maxlength="8" placeholder="810-0001" style="width:110px;">
      </div>
      <div class="form-row">
        <label>住所</label>
        <input type="text" name="address" value="<c:out value='${c.address}'/>" maxlength="255" style="flex:1;">
      </div>
      <div class="form-row">
        <label>TEL</label>
        <input type="text" name="tel" value="<c:out value='${c.tel}'/>" maxlength="20" style="width:160px;">
        <label style="width:auto;">URL</label>
        <input type="text" name="websiteUrl" value="<c:out value='${c.websiteUrl}'/>" maxlength="255" style="flex:1;">
      </div>
      <div class="form-row">
        <label>担当者</label>
        <input type="text" name="contactPerson" value="<c:out value='${c.contactPerson}'/>" maxlength="50" style="width:200px;">
        <label style="width:auto;">担当メール</label>
        <input type="email" name="email" value="<c:out value='${c.email}'/>" maxlength="255" style="flex:1;">
      </div>
      <div class="form-row">
        <label>備考</label>
        <textarea name="remarks" rows="3" style="flex:1;"><c:out value="${c.remarks}"/></textarea>
      </div>
    </div>

    <div class="card">
      <h2 class="section-title">募集職種（勤務地は Ctrl+クリックで複数選択）</h2>
      <div id="recRows">
        <c:forEach var="n" begin="1" end="${maxRows}">
          <c:set var="rec" value="${(not empty c and n <= fn:length(c.recruitments)) ? c.recruitments[n-1] : null}"/>
          <div class="rec-row" data-row="${n}"
               style="${empty rec and n > 1 ? 'display:none;' : ''}">
            <div class="rec-row-head">
              <span class="rec-row-no">募集 ${n}</span>
              <c:if test="${not empty rec and rec.applicationCount > 0}">
                <span class="field-hint">応募 ${rec.applicationCount} 件あり（職種変更に注意）</span>
              </c:if>
            </div>
            <input type="hidden" name="recId_${n}" value="${empty rec ? 0 : rec.recruitmentId}">
            <div class="form-row">
              <label>職種</label>
              <select name="jobType_${n}">
                <option value="">—（この行を使わない）</option>
                <c:forEach var="j" items="${jobTypes}">
                  <option value="${j.id}" ${not empty rec and rec.jobTypeId == j.id ? 'selected' : ''}><c:out value="${j.name}"/></option>
                </c:forEach>
              </select>
              <label style="width:auto;">人数</label>
              <input type="number" name="headcount_${n}" min="1" max="999" style="width:70px;"
                     value="${not empty rec and rec.headcount > 0 ? rec.headcount : ''}">
            </div>
            <div class="form-row">
              <label>勤務地</label>
              <select name="regions_${n}" multiple size="4" style="flex:1;">
                <c:forEach var="r" items="${regions}">
                  <option value="${r.id}"
                    <c:if test="${not empty rec}"><c:forEach var="rid" items="${rec.regionIds}"><c:if test="${rid == r.id}">selected</c:if></c:forEach></c:if>
                  ><c:out value="${r.subName}"/> <c:out value="${r.name}"/></option>
                </c:forEach>
              </select>
            </div>
          </div>
        </c:forEach>
      </div>
      <button type="button" class="btn btn-secondary" onclick="addRecRow()">＋ 職種を追加</button>
    </div>
  </div>

  <div class="form-actions">
    <c:choose>
      <c:when test="${mode == 'edit'}">
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/companies/view?id=${c.companyId}">キャンセル</a>
      </c:when>
      <c:otherwise>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/companies/list">キャンセル</a>
      </c:otherwise>
    </c:choose>
    <button type="submit" class="btn">${mode == 'edit' ? '保存する' : '登録する'}</button>
  </div>
</form>

<script>
function addRecRow() {
  const rows = document.querySelectorAll('#recRows .rec-row');
  for (const row of rows) {
    if (row.style.display === 'none') {
      row.style.display = '';
      return;
    }
  }
  alert('募集は最大 ' + rows.length + ' 件までです。');
}
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
