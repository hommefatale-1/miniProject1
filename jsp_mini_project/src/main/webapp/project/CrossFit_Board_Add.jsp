<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	request.setCharacterEncoding("UTF-8");
	String sid = (String) session.getAttribute("id");
	String userId = request.getParameter("id");
	out.println(userId);
	out.println(sid);
	%>
	<form action="CrossFit_Board_Add_Save.jsp">
		<div>
			<div>제목 : <input name="title" type="text"></div>
			<div>내용 :</div>
			<textarea name="contents" rows="100" cols="100"></textarea>
			<div>
			<input>
			<input type="submit" value="작성">
			<input type="button" value="취소" onclick="history.back()">
			</div>
		</div>
	</form>
</body>
</html>