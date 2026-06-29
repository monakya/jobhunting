
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 学生情報 閲覧（古川 拓実）</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./03-students-view.css">
</head>
<body>
<div class="page-label">JMS / 学生情報 閲覧（古川 拓実）</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1280px;" data-screen-label="学生情報 閲覧（古川 拓実）">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    学生情報 閲覧
  </div>

  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; box-shadow:0 2px 14px rgba(20,25,45,.08); overflow:hidden;">

    <!-- App chrome -->
    <div style="display:flex; align-items:center; gap:0; height:48px; background:#1B2030; color:#E2DED2; padding:0 20px;">
      <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em;">JMS</div>
      <div style="margin-left:18px; opacity:.55; font:500 12px/1 'Noto Sans JP', system-ui;">Job Hunting Management System</div>
      <div style="flex:1;"></div>
      <div style="display:flex; gap:18px; font:500 12px/1 'Noto Sans JP', system-ui; opacity:.85;">
        <span style="color:#fff; border-bottom:2px solid #fff; padding-bottom:14px; margin-bottom:-14px;">学生</span><span>企業</span><span>就職活動</span><span>活動状況報告</span><span>管理</span>
      </div>
      <div style="flex:1;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.75;">S2A1 担任</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#2C4A7A; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">中</div>
      </div>
    </div>

    <!-- breadcrumb -->
    <div style="padding:18px 28px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:14px;">
      <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
        <span style="cursor:pointer;">学生</span>　/　<span style="cursor:pointer;">S2A1 一覧</span>　/　<span style="color:#1B2030; font-weight:700;">古川 拓実</span>
      </div>
      <div style="flex:1;"></div>
      <button style="height:32px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; color:#A04B3C; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">削除</button>
      <button style="height:32px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">編集</button>
      <button style="height:32px; padding:0 16px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">就職活動を見る →</button>
    </div>

    <!-- Body -->
    <div style="display:grid; grid-template-columns:340px 1fr;">

      <!-- Left profile -->
      <div style="padding:24px; border-right:1px solid #E2DED2; background:#FBF9F3;">
        <div style="display:flex; align-items:center; gap:14px;">
          <div style="width:56px; height:56px; border-radius:99px; background:#F5EBD7; color:#B07025; display:flex; align-items:center; justify-content:center; font:700 22px/1 'BIZ UDPGothic', system-ui;">古</div>
          <div>
            <div style="font:700 18px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">古川 拓実</div>
            <div style="margin-top:3px; font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">ふるかわ たくみ</div>
          </div>
        </div>

        <div style="margin-top:16px; display:flex; gap:6px;">
          <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2F6E4F;"></span>在籍中</span>
          <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">あっせん継続</span>
        </div>

        <div style="margin-top:18px; padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">基本情報</div>
          <div style="margin-top:10px; display:grid; grid-template-columns:90px 1fr; gap:8px 14px; font:500 12px/1.5 'Noto Sans JP', system-ui;">
            <div style="color:#7B8294;">クラス</div><div style="color:#1B2030; font-weight:700;">S2A1-21</div>
            <div style="color:#7B8294;">学籍番号</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">240021</div>
            <div style="color:#7B8294;">性別</div><div style="color:#1B2030;">男</div>
            <div style="color:#7B8294;">生年月日</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">2005/08/14</div>
            <div style="color:#7B8294;">入学</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">2024/04</div>
          </div>
        </div>

        <div style="margin-top:14px; padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">連絡先</div>
          <div style="margin-top:10px; display:grid; grid-template-columns:90px 1fr; gap:8px 14px; font:500 12px/1.5 'Noto Sans JP', system-ui;">
            <div style="color:#7B8294;">電話</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">090-1234-5678</div>
            <div style="color:#7B8294;">メール</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">takumi.f@joho.ac.jp</div>
            <div style="color:#7B8294;">住所</div><div style="color:#1B2030;">福岡市中央区天神 1-2-3</div>
          </div>
        </div>
      </div>

      <!-- Right: 志望 + 就活サマリー + 備考 -->
      <div style="padding:24px 28px;">
        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">就職希望</div>
        <div style="margin-top:10px; display:grid; grid-template-columns:1fr 1fr; gap:14px;">
          <div style="padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">志望地域</div>
            <div style="margin-top:6px; font:700 14px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">福岡県内</div>
            <div style="margin-top:4px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">福岡市中央区 / 博多区</div>
          </div>
          <div style="padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">志望職種</div>
            <div style="margin-top:6px; font:700 14px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">Web 開発</div>
            <div style="margin-top:4px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">SE / プログラマ</div>
          </div>
        </div>

        <div style="margin-top:18px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">就職活動サマリー</div>
        <div style="margin-top:10px; padding:16px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="display:grid; grid-template-columns:repeat(4, 1fr); gap:12px;">
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">受験社数</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">5</div></div>
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">活動中</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#2C4A7A;">2</div></div>
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">内定</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#2F6E4F;">1</div></div>
            <div><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">不合格</div><div style="margin-top:4px; font:500 22px/1 'JetBrains Mono', monospace; color:#A04B3C;">2</div></div>
          </div>
          <div style="margin-top:14px; padding:10px 12px; background:#FCF6E8; border:1px solid #F5EBD7; border-radius:3px;">
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#B07025;">⚠ 内定承諾期限まで 残 2 日</div>
            <div style="margin-top:5px; font:500 11px/1.5 'Noto Sans JP', system-ui; color:#4B5263;">株式会社オーロラ (Web) / 期限 2026/07/03</div>
          </div>
        </div>

        <div style="margin-top:18px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">担任メモ</div>
        <div style="margin-top:10px; padding:14px 16px; background:#fff; border:1px solid #E2DED2; border-radius:3px; font:400 12px/1.7 'Noto Sans JP', system-ui; color:#4B5263;">
          オーロラ第一志望。承諾済との連絡を本人より受領 (06/26 朝)。<br>
          正式承諾入力は本日中に。家族とも確認済とのこと。
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>