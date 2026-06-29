<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/screen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/screens/15-login.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JMS — 学生情報 一覧</title>
</head>
<body>
<div class="page-label">JMS / 学生情報 一覧</div>
<a class="back-link" href="../index.html">← 画面一覧</a>
<div class="screen-frame" style="width:1480px;" data-screen-label="学生情報 一覧">
  <div data-drags-parent="1" style="position:absolute; top:-26px; left:0; font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030; letter-spacing:.04em;">
    学生情報 一覧　<span style="color:#7B8294; font-weight:500;">在籍状況・あっせん・志望をまとめて把握</span>
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

    <!-- Page header -->
    <div style="padding:22px 28px 18px 28px; border-bottom:1px solid #E2DED2;">
      <div style="display:flex; align-items:flex-end; gap:16px;">
        <div>
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294; letter-spacing:.08em;">学生管理</div>
          <div style="margin-top:6px; font:700 22px/1.2 'BIZ UDPGothic', system-ui; color:#1B2030;">学生情報 一覧</div>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; gap:8px;">
          <button style="height:36px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">CSV 出力</button>
          <button style="height:36px; padding:0 14px; border:1px solid #C7C0AF; background:#fff; color:#1B2030; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">進級・卒業処理</button>
          <button style="height:36px; padding:0 16px; border:1px solid #2C4A7A; background:#2C4A7A; color:#fff; border-radius:3px; font:700 12px/1 'BIZ UDPGothic', system-ui;">＋ 学生を登録</button>
        </div>
      </div>

      <!-- KPI strip -->
      <div style="margin-top:18px; display:grid; grid-template-columns:repeat(6, 1fr); gap:12px;">
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">在籍中</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">38<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">休学</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">1<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">退学</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#1B2030;">1<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">あっせん継続</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#2C4A7A;">34<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">辞退</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#A04B3C;">3<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
        </div>
        <div style="border:1px solid #E2DED2; border-radius:3px; padding:12px 14px; background:#fff;">
          <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">内定保有</div>
          <div style="margin-top:6px; font:500 22px/1 'JetBrains Mono', monospace; color:#2F6E4F;">9<span style="font-size:12px; color:#7B8294; margin-left:4px;">名</span></div>
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
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">あっせん</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">継続中</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">志望地域</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">すべて</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="display:flex; align-items:center; gap:6px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px;">
          <span style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">志望職種</span>
          <span style="font:700 12px/1 'BIZ UDPGothic', system-ui; color:#1B2030;">すべて</span>
          <span style="color:#7B8294;">▾</span>
        </div>
        <div style="flex:1;"></div>
        <div style="display:flex; align-items:center; gap:8px; height:34px; padding:0 12px; border:1px solid #C7C0AF; background:#fff; border-radius:3px; min-width:260px;">
          <span style="color:#7B8294;">⌕</span>
          <span style="font:400 12px/1 'Noto Sans JP', system-ui; color:#9CA3B1;">氏名・カナ・学籍番号で検索</span>
        </div>
      </div>
    </div>

    <!-- Table header -->
    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:10px 28px; background:#EFEBE0; border-bottom:1px solid #E2DED2; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#4B5263; letter-spacing:.04em;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div>クラス</div><div>学籍番号</div><div>氏名</div><div>性別</div><div>在籍</div><div>あっせん</div><div>志望地域</div><div>志望職種</div><div>内定状況</div><div>最終活動</div><div></div>
    </div>

    <!-- rows -->
    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-01</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240001</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">青木 真央<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">あおき まお</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">女</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡県内</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SE / プログラマ</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">活動中 3社</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FBF9F3;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-03</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240003</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">石橋 蓮<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">いしばし れん</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">男</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">北九州市</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">組込 / ハード</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">活動中 2社</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/25</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-05</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240005</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">大野 葵<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">おおの あおい</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">女</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡県内</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">Web 開発</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E3EFE7; color:#2F6E4F; font:700 11px/1 'BIZ UDPGothic', system-ui;">内定 1社</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/24</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-07</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240007</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">梶原 透花<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">かじわら とうか</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">女</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#7B8294;"><span style="width:6px; height:6px; border-radius:99px; background:#7B8294;"></span>休学</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-08</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240008</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">川村 慎吾<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">かわむら しんご</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">男</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡県内</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SI</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#2F6E4F; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui;">承諾済</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/20</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-11</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240011</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">佐藤 美海<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">さとう みう</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">女</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡市</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">SE / プログラマ</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">活動中 4社</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-14</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240014</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">高田 圭<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">たかだ けい</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">男</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#A04B3C;">辞退</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡市</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">進学希望</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-18</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240018</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">林 ゆい<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">はやし ゆい</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">女</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡県内</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">製造 / 品質</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#E8EDF5; color:#2C4A7A; font:700 11px/1 'BIZ UDPGothic', system-ui;">活動中 2社</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#FCF6E8;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #B07025; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-21</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240021</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">古川 拓実<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">ふるかわ たくみ</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">男</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡市</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">Web 開発</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#B07025; color:#fff; font:700 11px/1 'BIZ UDPGothic', system-ui;">承諾期限</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#4B5263;">06/26</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">S2A1-25</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#1B2030;">240025</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#1B2030;">山口 ひかり<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">やまぐち ひかり</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">女</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#2F6E4F;"><span style="width:6px; height:6px; border-radius:99px; background:#2F6E4F;"></span>在籍中</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">継続中</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">福岡市</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#4B5263;">Web デザイン</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; padding:3px 8px; border-radius:99px; background:#EEEAE0; color:#4B5263; font:700 11px/1 'BIZ UDPGothic', system-ui;">未活動</span></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <div style="display:grid; grid-template-columns:32px 56px 96px 1fr 50px 96px 110px 130px 150px 110px 110px 64px; align-items:center; padding:12px 28px; border-bottom:1px solid #EFECE3; background:#fff;">
      <div style="display:flex; align-items:center; justify-content:center;"><div style="width:14px; height:14px; border:1px solid #9CA3B1; border-radius:2px; background:#fff;"></div></div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#9CA3B1;">S2A1-28</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#9CA3B1;">240028</div>
      <div style="font:700 13px/1.3 'BIZ UDPGothic', system-ui; color:#9CA3B1;">渡辺 直<div style="font:500 10px/1.2 'Noto Sans JP', system-ui; color:#9CA3B1; margin-top:2px;">わたなべ なお</div></div>
      <div style="font:500 12px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">男</div>
      <div><span style="display:inline-flex; align-items:center; gap:5px; font:700 11px/1 'BIZ UDPGothic', system-ui; color:#A04B3C;"><span style="width:6px; height:6px; border-radius:99px; background:#A04B3C;"></span>退学</span></div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 11px/1.3 'Noto Sans JP', system-ui; color:#9CA3B1;">—</div>
      <div style="font:500 12px/1.3 'JetBrains Mono', monospace; color:#9CA3B1;">—</div>
      <div style="text-align:right; color:#7B8294;">⋯</div>
    </div>

    <!-- Pagination -->
    <div style="display:flex; align-items:center; gap:14px; padding:14px 28px; background:#fff; border-top:1px solid #E2DED2;">
      <div style="font:500 11px/1 'Noto Sans JP', system-ui; color:#7B8294;">全 40 名中 1–11 名を表示</div>
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
</body>
</html>