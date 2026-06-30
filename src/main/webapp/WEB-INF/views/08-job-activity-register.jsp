<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 就職活動 登録</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./08-job-activity-register.css">
</head>

<body>
<div class="page-label">JMS / 就職活動 登録</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" data-screen-label="就職活動 登録">

  <div class="dialog-header">
    <div>
      <div class="sub">就職活動 / 新規登録</div>
      <div class="title">受験情報を追加</div>
    </div>
    <div class="close">×</div>
  </div>

  <div class="dialog-body">

    <!-- 学生（DBから取得） -->
    <div class="section-title">学生</div>
    <div class="student-box">
      <div class="icon">{{ student.initial }}</div>
      <div>
        <div class="name">{{ student.name }}</div>
        <div class="meta">{{ student.class }} / {{ student.student_id }}</div>
      </div>
      <div class="flex"></div>
      <span class="link">変更</span>
    </div>

    <!-- 企業（DB検索） -->
    <div class="section-title">企業 *</div>
    <div class="company-search">
      <input type="text" id="companyInput" placeholder="企業名で検索">
      <div id="companyDropdown" class="dropdown"></div>
    </div>
    <div class="hint">部分一致検索。同一企業の重複登録を防ぎます。</div>

    <!-- 紹介区分・選考状況（DBマスタ） -->
    <div class="grid-2">
      <div>
        <div class="section-title">紹介区分 *</div>
        <div class="segmented" id="introType"></div>
      </div>
      <div>
        <div class="section-title">選考状況 *</div>
        <div class="select" id="statusSelect"></div>
      </div>
    </div>

    <!-- 日時・場所・最終 -->
    <div class="grid-3">
      <div>
        <div class="section-title">日時</div>
        <input type="datetime-local" id="examDate">
      </div>
      <div>
        <div class="section-title">場所</div>
        <input type="text" id="place">
      </div>
      <div>
        <div class="section-title">最終かどうか</div>
        <div class="segmented" id="isFinal"></div>
      </div>
    </div>

    <!-- 結果 -->
    <div class="section-title">結果（受験後に入力）</div>
    <div class="grid-3">
      <div>
        <div class="label">結果</div>
        <div class="segmented" id="resultType"></div>
      </div>
      <div>
        <div class="label">結果判明日</div>
        <input type="date" id="resultDate">
      </div>
      <div>
        <div class="label">承諾期限</div>
        <input type="date" id="limitDate">
      </div>
    </div>

    <!-- 備考 -->
    <div class="section-title">備考</div>
    <textarea id="note" class="note"></textarea>

  </div>

  <div class="dialog-footer">
    <div class="hint">必須項目を入力すると保存できます</div>
    <div class="flex"></div>
    <button class="cancel">キャンセル</button>
    <button class="primary">登録</button>
  </div>

</div>

<script>
// ▼ 学生情報（DBから取得）
const student = await fetch('/api/student/current').then(r => r.json());
document.querySelector('.icon').textContent = student.initial;
document.querySelector('.name').textContent = student.name;
document.querySelector('.meta').textContent = `${student.class} / ${student.student_id}`;

// ▼ 企業検索
document.getElementById('companyInput').addEventListener('input', async e => {
  const q = e.target.value;
  const list = await fetch(`/api/company/search?q=${q}`).then(r => r.json());
  const dd = document.getElementById('companyDropdown');
  dd.innerHTML = list.map(c => `
    <div class="item" data-id="${c.id}">
      <div class="name">${c.name}</div>
      <div class="sub">${c.industry}・${c.area}</div>
    </div>
  `).join('');
});

// ▼ マスタ情報（紹介区分・選考状況・結果）
async function loadMaster(id, api) {
  const data = await fetch(api).then(r => r.json());
  document.getElementById(id).innerHTML =
    data.map(x => `<div class="seg">${x.label}</div>`).join('');
}
loadMaster('introType', '/api/master/intro');
loadMaster('statusSelect', '/api/master/status');
loadMaster('isFinal', '/api/master/final');
loadMaster('resultType', '/api/master/result');
</script>

</body>
</html>
