<%@ page pageEncoding="UTF-8" %>
<%-- 就職活動 変更（画面08の編集モード）。選考の進行をここで行う --%>
<%@ include file="/WEB-INF/jsp/common/header.jspf" %>

<h1 class="page-title">就職活動変更</h1>
<div class="page-breadcrumb">
  JMS / <a href="${pageContext.request.contextPath}/app/activities/list">就職活動</a> /
  <a href="${pageContext.request.contextPath}/app/activities/view?id=${a.applicationId}">閲覧</a> / 変更
</div>

<c:if test="${param.msg == 'result'}"><div class="msg-info">現在の選考結果を確定しました。</div></c:if>
<c:if test="${param.msg == 'added'}"><div class="msg-info">次の選考を追加しました。</div></c:if>
<c:if test="${param.msg == 'offer'}"><div class="msg-info">内定への回答を保存しました。</div></c:if>
<c:if test="${param.msg == 'closed'}"><div class="msg-info">終了フラグを更新しました。</div></c:if>
<c:if test="${param.msg == 'hdeleted'}"><div class="msg-info">選考履歴を取り消しました。</div></c:if>

<%-- 応募の概要 + 現在の選考状況（U-5） --%>
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
  <p style="margin:10px 0 0;">
    現在の選考状況：
    <c:choose>
      <c:when test="${a.hasHistory}">
        <strong><c:out value="${a.currentStageName}"/></strong>
        <c:if test="${a.currentFinal}"><span class="chip chip-final">最終選考</span></c:if>
        ／ 結果：<c:out value="${a.currentResultName}"/>
      </c:when>
      <c:otherwise><span style="color:#aaa;">まだ履歴がありません</span></c:otherwise>
    </c:choose>
  </p>
</div>

<c:set var="latest" value="${a.histories[0]}" />

<%-- ① 現在の選考状況の結果を確定（結果・結果判明日・備考のみ更新） --%>
<c:if test="${a.hasHistory}">
<div class="card">
  <h2 class="section-title">① 現在の選考結果を確定する</h2>
  <p style="color:#888; margin-top:0;">
    対象：<c:out value="${latest.stageName}"/>
    <c:if test="${latest.finalSelection}"><span class="chip chip-final">最終</span></c:if>
    （<c:out value="${fn:replace(latest.eventAt, 'T', ' ')}"/>）
  </p>
  <form method="post" action="${pageContext.request.contextPath}/app/activities/edit">
    <input type="hidden" name="action" value="updateResult">
    <input type="hidden" name="id" value="${a.applicationId}">
    <input type="hidden" name="historyId" value="${latest.historyId}">

    <div class="form-row">
      <label class="req">結果</label>
      <div style="flex:1;">
        <c:forEach var="r" items="${results}">
          <label style="margin-right:14px; font-weight:normal;">
            <input type="radio" name="selectionResultId" class="uResult"
                   value="${r.id}" data-name="<c:out value='${r.name}'/>"
                   ${latest.selectionResultId == r.id ? 'checked' : ''}
                   onchange="onUpd();"><c:out value="${r.name}"/>
          </label>
        </c:forEach>
        <div id="uAttendHint" style="display:none; color:#c0392b; font-size:12px; margin-top:4px;">
          「参加」は説明会のときのみ選択できます。
        </div>
      </div>
    </div>
    <div class="form-row">
      <label>結果判明日</label>
      <input type="date" name="resultDate" value="<c:out value='${latest.resultDate}'/>">
    </div>
    <div class="form-row">
      <label>備考</label>
      <textarea name="remarks" rows="2" style="flex:1;"><c:out value="${latest.remarks}"/></textarea>
    </div>
    <div class="form-row">
      <label>承諾期限</label>
      <input type="date" name="acceptDeadline" id="uDeadline" disabled>
      <span id="uDeadlineHint" style="color:#888; margin-left:8px;">最終選考で「合格」を選択すると入力できます。</span>
    </div>
    <button type="submit" class="btn">結果を確定</button>
  </form>
</div>
</c:if>

<%-- ② 次の選考予定を追加（通過時のみ） --%>
<div class="card">
  <h2 class="section-title">② 次の選考を追加する</h2>
  <form method="post" action="${pageContext.request.contextPath}/app/activities/edit">
    <input type="hidden" name="action" value="addNext">
    <input type="hidden" name="id" value="${a.applicationId}">

    <div class="form-row">
      <label class="req">選考ステージ</label>
      <select name="selectionStageId" id="stageSelect2" style="flex:1;" onchange="onAdd();">
        <option value="">選択してください</option>
        <c:forEach var="s" items="${stages}">
          <option value="${s.id}" data-attend="${s.subName}"><c:out value="${s.name}"/></option>
        </c:forEach>
      </select>
    </div>
    <div class="form-row">
      <label>最終選考</label>
      <label style="flex:1; font-weight:normal;">
        <input type="checkbox" name="isFinalSelection" id="finalChk2" value="1" onchange="onAdd();">
        この選考は最終選考（内定に直結）
      </label>
    </div>
    <div class="form-row">
      <label class="req">選考日時</label>
      <input type="datetime-local" name="eventAt">
    </div>
    <div class="form-row">
      <label>場所</label>
      <input type="text" name="place" maxlength="255" style="flex:1;" placeholder="本社ビル 5F / オンライン 等">
    </div>
    <div class="form-row">
      <label>面接官人数</label>
      <input type="number" name="interviewerCount" min="1" style="width:120px;">
      <span style="color:#888; margin-left:8px;">担当者名などは備考へ</span>
    </div>
    <div class="form-row">
      <label class="req">結果</label>
      <div style="flex:1;">
        <c:forEach var="r" items="${results}">
          <label style="margin-right:14px; font-weight:normal;">
            <input type="radio" name="selectionResultId" class="aResult"
                   value="${r.id}" data-name="<c:out value='${r.name}'/>"
                   ${r.name == '未判明' ? 'checked' : ''}
                   onchange="onAdd();"><c:out value="${r.name}"/>
          </label>
        </c:forEach>
        <div id="aAttendHint" style="display:none; color:#c0392b; font-size:12px; margin-top:4px;">
          「参加」は説明会のときのみ選択できます。
        </div>
      </div>
    </div>
    <div class="form-row">
      <label>結果判明日</label>
      <input type="date" name="resultDate">
    </div>
    <div class="form-row">
      <label>備考</label>
      <textarea name="remarks" rows="2" style="flex:1;"></textarea>
    </div>
    <div class="form-row">
      <label>承諾期限</label>
      <input type="date" name="acceptDeadline" id="aDeadline" disabled>
      <span id="aDeadlineHint" style="color:#888; margin-left:8px;">最終選考で「合格」を選択すると入力できます。</span>
    </div>
    <button type="submit" class="btn">選考を追加</button>
  </form>
</div>

<%-- ③ 内定への回答（offer があるときだけ） --%>
<c:if test="${a.hasOffer}">
<div class="card">
  <h2 class="section-title">③ 内定への回答</h2>
  <p style="color:#888; margin-top:0;">
    内定日 <span class="mono"><c:out value="${a.offer.offerDate}"/></span>
    ／ 現在の回答：
    <c:choose>
      <c:when test="${empty a.offer.offerAcceptanceName}"><span class="chip chip-deadline">未回答</span></c:when>
      <c:otherwise><span class="chip"><c:out value="${a.offer.offerAcceptanceName}"/></span></c:otherwise>
    </c:choose>
  </p>
  <form method="post" action="${pageContext.request.contextPath}/app/activities/edit">
    <input type="hidden" name="action" value="acceptance">
    <input type="hidden" name="id" value="${a.applicationId}">
    <input type="hidden" name="offerId" value="${a.offer.offerId}">
    <div class="form-row">
      <label class="req">回答</label>
      <select name="offerAcceptanceId" style="flex:1;">
        <option value="">未回答</option>
        <c:forEach var="oa" items="${acceptances}">
          <option value="${oa.id}" ${a.offer.offerAcceptanceId == oa.id ? 'selected' : ''}><c:out value="${oa.name}"/></option>
        </c:forEach>
      </select>
    </div>
    <div class="form-row">
      <label>承諾日</label>
      <input type="date" name="acceptedDate" value="<c:out value='${a.offer.acceptedDate}'/>">
    </div>
    <div class="form-row">
      <label>承諾期限</label>
      <input type="date" name="acceptDeadline" value="<c:out value='${a.offer.acceptDeadline}'/>">
    </div>
    <button type="submit" class="btn">回答を保存</button>
  </form>
</div>
</c:if>

<%-- ④ 終了フラグ --%>
<div class="card">
  <h2 class="section-title">④ 終了フラグ</h2>
  <form method="post" action="${pageContext.request.contextPath}/app/activities/edit">
    <input type="hidden" name="action" value="toggleClosed">
    <input type="hidden" name="id" value="${a.applicationId}">
    <label style="font-weight:normal;">
      <input type="checkbox" name="closed" value="1" ${a.closed ? 'checked' : ''}>
      この応募を終了にする（不合格・辞退・承諾などで運用）
    </label>
    <div style="margin-top:10px;"><button type="submit" class="btn btn-secondary">終了状態を更新</button></div>
  </form>
</div>

<%-- 選考タイムライン（履歴の取り消しつき） --%>
<div class="card">
  <h2 class="section-title">選考タイムライン</h2>
  <c:choose>
    <c:when test="${empty a.histories}">
      <p style="color:#aaa;">まだ選考履歴がありません。</p>
    </c:when>
    <c:otherwise>
      <table class="list">
        <tr><th>選考日時</th><th>ステージ</th><th>結果</th><th>結果判明日</th><th>備考</th><th></th></tr>
        <c:forEach var="h" items="${a.histories}">
          <tr>
            <td class="mono"><c:out value="${fn:replace(h.eventAt, 'T', ' ')}"/></td>
            <td><c:out value="${h.stageName}"/>
                <c:if test="${h.finalSelection}"><span class="chip chip-final">最終</span></c:if></td>
            <td><c:out value="${h.resultName}"/></td>
            <td class="mono"><c:out value="${h.resultDate}"/></td>
            <td><c:out value="${h.remarks}"/></td>
            <td style="text-align:right;">
              <form method="post" action="${pageContext.request.contextPath}/app/activities/edit"
                    onsubmit="return confirm('この選考履歴を取り消します。よろしいですか？');" style="display:inline;">
                <input type="hidden" name="action" value="deleteHistory">
                <input type="hidden" name="id" value="${a.applicationId}">
                <input type="hidden" name="historyId" value="${h.historyId}">
                <button type="submit" class="btn btn-danger" style="padding:4px 10px; font-size:11px;">取消</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>
      <p style="color:#888; font-size:12px;">※取り消しは論理削除です（is_deleted）。データは残りますが集計・表示からは外れます。</p>
    </c:otherwise>
  </c:choose>
</div>

<script>
  var STAGE_ALLOWS = {};
  <c:forEach var="s" items="${stages}">
  STAGE_ALLOWS[${s.id}] = ('${s.subName}' === '1');
  </c:forEach>

  // ① 結果確定：ステージは固定（最新履歴のステージ）。最終フラグも固定。
  var UPD_STAGE_ID = '${latest.selectionStageId}';
  var UPD_FINAL = ${a.currentFinal ? 'true' : 'false'};
  function onUpd() {
    var allows = STAGE_ALLOWS[parseInt(UPD_STAGE_ID, 10)] === true;
    document.querySelectorAll('.uResult').forEach(function (rb) {
      if (rb.getAttribute('data-name') === '参加') {
        rb.disabled = !allows;
        if (!allows && rb.checked) rb.checked = false;
      }
    });
    var uh = document.getElementById('uAttendHint');
    if (uh) uh.style.display = allows ? 'none' : 'block';

    var checked = document.querySelector('.uResult:checked');
    var name = checked ? checked.getAttribute('data-name') : '';
    var can = UPD_FINAL && (name === '合格');
    var dl = document.getElementById('uDeadline');
    if (dl) {
      dl.disabled = !can;
      document.getElementById('uDeadlineHint').style.display = can ? 'none' : 'inline';
      if (!can) dl.value = '';
    }
  }

  // ② 次の選考：ステージ選択で「参加」可否、最終＋合格で承諾期限
  function onAdd() {
    var stageOpt = document.getElementById('stageSelect2').selectedOptions[0];
    var allows = stageOpt && stageOpt.getAttribute('data-attend') === '1';
    document.querySelectorAll('.aResult').forEach(function (rb) {
      if (rb.getAttribute('data-name') === '参加') {
        rb.disabled = !allows;
        if (!allows && rb.checked) rb.checked = false;
      }
    });
    document.getElementById('aAttendHint').style.display = allows ? 'none' : 'block';

    var isFinal = document.getElementById('finalChk2').checked;
    var checked = document.querySelector('.aResult:checked');
    var name = checked ? checked.getAttribute('data-name') : '';
    var can = isFinal && (name === '合格');
    var dl = document.getElementById('aDeadline');
    dl.disabled = !can;
    document.getElementById('aDeadlineHint').style.display = can ? 'none' : 'inline';
    if (!can) dl.value = '';
  }

  <c:if test="${a.hasHistory}">onUpd();</c:if>
  onAdd();
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jspf" %>
