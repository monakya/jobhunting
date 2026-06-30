<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 学生情報 一覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./02-students-list.css">
</head>
<body>

<div class="page-label">JMS / 学生情報 一覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:1480px;" data-screen-label="学生情報 一覧">

  <!-- Header -->
  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; overflow:hidden;">

    <!-- App chrome -->
    <div style="display:flex; align-items:center; height:48px; background:#1B2030; color:#E2DED2; padding:0 20px;">
      <div style="font:700 13px 'BIZ UDPGothic';">JMS</div>
      <div style="margin-left:18px; opacity:.55; font:500 12px 'Noto Sans JP';">Job Hunting Management System</div>
      <div style="flex:1;"></div>
      <div style="display:flex; gap:18px; font:500 12px 'Noto Sans JP'; opacity:.85;">
        <span style="color:#fff; border-bottom:2px solid #fff; padding-bottom:14px;">学生</span>
        <span>企業</span><span>就職活動</span><span>活動状況報告</span><span>管理</span>
      </div>
      <div style="flex:1;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <span style="font:500 11px 'Noto Sans JP'; opacity:.75;">S2A1 担任</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#2C4A7A; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px 'BIZ UDPGothic';">中</div>
      </div>
    </div>

    <!-- Page header -->
    <div style="padding:22px 28px 18px; border-bottom:1px solid #E2DED2;">
      <div style="display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px 'Noto Sans JP'; color:#7B8294;">学生管理</div>
          <div style="margin-top:6px; font:700 22px 'BIZ UDPGothic'; color:#1B2030;">学生情報 一覧</div>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; gap:8px;">
          <button class="btn">CSV 出力</button>
          <button class="btn">進級・卒業処理</button>
          <button class="btn-primary">＋ 学生を登録</button>
        </div>
      </div>

      <!-- KPI strip（DBで埋める） -->
      <div style="margin-top:18px; display:grid; grid-template-columns:repeat(6, 1fr); gap:12px;">
        <div class="kpi-box"><div>在籍中</div><div id="kpi-enrolled"></div></div>
        <div class="kpi-box"><div>休学</div><div id="kpi-leave"></div></div>
        <div class="kpi-box"><div>退学</div><div id="kpi-withdraw"></div></div>
        <div class="kpi-box"><div>あっせん継続</div><div id="kpi-assist"></div></div>
        <div class="kpi-box"><div>辞退</div><div id="kpi-decline"></div></div>
        <div class="kpi-box"><div>内定保有</div><div id="kpi-offer"></div></div>
      </div>

      <!-- Filters（固定UI） -->
      <div style="margin-top:16px; display:flex; gap:10px; flex-wrap:wrap;">
        <div class="filter-box"><span>クラス</span><span id="filter-class"></span><span>▾</span></div>
        <div class="filter-box"><span>在籍</span><span id="filter-enrollment"></span><span>▾</span></div>
        <div class="filter-box"><span>あっせん</span><span id="filter-assist"></span><span>▾</span></div>
        <div class="filter-box"><span>志望地域</span><span id="filter-area"></span><span>▾</span></div>
        <div class="filter-box"><span>志望職種</span><span id="filter-job"></span><span>▾</span></div>
        <div style="flex:1;"></div>
        <div class="search-box"><span>⌕</span><span>氏名・カナ・学籍番号で検索</span></div>
      </div>
    </div>

    <!-- Table header -->
    <div class="table-header">
      <div></div><div>クラス</div><div>学籍番号</div><div>氏名</div><div>性別</div>
      <div>在籍</div><div>あっせん</div><div>志望地域</div><div>志望職種</div>
      <div>内定状況</div><div>最終活動</div><div></div>
    </div>

    <!-- ★ DBから生成する行 ★ -->
    <div id="student-rows"></div>

    <!-- Pagination（DBで埋める） -->
    <div class="pagination">
      <div id="pagination-info"></div>
      <div id="pagination-buttons"></div>
    </div>

  </div>
</div>

</body>
</html>
