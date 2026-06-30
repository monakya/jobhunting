<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 活動状況報告 ダッシュボード</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./14-activity-dashboard.css">
</head>

<body>
<div class="page-label">JMS / 活動状況報告 ダッシュボード</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" data-screen-label="活動状況報告 ダッシュボード">

  <!-- Header -->
  <div class="app-header">
    <div class="app-title">JMS</div>
    <div class="app-sub">Job Hunting Management System</div>
    <div class="app-nav">
      <span>学生</span><span>企業</span><span>就職活動</span>
      <span class="active">活動状況報告</span><span>管理</span>
    </div>
    <div class="app-user">
      <span>就職指導部 山田</span>
      <div class="user-icon">山</div>
    </div>
  </div>

  <!-- Filters -->
  <div class="page-header">
    <div>
      <div class="page-label-small">活動状況報告</div>
      <div class="page-title">
        <span>2026 年度 就職活動 概況</span>
        <span class="timestamp">as of 2026/06/26 19:00</span>
      </div>
    </div>

    <div class="filters">
      <div class="filter"><span>学科</span><span class="value">情報システム科</span></div>
      <div class="filter"><span>学年</span><span class="value">2 年</span></div>
      <div class="filter"><span>クラス</span><span class="value">すべて (2)</span></div>
      <div class="filter"><span>比較</span><span class="value">前年同期</span></div>
    </div>
  </div>

  <!-- KPI Row -->
  <div class="kpi-row">

    <div class="kpi kpi-hero">
      <div class="kpi-title">内定率</div>
      <div class="kpi-main"><span class="num">62.5</span><span class="unit">%</span><span class="diff">▲ +8.3pt</span></div>
      <div class="kpi-bar"><div style="width:62.5%"></div></div>
      <div class="kpi-note">前年同期比 +8.3pt。9 月目標 80% に対し 17.5pt 不足。</div>
    </div>

    <div class="kpi">
      <div class="kpi-title">内定者</div>
      <div class="kpi-main"><span class="num green">25</span><span class="unit">名 / 40 名</span></div>
      <div class="kpi-note">承諾 14 名 ・ 未承諾 11 名</div>
      <div class="kpi-note">前年同期 21 名（+4）</div>
    </div>

    <div class="kpi kpi-warn">
      <div class="kpi-title">未内定 / 要フォロー</div>
      <div class="kpi-main"><span class="num warn">12</span><span class="unit">名</span></div>
      <div class="kpi-note">活動中 8 ・ 初期 3 ・ 未活動 1</div>
      <div class="kpi-note warn">未活動 1 名：6/30 までに面談</div>
    </div>

    <div class="kpi">
      <div class="kpi-title">活動量</div>
      <div class="kpi-main"><span class="num">3.4</span><span class="unit">社 / 学生平均</span></div>
      <div class="kpi-note">受験延べ 136 社 ・ 内定企業 32 社</div>
      <div class="kpi-note">学校紹介 71% / 自己開拓 24% / 縁故 5%</div>
    </div>

  </div>

  <!-- Charts Row -->
  <div class="charts-row">

    <!-- Class Progress -->
    <div class="chart-box">
      <div class="chart-header">
        <span class="chart-title">クラス別 進捗</span>
        <div class="legend">
          <span class="lg lg-ok">承諾</span>
          <span class="lg lg-naitei">内定</span>
          <span class="lg lg-senkou">選考中</span>
          <span class="lg lg-shoki">初期</span>
          <span class="lg lg-mikadou">未活動</span>
        </div>
      </div>

      <div class="class-progress">
        <div class="class-row">
          <div class="class-name">S2A1 <span class="small">20 名</span></div>
          <div class="bar">
            <div class="ok">7</div><div class="naitei">5</div>
            <div class="senkou">6</div><div class="shoki">1</div><div class="mikadou">1</div>
          </div>
          <div class="rate">60.0%</div>
        </div>

        <div class="class-row">
          <div class="class-name">S2A2 <span class="small">20 名</span></div>
          <div class="bar">
            <div class="ok">7</div><div class="naitei">6</div>
            <div class="senkou">5</div><div class="shoki">2</div>
          </div>
          <div class="rate">65.0%</div>
        </div>
      </div>

      <div class="chart-note">
        数字は人数。右端は<strong>内定率（承諾含む）</strong>。S2A2 がわずかに先行。
      </div>
    </div>

    <!-- Weekly Naitei -->
    <div class="chart-box">
      <div class="chart-header">
        <span class="chart-title">週別 内定者数</span>
        <span class="chart-sub">週ごとの新規内定</span>
      </div>

      <div class="weekly-bars">
        <div class="bar-col"><span>2</span><div class="bar h25"></div></div>
        <div class="bar-col"><span>1</span><div class="bar h12"></div></div>
        <div class="bar-col"><span>3</span><div class="bar h37"></div></div>
        <div class="bar-col"><span>5</span><div class="bar h62 blue"></div></div>
        <div class="bar-col"><span>4</span><div class="bar h50 blue"></div></div>
        <div class="bar-col"><span>6</span><div class="bar h75 blue"></div></div>
        <div class="bar-col"><span>8</span><div class="bar h100 blue"></div></div>
        <div class="bar-col"><span class="warn">4</span><div class="bar h50 warn"></div></div>
      </div>

      <div class="weekly-labels">
        <span>5/4週</span><span>5/5週</span><span>6/1週</span><span>6/2週</span>
        <span>6/3週</span><span>6/4週</span><span>6/5週</span><span class="warn">6/6週</span>
      </div>

      <div class="chart-note-row">
        <span>直近 8 週計 <strong>33 名</strong></span>
        <span>ピーク週 <strong>6/5 週 (8 名)</strong></span>
        <span>週平均 <strong>4.1 名</strong></span>
      </div>
    </div>

  </div>

  <!-- Follow + Recent Naitei -->
  <div class="bottom-row">

    <!-- Follow -->
    <div class="follow-box">
      <div class="follow-header">
        <span class="title">要フォロー学生</span>
        <span class="sub">未活動 / 不合格続き / 承諾期限間近</span>
        <span class="count">12 名</span>
      </div>

      <div class="follow-table-head">
        <span>クラス</span><span>学籍</span><span>氏名 / 状況</span><span>受験社数</span><span>状態</span>
      </div>

      <div class="follow-row">
        <span>S2A1-25</span><span>240025</span>
        <span>山口 ひかり / 受験記録なし</span><span class="warn">0 社</span>
        <span class="tag tag-mikadou">未活動</span>
      </div>

      <div class="follow-row">
        <span>S2A2-04</span><span>240104</span>
        <span>井上 直樹 / 5 社連続 書類落ち</span><span>5 社</span>
        <span class="tag tag-ng">不合格続</span>
      </div>

      <div class="follow-row">
        <span>S2A1-21</span><span>240021</span>
        <span>古川 拓実 / 承諾期限 残 2 日</span><span>5 社</span>
        <span class="tag tag-deadline">承諾期限</span>
      </div>

      <div class="follow-row">
        <span>S2A1-09</span><span>240209</span>
        <span>河野 みお / 最終後 2 週間結果未連絡</span><span>3 社</span>
        <span class="tag tag-wait">結果待</span>
      </div>

      <div class="follow-row">
        <span>S2A1-12</span><span>240412</span>
        <span>藤井 拓海 / 活動開始遅め (5月～)</span><span>2 社</span>
        <span class="tag tag-shoki">初期段階</span>
      </div>

      <div class="follow-more">残り 7 名を表示 →</div>
    </div>

    <!-- Recent Naitei -->
    <div class="naitei-box">
      <div class="naitei-header">
        <span class="title">直近の内定</span>
        <span class="count">今週 4 件</span>
      </div>

      <div class="naitei-item">
        <div class="naitei-status tag-naitei">内定</div><span class="date">06/24</span>
        <div class="name">大野 葵 <span class="id">S2A1-05</span></div>
        <div class="company">株式会社ミライウェイ ・ Web</div>
      </div>

      <div class="naitei-item">
        <div class="naitei-status tag-ok">承諾</div><span class="date">06/22</span>
        <div class="name">高山 葉月 <span class="id">S2A2-16</span></div>
        <div class="company">九州ITサポート ・ SI</div>
      </div>

      <div class="naitei-item">
        <div class="naitei-status tag-naitei">内定</div><span class="date">06/21</span>
        <div class="name">中原 怜 <span class="id">S2A2-22</span></div>
        <div class="company">福岡電子工業 ・ 製造</div>
      </div>

      <div class="naitei-item">
        <div class="naitei-status tag-naitei">内定</div><span class="date">06/19</span>
        <div class="name">古川 拓実 <span class="id">S2A1-21</span></div>
        <div class="company">株式会社オーロラ ・ Web</div>
      </div>

    </div>
  </div>

</div>
</body>
</html>
