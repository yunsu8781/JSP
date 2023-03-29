<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
	request. setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");


	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id = "system";
	String pwd = "1234";

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, db_id, pwd);
	String sql ="update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? "
			  + "where custno=?";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,custname);
	pstmt.setString(2,phone);
	pstmt.setString(3,address);
	pstmt.setString(4,joindate);
	pstmt.setString(5,grade);
	pstmt.setString(6,city);
	pstmt.setInt(7,custno);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("member_list.jsp");
	
%>