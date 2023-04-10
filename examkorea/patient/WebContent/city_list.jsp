<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
<style>
section{
	position:fixed;
	top:60px;
	width:100%;
	height:100%;
	background-color:lightgray;
}
</style>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "yunsu";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "SELECT PA.P_CITY, COUNT(RE.P_NO) " +
			 "FROM tbl_patient_202004 PA, tbl_result_202004 RE " +
	 		 "WHERE PA.P_NO = RE.P_NO " + 
			 "GROUP BY PA.P_CITY ORDER BY PA.P_CITY ASC";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>
<center>
	<section>
		<h2>지역별 검사건수</h2>
		<table border="1">
			<tr>
				<td>지역 코드</td>
				<td>지역 명</td>
				<td>검사건수</td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<%
					String city = null;
					if(rs.getString(1).equals("10")){
						city = "서울";
					}else if(rs.getString(1).equals("20")){
						city = "경기";						
					}else if(rs.getString(1).equals("30")){
						city = "강월";						
					}else if(rs.getString(1).equals("40")){
						city = "대구";						
					}
				%>
				<td><%=city%></td>
				<td><%=rs.getString(2)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</center>
<jsp:include page="footer.jsp"/>