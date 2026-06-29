
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 進級・卒業 一括処理</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./01-students-batch-promotion.css">
</head>
<body>
<div class="page-label">JMS / 進級・卒業 一括処理</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1480px;" data-screen-label="進級・卒業 一括処理">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    進級・卒業 一括処理　<span style="color:#7B8294; font-weight:500;">年度切替時に在籍学生を一括で進級・卒業させる</span>
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
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.75;">就職指導部 山田</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#2C4A7A; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">山</div>
      </div>
    </div>

    <!-- Breadcrumb / Page header -->
    <div style="padding:20px 28px 18px 28px; border-bottom:1px solid #E2DED2;">
      <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
        <span style="cursor:pointer;">学生</span>　/　<span style="cursor:pointer;">一覧</span>　/　<span style="color:#1B2030; font-weight:700;">進級・卒業 一括処理</span>
      </div>

      <div style="margin-top:10px; display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">学生管理 / 年度処理</div>
          <div style="margin-top:6px; font:700 22px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">進級・卒業 一括処理</div>
        </div>
        <div style="flex:1;"></div>
        <div style="font:500 12px/1.4 'Noto Sans JP', system-ui; color:#7B8294; text-align:right;">
          実行は年度末に <strong style="color:#1B2030;">1 回のみ</strong> 推奨。<br>処理後は変更履歴から取り消し可能 (24h 以内)。
        </div>
      </div>
    </div>

    <!-- Stepper -->
    <div style="padding:20px 28px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:0;">
      <div style="display:flex; align-items:center; gap:10px;">
        <div style="width:24px; height:24px; border-radius:99px; background:#1B2030; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'JetBrains Mono', monospace;">1</div>
        <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">対象年度を選択<div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294; margin-top:3px;">処理基準日</div></div>
      </div>
      <div style="flex:1; height:1px; background:#1B2030; margin:0 16px;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <div style="width:24px; height:24px; border-radius:99px; background:#1B2030; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'JetBrains Mono', monospace;">2</div>
        <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">対象学生と処理を確認<div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294; margin-top:3px;">個別調整可</div></div>
      </div>
      <div style="flex:1; height:1px; background:#E2DED2; margin:0 16px;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <div style="width:24px; height:24px; border-radius:99px; background:#fff; color:#9CA3B1; display:flex; align-items:center; justify-content:center; font:700 12px/1 'JetBrains Mono', monospace; border:1px solid #C7C0AF;">3</div>
        <div style="font:500 12px/1.2 'BIZ UDPGothic', system-ui; color:#7B8294;">最終確認 → 実行<div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294; margin-top:3px;">処理ログ生成</div></div>
      </div>
    </div>

    <!-- Year selector + summary -->
    <div style="padding:20px 28px; border-bottom:1px solid #E2DED2; background:#FBF9F3;">
      <div style="display:grid; grid-template-columns:1fr 1fr 1fr 1fr; gap:16px;">
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">基準日</div>
          <div style="margin-top:6px; display:flex; align-items:center; gap:8px; height:38px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
            <span style="color:#7B8294;">▦</span>
            <span style="font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">2027/03/31</span>
          </div>
        </div>
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">処理対象学年</div>
          <div style="margin-top:6px; display:flex; gap:4px; border:1px solid #C7C0AF; border-radius:3px; padding:3px; background:#fff;">
            <div style="flex:1; padding:8px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">2 年</div>
            <div style="flex:1; padding:8px; text-align:center; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 'BIZ UDPGothic', system-ui;">3 年 (現)</div>
            <div style="flex:1; padding:8px; text-align:center; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">全学年</div>
          </div>
        </div>
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">対象人数</div>
          <div style="margin-top:6px; display:flex; align-items:center; height:38px; padding:0 12px; border:1px solid #E2DED2; background:#fff; border-radius:3px;">
            <span style="font:500 18px/1 'JetBrains Mono', monospace; color:#1B2030;">40</span>
            <span style="margin-left:6px; font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">名 (S3A1: 20 / S3A2: 20)</span>
          </div>
        </div>
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">処理プリセット</div>
          <div style="margin-top:6px; display:flex; align-items:center; gap:8px; height:38px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
            <span style="font:500 13px/1 'Noto Sans JP', system-ui; color:#1B2030;">3 年生 → 卒業</span>
            <div style="flex:1;"></div>
            <span style="color:#7B8294;">▾</span>
          </div>
        </div>
      </div>

      <!-- 自動振り分け結果 -->
      <div style="margin-top:14px; display:grid; grid-template-columns:repeat(5, 1fr); gap:10px;">
        <div style="padding:12px 14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="display:flex; align-items:center; gap:6px;">
            <span style="width:8px; height:8px; border-radius:99px; background:#2F6E4F;"></span>
            <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">卒業</div>
          </div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#2F6E4F;">37<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
          <div style="margin-top:4px; font:500 10px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">在籍中の通常進路</div>
        </div>
        <div style="padding:12px 14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="display:flex; align-items:center; gap:6px;">
            <span style="width:8px; height:8px; border-radius:99px; background:#7B8294;"></span>
            <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">留年 (現年度継続)</div>
          </div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">1<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
          <div style="margin-top:4px; font:500 10px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">単位不足を別途要確認</div>
        </div>
        <div style="padding:12px 14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="display:flex; align-items:center; gap:6px;">
            <span style="width:8px; height:8px; border-radius:99px; background:#B07025;"></span>
            <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">休学継続</div>
          </div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#B07025;">1<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
          <div style="margin-top:4px; font:500 10px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">復学届で個別対応</div>
        </div>
        <div style="padding:12px 14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="display:flex; align-items:center; gap:6px;">
            <span style="width:8px; height:8px; border-radius:99px; background:#A04B3C;"></span>
            <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">退学処理済</div>
          </div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#A04B3C;">1<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
          <div style="margin-top:4px; font:500 10px/1.3 'Noto Sans JP', system-ui; color:#7B8294;">処理対象外 (記録のみ保持)</div>
        </div>
        <div style="padding:12px 14px; background:#FCF6E8; border:1px solid #F5EBD7; border-radius:3px;">
          <div style="display:flex; align-items:center; gap:6px;">
            <span style="width:8px; height:8px; border-radius:99px; background:#B07025;"></span>
            <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#B07025;">⚠ 要確認</div>
          </div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#B07025;">2<span style="font-size:12px; margin-left:4px;">名</span></div>
          <div style="margin-top:4px; font:500 10px/1.3 'Noto Sans JP', system-ui; color:#B07025;">内定未承諾で卒業予定</div>
        </div>
      </div>
    </div>

    <!-- Table -->
    <div>
      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:10px 28px; background:#EFEBE0; border-bottom:1px solid #E2DED2; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263; letter-spacing:.04em;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #1B2030; background:#1B2030; color:#fff; border-radius:2px; font:700 11px/1 monospace; display:flex; align-items:center; justify-content:center;">✓</div></div>
        <div>クラス</div>
        <div>学籍番号</div>
        <div>氏名</div>
        <div>現在</div>
        <div>就活状況</div>
        <div>処理後</div>
        <div>処理内容</div>
        <div></div>
      </div>

      <!-- 通常卒業 row -->
      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:2px; font:700 11px/1 monospace; display:flex; align-items:center; justify-content:center;">✓</div></div>
        <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">S3A1</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">230001</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">立石 ひかり</div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中 3年</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">承諾済</span></div>
        <div style="display:flex; align-items:center; gap:8px;">
          <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2F6E4F;"></span>卒業</span>
          <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">→ 2027/03/31</span>
        </div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">卒業 / 就職先確定</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FBF9F3;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:2px; font:700 11px/1 monospace; display:flex; align-items:center; justify-content:center;">✓</div></div>
        <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">S3A1</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">230005</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">大塚 拓也</div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中 3年</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">活動中</span></div>
        <div style="display:flex; align-items:center; gap:8px;">
          <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2F6E4F;"></span>卒業</span>
          <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">→ 2027/03/31</span>
        </div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">卒業 / 進路継続支援</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <!-- 要確認 row 1: 内定なし卒業 -->
      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FCF6E8;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #B07025; background:#fff; color:#B07025; border-radius:2px;"></div></div>
        <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">S3A1</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">230018</div>
        <div>
          <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">西脇 七海</div>
          <div style="margin-top:3px; font:500 10px/1.3 'Noto Sans JP', system-ui; color:#B07025;">⚠ 内定なしで卒業予定。確認推奨。</div>
        </div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中 3年</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">未活動</span></div>
        <div style="display:flex; align-items:center; gap:8px;">
          <div style="display:flex; align-items:center; gap:4px; height:30px; padding:0 10px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
            <span style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">処理を選択</span>
            <span style="color:#7B8294;">▾</span>
          </div>
        </div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#B07025;">担任面談で確認</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <!-- 要確認 row 2: 内定なし卒業 -->
      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FCF6E8;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #B07025; background:#fff; color:#B07025; border-radius:2px;"></div></div>
        <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">S3A2</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">230102</div>
        <div>
          <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">永田 翔</div>
          <div style="margin-top:3px; font:500 10px/1.3 'Noto Sans JP', system-ui; color:#B07025;">⚠ 内定なし。進学希望の可能性あり。</div>
        </div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中 3年</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#F2E2DD; color:#A04B3C; font:700 11px/1 'BIZ UDPGothic', system-ui;">不合格続</span></div>
        <div style="display:flex; align-items:center; gap:8px;">
          <div style="display:flex; align-items:center; gap:4px; height:30px; padding:0 10px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
            <span style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">処理を選択</span>
            <span style="color:#7B8294;">▾</span>
          </div>
        </div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#B07025;">担任面談で確認</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <!-- 留年 row -->
      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:2px; font:700 11px/1 monospace; display:flex; align-items:center; justify-content:center;">✓</div></div>
        <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">S3A2</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">230020</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">田島 響</div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中 3年</span></div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">未活動</span></div>
        <div style="display:flex; align-items:center; gap:8px;">
          <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#7B8294;"></span>留年</span>
          <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">2年継続</span>
        </div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">単位不足 / 別途要確認</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <!-- 休学 row -->
      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:2px; font:700 11px/1 monospace; display:flex; align-items:center; justify-content:center;">✓</div></div>
        <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">S3A1</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">230008</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">松井 唯</div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294;"><span style="width:6px; height:6px; border-radius:99px; background:#7B8294;"></span>休学</span></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="display:flex; align-items:center; gap:8px;">
          <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#7B8294;"></span>休学継続</span>
        </div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">復学届で個別対応</div>
        <div style="text-align:right; color:#7B8294;">⋯</div>
      </div>

      <!-- 退学 (excluded) row -->
      <div style="display:grid; grid-template-columns:32px 80px 100px 1fr 100px 130px 200px 170px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff; opacity:0.55;">
        <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; background:#EFEBE0; border-radius:2px;"></div></div>
        <div style="font:500 12px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">S3A1</div>
        <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#7B8294;">230029</div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">武田 光</div>
        <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#A04B3C;"><span style="width:6px; height:6px; border-radius:99px; background:#A04B3C;"></span>退学</span></div>
        <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#9CA3B1;">処理対象外</div>
        <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#9CA3B1;">記録のみ保持</div>
        <div style="text-align:right; color:#9CA3B1;">⋯</div>
      </div>

      <!-- expand row -->
      <div style="display:flex; align-items:center; justify-content:center; padding:12px; background:#fff; border-bottom:1px solid #EFECE3; font:500 11px/1 'Noto Sans JP', system-ui; color:#2C4A7A; cursor:pointer;">
        ＋ 残り 33 名を表示
      </div>

    </div>

    <!-- Footer / Action bar -->
    <div style="padding:16px 28px; border-top:1px solid #E2DED2; background:#FBF9F3; display:flex; align-items:center; gap:14px;">
      <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
        選択中 <strong style="color:#1B2030;">38 / 40 名</strong>　・　要確認 <strong style="color:#B07025;">2 名</strong>　・　処理対象外 <strong style="color:#1B2030;">1 名</strong> (退学)
      </div>
      <div style="flex:1;"></div>
      <button style="height:36px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">CSV ダウンロード</button>
      <button style="height:36px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">下書き保存</button>
      <button style="height:36px; padding:0 18px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">最終確認 →</button>
    </div>
  </div>
</div>
</body>
</html>