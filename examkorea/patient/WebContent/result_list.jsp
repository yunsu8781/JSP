<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	String sql = "select A.p_no, A.p_name, B.t_name, substr(C.t_sdate,1,8), C.t_status, substr(C.t_ldate,1,8), C.t_result from tbl_patient_202004 A, tbl_lab_test_202004 B, tbl_result_202004 C " 
				+"where A.p_no = C.p_no and B.t_code = C.t_code group by A.p_no, A.p_name, B.t_name, C.t_sdate, C.t_status, C.t_ldate, C.t_result order by A.p_no asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%> 

<center>
	<section>
		<h2>검색결과 조회</h2>
		<table border="1">
			<tr>
				<td>환자코드</td>
				<td>환자이름</td>
				<td>검사 명</td>
				<td>검사 시작일</td>
				<td>검사 상태</td>
				<td>검사 완료일</td>
				<td>검사 결과</td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<%
					String status = null;
					if(rs.getString(5).equals("1")){
						status = "검사중";
					}else if(rs.getString(5).equals("2")){
						status = "검사 완료";						
					}
				%>
				<td><%=status%></td>
				<td><%=rs.getString(6)%></td>
				<%
					String result = null;
					if(rs.getString(7).equals("X")){
						result = "미입력";
					}else if(rs.getString(7).equals("P")){
						result = "양성";						
					}else if(rs.getString(7).equals("N")){
						result = "음성";						
					}
				%>
				<td><%=result%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</center>
<jsp:include page="footer.jsp"/>