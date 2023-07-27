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
<script>
	function update(){
		if(document.forms.form.custno.value.trim() == ""){
			alert("회원번호가 입력되지 않았습니다.");
			form.custno.focus();
			return false;
		}else if(document.forms.form.custname.value.trim() == ""){
			alert("회원성명이 입력되지 않았습니다.");
			form.custname.focus();
			return false;
		}else if(document.forms.form.phone.value.trim() == ""){
			alert("회원전화이 입력되지 않았습니다.");
			form.phone.focus();
			return false;
		}else if(document.forms.form.address.value.trim() == ""){
			alert("회원주소가 입력되지 않았습니다.");
			form.address.focus();
			return false;
		}else if(document.forms.form.joindate.value.trim() == ""){
			alert("가입일자가 입력되지 않았습니다.");
			form.joindate.focus();
			return false;
		}else if(document.forms.form.grade.value.trim() == ""){
			alert("고객등급 입력되지 않았습니다.");
			form.grade.focus();
			return false;
		}else if(document.forms.form.city.value.trim() == ""){
			alert("도시코드가 입력되지 않았습니다.");
			form.city.focus();
			return false;
		}else {
			alert("등록되었습니다.");
			document.forms.form.submit();
			conn.commit;
			return true;
		}
	}
</script>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	int custno = Integer.parseInt(request.getParameter("custno"));
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url,user,pw);
	
	String sql = "select custno, custname, phone, address, to_char(joindate, 'YYYYmmDD'), grade, city from member_tbl_02 where custno = "+custno;
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	rs.next();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
	<section>
		<h2>홈쇼핑 회원정보 수정</h2>
		<form action="member_update_confirm.jsp" name="form">
			<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%=rs.getString(1)%>" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%=rs.getString(2)%>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%=rs.getString(4)%>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%=rs.getString(5)%>" readonly></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" value="<%=rs.getString(6)%>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%=rs.getString(7)%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="update();">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
					</td>
				</tr>
				
			</table>
		</form>
	</section>	
</center>
<jsp:include page="footer.jsp"></jsp:include>