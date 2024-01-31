<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 : 크로스핏커비</title>
<link rel="icon" href="../images/Crossfit.png" title="파비콘">
<link rel="stylesheet" href="../css/style.css">
</head>

<body>
	<div id="header_container">
		<p calss="topLogo">
			<a href="#none"> <img src="../images/croosfit1.png" alt="크로스핏">
				<img src="../images/croosfitmain.png" alt="커비">
			</a>
		</p>
	</div>
	<section id="content">
		<h1 class="login">로그인</h1>
		<ul class="loginBtnList">
			<li><a href="#none" class="uBtn -icoType -phone"> <span
					class="text">휴대폰 번호로 로그인</span>
			</a> <span class="or"> <span>또는</span>
			</span></li>
			<li><a href="#none" class="uBtn -icoType -email"> <span
					calss="text">이메일로 로그인</span>
			</a></li>
			<li><a href="#none" class="uBtn -icoType -naver"> <span
					calss="text">네이버로로 로그인</span>
			</a></li>
			<li><a href="#none" class="uBtn -icoType -facebook"> <span
					calss="text">페이스북으로 로그인</span>
			</a></li>
			<li><a href="#none" class="uBtn -icoType -apple"> <span
					calss="text">애플로 로그인</span>
			</a></li>
		</ul>
		<dvi class="uCheckbox"> <label> <input type="checkbox">
			<span class="text">로그인상태 유지</span>
		</label> </dvi>
		<p class="uJoin">
			"크로스핏커비 방문을 환영합니다" &nbsp; <a href="#none" onclick="fnjoin()"><strong>회원가입</strong></a>
		</p>
	</section>
</body>
</html>
<script>
	function fnjoin() {
		location.href = "CrossFitJoin.jsp";
	}
</script>