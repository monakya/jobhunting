<%@ page pageEncoding="UTF-8" %>
<%-- 就職活動 登録（画面08）。新規応募 + 最初の選考イベントを1画面で入力 --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">就職活動登録</h1>
<div class="page-breadcrumb">
  JMS / <a href="${pageContext.request.contextPath}/app/activities/list">就職活動</a> / 登録
</div>

<c:if test="${not empty errorMessage}">
  <div class="msg-error"><c:out value="${errorMessage}"/></div>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/app/activities/register">
  <input type="hidden" name="action" value="register">

  <div class="card">
    <h2 class="section-title">応募情報</h2>

    <div class="form-row">
      <label class="req">学生</label>
      <select name="studentNo" style="flex:1;">
        <option value="">選択してください</option>
        <c:forEach var="st" items="${students}">
          <option value="${st.subName}" ${a.studentNo == st.subName ? 'selected' : ''}><c:out value="${st.name}"/></option>
        </c:forEach>
      </select>
    </div>

    <div class="form-row">
      <label class="req">企業</label>
      <select name="companyId" id="companyId" style="flex:1;" onchange="filterRecruitments();">
        <option value="">選択してください</option>
        <c:forEach var="co" items="${companies}">
          <option value="${co.id}" ${a.companyId == co.id ? 'selected' : ''}><c:out value="${co.name}"/></option>
        </c:forEach>
      </select>
    </div>

    <div class="form-row">
      <label>募集</label>
      <select name="recruitmentId" id="recruitmentId" style="flex:1;">
        <option value="">募集なし（直接応募）</option>
      </select>
    </div>

    <div class="form-row">
      <label class="req">応募職種</label>
      <select name="jobTypeId" style="flex:1;">
        <option value="">選択してください</option>
        <c:forEach var="jt" items="${jobTypes}">
          <option value="${jt.id}" ${a.jobTypeId == jt.id ? 'selected' : ''}><c:out value="${jt.name}"/></option>
        </c:forEach>
      </select>
    </div>

    <div class="form-row">
      <label class="req">紹介区分</label>
      <select name="referralTypeId" style="flex:1;">
        <option value="">選択してください</option>
        <c:forEach var="rt" items="${referralTypes}">
          <option value="${rt.id}" ${a.referralTypeId == rt.id ? 'selected' : ''}><c:out value="${rt.name}"/></option>
        </c:forEach>
      </select>
    </div>

    <div class="form-row">
      <label class="req">エントリー日</label>
      <input type="date" name="entryDate" value="<c:out value='${a.entryDate}'/>">
    </div>
  </div>

  <div class="card">
    <h2 class="section-title">最初の選考イベント</h2>

    <div class="form-row">
      <label class="req">選考ステージ</label>
      <select name="selectionStageId" id="stageSelect" style="flex:1;" onchange="onStageOrResultChange();">
        <option value="">選択してください</option>
        <c:forEach var="s" items="${stages}">
          <option value="${s.id}" data-attend="${s.subName}" ${fh.selectionStageId == s.id ? 'selected' : ''}><c:out value="${s.name}"/></option>
        </c:forEach>
      </select>
    </div>

    <div class="form-row">
      <label>最終選考</label>
      <label style="flex:1; font-weight:normal;">
        <input type="checkbox" name="isFinalSelection" id="finalChk" value="1"
               ${fh.finalSelection ? 'checked' : ''} onchange="onStageOrResultChange();">
        この選考は最終選考（内定に直結）
      </label>
    </div>

    <div class="form-row">
      <label class="req">選考日時</label>
      <input type="datetime-local" name="eventAt" value="<c:out value='${fh.eventAt}'/>">
    </div>

    <div class="form-row">
      <label>場所</label>
      <input type="text" name="place" value="<c:out value='${fh.place}'/>" maxlength="255" style="flex:1;"
             placeholder="本社ビル 5F / オンライン 等">
    </div>

    <div class="form-row">
      <label>面接官人数</label>
      <input type="number" name="interviewerCount" value="<c:out value='${fh.interviewerCount}'/>" min="1" style="width:120px;">
      <span style="color:#888; margin-left:8px;">担当者名などは備考へ</span>
    </div>

    <div class="form-row">
      <label class="req">結果</label>
      <div style="flex:1;">
        <c:forEach var="r" items="${results}">
          <label style="margin-right:14px; font-weight:normal;">
            <input type="radio" name="selectionResultId" class="resultRadio"
                   value="${r.id}" data-name="<c:out value='${r.name}'/>"
                   ${fh.selectionResultId == r.id ? 'checked' : ''}
                   onchange="onStageOrResultChange();"><c:out value="${r.name}"/>
          </label>
        </c:forEach>
        <div id="attendHint" style="display:none; color:#c0392b; font-size:12px; margin-top:4px;">
          「参加」は説明会のときのみ選択できます。
        </div>
      </div>
    </div>

    <div class="form-row">
      <label>結果判明日</label>
      <input type="date" name="resultDate" value="<c:out value='${fh.resultDate}'/>">
    </div>

    <div class="form-row">
      <label>備考</label>
      <textarea name="remarks" rows="2" style="flex:1;"><c:out value="${fh.remarks}"/></textarea>
    </div>

    <div class="form-row">
      <label>承諾期限</label>
      <input type="date" name="acceptDeadline" id="acceptDeadline" value="<c:out value='${acceptDeadlineVal}'/>" disabled>
      <span id="deadlineHint" style="color:#888; margin-left:8px;">最終選考で「合格」を選択すると入力できます。</span>
    </div>
  </div>

  <div class="card">
    <button type="submit" class="btn">登録する</button>
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/app/activities/list">キャンセル</a>
  </div>
</form>

<script>
  // 企業ごとの募集 [recruitment_id, company_id, job_type_id]
  var REC = ${recruitmentIndexJson};
  // 募集ID -> 表示ラベル
  var LABELS = {};
  <c:forEach var="rl" items="${recruitmentLabels}">
  LABELS[${rl.id}] = "<c:out value='${rl.name}'/>";
  </c:forEach>
  var SELECTED_REC = "<c:out value='${a.recruitmentId}'/>"; // エラー復元用

  // 選択企業に紐づく募集だけを recruitment プルダウンに出す
  function filterRecruitments() {
    var companyId = parseInt(document.getElementById('companyId').value, 10);
    var sel = document.getElementById('recruitmentId');
    sel.innerHTML = '<option value="">募集なし（直接応募）</option>';
    if (!companyId) return;
    REC.forEach(function (row) {
      if (row[1] === companyId) {
        var opt = document.createElement('option');
        opt.value = row[0];
        opt.textContent = LABELS[row[0]] || ('募集ID ' + row[0]);
        if (String(row[0]) === SELECTED_REC) opt.selected = true;
        sel.appendChild(opt);
      }
    });
  }

  // U-4：「参加」は説明会のみ / U-6：承諾期限は「最終選考 かつ 合格」のみ活性
  function onStageOrResultChange() {
    var stageOpt = document.getElementById('stageSelect').selectedOptions[0];
    var stageAllowsAttend = stageOpt && stageOpt.getAttribute('data-attend') === '1';

    var checkedResult = document.querySelector('.resultRadio:checked');
    var resultName = checkedResult ? checkedResult.getAttribute('data-name') : '';

    // 「参加」ラジオの活性制御
    document.querySelectorAll('.resultRadio').forEach(function (rb) {
      if (rb.getAttribute('data-name') === '参加') {
        rb.disabled = !stageAllowsAttend;
        if (!stageAllowsAttend && rb.checked) rb.checked = false;
      }
    });
    document.getElementById('attendHint').style.display =
      (!stageAllowsAttend) ? 'block' : 'none';

    // 承諾期限の活性制御
    var isFinal = document.getElementById('finalChk').checked;
    var canDeadline = isFinal && (resultName === '合格');
    var dl = document.getElementById('acceptDeadline');
    dl.disabled = !canDeadline;
    document.getElementById('deadlineHint').style.display = canDeadline ? 'none' : 'inline';
    if (!canDeadline) dl.value = '';
  }

  // 初期化（エラー復元時に選択状態を反映）
  filterRecruitments();
  onStageOrResultChange();
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
