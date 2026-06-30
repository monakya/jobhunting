<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 管理 アカウント一覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./19-admin-accounts.css">
</head>
<body>

<div class="page-label">JMS / 管理 アカウント一覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" data-screen-label="管理 アカウント一覧">

  <div class="screen-title">アカウント管理 <span>担任・就職指導部・校長・システム管理者</span></div>

  <div class="app-chrome">
    <div class="logo">JMS</div>
    <div class="subtitle">Job Hunting Management System</div>
    <div class="nav">
      <span>学生</span><span>企業</span><span>就職活動</span>
      <span class="active">活動状況報告</span><span>管理</span>
    </div>
    <div class="user">
      <span>システム管理者</span><div class="user-icon">管</div>
    </div>
  </div>

  <div class="subnav">
    <div class="active">アカウント</div>
    <div>職種マスタ</div>
    <div>地域マスタ</div>
    <div>システム設定</div>
    <div>処理ログ</div>
  </div>

  <div class="page-header">
    <div>
      <div class="breadcrumb">管理 / アカウント</div>
      <div class="title">アカウント一覧</div>
    </div>
    <div class="header-actions">
      <button class="btn-light">ロール設定</button>
      <button class="btn-primary">＋ アカウントを追加</button>
    </div>

    <div class="kpi-strip">
      <div class="kpi"><div>担任</div><div class="num">8 名</div></div>
      <div class="kpi"><div>就職指導部</div><div class="num">3 名</div></div>
      <div class="kpi"><div>校長・教務部長</div><div class="num">2 名</div></div>
      <div class="kpi"><div>システム管理者</div><div class="num highlight">2 名</div></div>
      <div class="kpi"><div>無効・停止</div><div class="num muted">1 名</div></div>
    </div>

    <div class="filters">
      <div class="filter">部門：すべて ▾</div>
      <div class="filter">ロール：すべて ▾</div>
      <div class="filter">状態：有効 ▾</div>
      <div class="search">⌕ 氏名・ユーザー ID で検索</div>
    </div>
  </div>

  <div class="table-header">
    <div></div><div>ユーザー ID</div><div>氏名</div><div>部門</div>
    <div>ロール</div><div>最終ログイン</div><div>状態</div><div></div>
  </div>

  <!-- Row 1 -->
  <div class="row">
    <div class="chk"></div>
    <div class="uid">t.nakamura</div>
    <div class="name"><div>中村 裕太</div><div class="kana">なかむら ゆうた</div></div>
    <div>担任（S2A1）</div>
    <div><span class="tag blue">担任</span></div>
    <div>06/26 09:14</div>
    <div><span class="status ok">有効</span></div>
    <div class="menu">⋯</div>
  </div>

  <!-- Row 2 -->
  <div class="row alt">
    <div class="chk"></div>
    <div class="uid">k.sato</div>
    <div class="name"><div>佐藤 久代子</div><div class="kana">さとう くよこ</div></div>
    <div>担任（S2A2）</div>
    <div><span class="tag blue">担任</span></div>
    <div>06/26 08:42</div>
    <div><span class="status ok">有効</span></div>
    <div class="menu">⋯</div>
  </div>

  <!-- Row 3 -->
  <div class="row">
    <div class="chk"></div>
    <div class="uid">y.yamada</div>
    <div class="name"><div>山田 隆</div><div class="kana">やまだ たかし</div></div>
    <div>就職指導部</div>
    <div><span class="tag green">就職指導部長</span></div>
    <div>06/26 19:00</div>
    <div><span class="status ok">有効</span></div>
    <div class="menu">⋯</div>
  </div>

  <!-- Row 4 -->
  <div class="row">
    <div class="chk"></div>
    <div class="uid">m.hayashi</div>
    <div class="name"><div>林 未結</div><div class="kana">はやし みゆう</div></div>
    <div>就職指導部</div>
    <div><span class="tag gray">就職指導部</span></div>
    <div>06/26 17:32</div>
    <div><span class="status ok">有効</span></div>
    <div class="menu">⋯</div>
  </div>

  <!-- Row 5 -->
  <div class="row">
    <div class="chk"></div>
    <div class="uid">k.tanaka</div>
    <div class="name"><div>田中 警三</div><div class="kana">たなか けいぞう</div></div>
    <div>教務部</div>
    <div><span class="tag green">教務部長</span></div>
    <div>06/25 15:18</div>
    <div><span class="status ok">有効</span></div>
    <div class="menu">⋯</div>
  </div>

  <!-- Row 6 -->
  <div class="row">
    <div class="chk"></div>
    <div class="uid">h.okamoto</div>
    <div class="name"><div>岡本 豊</div><div class="kana">おかもと ゆたか</div></div>
    <div>事務局 / 情報システム</div>
    <div><span class="tag orange">システム管理者</span></div>
    <div>06/26 11:05</div>
    <div><span class="status ok">有効</span></div>
    <div class="menu">⋯</div>
  </div>

  <!-- Row 7 (停止) -->
  <div class="row disabled">
    <div class="chk disabled"></div>
    <div class="uid disabled">s.matsuda</div>
    <div class="name disabled"><div>松田 朝子</div><div class="kana">2026/03 退職</div></div>
    <div>—</div>
    <div><span class="tag gray">担任</span></div>
    <div>2026/03/28</div>
    <div><span class="status stop">停止</span></div>
    <div class="menu">⋯</div>
  </div>

  <div class="footer-info">
    <div><strong>ロール権限</strong>: 担任 → 自クラスの学生・就活、就職指導部 → 全体閲覧と企業管理、校長/教務部長 → 報告閲覧のみ、システム管理者 → すべて</div>
    <div class="total">全 8 名</div>
  </div>

</div>
</body>
</html>
