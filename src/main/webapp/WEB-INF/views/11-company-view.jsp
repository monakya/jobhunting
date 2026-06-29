
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 企業情報 閲覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./11-company-view.css">
</head>
<body>
<div class="page-label">JMS / 企業情報 閲覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1280px;" data-screen-label="企業情報 閲覧">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    企業情報 閲覧
  </div>

  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; box-shadow:0 2px 14px rgba(20,25,45,.08); overflow:hidden;">
    <div style="display:flex; align-items:center; gap:0; height:48px; background:#1B2030; color:#E2DED2; padding:0 20px;">
      <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em;">JMS</div>
      <div style="margin-left:18px; opacity:.55; font:500 12px/1 'Noto Sans JP', system-ui;">Job Hunting Management System</div>
      <div style="flex:1;"></div>
      <div style="display:flex; gap:18px; font:500 12px/1 'Noto Sans JP', system-ui; opacity:.85;">
        <span>学生</span><span style="color:#fff; border-bottom:2px solid #fff; padding-bottom:14px; margin-bottom:-14px;">企業</span><span>就職活動</span><span>活動状況報告</span><span>管理</span>
      </div>
      <div style="flex:1;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.75;">S2A1 担任</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#2C4A7A; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">中</div>
      </div>
    </div>

    <div style="padding:18px 28px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:14px;">
      <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
        <span style="cursor:pointer;">企業</span>　/　<span style="cursor:pointer;">一覧</span>　/　<span style="color:#1B2030; font-weight:700;">株式会社サンライズシステムズ</span>
      </div>
      <div style="flex:1;"></div>
      <button style="height:32px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; color:#A04B3C; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">削除</button>
      <button style="height:32px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">編集</button>
      <button style="height:32px; padding:0 16px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">受験者を見る →</button>
    </div>

    <div style="display:grid; grid-template-columns:340px 1fr;">
      <!-- Left -->
      <div style="padding:24px; border-right:1px solid #E2DED2; background:#FBF9F3;">
        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">正式名義</div>
        <div style="margin-top:6px; font:700 19px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社サンライズシステムズ</div>
        <div style="margin-top:3px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">さんらいずしすてむず</div>
        <div style="margin-top:12px; display:flex; gap:6px;">
          <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2F6E4F;"></span>募集中</span>
          <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">採用実績あり</span>
        </div>

        <div style="margin-top:18px; padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">企業情報</div>
          <div style="margin-top:10px; display:grid; grid-template-columns:90px 1fr; gap:8px 14px; font:500 12px/1.5 'Noto Sans JP', system-ui;">
            <div style="color:#7B8294;">企業 ID</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">C-00128</div>
            <div style="color:#7B8294;">業種</div><div style="color:#1B2030;">SI （システムインテグレーション）</div>
            <div style="color:#7B8294;">資本金</div><div style="color:#1B2030;">8,000 万円</div>
            <div style="color:#7B8294;">従業員数</div><div style="color:#1B2030;">132 名</div>
            <div style="color:#7B8294;">設立</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">2008</div>
          </div>
        </div>

        <div style="margin-top:14px; padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">連絡先</div>
          <div style="margin-top:10px; display:grid; grid-template-columns:90px 1fr; gap:8px 14px; font:500 12px/1.5 'Noto Sans JP', system-ui;">
            <div style="color:#7B8294;">住所</div><div style="color:#1B2030;">福岡市中央区天神 2-1-1</div>
            <div style="color:#7B8294;">電話</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">092-XXX-1234</div>
            <div style="color:#7B8294;">URL</div><div style="color:#2C4A7A; font-family:'JetBrains Mono', monospace;">sunrise-sys.example.jp</div>
            <div style="color:#7B8294;">担当</div><div style="color:#1B2030;">人事部 中野 様</div>
          </div>
        </div>
      </div>

      <!-- Right -->
      <div style="padding:24px 28px;">

        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">今年度 募集職種</div>
        <div style="margin-top:10px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
          <div style="padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
            <div style="display:flex; align-items:center; gap:8px;">
              <div style="font:700 14px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">SE / プログラマ</div>
              <div style="flex:1;"></div>
              <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">募集中</span>
            </div>
            <div style="margin-top:8px; display:grid; grid-template-columns:repeat(3, 1fr); gap:8px;">
              <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">募集人数</div><div style="margin-top:3px; font:500 16px/1 'JetBrains Mono', monospace; color:#1B2030;">5 名</div></div>
              <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">勤務地</div><div style="margin-top:3px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#1B2030;">福岡本社</div></div>
              <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">初任給</div><div style="margin-top:3px; font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">22.0万</div></div>
            </div>
          </div>
          <div style="padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
            <div style="display:flex; align-items:center; gap:8px;">
              <div style="font:700 14px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">インフラエンジニア</div>
              <div style="flex:1;"></div>
              <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">募集中</span>
            </div>
            <div style="margin-top:8px; display:grid; grid-template-columns:repeat(3, 1fr); gap:8px;">
              <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">募集人数</div><div style="margin-top:3px; font:500 16px/1 'JetBrains Mono', monospace; color:#1B2030;">2 名</div></div>
              <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">勤務地</div><div style="margin-top:3px; font:500 12px/1.3 'Noto Sans JP', system-ui; color:#1B2030;">福岡 / 東京</div></div>
              <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">初任給</div><div style="margin-top:3px; font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">23.5万</div></div>
            </div>
          </div>
        </div>

        <div style="margin-top:18px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">採用実績（直近 3 年）</div>
        <div style="margin-top:10px; padding:16px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="display:grid; grid-template-columns:repeat(4, 1fr); gap:12px;">
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">累計採用</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">12 名</div></div>
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">2025年度</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">4 名</div></div>
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">2024年度</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">4 名</div></div>
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">2023年度</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">4 名</div></div>
          </div>
        </div>

        <div style="margin-top:18px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">今年度 受験中の学生</div>
        <div style="margin-top:10px; background:#fff; border:1px solid #E2DED2; border-radius:3px; overflow:hidden;">
          <div style="display:grid; grid-template-columns:80px 1fr 120px 110px; padding:10px 14px; background:#EFEBE0; border-bottom:1px solid #E2DED2; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">
            <div>クラス</div><div>氏名</div><div>選考状況</div><div>最終更新</div>
          </div>
          <div style="display:grid; grid-template-columns:80px 1fr 120px 110px; padding:10px 14px; border-bottom:1px solid #EFECE3; align-items:center;">
            <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-01</div>
            <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">青木 真央</div>
            <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">2次面接</span></div>
            <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/28</div>
          </div>
          <div style="display:grid; grid-template-columns:80px 1fr 120px 110px; padding:10px 14px; align-items:center;">
            <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-11</div>
            <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">佐藤 美海</div>
            <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">書類選考</span></div>
            <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/25</div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>
</body>
</html>