<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}
	h2{
		text-align: center;
	}
		table{
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
	
	String sql = "select max(custno)+1, to_char(sysdate,'YYYYmmDD') from member_tbl_02";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	rs.next();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
	<section>
		<h2>홈쇼핑 회원등록</h2>
		<form action="member_insert_confirm.jsp" method="get">
			<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="" value="<%=rs.getString(1)%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="" value="<%=rs.getString(2)%>"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
					</td>
				</tr>
				
			</table>
		</form>
	</section>	
</center>
<jsp:include page="footer.jsp"></jsp:include>