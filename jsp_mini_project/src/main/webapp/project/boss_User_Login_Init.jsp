<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
	String id = request.getParameter("id");
	String sql = "UPDATE CROSSFITMEMBERS SET" 
				+ " CNT = 0 "
				+ "WHERE MEMBER_ID = '" + id + "'";
	stmt.executeQuery(sql);
	%>
</body>
</html>
<script>
	 alert("초기화 되었습니다");
	 location.href = "CrossFitMember1.jsp";
</script>