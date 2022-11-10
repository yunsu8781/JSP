<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<jsp:include page="../common/Link.jsp"/>
	
	<h2>글쓰기</h2>
	
	<form action="WriteProcess.jsp">
		<table border="1" width="100%">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width:99.4%"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width:99.55%; height:100%; resize: none" required></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">다시작성</button>
					<button type="button" onclick="location.href='List.jsp'">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>