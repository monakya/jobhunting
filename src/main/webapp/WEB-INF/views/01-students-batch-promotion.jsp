<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 進級・卒業 一括処理</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./01-students-batch-promotion.css">
</head>
<body>

<div class="page-label">JMS / 進級・卒業 一括処理</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:1480px;" data-screen-label="進級・卒業 一括処理">

  <!-- Header -->
  <div class="app-header">
    <!-- ここは固定UIなのでそのまま -->
  </div>

  <!-- Breadcrumb -->
  <div class="breadcrumb">
    <!-- 固定UI -->
  </div>

  <!-- Stepper -->
  <div class="stepper">
    <!-- 固定UI -->
  </div>

  <!-- Year selector + summary -->
  <div class="year-summary">

    <!-- 基準日（DBから入れる） -->
    <div class="field">
      <div class="label">基準日</div>
      <div class="value" id="base-date"></div>
    </div>

    <!-- 処理対象学年（固定UI） -->
    <div class="field">
      <div class="label">処理対象学年</div>
      <div class="grade-selector"></div>
    </div>

    <!-- 対象人数（DBから入れる） -->
    <div class="field">
      <div class="label">対象人数</div>
      <div class="value" id="student-count"></div>
    </div>

    <!-- 処理プリセット（固定UI or DB） -->
    <div class="field">
      <div class="label">処理プリセット</div>
      <div class="preset-selector"></div>
    </div>

    <!-- 自動振り分け結果（DBから入れる） -->
    <div class="auto-summary">
      <!-- 卒業 -->
      <div class="summary-box" id="summary-graduate"></div>

      <!-- 留年 -->
      <div class="summary-box" id="summary-repeat"></div>

      <!-- 休学 -->
      <div class="summary-box" id="summary-leave"></div>

      <!-- 退学 -->
      <div class="summary-box" id="summary-withdraw"></div>

      <!-- 要確認 -->
      <div class="summary-box" id="summary-warning"></div>
    </div>

  </div>

  <!-- Table -->
  <div class="student-table">

    <!-- ヘッダー（固定UI） -->
    <div class="table-header">
      <div>選択</div>
      <div>クラス</div>
      <div>学籍番号</div>
      <div>氏名</div>
      <div>現在</div>
      <div>就活状況</div>
      <div>処理後</div>
      <div>処理内容</div>
      <div></div>
    </div>

    <!-- ★★★ DBからループで生成する部分 ★★★ -->
    <div id="student-rows">
      <!-- JSで append する -->
    </div>

  </div>

  <!-- Footer -->
  <div class="footer-bar">
    <div id="footer-summary"></div>
    <button>CSV ダウンロード</button>
    <button>下書き保存</button>
    <button>最終確認 →</button>
  </div>

</div>

</body>
</html>
