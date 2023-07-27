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

String sql = "select custno, custname, phone, address, to_char(joindate, 'YYYY-mm-DD'), grade, city from member_tbl_02";
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
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
		
			<%
				while(rs.next()){
			%>
			<tr>
				<td><a href="member_update.jsp?custno=<%=rs.getInt(1)%>"><%=rs.getInt(1)%></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<%
				String grade_st = null;
			
				if(rs.getString(6).equals("A")){
				grade_st = "VIP";
				}else if(rs.getString(6).equals("B")){
					grade_st = "일반";				
				}else if(rs.getString(6).equals("C")){
					grade_st = "직원";								
				}
				System.out.println(rs.getString(6));
				System.out.println(grade_st);
				
				%>
				<td><%=grade_st%></td>		
				<td><%=rs.getString(7) %></td>
			</tr>		
			<%} %>
		</table>
	</section>
</center>
<jsp:include page="footer.jsp"></jsp:include>