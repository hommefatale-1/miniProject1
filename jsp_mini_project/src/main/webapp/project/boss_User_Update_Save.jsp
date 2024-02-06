<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원정보 저장</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	String pwd1 = request.getParameter("pwd1");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	String birth_Year = request.getParameter("birth_Year");
	String birth_Month = request.getParameter("birth_Month");
	String birth_Day = request.getParameter("birth_Day");
	String address = request.getParameter("address");
	String registration = request.getParameter("registration");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String membership = request.getParameter("membership");
	String hobby = request.getParameter("hobby");
	String comment = request.getParameter("comment");
	String phone = phone1 + phone2 + phone3;
	String birth = birth_Year + birth_Month + birth_Day;

/* 	out.println(
			"UPDATE CROSSFITMEMBERS SET "
					+ "PASSWORD ='"+ pwd +"',"
					+ "FULL_NAME ='"+ name +"',"
					+ "PHONE_NUMBER ='"+ phone +"',"
					+ "GENDER ='"+ gender +"',"
					+ "BIRTH_DATE='"+ birth +"',"
					+ "ADDRESS='"+ address +"',"
					+ "REGISTRATION_DATE='"+ registration +"',"
					+ "START_DATE='"+ start +"',"
					+ "END_DATE='"+ end +"',"
					+ "MEMBERSHIP_TYPE='"+ membership +"',"
					+ "HOBBY='"+ hobby +"',"
					+ "CMT='"+comment +"'"	
					+ " WHERE MEMBER_ID = '" + id + "'"
			); */
	/*oracle정보 호촐하여 저장  */
	 stmt.executeUpdate(
			"UPDATE CROSSFITMEMBERS SET "
			+ "PASSWORD ='"+ pwd +"',"
			+ "FULL_NAME ='"+ name +"',"
			+ "PHONE_NUMBER ='"+ phone +"',"
			+ "GENDER ='"+ gender +"',"
			+ "BIRTH_DATE='"+ birth +"',"
			+ "ADDRESS='"+ address +"',"
			+ "REGISTRATION_DATE='"+ registration +"',"
			+ "START_DATE='"+ start +"',"
			+ "END_DATE='"+ end +"',"
			+ "MEMBERSHIP_TYPE='"+ membership +"',"
			+ "HOBBY='"+ hobby +"',"
			+ "CMT='"+comment +"'"	
			+ " WHERE MEMBER_ID = '" + id + "'" 
			); 
	%>
</body>

</html>
<script>
	 alert("회원정보를 수정하였습니다");
	location.href = "CrossFitLogin.jsp" 
</script>