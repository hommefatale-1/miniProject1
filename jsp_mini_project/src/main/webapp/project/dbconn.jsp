<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>DB</title>
</head>
<body>
<%
		Connection conn;
		Statement stmt = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String db_id = "system";
		String db_pw = "test1234";
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		stmt = conn.createStatement();
		out.println("연결됬나?");
%>
</body>
</html>