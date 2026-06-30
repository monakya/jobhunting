<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>就職活動 閲覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./07-job-activity-view.css">
</head>

<body>

<div class="screen-frame">

  <!-- ▼ 学生プロフィール（DBから取得） -->
  <div class="profile">
    <div class="icon">{{ student.initial }}</div>
    <div class="name">{{ student.name }}</div>
    <div class="kana">{{ student.kana }}</div>

    <div class="info-grid">
      <div>クラス</div><div>{{ student.class }}</div>
      <div>学籍番号</div><div>{{ student.student_id }}</div>
      <div>性別</div><div>{{ student.gender }}</div>
      <div>在籍</div><div>{{ student.enrollment_status }}</div>
      <div>あっせん</div><div>{{ student.intro_status }}</div>
      <div>志望地域</div><div>{{ student.pref }}</div>
      <div>志望職種</div><div>{{ student.job_type }}</div>
    </div>

    <div class="highlight">
      内定承諾期限まで {{ student.remaining_days }} 日  
      <div>{{ student.offer_company }} / 期限 {{ student.offer_limit }}</div>
    </div>

    <div class="summary">
      <div>受験社数 {{ summary.total }}</div>
      <div>内定 {{ summary.ok }}</div>
      <div>活動中 {{ summary.active }}</div>
      <div>不合格 {{ summary.ng }}</div>
    </div>

    <div class="note">{{ student.note }}</div>
  </div>

  <!-- ▼ 選考タイムライン（DBから配列で取得） -->
  <div class="timeline">

    <h2>受験企業 / 選考タイムライン</h2>

    <!-- ▼ 企業ごとにループ -->
    {{#each companies}}
    <div class="company-block">

      <div class="company-header">
        <div class="company-name">{{ this.name }}</div>
        <div class="company-meta">{{ this.industry }} / {{ this.area }} / {{ this.intro_type }}</div>
        <div class="company-status">{{ this.current_status }}</div>
        {{#if this.offer_limit}}
          <div class="limit">承諾期限 {{ this.offer_limit }}</div>
        {{/if}}
      </div>

      <!-- ▼ 選考ステップをループ -->
      <div class="steps">
        {{#each this.steps}}
        <div class="step">
          <div class="step-name">{{ this.stage }}</div>
          <div class="step-date">{{ this.date }}</div>
          <div class="step-place">{{ this.place }}</div>
          <div class="step-result">{{ this.result }}</div>
          <div class="step-known">{{ this.known_date }}</div>
        </div>
        {{/each}}
      </div>

    </div>
    {{/each}}

  </div>

</div>

</body>
</html>
