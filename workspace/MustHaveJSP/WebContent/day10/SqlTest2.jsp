<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정적 쿼리문 - 회원 조회</title>
</head>
<body>
	<h2>회원 목록 조회하기 - executeQuery() 메서드 사용</h2>
	<%
	JDBConnect jdbc = new JDBConnect(application);
	
	String sql = "SELECT id, pass, name, regidate FROM member";
	Statement stmt = jdbc.conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		String id = rs.getString(1);
		String pw = rs.getString(2);
		String name = rs.getString ("name");
		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println(String.format("회원아이디 : %s, 비밀번호 : %s, 이름 : %s, 가입날짜 : %s", id, pw, name, regidate) + "<br />");
	}
	
	jdbc.close();
	%>
</body>
</html>