<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 전용 고객관리</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
	overflow: hidden;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: center;
	display: flex;
	justify-content: space-between;
	position: relative;
	overflow: hidden;
	text-decoration: none;
}

nav {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

nav a {
	color: #fff;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 10px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

nav a:hover {
	background-color: #555;
}

h1 a {
	color: #fff;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 10px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

h1 a:hover {
	color: black;
}

.right-header {
	display: flex;
	align-items: center;
}

input.login, input.loginOut {
	padding: 8px 15px;
	border: none;
	border-radius: 5px;
	background-color: gray;
	color: #fff;
	cursor: pointer;
}

table, tr, td {
	border: 1px solid black;
	padding: 5px 10px;
	border-collapse: collapse;
	text-align: center;
}

th {
	background-color: aqua;
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	out.println(session.getAttribute("id"));
	request.setCharacterEncoding("UTF-8");
	String userId = (String) session.getAttribute("id");
	String sql = "SELECT * FROM CROSSFITMEMBERS";
	String word = request.getParameter("keyword");
	String keyword = word != null ? word : "";
	if (keyword != null) {
		sql += " WHERE FULL_NAME LIKE '%" + keyword + "%'" + " OR MEMBER_ID LIKE '%" + keyword + "%'";
	}
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<form name="user_list">
		<header>
			<h1>
				<a href="CrossFitMain.jsp">CrossFit Kirby</a>
			</h1>
			<nav>
				<a href="CrossFitPromotion.jsp">promotion</a> 
				<a href="#">Sns</a> 
				<a href="#">Coach</a> 
				<a href="CrossFitMember.jsp">Member</a> 
				<a href="CrossFit_Board_list.jsp">post</a>  
				<a href="#">Event</a> 
				<a href="#">Place</a> 
				<a href="#">Enquire</a>
			</nav>

			<div class="right-header">
				<%
				if (userId != null && !userId.isEmpty()) {
				%>
				<input class="loginOut" type="button" value="로그인아웃"
					onclick="fnloginOut()">
				<%
				} else {
				%>
				<input class="login" type="button" value="로그인" onclick="fnlogin()">
				<%
				}
				%>
			</div>
		</header>
		<section>
			<div>
				<span>검색어 :</span> <input type="text" name="keyword"
					value="<%=keyword%>"> <input type="button" value="검색하기"
					onclick="fnsearch()">
			</div>
			<table border="1">
				<tr>
					<th>회원 이름</th>
					<th>회원 성별</th>
					<th>회원 생년월일</th>
					<th>회원 취미</th>
					<th>회원 자기소개</th>
					<th>계정 수정</th>
					<th>계정 삭제</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("FULL_NAME")%></td>
					<td><%=rs.getString("GENDER")%></td>
					<td><%=rs.getString("BIRTH_DATE")%></td>
					<td><%=rs.getString("HOBBY")%></td>
					<td><%=rs.getString("CMT")%></td>
					<td>
						<%
						String idch = rs.getString("MEMBER_ID");
						if (userId != null && userId.equals(idch)) {
						%> <input type="button"
						onclick="userUpdate('<%=rs.getString("MEMBER_ID")%>')" value="수정">
						<%
						}
						%>
					</td>
					<td>
						<%
						if (userId != null && userId.equals(idch)) {
						%> <input type="button"
						onclick="userDelete('<%=rs.getString("MEMBER_ID")%>')" value="삭제">
						<%
						}
						%>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
	</form>
</body>
</html>
<script>
	// 로그인 화면으로 이동
	function fnlogin() {
		location.href = "CrossFitLogin.jsp";
	}

	// 로그인 아웃 화면으로 이동
	function fnloginOut() {
		location.href = "CrossFitLoginOut.jsp";
	}

	// 검색하기
	var user = document.user_list;
	function fnsearch() {
		location.href = "CrossFitMember3.jsp?keyword=" + user.keyword.value;
	}

	/* 회원정보 수정 */
	function userUpdate(USERID) {
		if (confirm("수정하겠습니까???")) {
			location.href = "boss_User_Update.jsp?id=" + USERID;
		}
	}
	/* 회원정보 삭제 */
	function userDelete(USERID) {
		if (confirm("삭제하겠습니까???")) {
			location.href = "boss_User_Delete.jsp?id=" + USERID;
		}

	}
</script>