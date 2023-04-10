<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 60px;
	width: 100%;
	height: 100%;
	background-color: lightgray;
}
</style>
<script>
	function update() {
		if (document.forms.form.p_num.value.trim() == "") {
			alert("환자코드를 입력하세요!");
			form.p_num.focus();
			return false;
		} else if (document.forms.form.t_name.value.trim() == "") {
			alert("검사명을 선택하세요");
			form.t_name.focus();
			return false;
		} else if (document.forms.form.s_date.value.trim() == "") {
			alert("검사시작일을 선택하세요!");
			form.s_date.focus();
			return false;
		} else if (document.forms.form.status.value.trim() == "") {
			alert("검사상태를 선택하세요!");
			form.status.focus();
			return false;
		} else if (document.forms.form.l_date.value.trim() == "") {
			alert("검사 완료일을 입력하세요!");
			form.l_date.focus();
			return false;
		} else if (document.forms.form.result.value.trim() == "") {
			alert("검사 결과를 선택하세요!");
			form.result.focus();
			return false;
		} else {
			alert("등록되었습니다.");
			document.forms.form.submit();
			conn.commit;
			return true;
		}
	}
	
	function reset1(){
		 document.getElementById("focus").focus();
		 document.getElementById("form").reset();
		 alert("모든 데이터 초기화");
	}
</script>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />
<center>
	<section>

		<h1 style="text-align: center;">검사결과입력</h1>
		<form name="form" id="form" action="result_insert_confirm.jsp">
			<table style="text-align: center;" border=1>
				<tr>
					<td>환자코드</td>
					<td><input type="text" name="p_num" id="focus"></td>
				</tr>
				<tr>
					<td>검사명</td>
					<td>
					<select name="t_name">
							<option value="none">검사명</option>
							<option value="T001">[T001]결핵</option>
							<option value="T002">[T002]장티푸스</option>
							<option value="T003">[T003]수두</option>
							<option value="T004">[T004]홍역</option>
							<option value="T005">[T005]콜레라</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>검사시작일</td>
					<td><input type="text" name="s_date"></td>
				</tr>
				<tr>
					<td>검사상태</td>
					<td>
						<input type="radio" name="status" value="1">검사 중
						<input type="radio" name="status" value="2">검사 완료
					</td>
				</tr>
				<tr>
					<td>검사완료일</td>
					<td><input type="text" name="l_date"></td>
				</tr>
				<tr>
					<td>검사결과</td>
					<td>
						<input type="radio" name="result" value="X">미입력
						<input type="radio" name="result" value="P">양성
						<input type="radio" name="result" value="N">음성
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록" onclick="update();">
						<input type="button" value="재입력" onclick="reset1();"></td>
				</tr>

			</table>
		</form>
	</section>
</center>

<jsp:include page="footer.jsp" />