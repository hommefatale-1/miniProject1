<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>CrossFit Kirby 아이디 중복확인</title>
</head>
<body>
	<form name="join">
		<%@ include file="dbconn.jsp"%>
		<%
		// 사용자가 입력한 userId와 dis(화면에 표시 여부)를 받아옵니다.
		String userId = request.getParameter("userId");
		String dis = request.getParameter("dis") != null ? request.getParameter("dis") : "none";

		// 데이터베이스에서 userId로 중복 확인을 수행합니다.
		String sql = "SELECT * FROM CROSSFITMEMBERS WHERE MEMBER_ID = '" + userId + "'";
		ResultSet rs = stmt.executeQuery(sql);
		%>
		<%
		if (rs.next()) {
			// 만약 중복된 아이디가 있다면 해당 메시지를 출력합니다.
			out.println("중복된 아이디 입니다");
		%>
		<div>
			<input type='text' name='userId1'>

			<!-- 중복된 아이디 메시지를 표시하는 부분 -->
			<div style="display: <%=dis%>; color: red" id="hello">아이디를 다시 입력해주세요</div>

			<input type='button' value='중복체크' onclick="fnidCheck()">
		</div>
		<%
		} else {
		// 중복된 아이디가 없다면 사용 가능한 아이디 메시지를 출력합니다.
		out.println("사용가능한 아이디 입니다.");
		%>
		<div>
		<input type="button" value="사용하기" onclick="popClose('<%=userId%>')">
		</div>
		<%
		}
		%>

	</form>
</body>
</html>
<script>
	var regex = /^[a-zA-Z0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\-]{4,12}$/;
	var join = document.join;

	function popClose(userId) {
		// 부모 창의 userId 입력란에 선택한 userId를 설정하고 현재 창을 닫습니다.
		opener.document.join.userId.value = userId;
		window.close();
	}

	function fnidCheck() {
		var id = join.userId1.value;
		if (id == "" || id == undefined || id == null) {
			alert("아이디를 입력해 주세요.");
			return;
		} else if (!regex.test(id)) {
			alert("숫자, 영어, 특수문자만 입력 가능하며, 4자에서 12자 이하로 입력해 주세요.");
			return;
		} else {
			// 중복 체크 페이지로 이동하며, 화면에 메시지를 표시하도록 설정합니다.
			location.href = "CrossFitJoinIdCheck.jsp?userId=" + id + "&dis=" + "block";
		}
	}
</script>