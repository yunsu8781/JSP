<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "yunsu";
	String pw = "1234";

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String p_no = request.getParameter("p_num");
	String t_name = request.getParameter("t_name");
	String s_date = request.getParameter("s_date");
	String status = request.getParameter("status");
	String l_date = request.getParameter("l_date");
	String result = request.getParameter("result");
	
	String sql = "insert into tbl_result_202004 (p_no, t_code, t_sdate, t_status, t_ldate, t_result) "
				+"values (?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, p_no);
	pstmt.setString(2, t_name);
	pstmt.setString(3, s_date);
	pstmt.setString(4, status);
	pstmt.setString(5, l_date);
	pstmt.setString(6, result);
	pstmt.executeUpdate();
	response.sendRedirect("result_list.jsp");
%>