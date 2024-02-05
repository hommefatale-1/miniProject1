<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CrossFit Kirby</title>
<style>
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

.video-container {
	position: relative;
	width: 100%;
	max-width: 100vw;
	overflow: hidden;
	padding-top: 56.25%; /* 16:9 aspect ratio (height / width * 100) */
	margin-top: 20px; /* Add margin to separate video from header */
}

.video-container video {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.video-container video::-webkit-media-controls {
	display: none !important;
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

/* Responsive Styles */
@media screen and (max-width: 768px) {
	nav {
		flex-direction: column;
	}
	nav a {
		margin: 5px;
	}
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
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
		out.println(session.getAttribute("id"));
		String userId = (String) session.getAttribute("id");
		if (userId != null && !userId.isEmpty()) {
		%>
		<div class="right-header">
			<input class="loginOut" type="button" value="로그인아웃"
				onclick="fnloginOut()">
		</div>
		<%
		} else {
		%>
		<div class="right-header">
			<input class="login" type="button" value="로그인" onclick="fnlogin()">
		</div>
		<%
		}
		%>
	</header>

	<!-- 비디오 추가 -->
	<div class="video-container">
		<video width="100%" height="auto" controls>
			<source src="../vidio/CrossFit.mp4" type="video/mp4">
		</video>
	</div>
	<!-- 비디오 추가 끝 -->

	<script>
		function fnlogin() {
			location.href = "CrossFitLogin.jsp";
		}

		function fnloginOut() {
			location.href = "CrossFitLoginOut.jsp";
		}
	</script>
</body>
</html>