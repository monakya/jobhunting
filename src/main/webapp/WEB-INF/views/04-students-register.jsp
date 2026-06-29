
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
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    学生情報 登録（変更画面も同じレイアウト）
  </div>

  <div style="background:#fff; border:1px solid #C7C0AF; border-radius:6px; box-shadow:0 8px 32px rgba(20,25,45,.18); overflow:hidden;">
    <!-- Header -->
    <div style="padding:18px 22px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:12px;">
      <div>
        <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">学生管理 / 新規登録</div>
        <div style="margin-top:4px; font:700 18px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">学生を登録</div>
      </div>
      <div style="flex:1;"></div>
      <div style="font:500 18px/1 'BIZ UDPGothic', system-ui; color:#9CA3B1;">×</div>
    </div>

    <!-- Form body -->
    <div style="padding:22px;">

      <!-- セクション: 基本 -->
      <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">基本情報</div>
      <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">氏名<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui;">山田 太郎</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">フリガナ<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui; color:#1B2030;">ヤマダ タロウ</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">学籍番号<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace;">240029</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">クラス<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px;">
            <span style="font:500 13px/1 'BIZ UDPGothic', system-ui;">S2A1</span>
            <div style="flex:1;"></div>
            <span style="color:#7B8294;">▾</span>
          </div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">性別</div>
          <div style="margin-top:8px; display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px;">
            <div style="flex:1; padding:7px; text-align:center; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 'BIZ UDPGothic', system-ui;">男</div>
            <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">女</div>
            <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">回答なし</div>
          </div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">生年月日</div>
          <div style="margin-top:8px; display:flex; align-items:center; gap:8px; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px;">
            <span style="color:#7B8294;">▦</span>
            <span style="font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">2005/04/12</span>
          </div>
        </div>
      </div>

      <!-- セクション: 在籍 -->
      <div style="margin-top:22px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">在籍・あっせん</div>
        <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">在籍状況<span style="color:#A04B3C; margin-left:6px;">*</span></div>
            <div style="margin-top:8px; display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px;">
              <div style="flex:1; padding:7px; text-align:center; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 'BIZ UDPGothic', system-ui;">在籍中</div>
              <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">休学</div>
              <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">退学</div>
              <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">卒業</div>
            </div>
          </div>
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">あっせん状況<span style="color:#A04B3C; margin-left:6px;">*</span></div>
            <div style="margin-top:8px; display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px;">
              <div style="flex:1; padding:7px; text-align:center; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 'BIZ UDPGothic', system-ui;">継続中</div>
              <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">辞退</div>
            </div>
          </div>
        </div>
      </div>

      <!-- セクション: 志望 -->
      <div style="margin-top:22px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">就職希望</div>
        <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">志望地域</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px;">
              <span style="font:500 13px/1 'Noto Sans JP', system-ui;">福岡県内</span>
              <div style="flex:1;"></div>
              <span style="color:#7B8294;">▾</span>
            </div>
          </div>
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">志望職種</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px;">
              <span style="font:500 13px/1 'Noto Sans JP', system-ui;">SE / プログラマ</span>
              <div style="flex:1;"></div>
              <span style="color:#7B8294;">▾</span>
            </div>
          </div>
        </div>
      </div>

      <!-- セクション: 連絡先 -->
      <div style="margin-top:22px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">連絡先</div>
        <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">電話番号</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">090-1234-5678</div>
          </div>
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">メール</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">taro.y@joho.ac.jp</div>
          </div>
        </div>
        <div style="margin-top:14px;">
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">住所</div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui; color:#1B2030;">福岡市博多区博多駅前 1-1-1</div>
        </div>
      </div>

      <!-- セクション: 備考 -->
      <div style="margin-top:22px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">備考</div>
        <div style="margin-top:8px; padding:10px 12px; border:1px solid #C7C0AF; border-radius:3px; min-height:64px; font:400 12px/1.6 'Noto Sans JP', system-ui; color:#9CA3B1;">特記事項があれば入力（健康面の配慮、保護者連絡先など）</div>
      </div>

    </div>

    <!-- Footer -->
    <div style="padding:14px 22px; border-top:1px solid #E2DED2; background:#FBF9F3; display:flex; align-items:center; gap:8px;">
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">学籍番号は重複できません</div>
      <div style="flex:1;"></div>
      <button style="height:36px; padding:0 16px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">キャンセル</button>
      <button style="height:36px; padding:0 18px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">登録</button>
    </div>
  </div>
</div>
</body>
</html>