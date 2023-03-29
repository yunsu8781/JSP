<%@ page import="java.sql.*" %>
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

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />
<center>
<section>
<%
	int max_custno = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url,user,pw);
	
	String sql = "select custno from member_tbl_02";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()){
		if(max_custno < rs.getInt(1))
		max_custno = rs.getInt(1);
	}
%>



<h1 style="text-align:center;">홈쇼핑 회원 등록</h1>
<form name="form"action="member_insert_confirm.jsp">
	<table style="text-align:center;" border=1>
		<tr>
			<td>회원정보(자동발생)</td>
			<td><input type="text" name="custno" value="<%=max_custno + 1 %>" readonly></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate"></td>
		</tr>
		<tr>
			<td>고객등급</td>
			<td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td>
			<td>
			<input type="button" value="등록" onclick="update();">
			<input type="button" value="조회" onclick="location.href='member_list.jsp'">
			</td>
		</tr>

	</table>
</form>
</section>
</center>

<jsp:include page="footer.jsp" />
