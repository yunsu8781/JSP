<%@page import="java.sql.*"%>
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
	h2{
		text-align:center;
	}
	p{
		padding-left:10px;
	}
</style>
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
<%
	Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "yunsu";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select p_no, p_name, substr(p_birth,1,4), substr(p_birth,5,2), substr(p_birth,7,2), p_gender, p_tel1, p_tel2, p_tel3, p_city from tbl_patient_202004";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>

<center>
	<section>
		<h2>환자조회</h2>

		<table border=1>
			<tr>
				<td>환자코드</td>
				<td>환자이름</td>
				<td>환자 생년월일</td>
				<td>환자 성별</td>
				<td>환자 전화번호</td>
				<td>환자 거주지</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%>년<%=rs.getString(4)%>월<%=rs.getString(5)%>일</td>
				<%
					if (rs.getString(6).equals("M")) {
				%>
				<td>남</td>
				<%
					} else if (rs.getString(6).equals("F")) {
				%>
				<td>여</td>
				<%
					}
				%>
				<td><%=rs.getString(7)%>-<%=rs.getString(8)%>-<%=rs.getString(9)%></td>
				<% if(rs.getString(10).equals("10")) { %>
				<td>서울</td>
				<%}else if(rs.getString(10).equals("20")) { %>
				<td>경기</td>
				<%}else if(rs.getString(10).equals("30")) { %>
				<td>강원</td>
				<%}else if(rs.getString(10).equals("40")) { %>
				<td>대구</td>
				<% } %>
			</tr>
			<%
				}
			%>
		</table>
	</section>
</center>
<jsp:include page="footer.jsp"/>