<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
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
	<form action="CrossFit_Board_Update.jsp" name="boardView">
		<%@ include file="dbconn.jsp"%>
		<%
		String Post_ID = request.getParameter("Post_ID");
		String sid = (String) session.getAttribute("id");

		if (Post_ID == null) {
			// Post_ID가 null인 경우에 대한 처리
			out.println("게시글 ID가 없습니다.");
		} else {
			String sql = "SELECT Post_ID, Title, Content, " + "TO_CHAR(Creation_Date,'YY/MM/DD HH24:MI') AS CDATETIME, "
			+ "TO_CHAR(Modification_Date,'YY/MM/DD HH24:MI') AS MDATETIME, " + "View_Count, " + "B.MEMBER_ID "
			+ "FROM CROSSFIT_BOARD B " + "INNER JOIN CROSSFITMEMBERS M ON B.MEMBER_ID = M.MEMBER_ID "
			+ "WHERE Post_ID ='" + Post_ID + "'";

			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			String MEMBERID = rs.getString("MEMBER_ID");
			out.println(Post_ID);

			if (sid == null) {
				sid = "";
			}

			if (sid.equals(MEMBERID)) {
		%>
		<table>
			<%
			out.println("sid: " + sid);
			out.println("MEMBERID: " + MEMBERID);
			%>
			<tr>
				<th>제목</th>
				<td><input name="title" type="text"
					value="<%=rs.getString("Title")%>"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=rs.getString("MEMBER_ID")%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=rs.getString("View_Count")%></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=rs.getString("CDATETIME")%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input name="Content" type="text"
					value="<%=rs.getString("Content")%>"></td>
			</tr>
		</table>
		<input type="text" name="id" value="<%=Post_ID%>" hidden> <input
			type="button" onclick="board_delet('<%=Post_ID%>')" value="삭제">
		<input type="submit" value="수정">
		<%
		} else {
		%>
		<table>
			<tr>
				<%
				out.println("sid: " + sid);
				out.println("MEMBERID: " + MEMBERID);
				%>
				<th>제목</th>
				<td><%=rs.getString("Post_ID")%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=rs.getString("MEMBER_ID")%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=rs.getString("View_Count")%></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=rs.getString("CDATETIME")%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=rs.getString("Content")%></td>
			</tr>
		</table>
		<%
		}
		}
		%>
		<hr>
		<%

		%>
	</form>
</html>
<script>
	/* 게시글 삭제 */
	function board_delet(boardNo) {
		if (confirm("삭제합니까?")) {
			location.href = "CrossFit_Board_Delet.jsp?boardNo=" + boardNo;
		}
	}
</script>