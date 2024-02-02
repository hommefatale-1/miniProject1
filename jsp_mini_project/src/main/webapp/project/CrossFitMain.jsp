<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CrossFit Kirby</title>
<link rel="shortcut icon" href="../images/Crossfit.png" title="파비콘"
	type="image/x-icon">
<link rel="stylesheet" href="../css/CrossFitMain.css">
<style>
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<header>
		<h1>CrossFit Kirby</h1>
		<nav>
			<a href="#">Home</a> <a href="#">Sns</a> <a href="#">Coach</a> <a
				href="#">Schedule</a> <a href="#">Facility</a> <a href="#">Event</a>
			<a href="#">Place</a> <a href="#">Enquire</a>
		</nav>
		<div class="right-header">
			<input class="login" type="button" value="로그인" onclick="fnlogin()">
		</div>
	</header>

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
	</script>