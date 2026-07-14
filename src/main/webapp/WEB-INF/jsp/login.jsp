<%-- ログイン（画面 15）。AuthFilter の外なので共通ヘッダは使わない --%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>JMS — ログイン</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/auth.css">
</head>
<body>
	<div class="login-page">
		<div class="login-card">
			<div class="login-head">
				<span class="logo-mark">JMS</span>
				<div>
					<div class="t1">就職活動管理システム — Job Hunting Management System</div>
					<div class="t2">学生の就職活動状況・企業情報・内定状況を一元管理する校内システムです。</div>
				</div>
			</div>
			<h1>サインイン</h1>
			<c:if test="${not empty errorMessage}">
				<div class="msg-error">
					<c:out value="${errorMessage}" />
				</div>
			</c:if>
			<form method="post" action="${pageContext.request.contextPath}/login">
				<div class="login-field">
					<label for="accountId">ユーザーID</label> <input type="text"
						id="accountId" name="accountId"
						value="<c:out value='${accountId}'/>" autofocus>
				</div>
				<div class="login-field">
					<label for="password">パスワード</label>
					<div class="pw-wrap">
						<input type="password" id="password" name="password">
						<button type="button" class="pw-toggle" onclick="togglePw(this)">表示</button>
					</div>
				</div>
				<button type="submit" class="btn login-submit">ログイン</button>
			</form>
			<div class="login-help">
				ログインできない場合は就職指導部までご連絡ください。<br>
				担任・就職指導部・校長・システム管理者で表示メニューが切り替わります。
			</div>
			<script>
				function togglePw(btn) {
					const pw = document.getElementById('password');
					const show = pw.type === 'password';
					pw.type = show ? 'text' : 'password';
					btn.textContent = show ? '隠す' : '表示';
				}
			</script>
		</div>
	</div>
</body>
</html>
