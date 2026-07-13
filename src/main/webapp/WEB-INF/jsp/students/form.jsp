<%@ page pageEncoding="UTF-8" %>
<%-- 学生 登録／変更（画面04）。mode = "register" / "edit" で1枚を共用 --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">${mode == 'edit' ? '学生変更' : '学生登録'}</h1>
<div class="page-breadcrumb">JMS / 学生 / ${mode == 'edit' ? '変更' : '登録'}</div>

<c:if test="${not empty errorMessage}">
  <div class="msg-error"><c:out value="${errorMessage}"/></div>
</c:if>

<form method="post"
      action="${pageContext.request.contextPath}/app/students/${mode == 'edit' ? 'edit' : 'register'}">
  <input type="hidden" name="mode" value="${mode}">

  <div class="view-grid">
    <div class="card">
      <h2 class="section-title">基本情報</h2>

      <div class="form-row">
        <label class="req">学籍番号</label>
        <c:choose>
          <c:when test="${mode == 'edit'}">
            <span class="mono" style="line-height:2.4;"><c:out value="${s.studentNo}"/></span>
            <input type="hidden" name="studentNo" value="<c:out value='${s.studentNo}'/>">
          </c:when>
          <c:otherwise>
            <input type="text" name="studentNo" value="<c:out value='${s.studentNo}'/>"
                   maxlength="20" style="width:160px;">
          </c:otherwise>
        </c:choose>
      </div>

      <div class="form-row">
        <label class="req">クラス</label>
        <select name="classId">
          <option value="">選択してください</option>
          <c:forEach var="c" items="${classes}">
            <option value="${c.id}" ${s.classId == c.id ? 'selected' : ''}><c:out value="${c.name}"/></option>
          </c:forEach>
        </select>
        <label class="req" style="width:auto;">出席番号</label>
        <input type="number" name="attendanceNo" min="1" max="99" style="width:70px;"
               value="${s.attendanceNo > 0 ? s.attendanceNo : ''}">
      </div>

      <div class="form-row">
        <label class="req">氏名</label>
        <input type="text" name="name" value="<c:out value='${s.name}'/>" maxlength="50" style="flex:1;">
      </div>
      <div class="form-row">
        <label class="req">フリガナ</label>
        <input type="text" name="nameKana" value="<c:out value='${s.nameKana}'/>"
               maxlength="100" placeholder="ヤマダ タロウ（全角カタカナ）"
               pattern="[ァ-ヶー・　 ]+" title="全角カタカナで入力してください（ひらがな・漢字・半角カナは不可）"
               style="flex:1;">
      </div>
      <div class="form-row">
        <label class="req">性別</label>
        <select name="genderId">
          <option value="">選択してください</option>
          <c:forEach var="g" items="${genders}">
            <option value="${g.id}" ${s.genderId == g.id ? 'selected' : ''}><c:out value="${g.name}"/></option>
          </c:forEach>
        </select>
      </div>
      <div class="form-row">
        <label>生年月日</label>
        <input type="date" name="birthDate" value="<c:out value='${s.birthDate}'/>">
      </div>
      <div class="form-row">
        <label>入学年月</label>
        <input type="text" name="admissionYm" value="<c:out value='${s.admissionYm}'/>"
               placeholder="2024-04" maxlength="7" style="width:110px;">
      </div>
      <div class="form-row">
        <label class="req">在籍状況</label>
        <select name="enrollmentStatusId">
          <option value="">選択してください</option>
          <c:forEach var="st" items="${statuses}">
            <option value="${st.id}" ${s.enrollmentStatusId == st.id ? 'selected' : ''}><c:out value="${st.name}"/></option>
          </c:forEach>
        </select>
      </div>
      <div class="form-row">
        <label>あっせん辞退</label>
        <label style="width:auto; font-weight:400;">
          <input type="checkbox" name="refusesPlacement" ${s.refusesPlacement ? 'checked' : ''}> 辞退する
        </label>
      </div>

      <c:if test="${mode != 'edit'}">
        <div class="form-row">
          <label>初期パスワード</label>
          <input type="text" name="password" placeholder="未入力なら password" style="width:180px;">
        </div>
        <div class="field-hint" style="margin-left:156px;">
          アカウントは学籍番号と同じ ID で自動作成されます（ロール：学生）。
        </div>
      </c:if>
    </div>

    <div class="card">
      <h2 class="section-title">連絡先</h2>
      <div class="form-row">
        <label>メール</label>
        <input type="email" name="email" value="<c:out value='${s.email}'/>" maxlength="255" style="flex:1;">
      </div>
      <div class="form-row">
        <label>電話番号</label>
        <input type="text" name="phone" value="<c:out value='${s.phone}'/>" maxlength="20" style="width:180px;">
      </div>
      <div class="form-row">
        <label>住所</label>
        <input type="text" name="address" value="<c:out value='${s.address}'/>" maxlength="255" style="flex:1;">
      </div>

      <h2 class="section-title" style="margin-top:20px;">志望（第1〜第3志望）</h2>
      <c:forEach var="i" begin="1" end="3">
        <div class="form-row">
          <label>勤務地 第${i}志望</label>
          <select name="region${i}">
            <option value="">—</option>
            <c:forEach var="r" items="${regions}">
              <option value="${r.id}"
                <c:forEach var="p" items="${prefRegions}"><c:if test="${p.sortOrder == i && p.id == r.id}">selected</c:if></c:forEach>
              ><c:out value="${r.subName}"/> <c:out value="${r.name}"/></option>
            </c:forEach>
          </select>
        </div>
      </c:forEach>
      <c:forEach var="i" begin="1" end="3">
        <div class="form-row">
          <label>職種 第${i}志望</label>
          <select name="jobtype${i}">
            <option value="">—</option>
            <c:forEach var="j" items="${jobTypes}">
              <option value="${j.id}"
                <c:forEach var="p" items="${prefJobTypes}"><c:if test="${p.sortOrder == i && p.id == j.id}">selected</c:if></c:forEach>
              ><c:out value="${j.name}"/></option>
            </c:forEach>
          </select>
        </div>
      </c:forEach>

      <h2 class="section-title" style="margin-top:20px;">担任メモ</h2>
      <textarea name="remarks" rows="4" style="width:100%;"><c:out value="${s.remarks}"/></textarea>
    </div>
  </div>

  <div class="form-actions">
    <c:choose>
      <c:when test="${mode == 'edit'}">
        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/app/students/view?no=${s.studentNo}">キャンセル</a>
      </c:when>
      <c:otherwise>
        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/app/students/list">キャンセル</a>
      </c:otherwise>
    </c:choose>
    <button type="submit" class="btn">${mode == 'edit' ? '保存する' : '登録する'}</button>
  </div>
</form>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
