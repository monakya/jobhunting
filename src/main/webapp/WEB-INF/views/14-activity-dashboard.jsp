
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 活動状況報告 ダッシュボード</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./14-activity-dashboard.css">
</head>
<body>
<div class="page-label">JMS / 活動状況報告 ダッシュボード</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1480px;" data-screen-label="活動状況報告 ダッシュボード">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    活動状況報告
  </div>

  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; box-shadow:0 2px 14px rgba(20,25,45,.08); overflow:hidden;">

    <!-- App chrome -->
    <div style="display:flex; align-items:center; gap:0; height:48px; background:#1B2030; color:#E2DED2; padding:0 20px;">
      <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em;">JMS</div>
      <div style="margin-left:18px; opacity:.55; font:500 12px/1 'Noto Sans JP', system-ui;">Job Hunting Management System</div>
      <div style="flex:1;"></div>
      <div style="display:flex; gap:18px; font:500 12px/1 'Noto Sans JP', system-ui; opacity:.85;">
        <span>学生</span><span>企業</span><span>就職活動</span><span style="color:#fff; border-bottom:2px solid #fff; padding-bottom:14px; margin-bottom:-14px;">活動状況報告</span><span>管理</span>
      </div>
      <div style="flex:1;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.75;">就職指導部 山田</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#2C4A7A; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">山</div>
      </div>
    </div>

    <!-- Page header / filters -->
    <div style="padding:22px 28px 18px 28px; border-bottom:1px solid #E2DED2;">
      <div style="display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">活動状況報告</div>
          <div style="margin-top:6px; display:flex; align-items:baseline; gap:12px;">
            <div style="font:700 24px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">2026 年度 就職活動 概況</div>
            <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#7B8294;">as of 2026/06/26 19:00</div>
          </div>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; gap:8px;">
          
          
        </div>
      </div>

      <div style="margin-top:14px; display:flex; align-items:center; gap:8px; flex-wrap:wrap;">
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">学科</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">情報システム科</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">学年</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">2 年</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">クラス</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">すべて (2)</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">比較</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">前年同期</span>
          <span style="color:#7B8294;">▾</span>
        </div>
      </div>
    </div>

    <!-- KPI row -->
    <div style="padding:22px 28px 0 28px; display:grid; grid-template-columns:repeat(4, 1fr); gap:14px;">

      <!-- 内定率 - hero -->
      <div style="background:#1B2030; color:#fff; border-radius:4px; padding:20px 22px;">
        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.1em; opacity:.7;">内定率</div>
        <div style="margin-top:12px; display:flex; align-items:baseline; gap:8px;">
          <div style="font:500 52px/1 'JetBrains Mono', monospace;">62.5</div>
          <div style="font:500 18px/1 'BIZ UDPGothic', system-ui; opacity:.6;">%</div>
          <div style="margin-left:8px; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#7CB394;">▲ +8.3pt</div>
        </div>
        <div style="margin-top:10px; display:flex; align-items:center; gap:10px;">
          <div style="flex:1; height:6px; background:rgba(255,255,255,.15); border-radius:3px; overflow:hidden;">
            <div style="width:62.5%; height:100%; background:#7CB394;"></div>
          </div>
          <div style="font:500 11px/1 'JetBrains Mono', monospace; opacity:.7;">目標 80%</div>
        </div>
        <div style="margin-top:10px; font:500 11px/1.4 'Noto Sans JP', system-ui; opacity:.65;">前年同期比 +8.3pt。9 月目標 80% に対し 17.5pt 不足。</div>
      </div>

      <!-- 内定者 -->
      <div style="background:#fff; border:1px solid #E2DED2; border-radius:4px; padding:18px 20px;">
        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em; color:#4B5263;">内定者</div>
        <div style="margin-top:12px; display:flex; align-items:baseline; gap:8px;">
          <div style="font:500 36px/1 'JetBrains Mono', monospace; color:#2F6E4F;">25</div>
          <div style="font:500 13px/1 'Noto Sans JP', system-ui; color:#7B8294;">名 / 40 名</div>
        </div>
        <div style="margin-top:10px; display:flex; gap:8px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
          <div>うち承諾済 <span style="color:#2F6E4F; font-weight:700;">14</span> 名</div>
          <div>・</div>
          <div>未承諾 <span style="color:#B07025; font-weight:700;">11</span> 名</div>
        </div>
        <div style="margin-top:10px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">前年同期 21 名（<span style="color:#2F6E4F; font-weight:700;">+4</span>）</div>
      </div>

      <!-- 未内定 / 要フォロー -->
      <div style="background:#fff; border:1px solid #F5EBD7; border-radius:4px; padding:18px 20px;">
        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em; color:#B07025;">未内定 / 要フォロー</div>
        <div style="margin-top:12px; display:flex; align-items:baseline; gap:8px;">
          <div style="font:500 36px/1 'JetBrains Mono', monospace; color:#B07025;">12</div>
          <div style="font:500 13px/1 'Noto Sans JP', system-ui; color:#7B8294;">名</div>
        </div>
        <div style="margin-top:10px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">
          活動中 8 ・ 初期段階 3 ・ 未活動 1
        </div>
        <div style="margin-top:10px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#B07025;">未活動 1 名：6/30 までに面談</div>
      </div>

      <!-- 受験社数 -->
      <div style="background:#fff; border:1px solid #E2DED2; border-radius:4px; padding:18px 20px;">
        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em; color:#4B5263;">活動量</div>
        <div style="margin-top:12px; display:flex; align-items:baseline; gap:8px;">
          <div style="font:500 36px/1 'JetBrains Mono', monospace; color:#1B2030;">3.4</div>
          <div style="font:500 13px/1 'Noto Sans JP', system-ui; color:#7B8294;">社 / 学生平均</div>
        </div>
        <div style="margin-top:10px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">受験延べ 136 社 ・ 内定企業 32 社</div>
        <div style="margin-top:10px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">学校紹介 71% / 自己開拓 24% / 縁故 5%</div>
      </div>
    </div>

    <!-- Charts row 1 -->
    <div style="padding:22px 28px 0 28px; display:grid; grid-template-columns:1.4fr 1fr; gap:14px;">

      <!-- クラス別積み上げバー -->
      <div style="background:#fff; border:1px solid #E2DED2; border-radius:4px; padding:18px 20px;">
        <div style="display:flex; align-items:center; gap:10px;">
          <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">クラス別 進捗</div>
          <div style="flex:1;"></div>
          <div style="display:flex; gap:12px; font:500 11px/1 'Noto Sans JP', system-ui; color:#4B5263;">
            <div style="display:flex; align-items:center; gap:4px;"><span style="width:10px; height:10px; background:#2F6E4F; border-radius:2px;"></span>承諾</div>
            <div style="display:flex; align-items:center; gap:4px;"><span style="width:10px; height:10px; background:#7CB394; border-radius:2px;"></span>内定</div>
            <div style="display:flex; align-items:center; gap:4px;"><span style="width:10px; height:10px; background:#2C4A7A; border-radius:2px;"></span>選考中</div>
            <div style="display:flex; align-items:center; gap:4px;"><span style="width:10px; height:10px; background:#9FB0CE; border-radius:2px;"></span>初期</div>
            <div style="display:flex; align-items:center; gap:4px;"><span style="width:10px; height:10px; background:#D5CFC0; border-radius:2px;"></span>未活動</div>
          </div>
        </div>

        <div style="margin-top:16px; display:flex; flex-direction:column; gap:12px;">

          <div style="display:grid; grid-template-columns:60px 1fr 70px; align-items:center; gap:14px;">
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">S2A1<div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294; margin-top:3px;">20 名</div></div>
            <div style="display:flex; height:22px; border-radius:3px; overflow:hidden;">
              <div style="flex:7; background:#2F6E4F; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">7</div>
              <div style="flex:5; background:#7CB394; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">5</div>
              <div style="flex:6; background:#2C4A7A; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">6</div>
              <div style="flex:1; background:#9FB0CE; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">1</div>
              <div style="flex:1; background:#D5CFC0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">1</div>
            </div>
            <div style="font:500 13px/1 'JetBrains Mono', monospace; color:#2F6E4F; text-align:right;">60.0%</div>
          </div>

          <div style="display:grid; grid-template-columns:60px 1fr 70px; align-items:center; gap:14px;">
            <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">S2A2<div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294; margin-top:3px;">20 名</div></div>
            <div style="display:flex; height:22px; border-radius:3px; overflow:hidden;">
              <div style="flex:7; background:#2F6E4F; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">7</div>
              <div style="flex:6; background:#7CB394; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">6</div>
              <div style="flex:5; background:#2C4A7A; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">5</div>
              <div style="flex:2; background:#9FB0CE; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui; display:flex; align-items:center; justify-content:center;">2</div>
              <div style="flex:0.01; background:#D5CFC0;"></div>
            </div>
            <div style="font:500 13px/1 'JetBrains Mono', monospace; color:#2F6E4F; text-align:right;">65.0%</div>
          </div>

        </div>

        <div style="margin-top:16px; padding-top:12px; border-top:1px solid #EFECE3; font:500 11px/1.5 'Noto Sans JP', system-ui; color:#7B8294;">
          数字は人数。右端はクラスの<strong style="color:#1B2030;">内定率（承諾含む）</strong>。<span style="color:#2F6E4F; font-weight:700;">S2A2</span> がわずかに先行、<span style="color:#1B2030; font-weight:700;">S2A1</span> の未活動 1 名が要フォロー。
        </div>
      </div>

      <!-- 週別 内定者数（累計でない） -->
      <div style="background:#fff; border:1px solid #E2DED2; border-radius:4px; padding:18px 20px;">
        <div style="display:flex; align-items:center; gap:10px;">
          <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">週別 内定者数</div>
          <div style="flex:1;"></div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">週ごとの新規内定（累計ではありません）</div>
        </div>

        <!-- bar chart -->
        <div style="margin-top:22px; height:160px; display:grid; grid-template-columns:repeat(8, 1fr); gap:10px; align-items:end; padding:0 4px;">

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#1B2030;">2</div>
            <div style="width:100%; height:25%; background:#9FB0CE; border-radius:3px 3px 0 0;"></div>
          </div>

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#1B2030;">1</div>
            <div style="width:100%; height:12.5%; background:#9FB0CE; border-radius:3px 3px 0 0;"></div>
          </div>

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#1B2030;">3</div>
            <div style="width:100%; height:37.5%; background:#9FB0CE; border-radius:3px 3px 0 0;"></div>
          </div>

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#1B2030;">5</div>
            <div style="width:100%; height:62.5%; background:#2C4A7A; border-radius:3px 3px 0 0;"></div>
          </div>

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#1B2030;">4</div>
            <div style="width:100%; height:50%; background:#2C4A7A; border-radius:3px 3px 0 0;"></div>
          </div>

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#1B2030;">6</div>
            <div style="width:100%; height:75%; background:#2C4A7A; border-radius:3px 3px 0 0;"></div>
          </div>

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#1B2030;">8</div>
            <div style="width:100%; height:100%; background:#2C4A7A; border-radius:3px 3px 0 0;"></div>
          </div>

          <div style="display:flex; flex-direction:column; align-items:center; gap:4px; height:100%; justify-content:flex-end;">
            <div style="font:700 11px/1 'JetBrains Mono', monospace; color:#B07025;">4 <span style="font:500 9px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">(週途中)</span></div>
            <div style="width:100%; height:50%; background:#B07025; border-radius:3px 3px 0 0; opacity:0.7;"></div>
          </div>

        </div>
        <!-- x labels -->
        <div style="margin-top:6px; display:grid; grid-template-columns:repeat(8, 1fr); gap:10px; font:500 10px/1.2 'JetBrains Mono', monospace; color:#7B8294; text-align:center;">
          <div>5/4週</div>
          <div>5/5週</div>
          <div>6/1週</div>
          <div>6/2週</div>
          <div>6/3週</div>
          <div>6/4週</div>
          <div>6/5週</div>
          <div style="color:#B07025; font-weight:700;">6/6週</div>
        </div>

        <div style="margin-top:16px; padding-top:12px; border-top:1px solid #EFECE3; display:flex; gap:18px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
          <div>直近 8 週計 <strong style="color:#1B2030;">33 名</strong></div>
          <div>ピーク週 <strong style="color:#1B2030;">6/5 週 (8 名)</strong></div>
          <div>週平均 <strong style="color:#1B2030;">4.1 名</strong></div>
        </div>
      </div>
    </div>

    <!-- Charts row 2 削除済 -->

    <!-- bottom row: 要フォロー学生 + 直近内定 -->
    <div style="padding:14px 28px 22px 28px; display:grid; grid-template-columns:1.4fr 1fr; gap:14px;">

      <!-- 要フォロー学生 -->
      <div style="background:#fff; border:1px solid #F5EBD7; border-radius:4px; overflow:hidden;">
        <div style="padding:14px 18px; background:#FCF6E8; border-bottom:1px solid #F5EBD7; display:flex; align-items:center; gap:10px;">
          <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; color:#B07025;">要フォロー学生</div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#B07025;">未活動 / 不合格続き / 承諾期限間近</div>
          <div style="flex:1;"></div>
          <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#B07025;">12 名</div>
        </div>

        <div style="display:grid; grid-template-columns:60px 100px 1fr 90px 110px; padding:10px 18px; background:#EFEBE0; border-bottom:1px solid #E2DED2; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">
          <div>クラス</div><div>学籍</div><div>氏名 / 状況</div><div>受験社数</div><div>状態</div>
        </div>

        <div style="display:grid; grid-template-columns:60px 100px 1fr 90px 110px; padding:10px 18px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-25</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240025</div>
          <div>
            <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">山口 ひかり</div>
            <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#7B8294;">受験記録なし</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#A04B3C;">0 社</div>
          <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#F2E2DD; color:#A04B3C; font:700 10px/1 'BIZ UDPGothic', system-ui;">未活動</span></div>
        </div>

        <div style="display:grid; grid-template-columns:60px 100px 1fr 90px 110px; padding:10px 18px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A2-04</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240104</div>
          <div>
            <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">井上 直樹</div>
            <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#7B8294;">5 社連続 書類落ち</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">5 社</div>
          <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#F2E2DD; color:#A04B3C; font:700 10px/1 'BIZ UDPGothic', system-ui;">不合格続</span></div>
        </div>

        <div style="display:grid; grid-template-columns:60px 100px 1fr 90px 110px; padding:10px 18px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-21</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240021</div>
          <div>
            <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">古川 拓実</div>
            <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#7B8294;">承諾期限 残 2 日</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">5 社</div>
          <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#B07025; color:#fff; font:700 10px/1 'BIZ UDPGothic', system-ui;">承諾期限</span></div>
        </div>

        <div style="display:grid; grid-template-columns:60px 100px 1fr 90px 110px; padding:10px 18px; border-bottom:1px solid #EFECE3; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-09</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240209</div>
          <div>
            <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">河野 みお</div>
            <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#7B8294;">最終後 2 週間結果未連絡</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">3 社</div>
          <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FCF6E8; color:#B07025; font:700 10px/1 'BIZ UDPGothic', system-ui;">結果待</span></div>
        </div>

        <div style="display:grid; grid-template-columns:60px 100px 1fr 90px 110px; padding:10px 18px; align-items:center;">
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-12</div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240412</div>
          <div>
            <div style="font:700 12px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">藤井 拓海</div>
            <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#7B8294;">活動開始遅め (5月～)</div>
          </div>
          <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">2 社</div>
          <div><span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui;">初期段階</span></div>
        </div>

        <div style="padding:10px 18px; text-align:center; border-top:1px solid #EFECE3; font:500 11px/1 'Noto Sans JP', system-ui; color:#2C4A7A;">
          残り 7 名を表示 →
        </div>
      </div>

      <!-- 直近の内定 -->
      <div style="background:#fff; border:1px solid #E2DED2; border-radius:4px; overflow:hidden;">
        <div style="padding:14px 18px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:10px;">
          <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">直近の内定</div>
          <div style="flex:1;"></div>
          <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">今週 4 件</div>
        </div>

        <div style="padding:14px 18px; border-bottom:1px solid #EFECE3;">
          <div style="display:flex; align-items:center; gap:8px;">
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">内定</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">06/24</span>
          </div>
          <div style="margin-top:6px;">
            <span style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">大野 葵</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:6px;">S2A1-05</span>
          </div>
          <div style="margin-top:4px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">株式会社ミライウェイ ・ Web</div>
        </div>

        <div style="padding:14px 18px; border-bottom:1px solid #EFECE3;">
          <div style="display:flex; align-items:center; gap:8px;">
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#2F6E4F; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui;">承諾</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">06/22</span>
          </div>
          <div style="margin-top:6px;">
            <span style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">高山 葉月</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:6px;">S2A2-16</span>
          </div>
          <div style="margin-top:4px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">九州ITサポート ・ SI</div>
        </div>

        <div style="padding:14px 18px; border-bottom:1px solid #EFECE3;">
          <div style="display:flex; align-items:center; gap:8px;">
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">内定</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">06/21</span>
          </div>
          <div style="margin-top:6px;">
            <span style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">中原 怜</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:6px;">S2A2-22</span>
          </div>
          <div style="margin-top:4px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">福岡電子工業 ・ 製造</div>
        </div>

        <div style="padding:14px 18px;">
          <div style="display:flex; align-items:center; gap:8px;">
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">内定</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">06/19</span>
          </div>
          <div style="margin-top:6px;">
            <span style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">古川 拓実</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294; margin-left:6px;">S2A1-21</span>
          </div>
          <div style="margin-top:4px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#4B5263;">株式会社オーロラ ・ Web</div>
        </div>
      </div>
    </div>

  </div>
</div>
</body>
</html>