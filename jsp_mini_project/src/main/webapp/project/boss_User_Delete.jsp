<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원정보 삭제</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String userId = request.getParameter("id");
	String sql = "DELETE FROM CROSSFITMEMBERS"
				+ " WHERE MEMBER_ID ='"+ userId +"'";
	stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	alert("삭제되었습니다");
	location.href="CrossFitMember1.jsp";
</script>