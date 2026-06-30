<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 学生情報 登録</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./04-students-register.css">
</head>
<body>

<div class="page-label">JMS / 学生情報 登録</div>
<a class="back-link" href="../index.html">← 画面一覧</a>

<div class="screen-frame" style="width:760px;" data-screen-label="学生情報 登録">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px 'BIZ UDPGothic'; color:#1B2030;">
    学生情報 登録（変更画面も同じレイアウト）
  </div>

  <div style="background:#fff; border:1px solid #C7C0AF; border-radius:6px; box-shadow:0 8px 32px rgba(20,25,45,.18); overflow:hidden;">

    <!-- Header -->
    <div style="padding:18px 22px; border-bottom:1px solid #E2DED2; display:flex; align-items:center;">
      <div>
        <div style="font:500 11px 'Noto Sans JP'; color:#7B8294;">学生管理 / 新規登録</div>
        <div style="margin-top:4px; font:700 18px 'BIZ UDPGothic'; color:#1B2030;">学生を登録</div>
      </div>
      <div style="flex:1;"></div>
      <div style="font:500 18px 'BIZ UDPGothic'; color:#9CA3B1;">×</div>
    </div>

    <!-- Form body -->
    <div style="padding:22px;">

      <!-- 基本情報 -->
      <div class="section-title">基本情報</div>
      <div class="form-grid">

        <!-- 氏名 -->
        <div>
          <label class="form-label">氏名<span class="required">*</span></label>
          <input id="input-name" type="text" class="form-input">
        </div>

        <!-- フリガナ -->
        <div>
          <label class="form-label">フリガナ<span class="required">*</span></label>
          <input id="input-kana" type="text" class="form-input">
        </div>

        <!-- 学籍番号 -->
        <div>
          <label class="form-label">学籍番号<span class="required">*</span></label>
          <input id="input-student-id" type="text" class="form-input">
        </div>

        <!-- クラス -->
        <div>
          <label class="form-label">クラス<span class="required">*</span></label>
          <div class="form-select">
            <span id="input-class-display"></span>
            <div style="flex:1;"></div>
            <span>▾</span>
          </div>
        </div>

        <!-- 性別 -->
        <div>
          <label class="form-label">性別</label>
          <div class="form-radio-group">
            <div class="radio-option selected" data-value="男">男</div>
            <div class="radio-option" data-value="女">女</div>
            <div class="radio-option" data-value="回答なし">回答なし</div>
          </div>
        </div>

        <!-- 生年月日 -->
        <div>
          <label class="form-label">生年月日</label>
          <div class="form-date">
            <span>▦</span>
            <input id="input-birthday" type="date" class="date-input">
          </div>
        </div>

      </div>

      <!-- 在籍・あっせん -->
      <div class="section-divider"></div>
      <div class="section-title">在籍・あっせん</div>

      <div class="form-grid">

        <!-- 在籍状況 -->
        <div>
          <label class="form-label">在籍状況<span class="required">*</span></label>
          <div class="form-radio-group">
            <div class="radio-option selected" data-value="在籍中">在籍中</div>
            <div class="radio-option" data-value="休学">休学</div>
            <div class="radio-option" data-value="退学">退学</div>
            <div class="radio-option" data-value="卒業">卒業</div>
          </div>
        </div>

        <!-- あっせん状況 -->
        <div>
          <label class="form-label">あっせん状況<span class="required">*</span></label>
          <div class="form-radio-group">
            <div class="radio-option selected" data-value="継続中">継続中</div>
            <div class="radio-option" data-value="辞退">辞退</div>
          </div>
        </div>

      </div>

      <!-- 就職希望 -->
      <div class="section-divider"></div>
      <div class="section-title">就職希望</div>

      <div class="form-grid">

        <!-- 志望地域 -->
        <div>
          <label class="form-label">志望地域</label>
          <div class="form-select">
            <span id="input-wish-area-display"></span>
            <div style="flex:1;"></div>
            <span>▾</span>
          </div>
        </div>

        <!-- 志望職種 -->
        <div>
          <label class="form-label">志望職種</label>
          <div class="form-select">
            <span id="input-wish-job-display"></span>
            <div style="flex:1;"></div>
            <span>▾</span>
          </div>
        </div>

      </div>

      <!-- 連絡先 -->
      <div class="section-divider"></div>
      <div class="section-title">連絡先</div>

      <div class="form-grid">

        <!-- 電話番号 -->
        <div>
          <label class="form-label">電話番号</label>
          <input id="input-phone" type="text" class="form-input">
        </div>

        <!-- メール -->
        <div>
          <label class="form-label">メール</label>
          <input id="input-email" type="text" class="form-input">
        </div>

      </div>

      <!-- 住所 -->
      <div style="margin-top:14px;">
        <label class="form-label">住所</label>
        <input id="input-address" type="text" class="form-input">
      </div>

      <!-- 備考 -->
      <div class="section-divider"></div>
      <div class="section-title">備考</div>

      <textarea id="input-note" class="form-textarea" placeholder="特記事項があれば入力（健康面の配慮、保護者連絡先など）"></textarea>

    </div>

    <!-- Footer -->
    <div class="form-footer">
      <div class="footer-note">学籍番号は重複できません</div>
      <div style="flex:1;"></div>
      <button class="btn">キャンセル</button>
      <button class="btn-primary">登録</button>
    </div>

  </div>
</div>

</body>
</html>
