<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>企業情報 閲覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
</head>

<body>
<div class="page-label">企業情報 閲覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:900px;">

  <!-- 企業名 -->
  <h2>{CompanyName}</h2>
  <div>{CompanyKana}</div>

  <!-- 状態 -->
  <div>
    <span>{RecruitStatus}</span>
    <span>{HasRecord}</span>
  </div>

  <!-- 企業情報 -->
  <section>
    <h3>企業情報</h3>
    <table>
      <tr><th>企業ID</th><td>{CompanyID}</td></tr>
      <tr><th>業種</th><td>{Industry}</td></tr>
      <tr><th>資本金</th><td>{Capital}</td></tr>
      <tr><th>従業員数</th><td>{Employees}</td></tr>
      <tr><th>設立</th><td>{FoundedYear}</td></tr>
    </table>
  </section>

  <!-- 連絡先 -->
  <section>
    <h3>連絡先</h3>
    <table>
      <tr><th>住所</th><td>{Address}</td></tr>
      <tr><th>電話</th><td>{Phone}</td></tr>
      <tr><th>URL</th><td>{Url}</td></tr>
      <tr><th>担当</th><td>{ContactPerson}</td></tr>
    </table>
  </section>

  <!-- 募集職種 -->
  <section>
    <h3>今年度 募集職種</h3>

    <!-- ループ：募集職種 -->
    <!-- for each job in Jobs -->
    <div class="job-box">
      <h4>{JobName}</h4>
      <table>
        <tr><th>募集人数</th><td>{RecruitCount}</td></tr>
        <tr><th>勤務地</th><td>{Location}</td></tr>
        <tr><th>初任給</th><td>{Salary}</td></tr>
      </table>
    </div>
    <!-- end loop -->

  </section>

  <!-- 採用実績 -->
  <section>
    <h3>採用実績（直近3年）</h3>
    <table>
      <tr><th>累計採用</th><td>{TotalHire}</td></tr>
      <tr><th>2025年度</th><td>{Hire2025}</td></tr>
      <tr><th>2024年度</th><td>{Hire2024}</td></tr>
      <tr><th>2023年度</th><td>{Hire2023}</td></tr>
    </table>
  </section>

  <!-- 受験中の学生 -->
  <section>
    <h3>今年度 受験中の学生</h3>
    <table>
      <tr>
        <th>クラス</th>
        <th>氏名</th>
        <th>選考状況</th>
        <th>最終更新</th>
      </tr>

      <!-- ループ：受験者 -->
      <!-- for each student in Students -->
      <tr>
        <td>{StudentClass}</td>
        <td>{StudentName}</td>
        <td>{StudentStatus}</td>
        <td>{UpdatedAt}</td>
      </tr>
      <!-- end loop -->

    </table>
  </section>

</div>
</body>
</html>
