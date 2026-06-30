<!-- regions.html（短縮版） -->
<?php
require_once 'db.php';

// 都道府県一覧
$pref = $db->query("SELECT id, name, city_count FROM regions_pref ORDER BY sort");

// 選択中の都道府県（初期は福岡県）
$pref_id = $_GET['pref'] ?? 40;
$city = $db->prepare("SELECT id, name, kana, wish_count, company_count 
                      FROM regions_city 
                      WHERE pref_id = ?");
$city->execute([$pref_id]);
$city_list = $city->fetchAll();
?>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>地域マスタ</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
</head>
<body>

<div class="page-label">地域マスタ</div>

<div class="screen-frame">

  <!-- 左：都道府県 -->
  <div class="left-pane">
    <div class="pane-title">都道府県</div>
    <?php foreach($pref as $p): ?>
      <a class="pref-item <?= $p['id']==$pref_id?'active':'' ?>"
         href="?pref=<?= $p['id'] ?>">
        <?= htmlspecialchars($p['name']) ?>
        <span><?= $p['city_count'] ?> 市区</span>
      </a>
    <?php endforeach; ?>
  </div>

  <!-- 右：市区町村 -->
  <div class="right-pane">
    <table class="city-table">
      <thead>
        <tr><th>ID</th><th>市区町村名</th><th>志望者</th><th>企業数</th></tr>
      </thead>
      <tbody>
        <?php foreach($city_list as $c): ?>
        <tr>
          <td><?= $c['id'] ?></td>
          <td>
            <div class="city-name"><?= htmlspecialchars($c['name']) ?></div>
            <div class="city-kana"><?= htmlspecialchars($c['kana']) ?></div>
          </td>
          <td><?= $c['wish_count'] ?></td>
          <td><?= $c['company_count'] ?></td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>

</div>
</body>
</html>
