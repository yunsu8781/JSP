<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<script>
	function update () {
		if(document.forms.form.id.value.trim() == ""){
			alert("학번이 입력되지 않았습니다.");
			return false;
		}
		else if(document.forms.form.korean.value.trim() == ""){
				alert("국어점수가 입력되지 않았습니다.");
				return false;
			}
		else if(document.forms.form.english.value.trim() == ""){
					alert("영어점수가 입력되지 않았습니다.");
					return false;
				}
		else if(document.forms.form.math.value.trim() == ""){
						alert("수학점수가 입력되지 않았습니다.");
						return false;
					}
		else if(document.forms.form.history.value.trim() == ""){
						alert("역사점수가 입력되지 않았습니다.");
						return false;
						}
					else {
						alert("등록되었습니다.");
						document.forms.form.submit();
						conn.commit();
						return true;
					}
	}

</script>
<center>
	<section>
		<h1>학생성적 등록</h1>
		<form name="form" action="student_grade_insert_confirm.jsp">
			<table border=1>
				<tr>
					<td>학번</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>국어</td>
					<td><input type="text" name="korean" /></td>
				</tr>
				<tr>
					<td>영어</td>
					<td><input type="text" name="english" /></td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="math" /></td>
				</tr>
				<tr>
					<td>역사</td>
					<td><input type="text" name="history" /></td>
				</tr>

			</table>
			<br />
			<input type="button" value="등록" onclick="update()" /><br />
		</form>
	</section>
</center>


