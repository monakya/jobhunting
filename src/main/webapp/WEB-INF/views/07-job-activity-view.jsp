
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 就職活動 閲覧（古川 拓実）</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./07-job-activity-view.css">
</head>
<body>
<div class="page-label">JMS / 就職活動 閲覧（古川 拓実）</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1280px;" data-screen-label="就職活動 閲覧（古川 拓実）">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    就職活動 閲覧 — 学生 × 選考タイムライン
  </div>

  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; box-shadow:0 2px 14px rgba(20,25,45,.08); overflow:hidden;">

    <!-- App chrome -->
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

    <!-- breadcrumb / page header -->
    <div style="padding:18px 28px; border-bottom:1px solid #E2DED2; display:flex; align-items:center; gap:14px;">
      <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
        <span style="cursor:pointer;">就職活動</span>　/　<span style="cursor:pointer;">S2A1 一覧</span>　/　<span style="color:#1B2030; font-weight:700;">古川 拓実</span>
      </div>
      <div style="flex:1;"></div>
      <button style="height:32px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; color:#A04B3C; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">削除</button>
      <button style="height:32px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">編集</button>
      <button style="height:32px; padding:0 16px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 11px/1 'BIZ UDPGothic', system-ui;">＋ 受験を追加</button>
    </div>

    <!-- Body 2col -->
    <div style="display:grid; grid-template-columns:340px 1fr; gap:0;">

      <!-- Left: profile -->
      <div style="padding:24px; border-right:1px solid #E2DED2; background:#FBF9F3;">
        <div style="display:flex; align-items:center; gap:14px;">
          <div style="width:56px; height:56px; border-radius:99px; background:#F5EBD7; color:#B07025; display:flex; align-items:center; justify-content:center; font:700 22px/1 'BIZ UDPGothic', system-ui;">古</div>
          <div>
            <div style="font:700 18px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">古川 拓実</div>
            <div style="margin-top:3px; font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">ふるかわ たくみ</div>
          </div>
        </div>

        <div style="margin-top:20px; padding:14px; background:#fff; border:1px solid #E2DED2; border-radius:3px;">
          <div style="display:grid; grid-template-columns:80px 1fr; gap:10px 14px; font:500 12px/1.5 'Noto Sans JP', system-ui;">
            <div style="color:#7B8294;">クラス</div><div style="color:#1B2030; font-weight:700;">S2A1-21</div>
            <div style="color:#7B8294;">学籍番号</div><div style="color:#1B2030; font-family:'JetBrains Mono', monospace;">240021</div>
            <div style="color:#7B8294;">性別</div><div style="color:#1B2030;">男</div>
            <div style="color:#7B8294;">在籍</div><div style="color:#2F6E4F; font-weight:700;">● 在籍中</div>
            <div style="color:#7B8294;">あっせん</div><div style="color:#1B2030;">継続中</div>
            <div style="color:#7B8294;">志望地域</div><div style="color:#1B2030;">福岡県内</div>
            <div style="color:#7B8294;">志望職種</div><div style="color:#1B2030;">Web 系プログラマ</div>
          </div>
        </div>

        <!-- Highlight box -->
        <div style="margin-top:14px; padding:12px 14px; background:#FCF6E8; border:1px solid #F5EBD7; border-radius:3px;">
          <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#B07025;">⚠ 内定承諾期限まで 残 2 日</div>
          <div style="margin-top:6px; font:500 11px/1.5 'Noto Sans JP', system-ui; color:#4B5263;">株式会社オーロラ (Web) / 期限 2026/07/03</div>
        </div>

        <div style="margin-top:18px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">活動サマリー</div>
        <div style="margin-top:8px; display:grid; grid-template-columns:1fr 1fr; gap:8px;">
          <div style="padding:10px; background:#fff; border:1px solid #E2DED2; border-radius:3px;"><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">受験社数</div><div style="margin-top:4px; font:500 18px/1 'JetBrains Mono', monospace; color:#1B2030;">5</div></div>
          <div style="padding:10px; background:#fff; border:1px solid #E2DED2; border-radius:3px;"><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">内定</div><div style="margin-top:4px; font:500 18px/1 'JetBrains Mono', monospace; color:#2F6E4F;">1</div></div>
          <div style="padding:10px; background:#fff; border:1px solid #E2DED2; border-radius:3px;"><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">活動中</div><div style="margin-top:4px; font:500 18px/1 'JetBrains Mono', monospace; color:#2C4A7A;">2</div></div>
          <div style="padding:10px; background:#fff; border:1px solid #E2DED2; border-radius:3px;"><div style="font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">不合格</div><div style="margin-top:4px; font:500 18px/1 'JetBrains Mono', monospace; color:#A04B3C;">2</div></div>
        </div>

        <div style="margin-top:16px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.08em;">備考</div>
        <div style="margin-top:8px; padding:12px; background:#fff; border:1px solid #E2DED2; border-radius:3px; font:400 12px/1.6 'Noto Sans JP', system-ui; color:#4B5263;">
          オーロラ第一志望。承諾済との連絡を本人より受領 (06/26 朝)。<br>正式承諾入力は本日中に。
        </div>
      </div>

      <!-- Right: timeline of applications -->
      <div style="padding:24px 28px;">

        <div style="display:flex; align-items:center; gap:12px;">
          <div style="font:700 14px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">受験企業 / 選考タイムライン</div>
          <div style="flex:1;"></div>
          <div style="display:flex; gap:6px;">
            <div style="padding:5px 10px; border:1px solid #C7C0AF; background:#1B2030; color:#fff; border-radius:3px; font:700 10px/1 'BIZ UDPGothic', system-ui;">タイムライン</div>
            <div style="padding:5px 10px; border:1px solid #C7C0AF; background:#fff; color:#7B8294; border-radius:3px; font:700 10px/1 'BIZ UDPGothic', system-ui;">リスト</div>
          </div>
        </div>

        <!-- Company 1: オーロラ (内定・期限間近) -->
        <div style="margin-top:18px; background:#fff; border:1px solid #B07025; border-radius:4px; overflow:hidden;">
          <div style="padding:14px 18px; background:#FCF6E8; display:flex; align-items:center; gap:10px; border-bottom:1px solid #F5EBD7;">
            <div>
              <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社オーロラ</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">Web ・ 福岡市中央区 ・ 学校紹介</div>
            </div>
            <div style="flex:1;"></div>
            <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 10px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2F6E4F;"></span>内定</span>
            <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 10px; border-radius:99px; background:#B07025; color:#fff; font:700 11px/1 'JetBrains Mono', monospace;">承諾期限 07/03</span>
          </div>

          <!-- Step row -->
          <div style="padding:14px 18px;">
            <div style="display:grid; grid-template-columns:140px 100px 1fr 80px 110px; gap:10px; padding:8px 0; border-bottom:1px solid #EFECE3; align-items:center;">
              <div style="font:500 11px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">段階</div>
              <div style="font:500 11px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">日時</div>
              <div style="font:500 11px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">場所 / メモ</div>
              <div style="font:500 11px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">結果</div>
              <div style="font:500 11px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">判明日</div>
            </div>

            <div style="display:grid; grid-template-columns:140px 100px 1fr 80px 110px; gap:10px; padding:10px 0; align-items:center;">
              <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">説明会</span></div>
              <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">05/12 14:00</div>
              <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">本社・オンライン併用</div>
              <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
              <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
            </div>
            <div style="display:grid; grid-template-columns:140px 100px 1fr 80px 110px; gap:10px; padding:10px 0; border-top:1px solid #EFECE3; align-items:center;">
              <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">書類選考</span></div>
              <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">05/20</div>
              <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">履歴書・成績証明書 提出済</div>
              <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;">通過</div>
              <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#4B5263;">05/27</div>
            </div>
            <div style="display:grid; grid-template-columns:140px 100px 1fr 80px 110px; gap:10px; padding:10px 0; border-top:1px solid #EFECE3; align-items:center;">
              <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">1次面接</span></div>
              <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">06/02 10:00</div>
              <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">本社・対面</div>
              <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;">通過</div>
              <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#4B5263;">06/06</div>
            </div>
            <div style="display:grid; grid-template-columns:140px 100px 1fr 80px 110px; gap:10px; padding:10px 0; border-top:1px solid #EFECE3; align-items:center;">
              <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">最終面接</span><span style="margin-left:6px; font:700 10px/1 'BIZ UDPGothic', system-ui; color:#B07025;">最終</span></div>
              <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">06/14 13:00</div>
              <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">本社・対面</div>
              <div style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;">内定</div>
              <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#4B5263;">06/19</div>
            </div>
            <div style="display:grid; grid-template-columns:140px 100px 1fr 80px 110px; gap:10px; padding:10px 0; border-top:1px solid #EFECE3; align-items:center; background:#FCF6E8; margin:0 -18px; padding-left:18px; padding-right:18px;">
              <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#F5EBD7; color:#B07025; font:700 11px/1 'BIZ UDPGothic', system-ui;">承諾期限</span></div>
              <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#B07025; font-weight:700;">07/03 まで</div>
              <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#B07025;">残り 2 日 — 承諾入力 / 辞退入力が必要</div>
              <div style="font:500 12px/1 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
              <div style="display:flex; gap:4px; justify-content:flex-end;">
                <button style="height:26px; padding:0 8px; border:1px solid #2F6E4F; background:#2F6E4F; color:#fff; border-radius:3px; font:700 10px/1 'BIZ UDPGothic', system-ui;">承諾</button>
                <button style="height:26px; padding:0 8px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 10px/1 'BIZ UDPGothic', system-ui;">辞退</button>
              </div>
            </div>
          </div>
        </div>

        <!-- Company 2: スカイブリッジ -->
        <div style="margin-top:14px; background:#fff; border:1px solid #E2DED2; border-radius:4px; overflow:hidden;">
          <div style="padding:12px 18px; background:#FBF9F3; display:flex; align-items:center; gap:10px; border-bottom:1px solid #EFECE3;">
            <div>
              <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">株式会社スカイブリッジ</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">Web ・ 福岡市中央区 ・ 自己開拓</div>
            </div>
            <div style="flex:1;"></div>
            <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 10px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#2C4A7A;"></span>2次面接</span>
          </div>
          <div style="padding:10px 18px; display:flex; align-items:center; gap:14px;">
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">書類 通過</span>
            <span style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">→</span>
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">1次 通過</span>
            <span style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">→</span>
            <span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">2次面接 07/05 13:00</span>
            <div style="flex:1;"></div>
            <button style="height:26px; padding:0 10px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 10px/1 'BIZ UDPGothic', system-ui;">詳細</button>
          </div>
        </div>

        <!-- Company 3: 不合格 -->
        <div style="margin-top:10px; background:#fff; border:1px solid #E2DED2; border-radius:4px; overflow:hidden;">
          <div style="padding:12px 18px; display:flex; align-items:center; gap:10px;">
            <div>
              <div style="font:700 13px/1.2 'BIZ UDPGothic', system-ui; color:#7B8294;">九州デジタルサービス</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">SI ・ 学校紹介</div>
            </div>
            <div style="flex:1;"></div>
            <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 10px; border-radius:99px; background:#F2E2DD; color:#A04B3C; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#A04B3C;"></span>1次 不合格</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#9CA3B1;">05/30</span>
          </div>
        </div>

        <div style="margin-top:10px; background:#fff; border:1px solid #E2DED2; border-radius:4px; overflow:hidden;">
          <div style="padding:12px 18px; display:flex; align-items:center; gap:10px;">
            <div>
              <div style="font:700 13px/1.2 'BIZ UDPGothic', system-ui; color:#7B8294;">テクノス博多</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">SI ・ 自己開拓</div>
            </div>
            <div style="flex:1;"></div>
            <span style="display:inline-flex; align-items:center; gap:5px; padding:4px 10px; border-radius:99px; background:#F2E2DD; color:#A04B3C; font:700 11px/1 'BIZ UDPGothic', system-ui;"><span style="width:6px;height:6px;border-radius:99px;background:#A04B3C;"></span>書類 不合格</span>
            <span style="font:500 11px/1 'JetBrains Mono', monospace; color:#9CA3B1;">05/15</span>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>
</body>
</html>