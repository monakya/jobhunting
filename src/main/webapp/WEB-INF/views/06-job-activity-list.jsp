
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — V-A 就職活動管理 一覧（シート刷新型）</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./06-job-activity-list.css">
</head>
<body>
<div class="page-label">JMS / V-A 就職活動管理 一覧（シート刷新型）</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1480px;" data-screen-label="V-A 就職活動管理 一覧（シート刷新型）">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    A — シート刷新型　<span style="color:#7B8294; font-weight:500;">既存「就職指導一覧表」をそのまま洗練</span>
  </div>

  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; box-shadow:0 2px 14px rgba(20,25,45,.08); overflow:hidden;">

    <!-- App chrome: top -->
    <div style="display:flex; align-items:center; gap:0; height:48px; background:#1B2030; color:#E2DED2; padding:0 20px;">
      <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em;">JMS</div>
      <div style="margin-left:18px; opacity:.55; font:500 12px/1 'Noto Sans JP', system-ui;">Job Hunting Management System</div>
      <div style="flex:1;"></div>
      <div style="display:flex; gap:18px; font:500 12px/1 'Noto Sans JP', system-ui; opacity:.85;">
        <span>学生</span><span>企業</span><span style="color:#fff; border-bottom:2px solid #fff; padding-bottom:14px; margin-bottom:-14px;">就職活動</span><span>活動状況報告</span><span>管理</span>
      </div>
      <div style="flex:1;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.75;">S2A1 担任</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#2C4A7A; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">中</div>
      </div>
    </div>

    <!-- Page header -->
    <div style="padding:22px 28px 18px 28px; border-bottom:1px solid #E2DED2;">
      <div style="display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">就職活動管理</div>
          <div style="margin-top:6px; font:700 22px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">就職活動 一覧</div>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; gap:8px;">
          <button style="height:36px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">出力</button>
          <button style="height:36px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">列のカスタマイズ</button>
          <button style="height:36px; padding:0 16px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">＋ 受験情報を追加</button>
        </div>
      </div>

      <!-- KPI strip -->
      <div style="margin-top:18px; display:grid; grid-template-columns:repeat(6, 1fr); gap:12px;">
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">在籍中</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">38<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">活動中</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#2C4A7A;">34<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">内定</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#2F6E4F;">9<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">内定承諾</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#2F6E4F;">5<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">未活動</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">4<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #F5EBD7; background:#FCF6E8; border-radius:3px; padding:12px 14px;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#B07025;">承諾期限 7日以内</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#B07025;">2<span style="font-size:12px; margin-left:4px;">名</span></div>
        </div>
      </div>

      <!-- Filters -->
      <div style="margin-top:16px; display:flex; align-items:center; gap:10px; flex-wrap:wrap;">
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">クラス</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">S2A1</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">在籍</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">在籍中</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">紹介区分</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">すべて</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">選考状況</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">すべて</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">期間</span>
          <span style="font:500 12px/1 'JetBrains Mono', monospace; color:#1B2030;">2026/06/26 — 2026/07/31</span>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; align-items:center; gap:8px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px; min-width:260px;">
          <span style="color:#7B8294;">⌕</span>
          <span style="font:400 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">学生・企業名で検索</span>
        </div>
      </div>
    </div>

    <!-- Table -->
    <div style="padding:0 0 0 0;">
      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:10px 28px; background:#EFEBE0; border-bottom:1px solid #E2DED2; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263; letter-spacing:.04em;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div>クラス</div><div>学籍</div><div>氏名</div><div>企業名</div><div>業種</div><div>紹介</div><div>選考状況</div><div>次回日時 / 場所</div><div>結果</div><div>結果判明日</div><div>承諾期限</div><div></div>
      </div>

      <!-- rows -->

      <!-- row -->
      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-01</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240001</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">青木 真央<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">あおき まお</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社サンライズシステムズ</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市中央区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SI</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2C4A7A;"></span>2次面接</span></div>
        <div style="font:500 12px/1.4 'JetBrains Mono', monospace; color:#1B2030;">06/28 14:00<div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">福岡本社</div></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FBF9F3;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#7B8294;">〃</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#7B8294;">〃</div>
        <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">〃</div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">KYUSHO テック株式会社</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市博多区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">通信</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FCF6E8; color:#B07025; font:700 10px/1 'BIZ UDPGothic', system-ui;">自己</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#7B8294;"></span>書類選考</span></div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-03</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240003</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">石橋 蓮<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">いしばし れん</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">福岡電子工業株式会社</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">北九州市</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">製造</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2C4A7A;"></span>最終面接</span></div>
        <div style="font:500 12px/1.4 'JetBrains Mono', monospace; color:#1B2030;">07/02 10:00<div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">北九州本社</div></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-05</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240005</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">大野 葵<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">おおの あおい</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社ミライウェイ</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市中央区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">Web</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2F6E4F;"></span>内定</span></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#2F6E4F;">内定</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#4B5263;">06/24</div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#F5EBD7; color:#B07025; font:700 11px/1 'JetBrains Mono', monospace;">07/05</span></div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-08</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240008</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">川村 慎吾<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">かわむら しんご</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">九州ITサポート株式会社</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市博多区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SI</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#2F6E4F; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#fff;"></span>内定承諾</span></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#2F6E4F;">承諾</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#4B5263;">06/20</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-11</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240011</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">佐藤 美海<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">さとう みう</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">コアシステム博多株式会社</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市博多区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SI</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2C4A7A;"></span>1次面接</span></div>
        <div style="font:500 12px/1.4 'JetBrains Mono', monospace; color:#1B2030;">06/30 13:00<div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">博多本社</div></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-12</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240012</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">中島 隼人<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">なかしま はやと</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社スカイブリッジ</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市中央区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">Web</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FCF6E8; color:#B07025; font:700 10px/1 'BIZ UDPGothic', system-ui;">自己</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#7B8294;"></span>説明会</span></div>
        <div style="font:500 12px/1.4 'JetBrains Mono', monospace; color:#1B2030;">06/27 16:00<div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">オンライン</div></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-15</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240015</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">西山 真央<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">にしやま まお</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">九信エンジニアリング株式会社</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">久留米市</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SI</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#F2E2DD; color:#A04B3C; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#A04B3C;"></span>不合格</span></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#A04B3C;">不合格</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#4B5263;">06/22</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-18</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240018</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">林 ゆい<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">はやし ゆい</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">パシフィカル福岡株式会社</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市東区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">製造</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2C4A7A;"></span>2次面接</span></div>
        <div style="font:500 12px/1.4 'JetBrains Mono', monospace; color:#1B2030;">07/01 11:00<div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">本社</div></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FCF6E8;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #B07025; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-21</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240021</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">古川 拓実<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">ふるかわ たくみ</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社オーロラ</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市中央区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">Web</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2F6E4F;"></span>内定</span></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#2F6E4F;">内定</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#4B5263;">06/19</div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#B07025; color:#fff; font:700 11px/1 'JetBrains Mono', monospace;">07/03 ⚠</span></div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-22</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240022</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">牧野 楓<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">まきの かえで</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">九州デジタルサービス株式会社</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">福岡市博多区</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SI</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FCF6E8; color:#B07025; font:700 10px/1 'BIZ UDPGothic', system-ui;">自己</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#7B8294;"></span>書類選考</span></div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 56px 88px 110px 1fr 78px 78px 130px 130px 110px 110px 110px 64px; align-items:center; gap:0; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-24</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240024</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">三好 健太<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">みよし けんた</div></div>
        <div><div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社グリーンライン</div><div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">大野城市</div></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">通信</div>
        <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">学校</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:4px 9px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2C4A7A;"></span>1次面接</span></div>
        <div style="font:500 12px/1.4 'JetBrains Mono', monospace; color:#1B2030;">07/04 09:30<div style="font:400 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">本社</div></div>
        <div style="font:500 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <!-- Pagination -->
      <div style="display:flex; align-items:center; gap:14px; padding:14px 28px; background:#fff; border-top:1px solid #E2DED2;">
        <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">全 142 件中 1–12 件を表示</div>
        <div style="flex:1;"></div>
        <div style="display:flex; align-items:center; gap:4px;">
          <button style="width:30px; height:30px; border:1px solid #C7C0AF; background:#fff; color:#7B8294; border-radius:3px; font:500 12px/1 'JetBrains Mono', monospace;">‹</button>
          <button style="width:30px; height:30px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:500 12px/1 'JetBrains Mono', monospace;">1</button>
          <button style="width:30px; height:30px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:500 12px/1 'JetBrains Mono', monospace;">2</button>
          <button style="width:30px; height:30px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:500 12px/1 'JetBrains Mono', monospace;">3</button>
          <button style="width:30px; height:30px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:500 12px/1 'JetBrains Mono', monospace;">›</button>
        </div>
      </div>

    </div>
  </div>



</div>
</body>
</html>