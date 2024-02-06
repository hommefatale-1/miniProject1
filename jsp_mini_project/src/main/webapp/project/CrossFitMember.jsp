<%@page import="javax.xml.stream.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원님들 정보</title>

</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<%
	out.println(session.getAttribute("id"));
	request.setCharacterEncoding("UTF-8");
	String userId = (String) session.getAttribute("id");
	String sql = "SELECT * FROM CROSSFITMEMBERS WHERE MEMBER_ID = '" + userId + "'";
	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		String membershipType = rs.getString("MEMBERSHIP_TYPE"); // 회원 등급을 가져옴
	%>

	<%-- 등급에 따라 다르게 보여줄려고 이동 --%>

	<%
	if ("대표님".equals(membershipType.trim())) {
	%>
	<script>
		window.location.href = "CrossFitMember1.jsp";
	</script>
	<%
	} else if ("코치님".equals(membershipType.trim())) {
	%>
	<script>
		window.location.href = "CrossFitMember2.jsp";
	</script>
	<%
	} else if ("일반회원".equals(membershipType.trim())) {
	%>
	<script>
		window.location.href = "CrossFitMember3.jsp";
	</script>
	<%
	} else {
	%>
	<script>
		alert("비회원은 사용이 불가합니다");
		out.println(membershipType);
	</script>
	<%
	}
	} else {
	%>
	<script>
		alert("비회원은 사용이 불가합니다");
		window.location.href = "CrossFitMain.jsp";
	</script>
	<%
	}
	%>
</body>
</html>

