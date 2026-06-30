<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/screen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/screens/15-login.css">
<title>JMS — ログイン</title>
</head>
<body>
<div class="page-label">JMS / ログイン</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:480px;" data-screen-label="ログイン">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    ログイン画面
  </div>

  <!-- desktop background -->
  <div style="background:#1B2030; border-radius:6px; padding:40px 0; box-shadow:0 8px 32px rgba(20,25,45,.18); height:660px; display:flex; align-items:center; justify-content:center; position:relative; overflow:hidden;">
    <!-- decoration -->
    <div style="position:absolute; top:-80px; right:-80px; width:280px; height:280px; border-radius:99px; background:radial-gradient(circle, rgba(44,74,122,.4), transparent 70%);"></div>
    <div style="position:absolute; bottom:-60px; left:-60px; width:240px; height:240px; border-radius:99px; background:radial-gradient(circle, rgba(176,112,37,.18), transparent 70%);"></div>

    <!-- card -->
    <div style="background:#F4F1EA; border-radius:8px; padding:38px 36px; width:340px; box-shadow:0 12px 40px rgba(0,0,0,.35); position:relative; z-index:1;">
      <!-- brand -->
      <div style="display:flex; align-items:center; gap:12px;">
        <div style="width:42px; height:42px; background:#1B2030; color:#fff; display:flex; align-items:center; justify-content:center; border-radius:4px; font:700 16px/1 'BIZ UDPGothic', system-ui; letter-spacing:.06em;">JMS</div>
        <div>
          <div style="font:700 14px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">Job Hunting Management System</div>
          <div style="margin-top:3px; font:500 10px/1 'Noto Sans JP', system-ui; color:#7B8294;">KYUSHO-JOHO 就職指導管理</div>
        </div>
      </div>

      <div style="margin-top:28px; font:700 18px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">サインイン</div>
      <div style="margin-top:4px; font:500 11px/1.4 'Noto Sans JP', system-ui; color:#7B8294;">校内配布の ID とパスワードを入力</div>

      <!-- ID -->
      <div style="margin-top:18px;">
        <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263;">ユーザー ID</div>
        <div style="margin-top:6px; display:flex; align-items:center; gap:8px; height:40px; padding:0 12px; border:1px solid #C7C0AF; border-radius:4px; background:#fff; font:500 13px/1 'JetBrains Mono', monospace; color:#1B2030;">t.nakamura</div>
      </div>

      <!-- Password -->
      <div style="margin-top:14px;">
        <div style="display:flex; align-items:center;">
          <div style="font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263; flex:1;">パスワード</div>
          <a style="font:500 10px/1 'Noto Sans JP', system-ui; color:#2C4A7A;">パスワードを忘れた方</a>
        </div>
        <div style="margin-top:6px; display:flex; align-items:center; gap:8px; height:40px; padding:0 12px; border:1px solid #C7C0AF; border-radius:4px; background:#fff;">
          <div style="font:500 16px/1 'JetBrains Mono', monospace; color:#1B2030; letter-spacing:6px;">・・・・・・・・・・・・</div>
          <div style="flex:1;"></div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; cursor:pointer;">表示</div>
        </div>
      </div>

      <!-- Remember -->
      <div style="margin-top:14px; display:flex; align-items:center; gap:8px;">
        <div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff; display:flex; align-items:center; justify-content:center; color:#2C4A7A; font:700 11px/1 monospace;">✓</div>
        <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#4B5263;">この端末で ID を記憶させる</div>
      </div>

      <!-- Submit -->
      <button style="margin-top:22px; width:100%; height:44px; border:0; background:#2C4A7A; color:#fff; border-radius:4px; font:700 13px/1 'BIZ UDPGothic', system-ui;">ログイン</button>

      <!-- LAN notice -->
      

      <!-- Footer -->
      
    </div>
  </div>
</div>
</body>
</html>