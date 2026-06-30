<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 企業情報 登録</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./12-company-register.css">
</head>
<body>
<div class="page-label">JMS / 企業情報 登録</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:760px;" data-screen-label="企業情報 登録">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px 'BIZ UDPGothic';">
    企業情報 登録
  </div>

  <div style="background:#fff; border:1px solid #C7C0AF; border-radius:6px; overflow:hidden;">
    <!-- Header -->
    <div style="padding:18px 22px; border-bottom:1px solid #E2DED2; display:flex; align-items:center;">
      <div>
        <div style="font:500 11px 'Noto Sans JP'; color:#7B8294;">企業管理 / 新規登録</div>
        <div style="margin-top:4px; font:700 18px 'BIZ UDPGothic';">企業を登録</div>
      </div>
      <div style="flex:1;"></div>
      <div style="font:500 18px 'BIZ UDPGothic'; color:#9CA3B1;">×</div>
    </div>

    <div style="padding:22px;">

      <!-- 一時名義 -->
      <div style="padding:14px; background:#FCF6E8; border:1px solid #F5EBD7; border-radius:3px; display:flex; gap:12px;">
        <div style="flex:1;">
          <div style="font:700 12px 'BIZ UDPGothic'; color:#B07025;">一時名義として登録？</div>
        </div>
        <div style="display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px;">
          <div style="padding:6px 12px; color:#7B8294; font:700 11px 'BIZ UDPGothic';">一時名義</div>
          <div style="padding:6px 12px; background:#1B2030; color:#fff; border-radius:2px; font:700 11px 'BIZ UDPGothic';">正式登録</div>
        </div>
      </div>

      <!-- 企業情報 -->
      <div style="margin-top:18px; font:700 12px 'BIZ UDPGothic'; color:#7B8294;">企業情報</div>
      <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
        <div>
          <div style="font:700 12px 'BIZ UDPGothic';">正式名義 *</div>
          <div class="input-box">株式会社サクラテクノロジー</div>
        </div>
        <div>
          <div style="font:700 12px 'BIZ UDPGothic';">フリガナ *</div>
          <div class="input-box">サクラテクノロジー</div>
        </div>
        <div>
          <div style="font:700 12px 'BIZ UDPGothic';">業種 *</div>
          <div class="input-box">SI</div>
        </div>
        <div>
          <div style="font:700 12px 'BIZ UDPGothic';">設立</div>
          <div class="input-box">2012</div>
        </div>
        <div>
          <div style="font:700 12px 'BIZ UDPGothic';">資本金</div>
          <div class="input-box">5,000 万円</div>
        </div>
        <div>
          <div style="font:700 12px 'BIZ UDPGothic';">従業員数</div>
          <div class="input-box">85 名</div>
        </div>
      </div>

      <!-- 連絡先 -->
      <div style="margin-top:22px; font:700 12px 'BIZ UDPGothic'; color:#7B8294;">連絡先</div>
      <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
        <div>
          <div class="label">電話</div>
          <div class="input-box">092-XXX-7777</div>
        </div>
        <div>
          <div class="label">URL</div>
          <div class="input-box">sakuratech.example.jp</div>
        </div>
        <div style="grid-column:span 2;">
          <div class="label">住所</div>
          <div class="input-box">福岡市南区大横 1-1-1</div>
        </div>
        <div>
          <div class="label">担当者</div>
          <div class="input-box">人事部 小林 様</div>
        </div>
        <div>
          <div class="label">担当メール</div>
          <div class="input-box">kobayashi@sakuratech.example.jp</div>
        </div>
      </div>

      <!-- 募集職種 -->
      <div style="margin-top:22px; font:700 12px 'BIZ UDPGothic'; color:#7B8294;">募集職種</div>

      <div class="job-box">
        <div>
          <div class="label">職種</div>
          <div class="value">SE / プログラマ</div>
        </div>
        <div>
          <div class="label">人数</div>
          <div class="value">3 名</div>
        </div>
        <div>
          <div class="label">勤務地</div>
          <div class="value">福岡本社</div>
        </div>
        <div>
          <div class="label">初任給</div>
          <div class="value">21.5万</div>
        </div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div class="job-box">
        <div>
          <div class="label">職種</div>
          <div class="value">QA / テストエンジニア</div>
        </div>
        <div>
          <div class="label">人数</div>
          <div class="value">1 名</div>
        </div>
        <div>
          <div class="label">勤務地</div>
          <div class="value">福岡本社</div>
        </div>
        <div>
          <div class="label">初任給</div>
          <div class="value">20.5万</div>
        </div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <!-- 備考 -->
      <div style="margin-top:22px; font:700 12px 'BIZ UDPGothic'; color:#7B8294;">備考</div>
      <div class="notes-box">校内説明会参加予定。</div>

    </div>

    <!-- Footer -->
    <div style="padding:14px 22px; border-top:1px solid #E2DED2; background:#FBF9F3; display:flex; align-items:center;">
      <div style="font:500 11px 'Noto Sans JP'; color:#7B8294;">重複チェックあり</div>
      <div style="flex:1;"></div>
      <button class="cancel-btn">キャンセル</button>
      <button class="submit-btn">登録</button>
    </div>

  </div>
</div>

<style>
.input-box{
  margin-top:8px; padding:0 12px; height:36px;
  border:1px solid #C7C0AF; border-radius:3px;
  display:flex; align-items:center; font:500 13px 'Noto Sans JP';
}
.label{font:500 10px 'Noto Sans JP'; color:#7B8294;}
.value{margin-top:4px; font:700 12px 'BIZ UDPGothic';}
.job-box{
  margin-top:10px; padding:12px 14px; background:#FBF9F3;
  border:1px solid #E2DED2; border-radius:3px;
  display:grid; grid-template-columns:1.5fr 0.6fr 0.8fr 0.8fr 32px; gap:10px;
}
.notes-box{
  margin-top:8px; padding:10px 12px; border:1px solid #C7C0AF;
  border-radius:3px; min-height:64px; font:400 12px 'Noto Sans JP';
}
.cancel-btn, .submit-btn{
  height:36px; padding:0 16px; border-radius:3px; font:700 12px 'BIZ UDPGothic';
}
.cancel-btn{border:1px solid #C7C0AF; background:#fff;}
.submit-btn{border:1px solid #2C4A7A; background:#2C4A7A; color:#fff;}
</style>

</body>
</html>
