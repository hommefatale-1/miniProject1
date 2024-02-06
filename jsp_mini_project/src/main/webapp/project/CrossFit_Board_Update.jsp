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
	<
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String contents = request.getParameter("Content");
		String boardNo= request.getParameter("id");
		
		String sql 
		= "UPDATE CROSSFIT_BOARD SET"
		+ " TITLE = '" + title +"',"
		+ " CONTENT = '" + contents +"',"
		+ "MODIFICATION_DATE = SYSDATE "
		+ "WHERE POST_ID = '" + boardNo +"'";
		
		stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	alert("수정되었습니다");
	location.href="CrossFit_Board_list.jsp";
</script>