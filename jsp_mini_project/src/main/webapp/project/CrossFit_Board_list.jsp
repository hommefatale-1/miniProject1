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
	String sql = "";
	
	String keyword = request.getParameter("keyword");
	if (keyword != null) {
		sql += " WHERE TITLE LIKE '%" + keyword + "%'";
	}
	sql += " ORDER BY CDATETIME DESC";
	ResultSet rs = stmt.executeQuery(sql);
	%>

	<from> <tavle>
	<div>
		<span>검색어 :</span> <input type="text" name="keyword"
			value="<%=keyword%>"> <input type="button" value="검색하기"
			onclick="search()">
	</div>
	<tr>
		<th></th>
	</tr></from>
</body>
</html>