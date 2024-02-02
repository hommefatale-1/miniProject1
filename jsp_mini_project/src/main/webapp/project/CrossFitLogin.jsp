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
	<form action="CrossFitLoginView.jsp" name="login"> 
	<%
	request.setCharacterEncoding("UTF-8");
	if (request.isRequestedSessionIdValid()) {

		session.invalidate();
	} else {
		out.println("세션없다");
	}
	%>
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
			<li>
				<div class="uBtn -icoType -id">
					<span class="text" style="padding: 0px;">
					<input type="text" name="id" style="width: 100%; height: 100%; border:none;"></span>
				</div>
			<li>
				<div class="uBtn -icoType -pwd">
					<span class="text" style="padding: 0px;">
					<input type="text" name="pwd"  style="width: 100%; height: 100%; border:none;"></span>
				</div>
			</li>
			<li>
				<input class="in" type="button" value="로그인" onclick="fnlogin()" >
			</li>
			<span class="or"><span>또는</span></span>
			<li><a href="#none" class="uBtn -icoType -phone"><span
					class="text">휴대폰 번호로 로그인</span></a></li>

			<li><a href="#none" class="uBtn -icoType -email"> <span
					calss="text">이메일로 로그인</span></a></li>

			<li><a href="#none" class="uBtn -icoType -naver"> <span
					calss="text">네이버로로 로그인</span></a></li>

			<li><a href="#none" class="uBtn -icoType -facebook"> <span
					calss="text">페이스북으로 로그인</span></a></li>

			<li><a href="#none" class="uBtn -icoType -apple"> <span
					calss="text">애플로 로그인</span></a></li>
		</ul>
		<div class="uCheckbox">
			<label> <input type="checkbox"> <span class="text">로그인상태
					유지</span>
			</label>
		</div>
		<p class="uJoin">
			"크로스핏커비 방문을 환영합니다" &nbsp; <a href="#none" onclick="fnjoin()"><strong>회원가입</strong></a>
		</p>
	</section>
	
	</from>
</body>
</html>
<script>
	function fnjoin() {
		
		location.href = "CrossFitJoin.jsp";
	}
	function fnlogin(){
		var login=document.login;
		if(login.id.value==""){
			alert("아이디 입력하셈");
			return ;
		} else if(login.pwd.value==""){
			alert("비밀번호 입력하셈");
			return;
		}
		
	}
	
</script>