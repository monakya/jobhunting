<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/screen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/screens/15-login.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — メインメニュー</title>
</head>
<body>
<div class="page-label">JMS / メインメニュー</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1280px;" data-screen-label="メインメニュー">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    メインメニュー　<span style="color:#7B8294; font-weight:500;">ログイン直後の画面</span>
  </div>

  <div style="background:#F4F1EA; border:1px solid #C7C0AF; border-radius:4px; box-shadow:0 2px 14px rgba(20,25,45,.08); overflow:hidden;">

    <!-- App chrome -->
    <div style="display:flex; align-items:center; gap:0; height:48px; background:#1B2030; color:#E2DED2; padding:0 20px;">
      <div style="font:700 13px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em;">JMS</div>
      <div style="margin-left:18px; opacity:.55; font:500 12px/1 'Noto Sans JP', system-ui;">Job Hunting Management System</div>
      <div style="flex:1;"></div>
      <div style="display:flex; gap:18px; font:500 12px/1 'Noto Sans JP', system-ui; opacity:.6;">
        <span>学生</span><span>企業</span><span>就職活動</span><span>活動状況報告</span><span>管理</span>
      </div>
      <div style="flex:1;"></div>
      <div style="display:flex; align-items:center; gap:10px;">
        <span style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.75;">S2A1 担任</span>
        <div style="width:28px; height:28px; border-radius:99px; background:#2C4A7A; color:#fff; display:flex; align-items:center; justify-content:center; font:700 12px/1 'BIZ UDPGothic', system-ui;">中</div>
      </div>
    </div>

    <!-- Welcome -->
    <div style="padding:24px 28px 18px 28px; border-bottom:1px solid #E2DED2;">
      <div style="display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">こんにちは</div>
          <div style="margin-top:6px; font:700 24px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">中村 先生<span style="font:500 13px/1 'Noto Sans JP', system-ui; color:#7B8294; margin-left:8px;">S2A1 担任 / 2026 年度</span></div>
        </div>
        <div style="flex:1;"></div>
        <div style="text-align:right; font:500 11px/1.5 'Noto Sans JP', system-ui; color:#7B8294;">
          
          
        </div>
      </div>
    </div>

    <!-- Today summary banner -->
    <div style="padding:22px 28px 0 28px;">
      <div style="background:#1B2030; color:#fff; border-radius:4px; padding:18px 22px; display:grid; grid-template-columns:repeat(4, 1fr); gap:24px;">
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em; opacity:.7;">本日の試験</div>
          <div style="margin-top:8px; display:flex; align-items:baseline; gap:6px;">
            <div style="font:500 28px/1 'JetBrains Mono', monospace;">3</div>
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.6;">名</div>
          </div>
        </div>
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em; opacity:.7;">明日の試験</div>
          <div style="margin-top:8px; display:flex; align-items:baseline; gap:6px;">
            <div style="font:500 28px/1 'JetBrains Mono', monospace;">5</div>
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.6;">名</div>
          </div>
        </div>
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em; color:#F5EBD7;">承諾期限 7日以内</div>
          <div style="margin-top:8px; display:flex; align-items:baseline; gap:6px; color:#F5EBD7;">
            <div style="font:500 28px/1 'JetBrains Mono', monospace;">2</div>
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.8;">名</div>
          </div>
        </div>
        <div>
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; letter-spacing:.08em; opacity:.7;">クラス内定率</div>
          <div style="margin-top:8px; display:flex; align-items:baseline; gap:6px;">
            <div style="font:500 28px/1 'JetBrains Mono', monospace; color:#7CB394;">60.0</div>
            <div style="font:500 11px/1 'Noto Sans JP', system-ui; opacity:.6;">%</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Menu tiles -->
    <div style="padding:18px 28px 24px 28px;">
      <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294; letter-spacing:.1em;">メニュー</div>

      <div style="margin-top:12px; display:grid; grid-template-columns:repeat(3, 1fr); gap:14px;">

        <a style="background:#fff; border:1px solid #E2DED2; border-radius:6px; padding:22px 20px; display:block; text-decoration:none; cursor:pointer;">
          <div style="display:flex; align-items:center; gap:12px;">
            <div style="width:36px; height:36px; border-radius:4px; background:#E8EDF5; color:#2C4A7A; display:flex; align-items:center; justify-content:center; font:700 18px/1 'BIZ UDPGothic', system-ui;">⚀</div>
            <div style="flex:1;">
              <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">学生</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">Students</div>
            </div>
            <div style="font:700 18px/1 'BIZ UDPGothic', system-ui; color:#9CA3B1;">›</div>
          </div>
          <div style="margin-top:12px; font:500 12px/1.5 'Noto Sans JP', system-ui; color:#4B5263;">学生情報の閲覧・登録・変更。進級・卒業処理。</div>
          <div style="margin-top:10px; display:flex; gap:6px; flex-wrap:wrap;">
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FBF9F3; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">在籍 40 名</span>
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FBF9F3; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">2 クラス</span>
          </div>
        </a>

        <a style="background:#fff; border:1px solid #E2DED2; border-radius:6px; padding:22px 20px; display:block; text-decoration:none; cursor:pointer;">
          <div style="display:flex; align-items:center; gap:12px;">
            <div style="width:36px; height:36px; border-radius:4px; background:#E8EDF5; color:#2C4A7A; display:flex; align-items:center; justify-content:center; font:700 18px/1 'BIZ UDPGothic', system-ui;">◨</div>
            <div style="flex:1;">
              <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">企業</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">Companies</div>
            </div>
            <div style="font:700 18px/1 'BIZ UDPGothic', system-ui; color:#9CA3B1;">›</div>
          </div>
          <div style="margin-top:12px; font:500 12px/1.5 'Noto Sans JP', system-ui; color:#4B5263;">採用企業の一元管理。募集職種、採用実績、一時名義企業。</div>
          <div style="margin-top:10px; display:flex; gap:6px; flex-wrap:wrap;">
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FBF9F3; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">218 社</span>
            
          </div>
        </a>

        <a style="background:#1B2030; color:#fff; border-radius:6px; padding:22px 20px; display:block; text-decoration:none; cursor:pointer; position:relative; overflow:hidden;">
          <div style="display:flex; align-items:center; gap:12px;">
            <div style="width:36px; height:36px; border-radius:4px; background:rgba(255,255,255,.15); color:#fff; display:flex; align-items:center; justify-content:center; font:700 18px/1 'BIZ UDPGothic', system-ui;">◉</div>
            <div style="flex:1;">
              <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui;">就職活動</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; opacity:.6;">Job Hunting</div>
            </div>
            <div style="font:700 18px/1 'BIZ UDPGothic', system-ui; opacity:.5;">›</div>
          </div>
          <div style="margin-top:12px; font:500 12px/1.5 'Noto Sans JP', system-ui; opacity:.85;">受験情報の記録。選考・結果・承諾期限を一元管理。</div>
          <div style="margin-top:10px; display:flex; gap:6px; flex-wrap:wrap;">
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:rgba(255,255,255,.15); font:700 10px/1 'BIZ UDPGothic', system-ui;">活動中 142 件</span>
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#B07025; color:#fff; font:700 10px/1 'BIZ UDPGothic', system-ui;">承諾期限 2 名</span>
          </div>
        </a>

        <a style="background:#fff; border:1px solid #E2DED2; border-radius:6px; padding:22px 20px; display:block; text-decoration:none; cursor:pointer;">
          <div style="display:flex; align-items:center; gap:12px;">
            <div style="width:36px; height:36px; border-radius:4px; background:#E3EFE7; color:#2F6E4F; display:flex; align-items:center; justify-content:center; font:700 18px/1 'BIZ UDPGothic', system-ui;">▰</div>
            <div style="flex:1;">
              <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">活動状況報告</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">Report</div>
            </div>
            <div style="font:700 18px/1 'BIZ UDPGothic', system-ui; color:#9CA3B1;">›</div>
          </div>
          <div style="margin-top:12px; font:500 12px/1.5 'Noto Sans JP', system-ui; color:#4B5263;">学科全体の状況をダッシュボードで可視化。週別・クラス別。</div>
          <div style="margin-top:10px; display:flex; gap:6px; flex-wrap:wrap;">
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 10px/1 'BIZ UDPGothic', system-ui;">内定率 62.5%</span>
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FBF9F3; color:#4B5263; font:700 10px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">要フォロー 12</span>
          </div>
        </a>

        <a style="background:#fff; border:1px solid #E2DED2; border-radius:6px; padding:22px 20px; display:block; text-decoration:none; cursor:pointer;">
          <div style="display:flex; align-items:center; gap:12px;">
            <div style="width:36px; height:36px; border-radius:4px; background:#EEEAE0; color:#4B5263; display:flex; align-items:center; justify-content:center; font:700 18px/1 'BIZ UDPGothic', system-ui;">⚙</div>
            <div style="flex:1;">
              <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">管理</div>
              <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">Admin</div>
            </div>
            <div style="font:700 18px/1 'BIZ UDPGothic', system-ui; color:#9CA3B1;">›</div>
          </div>
          <div style="margin-top:12px; font:500 12px/1.5 'Noto Sans JP', system-ui; color:#4B5263;">アカウント、職種・地域マスタ、システム設定。</div>
          <div style="margin-top:10px; display:flex; gap:6px; flex-wrap:wrap;">
            <span style="display:inline-block; padding:3px 8px; border-radius:99px; background:#FBF9F3; color:#7B8294; font:700 10px/1 'BIZ UDPGothic', system-ui; border:1px solid #E2DED2;">システム管理者のみ</span>
          </div>
        </a>

        

      </div>
    </div>
  </div>
</div>
</body>
</html>