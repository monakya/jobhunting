<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 就職活動管理 一覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./06-job-activity-list.css">
</head>

<body>
<div class="page-label">JMS / V-A 就職活動管理 一覧（シート刷新型）</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:1480px;">
  
  <!-- Header -->
  <div class="app-header">
    <div class="logo">JMS</div>
    <div class="subtitle">Job Hunting Management System</div>
    <div class="nav">
      <span>学生</span><span>企業</span>
      <span class="active">就職活動</span>
      <span>活動状況報告</span><span>管理</span>
    </div>
    <div class="user">
      <span>S2A1 担任</span>
      <div class="user-icon">中</div>
    </div>
  </div>

  <!-- Page Title -->
  <div class="page-header">
    <div>
      <div class="label">就職活動管理</div>
      <div class="title">就職活動 一覧</div>
    </div>
    <div class="actions">
      <button>出力</button>
      <button>列のカスタマイズ</button>
      <button class="primary">＋ 受験情報を追加</button>
    </div>
  </div>

  <!-- KPI -->
  <div class="kpi-grid">
    <!-- ここも DB から数字を入れるだけ -->
    <div class="kpi"><div>在籍中</div><div class="num">38 名</div></div>
    <div class="kpi"><div>活動中</div><div class="num active">34 名</div></div>
    <div class="kpi"><div>内定</div><div class="num ok">9 名</div></div>
    <div class="kpi"><div>内定承諾</div><div class="num ok">5 名</div></div>
    <div class="kpi"><div>未活動</div><div class="num">4 名</div></div>
    <div class="kpi warn"><div>承諾期限 7日以内</div><div class="num warn">2 名</div></div>
  </div>

  <!-- Filters -->
  <div class="filters">
    <div class="filter">クラス <span>S2A1 ▾</span></div>
    <div class="filter">在籍 <span>在籍中 ▾</span></div>
    <div class="filter">紹介区分 <span>すべて ▾</span></div>
    <div class="filter">選考状況 <span>すべて ▾</span></div>
    <div class="filter">期間 <span>2026/06/26 — 2026/07/31</span></div>
    <div class="search"><span>⌕</span> 学生・企業名で検索</div>
  </div>

  <!-- Table Header -->
  <div class="table-header">
    <div></div><div>クラス</div><div>学籍</div><div>氏名</div><div>企業名</div>
    <div>業種</div><div>紹介</div><div>選考状況</div><div>次回日時 / 場所</div>
    <div>結果</div><div>結果判明日</div><div>承諾期限</div><div></div>
  </div>

  <!-- ▼▼▼ ここが短縮ポイント：DBループ ▼▼▼ -->
  <!-- row-template を使って繰り返し生成する -->
  <div id="rows">
    <!-- 例：テンプレート（1行だけ） -->
    <template id="row-template">
      <div class="row">
        <div class="chk"></div>
        <div class="class"></div>
        <div class="student-id"></div>
        <div class="student-name"></div>
        <div class="company"></div>
        <div class="industry"></div>
        <div class="intro"></div>
        <div class="status"></div>
        <div class="next"></div>
        <div class="result"></div>
        <div class="result-date"></div>
        <div class="limit"></div>
        <div class="menu">⋯</div>
      </div>
    </template>
  </div>

  <!-- Pagination -->
  <div class="pagination">
    <div>全 142 件中 1–12 件を表示</div>
    <div class="pages">
      <button>‹</button>
      <button class="active">1</button>
      <button>2</button>
      <button>3</button>
      <button>›</button>
    </div>
  </div>

</div>
</body>
</html>
