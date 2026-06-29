
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 就職活動 登録</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./08-job-activity-register.css">
</head>
<body>
<div class="page-label">JMS / 就職活動 登録</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:760px;" data-screen-label="就職活動 登録">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    登録 — 受験情報を追加
  </div>

  <div style="background:#fff; border:1px solid #C7C0AF; border-radius:6px; box-shadow:0 8px 32px rgba(20,25,45,.18); overflow:hidden;">
    <!-- Header -->
    <div style="padding:18px 22px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:12px;">
      <div>
        <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">就職活動 / 新規登録</div>
        <div style="margin-top:4px; font:700 18px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">受験情報を追加</div>
      </div>
      <div style="flex:1;"></div>
      <div style="font:500 18px/1 'BIZ UDPGothic', system-ui; color:#9CA3B1;">×</div>
    </div>

    <!-- Form body -->
    <div style="padding:22px;">

      <!-- 学生 -->
      <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">学生</div>
      <div style="margin-top:8px; padding:10px 14px; border:1px solid #E2DED2; border-radius:3px; background:#FBF9F3; display:flex; align-items:center; gap:10px;">
        <div style="width:30px; height:30px; border-radius:99px; background:#F5EBD7; color:#B07025; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">古</div>
        <div>
          <div style="font:700 13px/1.2 'BIZ UDPGothic', system-ui;">古川 拓実</div>
          <div style="margin-top:2px; font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294;">S2A1-21 / 240021</div>
        </div>
        <div style="flex:1;"></div>
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#2C4A7A; cursor:pointer;">変更</span>
      </div>

      <!-- 企業 -->
      <div style="margin-top:18px; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">企業<span style="color:#A04B3C; margin-left:6px;">*</span></div>
      <div style="margin-top:8px; position:relative;">
        <div style="display:flex; align-items:center; gap:8px; height:38px; padding:0 12px; border:1px solid #2C4A7A; border-radius:3px; background:#fff;">
          <span style="color:#7B8294;">⌕</span>
          <span style="font:500 13px/1 'Noto Sans JP', system-ui; color:#1B2030;">サン</span>
          <span style="background:#E8EDF5; padding:0 2px;">ライズ</span>
        </div>
        <!-- dropdown -->
        <div style="position:absolute; top:42px; left:0; right:0; background:#fff; border:1px solid #C7C0AF; border-radius:3px; box-shadow:0 6px 20px rgba(0,0,0,.12); overflow:hidden; z-index:2;">
          <div style="padding:8px 12px; background:#E8EDF5;">
            <div style="font:700 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社サンライズシステムズ</div>
            <div style="margin-top:3px; font:400 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">SI ・ 福岡市中央区 ・ 採用実績 12 名</div>
          </div>
          <div style="padding:8px 12px; border-top:1px solid #EFECE3;">
            <div style="font:700 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">サンライズ電子工業</div>
            <div style="margin-top:3px; font:400 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">製造 ・ 北九州市</div>
          </div>
          <div style="padding:8px 12px; border-top:1px solid #EFECE3; background:#FBF9F3;">
            <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#2C4A7A;">＋ 新規企業として登録</div>
          </div>
        </div>
      </div>
      <div style="margin-top:6px; font:400 10px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">半角/全角・カナ・部分一致で検索。同一企業の重複登録を防ぎます。</div>

      <!-- 紹介区分・選考状況 row -->
      <div style="margin-top:64px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">紹介区分<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px; background:#FBF9F3;">
            <div style="flex:1; padding:7px; text-align:center; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 'BIZ UDPGothic', system-ui;">学校紹介</div>
            <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">自己開拓</div>
            <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">縁故</div>
          </div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">選考状況<span style="color:#A04B3C; margin-left:6px;">*</span></div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px;">
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:5px;height:5px;border-radius:99px;background:#2C4A7A;"></span>1次面接</span>
            <div style="flex:1;"></div>
            <span style="color:#7B8294;">▾</span>
          </div>
        </div>
      </div>

      <!-- 日時 場所 -->
      <div style="margin-top:14px; display:grid; grid-template-columns:1.2fr 1fr 1fr; gap:14px;">
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">日時</div>
          <div style="margin-top:8px; display:flex; align-items:center; gap:8px; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px;">
            <span style="color:#7B8294;">▦</span>
            <span style="font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">2026/07/05 (土)</span>
            <span style="color:#9CA3B1;">|</span>
            <span style="font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">13:00</span>
          </div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">場所</div>
          <div style="margin-top:8px; display:flex; align-items:center; height:36px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 13px/1 'Noto Sans JP', system-ui; color:#1B2030;">本社・対面</div>
        </div>
        <div>
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">最終かどうか</div>
          <div style="margin-top:8px; display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px;">
            <div style="flex:1; padding:7px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">○ 最終</div>
            <div style="flex:1; padding:7px; text-align:center; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 'BIZ UDPGothic', system-ui;">× 最終でない</div>
          </div>
        </div>
      </div>

      <!-- 結果 -->
      <div style="margin-top:18px; padding-top:18px; border-top:1px dashed #E2DED2;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">結果（受験後に入力）</div>
        <div style="margin-top:10px; display:grid; grid-template-columns:1fr 1fr 1fr; gap:14px;">
          <div>
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">結果</div>
            <div style="margin-top:6px; display:flex; gap:4px;">
              <div style="padding:6px 10px; border-radius:3px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">通過</div>
              <div style="padding:6px 10px; border-radius:3px; background:#FBF9F3; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">内定</div>
              <div style="padding:6px 10px; border-radius:3px; background:#FBF9F3; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">不合格</div>
              <div style="padding:6px 10px; border-radius:3px; background:#FBF9F3; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">未判明</div>
            </div>
          </div>
          <div>
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">結果判明日</div>
            <div style="margin-top:6px; display:flex; align-items:center; gap:8px; height:34px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">YYYY/MM/DD</div>
          </div>
          <div>
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">承諾期限</div>
            <div style="margin-top:6px; display:flex; align-items:center; gap:8px; height:34px; padding:0 12px; border:1px solid #C7C0AF; border-radius:3px; font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">YYYY/MM/DD</div>
          </div>
        </div>
      </div>

      <!-- 備考 -->
      <div style="margin-top:18px;">
        <div style="font:700 12px/1 'BIZ UDPGothic', system-ui;">備考</div>
        <div style="margin-top:8px; padding:10px 12px; border:1px solid #C7C0AF; border-radius:3px; min-height:64px; font:400 12px/1.6 'Noto Sans JP', system-ui; color:#9CA3B1;">服装自由。技術試問あり。</div>
      </div>

    </div>

    <!-- Footer -->
    <div style="padding:14px 22px; border-top:1px solid #E2DED2; background:#FBF9F3; display:flex; align-items:center; gap:8px;">
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">必須項目を入力すると保存できます</div>
      <div style="flex:1;"></div>
      <button style="height:36px; padding:0 16px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">キャンセル</button>
      <button style="height:36px; padding:0 18px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">登録</button>
    </div>
  </div>
</div>
</body>
</html>