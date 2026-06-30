<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 管理 職種マスタ</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./20-admin-job-types.css">
</head>

<body>
<div class="page-label">JMS / 管理 職種マスタ</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" data-screen-label="管理 職種マスタ">

  <div class="screen-title">
    職種マスタ <span>募集職種・志望職種で使われる選択肢</span>
  </div>

  <div class="app-frame">

    <!-- App chrome -->
    <div class="app-chrome">
      <div class="app-logo">JMS</div>
      <div class="app-sub">Job Hunting Management System</div>
      <div class="app-nav">
        <span>学生</span><span>企業</span><span>就職活動</span><span>活動状況報告</span>
        <span class="active">管理</span>
      </div>
      <div class="app-user">
        <span>システム管理者</span>
        <div class="user-icon">管</div>
      </div>
    </div>

    <!-- Sub nav -->
    <div class="sub-nav">
      <div>アカウント</div>
      <div class="active">職種マスタ</div>
      <div>地域マスタ</div>
      <div>システム設定</div>
      <div>処理ログ</div>
    </div>

    <!-- Page header -->
    <div class="page-header">
      <div>
        <div class="page-path">管理 / 職種マスタ</div>
        <div class="page-title">職種マスタ</div>
        <div class="page-desc">全 32 件。企業管理・学生管理・就活管理で選択肢として使用されます。</div>
      </div>
      <button class="btn-primary">＋ 職種を追加</button>
    </div>

    <!-- Body -->
    <div class="job-body">

      <!-- Left: categories -->
      <div class="job-categories">
        <div class="cat-label">大分類</div>
        <div class="cat-item active">IT / ソフトウェア <span>12</span></div>
        <div class="cat-item">製造 / ハードウェア <span>8</span></div>
        <div class="cat-item">通信 / インフラ <span>5</span></div>
        <div class="cat-item">事務 / 管理 <span>4</span></div>
        <div class="cat-item">その他 <span>3</span></div>
        <div class="cat-note">大分類ごとにグループ化して並べ替え可</div>
      </div>

      <!-- Right: job list -->
      <div class="job-list">

        <div class="job-header">
          <div>ID</div><div>職種名</div><div>使用件数</div><div>並び順</div><div></div>
        </div>

        <div class="job-row">
          <div>J-001</div><div>SE / プログラマ</div><div>42</div><div>1</div><div>⋯</div>
        </div>

        <div class="job-row alt">
          <div>J-002</div><div>Web 開発</div><div>28</div><div>2</div><div>⋯</div>
        </div>

        <div class="job-row">
          <div>J-003</div><div>インフラエンジニア</div><div>14</div><div>3</div><div>⋯</div>
        </div>

        <div class="job-row">
          <div>J-004</div><div>組込エンジニア</div><div>9</div><div>4</div><div>⋯</div>
        </div>

        <div class="job-row">
          <div>J-005</div><div>QA / テストエンジニア</div><div>6</div><div>5</div><div>⋯</div>
        </div>

        <div class="job-row">
          <div>J-006</div><div>インフラ / サーバー運用</div><div>5</div><div>6</div><div>⋯</div>
        </div>

        <div class="job-row">
          <div>J-007</div><div>Web デザイン</div><div>4</div><div>7</div><div>⋯</div>
        </div>

        <div class="job-footer">
          使用件数は「この職種を選択している企業/学生」の合計。使用中の職種は削除不可。
        </div>

      </div>
    </div>

  </div>
</div>
</body>
</html>
