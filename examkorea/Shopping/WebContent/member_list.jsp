<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
section{
		position: fixed;
		top: 60px;
		width:100%;
		height: 100%;
		background-color: lightgray;
	}
</style>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

<jsp:include page="section.jsp" />

<%	
/* 	String grade_check = null;	

ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "system";
String pwd = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, db_id, pwd);
	
	String sql="select custno, custname, phone, address, joindate, grade, city"
			 + "from member_tbl_02";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery(); */
	
	String grade_check = null;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pw = "1234";

    Class.forName("oracle.jdbc.OracleDriver");
    conn = DriverManager.getConnection(url, user, pw);

    String sql = "select custno, custname, phone, address, joindate, grade, city "+
                 "from member_tbl_02";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	
%>
<section>
	<h2 style="text-align:center">회원목록 조회/수정</h2>
	<table style="text-align:center" border=1>
		<tr>
			<td>회원번호</td>
			<td>회원설명</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>가입일자</td>
			<td>고객등급</td>
			<td>거주지역</td>
		</tr>
		
		<%
		while(rs.next()){
			if(rs.getString(6).equals("A")){
				grade_check = "VIP";
			}else if(rs.getString(6).equals("B")){
				grade_check = "일반";				
			}if(rs.getString(6).equals("C")){
				grade_check = "직원";				
			}	
		%>
		<tr>
			<td><a href="member_update.jsp?custno=<%=rs.getInt(1)%>"><%=rs.getInt(1)%></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=grade_check %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%
		}
		%>
	</table>
</section>

<jsp:include page="footer.jsp" />