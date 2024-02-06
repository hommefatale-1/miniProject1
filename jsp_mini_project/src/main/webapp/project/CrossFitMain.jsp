<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CrossFit Kirby 메인화면</title>
<link rel="shortcut icon" href="../images/Crossfit.png" title="파비콘"
	type="image/x-icon">

<style>
@charset "UTF-8";

body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
	overflow: hidden;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: center;
	display: flex;
	justify-content: space-between;
	position: relative;
	overflow: hidden;
	text-decoration: none;
}

nav {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

nav a {
	color: #fff;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 10px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

nav a:hover {
	background-color: #555;
}

h1 a {
	color: #fff;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 10px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

h1 a:hover {
	color: black;
}

.right-header {
	display: flex;
	align-items: center;
}

input.login, input.loginOut {
	padding: 8px 15px;
	border: none;
	border-radius: 5px;
	background-color: gray;
	color: #fff;
	cursor: pointer;
}

.slideshow-container {
	max-width: 1500px;
	height: 1000px;
	/* 16:9 aspect ratio (1000px / 16 * 9) */
	position: relative;
	margin: auto;
	overflow: hidden;
}

.mySlides {
	display: none;
}

.fade {
	animation: fade 5s infinite;
}

@
keyframes fade { 0%, 100% {
	opacity: 0;
}

25










%
,
75










%
{
opacity










:










1








;
}
}
/* 이미지 */
.mySlides img {
	width: 100%;
	height: auto; /* height를 auto로 설정하여 가로 비율을 유지하도록 함 */
	object-fit: cover;
}
/* 풋터 */
footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
	position: fixed;
	bottom: 0;
	width: 100%;
	z-index: 1; /* 적절한 z-index 값으로 설정 */
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<%
	request.setCharacterEncoding("UTF-8");
	out.println(session.getAttribute("id"));
	String userId = (String) session.getAttribute("id");
	%>
	<header>
		<h1>
			<a href="CrossFitMain.jsp">CrossFit Kirby</a>
		</h1>
		<nav>
			<a href="CrossFitPromotion.jsp">promotion</a> <a href="#">Sns</a> <a
				href="#">Coach</a> <a href="CrossFitMember.jsp">Member</a> <a
				href="#">Facility</a> <a href="#">Event</a> <a href="#">Place</a> <a
				href="#">Enquire</a>
		</nav>
		<%
		if (userId != null && !userId.isEmpty()) {
			// 세션에 id가 있는 경우 로그인 상태로 간주
		%>
		<div class="right-header">
			<input class="loginOut" type="button" value="로그인아웃"
				onclick="fnloginOut()">
		</div>
		<!-- 로그아웃 페이지로 이동하도록 설정 -->
		<%
		} else {
		// 세션에 id가 없는 경우 로그아웃 상태로 간주
		%>
		<div class="right-header">
			<input class="login" type="button" value="로그인" onclick="fnlogin()">
		</div>
		<%
		}
		%>
	</header>
	<footer>
		<p>여기는 풋터 내용입니다.</p>
	</footer>
	<div class="slideshow-container">
		<div class="mySlides fade">
			<img src="../images/muscle_Up.PNG" alt="Background Image 1">
		</div>
		<div class="mySlides fade">
			<img src="../images/lof.PNG" alt="Background Image 2">
		</div>
		<div class="mySlides fade">
			<img src="../images/Powersnatch.PNG" alt="Background Image 3">
		</div>
	</div>
</body>
</html>
<script>
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		slides[slideIndex - 1].style.display = "block";
		setTimeout(showSlides, 5000); // Change slide every 5 seconds
	}
	// 로그인 화면으로 이동
	function fnlogin() {
		location.href = "CrossFitLogin.jsp";
	}
	/* 로그인 아웃 화면으로 이동 */
	function fnloginOut() {
		location.href = "CrossFitLoginOut.jsp";
	}
</script>