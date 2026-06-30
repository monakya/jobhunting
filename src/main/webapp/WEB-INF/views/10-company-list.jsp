<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JMS — 企業情報 一覧</title>
  <link rel="stylesheet" href="../css/base.css">
  <link rel="stylesheet" href="../css/screen.css">
  <link rel="stylesheet" href="./10-company-list.css">
</head>

<body>
<div class="page-label">JMS / 企業情報 一覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:1480px;">
  
  <!-- Header -->
  <div class="app-header">
    <div class="logo">JMS</div>
    <div class="subtitle">Job Hunting Management System</div>
    <div class="nav">
      <span>学生</span>
      <span class="active">企業</span>
      <span>就職活動</span>
      <span>活動状況報告</span>
      <span>管理</span>
    </div>
    <div class="user">
      <span>S2A1 担任</span>
      <div class="user-icon">中</div>
    </div>
  </div>

  <!-- Page Title -->
  <div class="page-header">
    <div>
      <div class="label">企業管理</div>
      <div class="title">企業情報 一覧</div>
    </div>
    <div class="actions">
      <button class="primary">＋ 企業を登録</button>
    </div>
  </div>

  <!-- Filters -->
  <div class="filters">
    <div class="filter">業種 <span>すべて ▾</span></div>
    <div class="filter">所在地 <span>福岡県内 ▾</span></div>
    <div class="filter">状態 <span>募集中 ▾</span></div>
    <div class="filter">採用実績 <span>あり ▾</span></div>
    <div class="search"><span>⌕</span> 名称で検索</div>
  </div>

  <!-- Table Header -->
  <div class="table-header">
    <div></div><div>ID</div><div>名称</div><div>業種</div><div>所在地</div>
    <div>連絡先</div><div>募集職種</div><div>採用実績</div><div>状態</div><div></div>
  </div>

  <!-- Rows -->
  <div id="company-rows"></div>

  <!-- Template -->
  <template id="company-row-template">
    <div class="row">
      <div class="chk"></div>
      <div class="cid"></div>
      <div class="name"></div>
      <div class="industry"></div>
      <div class="location"></div>
      <div class="contact"></div>
      <div class="jobs"></div>
      <div class="history"></div>
      <div class="status"></div>
      <div class="menu">⋯</div>
    </div>
  </template>

  <!-- Pagination -->
  <div class="pagination">
    <div class="info"></div>
    <div class="pages"></div>
  </div>

</div>

<script>
async function loadCompanies() {
  const res = await fetch('/api/companies'); // ← DB から取得
  const data = await res.json();

  const rows = document.getElementById('company-rows');
  const tpl = document.getElementById('company-row-template');

  rows.innerHTML = '';

  data.list.forEach(c => {
    const row = tpl.content.cloneNode(true);

    row.querySelector('.cid').textContent = c.companyId;
    row.querySelector('.name').textContent = c.name;
    row.querySelector('.industry').textContent = c.industry;
    row.querySelector('.location').textContent = c.location;
    row.querySelector('.contact').textContent = `${c.phone} / ${c.person}`;
    row.querySelector('.jobs').textContent = `${c.jobTitle}（${c.jobCount}名）`;
    row.querySelector('.history').textContent = `${c.hireCount} 名 / ${c.hireYears} 年`;
    row.querySelector('.status').textContent = c.status;

    rows.appendChild(row);
  });

  document.querySelector('.pagination .info').textContent =
    `全 ${data.total} 社中 ${data.range} 件を表示`;
}

loadCompanies();
</script>

</body>
</html>
