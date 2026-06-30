<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 学生情報 閲覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./03-students-view.css">
</head>
<body>

<div class="page-label">JMS / 学生情報 閲覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:1280px;" data-screen-label="学生情報 閲覧">

  <!-- Header -->
  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; overflow:hidden;">

    <!-- App chrome -->
    <div class="app-header">…</div>

    <!-- breadcrumb -->
    <div class="breadcrumb">
      <span>学生</span> / <span id="breadcrumb-class"></span> 一覧 / 
      <span id="breadcrumb-name"></span>
      <div style="flex:1;"></div>
      <button class="btn-danger">削除</button>
      <button class="btn">編集</button>
      <button class="btn-primary">就職活動を見る →</button>
    </div>

    <!-- Body -->
    <div style="display:grid; grid-template-columns:340px 1fr;">

      <!-- Left profile -->
      <div class="profile-left">

        <div class="profile-header">
          <div class="profile-icon" id="profile-icon"></div>
          <div>
            <div id="student-name" class="name"></div>
            <div id="student-kana" class="kana"></div>
          </div>
        </div>

        <div class="status-tags">
          <span id="status-enrollment"></span>
          <span id="status-assist"></span>
        </div>

        <!-- 基本情報 -->
        <div class="box">
          <div class="box-title">基本情報</div>
          <div class="box-grid">
            <div>クラス</div><div id="info-class"></div>
            <div>学籍番号</div><div id="info-student-id"></div>
            <div>性別</div><div id="info-gender"></div>
            <div>生年月日</div><div id="info-birthday"></div>
            <div>入学</div><div id="info-admission"></div>
          </div>
        </div>

        <!-- 連絡先 -->
        <div class="box">
          <div class="box-title">連絡先</div>
          <div class="box-grid">
            <div>電話</div><div id="contact-phone"></div>
            <div>メール</div><div id="contact-email"></div>
            <div>住所</div><div id="contact-address"></div>
          </div>
        </div>

      </div>

      <!-- Right -->
      <div class="profile-right">

        <!-- 志望 -->
        <div class="section-title">就職希望</div>
        <div class="wish-grid">
          <div class="box">
            <div class="box-title">志望地域</div>
            <div id="wish-area"></div>
            <div id="wish-area-detail"></div>
          </div>
          <div class="box">
            <div class="box-title">志望職種</div>
            <div id="wish-job"></div>
            <div id="wish-job-detail"></div>
          </div>
        </div>

        <!-- 就活サマリー -->
        <div class="section-title">就職活動サマリー</div>
        <div class="box">
          <div class="summary-grid">
            <div><div>受験社数</div><div id="summary-total"></div></div>
            <div><div>活動中</div><div id="summary-active"></div></div>
            <div><div>内定</div><div id="summary-offer"></div></div>
            <div><div>不合格</div><div id="summary-fail"></div></div>
          </div>

          <div id="offer-warning-box" class="warning-box" style="display:none;">
            <div id="offer-warning-title"></div>
            <div id="offer-warning-detail"></div>
          </div>
        </div>

        <!-- 担任メモ -->
        <div class="section-title">担任メモ</div>
        <div class="box">
          <div id="teacher-memo"></div>
        </div>

      </div>
    </div>

  </div>
</div>

</body>
</html>
