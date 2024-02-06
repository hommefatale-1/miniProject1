<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp"%>
	<%
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String sid = (String) session.getAttribute("id");

	String sql = "INSERT INTO CROSSFIT_BOARD VALUES ("
	        + "BBS_SEQ1.NEXTVAL,"
	        + "'" + title + "',"
	        + "'" + contents + "',"
	        + "SYSDATE,"
	        + "SYSDATE,"
	        + "0,"
	        + "'" + sid + "')";
	stmt.executeUpdate(sql);	 
	 %>
	 
</body>
</html>
<script>
	alert("저장되었씁니다");
	location.href = "CrossFit_Board_list.jsp";
</script>