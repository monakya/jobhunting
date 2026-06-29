
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
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    企業情報 登録（変更画面も同じレイアウト）
  </div>

  <div style="background:#fff; border:1px solid #C7C0AF; border-radius:6px; box-shadow:0 8px 32px rgba(20,25,45,.18); overflow:hidden;">
    <div style="padding:18px 22px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:12px;">
      <div>
        <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">企業管理 / 新規登録</div>
        <div style="margin-top:4px; font:700 18px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">企業を登録</div>
      </div>
      <div style="flex:1;"></div>
      <div style="font:500 18px/1 'BIZ UDPGothic', system-ui; color:#9CA3B1;">×</div>
    </div>

    <div style="padding:22px;">
      <!-- 一時名義トグル -->
      <div style="padding:14px; background:#FCF6E8; border:1px solid #F5EBD7; border-radius:3px; display:flex; align-items:center; gap:12px;">
        <div style="flex:1;">
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#B07025;">一時名義として登録しますか？</div>
          <div style="margin-top:5px; font:500 11px/1.5 'Noto Sans JP', system-ui; color:#4B5263;">正式名未確認の企業として記録され、一覧で警告表示されます。</div>
        </div>
        <div style="display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px; background:#fff;">
          <div style="padding:6px 12px; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">一時名義</div>
          <div style="padding:6px 12px; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 'BIZ UDPGothic', system-ui;">正式登録</div>
        </div>
      </div>

      <div style="margin-top:18px; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">企業情報</div>
      <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">正式名義<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui;">株式会社サクラテクノロジー</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">フリガナ<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui;">サクラテクノロジー</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">業種<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px;">
            <span style="font:500 13px/1 'Noto Sans JP', system-ui;">SI</span>
            <div style="flex:1;"></div>
            <span style="color:#7B8294;">▾</span>
          </div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">設立</div>
          <div style="margin-top:8px; display:flex; align-items:center; gap:8px; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">2012</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">資本金</div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui;">5,000 万円</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">従業員数</div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">85 名</div>
        </div>
      </div>

      <div style="margin-top:22px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">連絡先</div>
        <div style="margin-top:12px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">電話</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">092-XXX-7777</div>
          </div>
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">URL</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">sakuratech.example.jp</div>
          </div>
          <div style="grid-column:span 2;">
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">住所</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui; color:#1B2030;">福岡市南区大横 1-1-1</div>
          </div>
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">担当者</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui;">人事部 小林 様</div>
          </div>
          <div>
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">担当メール</div>
            <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">kobayashi@sakuratech.example.jp</div>
          </div>
        </div>
      </div>

      <div style="margin-top:22px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="display:flex; align-items:center; gap:10px;">
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">募集職種</div>
          <div style="flex:1;"></div>
          <button style="height:28px; padding:0 12px; border:1px dashed #C7C0AF; background:transparent; color:#7B8294; border-radius:3px; font:700 10px/1 'BIZ UDPGothic', system-ui;">＋ 職種を追加</button>
        </div>

        <div style="margin-top:10px; padding:12px 14px; background:#FBF9F3; border:1px solid #E2DED2; border-radius:3px; display:grid; grid-template-columns:1.5fr 0.6fr 0.8fr 0.8fr 32px; gap:10px; align-items:center;">
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">職種</div>
            <div style="margin-top:4px; font:700 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">SE / プログラマ</div>
          </div>
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">募集人数</div>
            <div style="margin-top:4px; font:500 14px/1 'JetBrains Mono', monospace; color:#1B2030;">3 名</div>
          </div>
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">勤務地</div>
            <div style="margin-top:4px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#1B2030;">福岡本社</div>
          </div>
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">初任給</div>
            <div style="margin-top:4px; font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">21.5万</div>
          </div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>

        <div style="margin-top:8px; padding:12px 14px; background:#FBF9F3; border:1px solid #E2DED2; border-radius:3px; display:grid; grid-template-columns:1.5fr 0.6fr 0.8fr 0.8fr 32px; gap:10px; align-items:center;">
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">職種</div>
            <div style="margin-top:4px; font:700 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">QA / テストエンジニア</div>
          </div>
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">募集人数</div>
            <div style="margin-top:4px; font:500 14px/1 'JetBrains Mono', monospace; color:#1B2030;">1 名</div>
          </div>
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">勤務地</div>
            <div style="margin-top:4px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#1B2030;">福岡本社</div>
          </div>
          <div>
            <div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">初任給</div>
            <div style="margin-top:4px; font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">20.5万</div>
          </div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>
      </div>

      <div style="margin-top:22px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">備考</div>
        <div style="margin-top:8px; padding:10px 12px; border:1px solid #C7C0AF; border-radius:3px; min-height:64px; font:400 12px/1.6 'Noto Sans JP', system-ui; color:#9CA3B1;">校内説明会参加予定。2024年度は当校から 2 名採用。</div>
      </div>
    </div>

    <div style="padding:14px 22px; border-top:1px solid #E2DED2; background:#FBF9F3; display:flex; align-items:center; gap:8px;">
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">正式名義・フリガナで同一企業の重複をチェックします</div>
      <div style="flex:1;"></div>
      <button style="height:36px; padding:0 16px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">キャンセル</button>
      <button style="height:36px; padding:0 18px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">登録</button>
    </div>
  </div>
</div>
</body>
</html>