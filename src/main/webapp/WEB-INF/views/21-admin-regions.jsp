
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 管理 地域マスタ</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./21-admin-regions.css">
</head>
<body>
<div class="page-label">JMS / 管理 地域マスタ</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1480px;" data-screen-label="管理 地域マスタ">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    地域マスタ　<span style="color:#7B8294; font-weight:500;">志望地域・企業所在地で使われる階層データ</span>
  </div>

  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; box-shadow:0 2px 14px rgba(20,25,45,.08); overflow:hidden;">

    <!-- App chrome -->
    <div style="display:flex; align-items:center; gap:0; height:48px; background:#1B2030; color:#E2DED2; padding:0 20px;">
      <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em;">JMS</div>
      <div style="margin-left:18px; opacity:.55; font:500 12px/1 'Noto Sans JP', system-ui;">Job Hunting Management System</div>
      <div style="flex:1;"></div>
      <div style="display:flex; gap:18px; font:500 12px/1 'Noto Sans JP', system-ui; opacity:.85;">
        <span>学生</span><span>企業</span><span>就職活動</span><span>活動状況報告</span><span style="color:#fff; border-bottom:2px solid #fff; padding-bottom:14px; margin-bottom:-14px;">管理</span>
      </div>
      <div style="flex:1;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.75;">システム管理者</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#B07025; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">管</div>
      </div>
    </div>

    <!-- Sub nav -->
    <div style="display:flex; align-items:center; gap:0; padding:0 28px; border-bottom:1px solid #E2DED2; background:#EFEBE0;">
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">アカウント</div>
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">職種マスタ</div>
      <div style="padding:14px 16px; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; border-bottom:2px solid #1B2030;">地域マスタ</div>
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">システム設定</div>
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">処理ログ</div>
    </div>

    <!-- Page header -->
    <div style="padding:22px 28px 14px 28px; border-bottom:1px solid #E2DED2;">
      <div style="display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">管理 / 地域マスタ</div>
          <div style="margin-top:6px; font:700 22px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">地域マスタ</div>
          <div style="margin-top:5px; font:400 11px/1.5 'Noto Sans JP', system-ui; color:#7B8294;">都道府県 → 市区町村の階層。学生の「志望地域」、企業の「所在地」で使用されます。</div>
        </div>
        <div style="flex:1;"></div>
        <button style="height:36px; padding:0 16px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">＋ 地域を追加</button>
      </div>
    </div>

    <!-- Tree-like 2-column display -->
    <div style="display:grid; grid-template-columns:280px 1fr;">
      <!-- 県 -->
      <div style="border-right:1px solid #E2DED2; background:#FBF9F3;">
        <div style="padding:14px 18px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">都道府県</div>
        <div style="padding:10px 18px; font:700 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030; background:#fff; border-left:3px solid #1B2030;">福岡県 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">12 市区</span></div>
        <div style="padding:10px 18px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">佐賀県 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">4 市区</span></div>
        <div style="padding:10px 18px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">長崎県 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">5 市区</span></div>
        <div style="padding:10px 18px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">熊本県 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">4 市区</span></div>
        <div style="padding:10px 18px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">大分県 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">3 市区</span></div>
        <div style="padding:10px 18px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">宮崎県 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">2 市区</span></div>
        <div style="padding:10px 18px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">鹿児島県 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">3 市区</span></div>
        <div style="padding:10px 18px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">その他 <span style="font:500 10px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:4px;">8</span></div>
        <div style="padding:14px 18px; border-top:1px solid #EFECE3; margin-top:8px; font:500 10px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">全 41 都道府県・185 市区を登録済</div>
      </div>

      <!-- 市区 -->
      <div>
        <div style="display:grid; grid-template-columns:80px 1fr 130px 130px 64px; padding:10px 22px; background:#EFEBE0; border-bottom:1px solid #E2DED2; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">
          <div>ID</div><div>市区町村名</div><div>志望者数</div><div>企業数</div><div></div>
        </div>

        <div style="display:grid; grid-template-columns:80px 1fr 130px 130px 64px; padding:10px 22px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">R-4011</div>
          <div>
            <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">福岡市中央区</div>
            <div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">ふくおかし ちゅうおうく</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">14</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">48</div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>
        <div style="display:grid; grid-template-columns:80px 1fr 130px 130px 64px; padding:10px 22px; border-bottom:1px solid #EFECE3; align-items:center; background:#FBF9F3;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">R-4012</div>
          <div>
            <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">福岡市博多区</div>
            <div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">ふくおかし はかたく</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">11</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">42</div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>
        <div style="display:grid; grid-template-columns:80px 1fr 130px 130px 64px; padding:10px 22px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">R-4013</div>
          <div>
            <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">福岡市東区</div>
            <div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">ふくおかし ひがしく</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">5</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">22</div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>
        <div style="display:grid; grid-template-columns:80px 1fr 130px 130px 64px; padding:10px 22px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">R-4014</div>
          <div>
            <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">北九州市</div>
            <div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">きたきゅーしゅーし</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">7</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">19</div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>
        <div style="display:grid; grid-template-columns:80px 1fr 130px 130px 64px; padding:10px 22px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">R-4015</div>
          <div>
            <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">久留米市</div>
            <div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">くるめし</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">2</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">8</div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>
        <div style="display:grid; grid-template-columns:80px 1fr 130px 130px 64px; padding:10px 22px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">R-4016</div>
          <div>
            <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">大野城市</div>
            <div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">おのじょーし</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">1</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">6</div>
          <div style="text-align:right; color:#7B8294;">⋯</div>
        </div>

        <div style="padding:14px 22px; background:#FBF9F3; border-top:1px solid #E2DED2; display:flex; align-items:center;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">「志望地域」は県・市区どちらの粒度も選択可能。</div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>