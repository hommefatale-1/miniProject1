<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 아웃페이지</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	  // 세션 무효화
    session.invalidate();
	%>
</body>
</html>
<script>
	alert("로그아웃이 되었습니다");
	location.href="CrossFitMain.jsp";
</script>