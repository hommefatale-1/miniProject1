<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<style>
table, tr, td, th {
	border: 1px solid black;
	padding: 5px 10px;
	border-collapse: collapse;
	text-align: center;
}

th {
	background-color: skyblue;
}

a {
	color: black;
	font-weight: bold;
	text-decoration: none;
}

a:visited {
	color: black;
}

a:hover {
	color: blue;
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String userId = (String) session.getAttribute("id");

	String sql = "SELECT Post_ID, Title, Content, " 
	+ "TO_CHAR(Creation_Date,'YY/MM/DD HH24:MI') AS CDATETIME, "
	+ "TO_CHAR(Modification_Date,'YY/MM/DD HH24:MI') AS MDATETIME, "
	+ "View_Count, "
	+ "B.MEMBER_ID "
	+ "FROM CROSSFIT_BOARD B "
	+ "INNER JOIN CROSSFITMEMBERS M ON B.MEMBER_ID = M.MEMBER_ID"
	;
	String keyword = request.getParameter("keyword");

	if (keyword != null) {
		sql += " WHERE TITLE LIKE '%" + keyword + "%'";
	}
	sql += " ORDER BY CDATETIME DESC";
	ResultSet rs = stmt.executeQuery(sql);
		out.println(userId);
	
	%>

	<form name="board_list">
		<div>
			<span>검색어 :</span> <input type="text" name="keyword"
				value="<%=keyword%>"> <input type="button" value="검색하기"
				onclick="search()">
		</div>
		<table>
			<tr>
				<th>게시글 번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>수정일자</th>
				<th>조회수</th>
				<th>작성자</th>
			</tr>
			<%
		while(rs.next()){
			%>

			<tr>
				<td><%= rs.getString("Post_ID")%> </td>
				<td><a href="#" onclick="fnboard_modify('<%= rs.getString("Post_ID")%>')"><%= rs.getString("Title")%> </td>
				<td><%= rs.getString("Content")%> </td>
				<td><%= rs.getString("CDATETIME")%> </td>
				<td><%= rs.getString("MDATETIME")%> </td>
				<td><%= rs.getString("View_Count")%> </td>
				<td><%= rs.getString("MEMBER_ID")%> </td>
			</tr>
			<%
			}
			%>
			
		</table>
	<div>
		<input type="button" value="글쓰기" onclick="fnboard_Add('<%= userId%>')" >
	</div>
	</form>
</body>
</html>
<script>
	/* 검색하기 */
	var board = document.board_list;
	function search() {
		location.href = "CrossFit_Board_list.jsp?keyword="
				+ board.keyword.value;
	}
	function fnboard_Add(id) {
		location.href = "CrossFit_Board_Add.jsp?id="+id;
	}
	function fnboard_modify(Post_ID){
		location.href="CrossFit_Board_Modify.jsp?Post_ID=" + Post_ID;
	}
</script>