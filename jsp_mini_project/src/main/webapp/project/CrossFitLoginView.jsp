<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CrossFit Kirby 로그인 여부확인</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
		%>
		<%
		/* 로그인 성공시 */
		if (rs.next()) {
			if (rs.getInt("CNT") >= 4) {
		%>
		<script>
		// SweetAlert을 사용하여 5회 이상 실패 시 메시지 표시
			Swal.fire({
				icon : 'error',
				title : '로그인 실패',
				text : '5회 실패로 인한 관리자 문의바람',
				confirmButtonColor : '#3085d6',
				confirmButtonText : '확인'
			}).then((result) => {
		        if (result.isConfirmed) {
		            // 확인 버튼을 클릭하면 이전 페이지로 돌아가기
		            history.back();
		        }
		    });
		</script>
		<%
		/*  */
		} else {
		session.setAttribute("id", rs.getString("MEMBER_ID"));
		sql = "UPDATE CROSSFITMEMBERS SET" + " CNT = 0 " + "WHERE MEMBER_ID = '" + id + "'";
		stmt.executeQuery(sql);
		response.sendRedirect("CrossFitMain.jsp");
		out.println("로그인 성공");

		}

		} /* 로그인 실패시 */
		else {
		/* 아이디는 있는데 패스워드가 틀린경우 */
		String idSql = "SELECT * FROM " + "CROSSFITMEMBERS WHERE MEMBER_ID = '" + id + "'";
		ResultSet rsId = stmt.executeQuery(idSql);
		if (rsId.next()) {
		int cnt = rsId.getInt("CNT");
		if ((cnt + 1) >= 4) {
		%>
		<script>
				// SweetAlert을 사용하여 5회 이상 실패 시 메시지 표시
				Swal.fire({
					icon : 'error',
					title : '로그인 실패',
					text : '회 이상 실패로 인한 관리자 문의 바람',
					confirmButtonColor : '#3085d6',
					confirmButtonText : '확인'
				}).then((result) => {
			        if (result.isConfirmed) {
			            // 확인 버튼을 클릭하면 이전 페이지로 돌아가기
			            history.back();
			        }
			    });
			</script>
		<%
		} else {
		out.println((cnt + 1) + "번 이상 실패!");
		stmt.executeUpdate("UPDATE CROSSFITMEMBERS SET " + "CNT = CNT+1 " + "WHERE MEMBER_ID = '" + id + "'");
		}
		} else {
		//2.아이디가 없는경
		%>
		<script>
			// SweetAlert을 사용하여 비밀번호 오류 시 메시지 표시
				Swal.fire({
					icon : 'error',
					title : '로그인 실패',
					text : '아이디를 확인해 주세요',
					confirmButtonColor : '#3085d6',
					confirmButtonText : '확인'
				});
			</script>
		<%
		}
		%>
		<script>
		// SweetAlert을 사용하여 비밀번호 오류 시 메시지 표시
			Swal.fire({
				icon : 'error',
				title : '로그인 실패',
				text :  '아이디랑 비밀번호를 확인해 주세요',
				confirmButtonColor : '#3085d6',
				confirmButtonText : '확인'
			});
		</script>
		<%
		}
		%>

		<input type="button" value="되돌아가기" onclick="history.back()">
	</form>

</body>
</html>

