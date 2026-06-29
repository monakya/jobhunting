
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 管理 アカウント一覧</title>
<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/screen.css">
<link rel="stylesheet" href="./19-admin-accounts.css">
</head>
<body>
<div class="page-label">JMS / 管理 アカウント一覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1480px;" data-screen-label="管理 アカウント一覧">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    アカウント管理　<span style="color:#7B8294; font-weight:500;">担任・就職指導部・校長・システム管理者</span>
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
      <div style="padding:14px 16px; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; border-bottom:2px solid #1B2030;">アカウント</div>
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">職種マスタ</div>
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">地域マスタ</div>
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">システム設定</div>
      <div style="padding:14px 16px; font:500 12px/1 'Noto Sans JP', system-ui; color:#7B8294;">処理ログ</div>
    </div>

    <!-- Page header -->
    <div style="padding:22px 28px 18px 28px; border-bottom:1px solid #E2DED2;">
      <div style="display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">管理 / アカウント</div>
          <div style="margin-top:6px; font:700 22px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">アカウント一覧</div>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; gap:8px;">
          <button style="height:36px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">ロール設定</button>
          <button style="height:36px; padding:0 16px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">＋ アカウントを追加</button>
        </div>
      </div>

      <!-- KPI strip -->
      <div style="margin-top:18px; display:grid; grid-template-columns:repeat(5, 1fr); gap:12px;">
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">担任</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">8<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">就職指導部</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">3<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">校長・教務部長</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">2<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">システム管理者</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#B07025;">2<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">無効・停止</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#7B8294;">1<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
      </div>

      <!-- filters -->
      <div style="margin-top:16px; display:flex; align-items:center; gap:10px; flex-wrap:wrap;">
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">部門</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">すべて</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">ロール</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">すべて</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">状態</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">有効</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; align-items:center; gap:8px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px; min-width:260px;">
          <span style="color:#7B8294;">⌕</span>
          <span style="font:400 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">氏名・ユーザー ID で検索</span>
        </div>
      </div>
    </div>

    <!-- Table -->
    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:10px 28px; background:#EFEBE0; border-bottom:1px solid #E2DED2; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263; letter-spacing:.04em;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div>ユーザー ID</div>
      <div>氏名</div>
      <div>部門</div>
      <div>ロール</div>
      <div>最終ログイン</div>
      <div>状態</div>
      <div></div>
    </div>

    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">t.nakamura</div>
      <div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">中村 裕太</div>
        <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">なかむら ゆうた</div>
      </div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">担任 （S2A1）</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">担任</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26 09:14</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>有効</span></div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FBF9F3;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">k.sato</div>
      <div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">佐藤 久代子</div>
        <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">さとう くよこ</div>
      </div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">担任 （S2A2）</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">担任</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26 08:42</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>有効</span></div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">y.yamada</div>
      <div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">山田 隆</div>
        <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">やまだ たかし</div>
      </div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">就職指導部</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">就職指導部長</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26 19:00</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>有効</span></div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">m.hayashi</div>
      <div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">林 未結</div>
        <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">はやし みゆう</div>
      </div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">就職指導部</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">就職指導部</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26 17:32</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>有効</span></div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">k.tanaka</div>
      <div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">田中 警三</div>
        <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">たなか けいぞう</div>
      </div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">教務部</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">教務部長</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/25 15:18</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>有効</span></div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">h.okamoto</div>
      <div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">岡本 豊</div>
        <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">おかもと ゆたか</div>
      </div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">事務局 / 情報システム</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#FCF6E8; color:#B07025; font:700 11px/1 'BIZ UDPGothic', system-ui;">システム管理者</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26 11:05</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>有効</span></div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 130px 1fr 150px 160px 130px 130px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff; opacity:0.6;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#EFEBE0;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#7B8294; text-decoration:line-through;">s.matsuda</div>
      <div>
        <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#7B8294;">松田 朝子</div>
        <div style="margin-top:2px; font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1;">2026/03 退職</div>
      </div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#7B8294; font:700 11px/1 'BIZ UDPGothic', system-ui;">担任</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#9CA3B1;">2026/03/28</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294;"><span style="width:6px; height:6px; border-radius:99px; background:#9CA3B1;"></span>停止</span></div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <!-- Footer info -->
    <div style="padding:14px 28px; background:#fff; border-top:1px solid #E2DED2; display:flex; align-items:center; gap:14px;">
      <div style="font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">
        <strong style="color:#1B2030;">ロール権限</strong>: 担任 → 自クラスの学生・就活、就職指導部 → 全体閲覧と企業管理、校長/教務部長 → 報告閲覧のみ、システム管理者 → すべて
      </div>
      <div style="flex:1;"></div>
      <div style="font:500 11px/1 'JetBrains Mono', monospace; color:#7B8294;">全 8 名</div>
    </div>
  </div>
</div>
</body>
</html>