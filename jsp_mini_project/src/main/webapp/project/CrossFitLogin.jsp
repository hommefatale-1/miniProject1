<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CrossFit Kirby 로그인 메인페이지</title>
<link rel="icon" href="../images/Crossfit.png" title="파비콘">
<link rel="stylesheet" href="../css/style.css">
<style>
/* 모달 스타일 추가 */
.modal {
	/* 초기에는 숨김 */
	display: none; /* 초기에는 숨김 */
	position: fixed;
	z-index: 1;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%); /* 페이지 중앙으로 이동 */
	width: 80%; /* 모달 창 너비 조절 */
	max-width: 400px; /* 최대 너비 설정 */
	background-color: #fefefe;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.modal-content {
	position: relative;
}

.close 0 {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
}
/* 슬라이드 쇼 스타일 수정 */
.slideshow-container {
	position: relative;
	max-width: 1000px;
	margin: auto;
	overflow: hidden;
}

.mySlides {
	display: none;
	width: 100%;
}
</style>
</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	if(request.isRequestedSessionIdValid()){
		session.invalidate();
	}else{
		out.println("세션없다");
	}
	%>
	<form action="CrossFitLoginView.jsp" name="login">
		<div id="header_container">
			<p class="topLogo">
				<a href="CrossFitMain.jsp"> <img src="../images/croosfit1.png" alt="크로스핏">
					<img src="../images/croosfitmain.png" alt="커비">
				</a>
			</p>
		</div>
		<section id="content">
			<h1 class="login">로그인</h1>
			<ul class="loginBtnList">
				<li>
					<div class="uBtn -icoType -id">
						<span class="text" style="padding: 0px;"> <input
							type="text" name="id"
							style="width: 100%; height: 100%; border: none;">
						</span>
					</div>
				</li>
				<li>
					<div class="uBtn -icoType -pwd">
						<span class="text" style="padding: 0px;"> <input
							type="text" name="pwd"
							style="width: 100%; height: 100%; border: none;">
						</span>
					</div>
				</li>
				<li><input class="in" type="submit" value="로그인"
					onclick="return fnlogin()"></li>
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
	</form>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close 0" onclick="closeModal()">X</span>
			<p id="modalMessage"></p>
		</div>
	</div>
</body>
</html>
<script>
	function fnjoin() {

		location.href = "CrossFitJoin.jsp";
	}
	function fnlogin() {
		if(login.id.value == "" && login.pwd.value == ""){
			openModal("아이디와 비밀번호를 입력해 주세요");
			return false;
		}else if (login.id.value == "") {
			openModal("아이디를 입력해 주세요");
			return false;
		} else if (login.pwd.value == "") {
			openModal("비밀번호를 다시 입력해 주세요");
			return false;
		}
		return true;
	}
	/* 모달 창 열기 */
	function openModal(message, isSuccessMessage) {
		var modal = document.getElementById("myModal");
		var modalMessage = document.getElementById("modalMessage");

		// 메시지 설정
		modalMessage.innerText = message;

		// 성공 메시지인 경우 스타일 추가
		if (isSuccessMessage) {
			modalMessage.style.color = "green";
		} else {
			modalMessage.style.color = "red";
		}

		// 모달 창 열기
		modal.style.display = "block";
	}
	/* 모달 창 닫기 */
	function closeModal() {
		var modal = document.getElementById("myModal");
		// 모달 창 닫기
		modal.style.display = "none";
	}
</script>