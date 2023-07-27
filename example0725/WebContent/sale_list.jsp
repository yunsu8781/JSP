<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	section{
		position:fixed;
		top:80px;
		width:100%;
		height:100%;
		background-color:lightgray;
		font-size: 20px;
		text-align: center;
	}
	h2{
		text-align: center;
	}
</style>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url,user,pw);

String sql = "select mem.custno, mem.custname, mem.grade, sum(mon.price) "+
			 "from MEMBER_TBL_02 mem , MONEY_TBL_02 mon "+
			 "where mem.custno = mon.custno "+
			 "group by mem.custno, mem.custname, mem.grade "+
			 "order by sum(mon.price) desc ";
			 pstmt = conn.prepareStatement(sql);

rs = rs = pstmt.executeQuery();

%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
	<section>
		<h2>회원목록 조회/수정</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
		
			<%
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<%
				String grade_st = null;
			
				if(rs.getString(3).equals("A")){
				grade_st = "VIP";
				}else if(rs.getString(3).equals("B")){
					grade_st = "일반";				
				}else if(rs.getString(3).equals("C")){
					grade_st = "직원";								
				}
				%>
				<td><%=grade_st%></td>
				<td><%=rs.getString(4) %></td>		
			</tr>		
			<%} %>
		</table>
	</section>
</center>
<jsp:include page="footer.jsp"></jsp:include>