<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<%@ include file="dbconn.jsp"%>

		<%
		request.setCharacterEncoding("UTF-8");
		// 사용자가 전송한 로그인 폼에서 입력한 ID와 비밀번호 가져오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		/* 사용자가 전송한 ID와 비빌번호를 DB에 비교 */
		String sql = "SELECT * FROM " + "CROSSFITMEMBERS WHERE MEMBER_ID ='" + id + "' AND PASSWORD = '" + pwd + "'";
		ResultSet rs = stmt.executeQuery(sql);

		// 로그인 성공 여부를 저장할 변수
		boolean loginSuccess = false;
		/* 로그인 성공시 */
		if (rs.next()) {
			if (rs.getInt("CNT") >= 5) {
				out.println("비밀번호 5번  실패! 관리자 문의 하셈");
			} else
			/* 관리자 전용 페이지 이동*/
			if (rs.getString("MEMERSHIP_TYPE").equals("코치님") || rs.getString("MEMERSHIP_TYPE").equals("대표님")) {

				response.sendRedirect("user_list.jsp");
			}
			/* 로그인 실패시 */
		} else {
			/* 아이디는 있는데 패스워드가 틀린경우 */
			String idSql = "SELECT * FROM " + "CROSSFITMEMBERS WHERE MEMBER_ID = '" + id + "'";
			ResultSet rsId = stmt.executeQuery(idSql);

			if (rsId.next()) {
				int cnt = rsId.getInt("CNT");
				if ((cnt + 1) >= 5) {
					out.println("5번 틀리셨습니다 관리자에게 문의 바랍니다");
				} else {
				out.println((cnt + 1) + "번 이상 실패! 비밀번호를 확인해 주세요");
				stmt.executeUpdate("UPDATE CROSSFITMEMBERS SET " + "CNT = CNT+1 " + "WHERE MEMBER_ID = '" + id + "'");
				}
			}
			else{
				//2.아이디가 없는경
		out.println("아이디를 확인해주세요"); 
			}
		}
		%>
		<%-- <input type="button" value="되돌아가기" onclick="fnbnt_back('<%= id%>')"> --%>
		<input type="button" value="되돌아가기" onclick="history.back()">
	</form>
</body>
</html>
<script>
	/* 되돌아가기 기능 */
	function fnbnt_back(id) {
		location.href = "CrossFitLogin.jsp?id=" + id;
	}
</script>