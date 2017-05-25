<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.ex {
		text-align: center;
		width: 35%;
		padding: 10px;
		boarder: 5px solid grey;
		margin: 20px;
	}
</style>
</head>
<body>
<h1 style = "text-align:center">회원가입</h1>

<form action="/project_mini/memberJoin" method="post" name="joinform">
<table cellpadding="5">
	<tr style = "text-align:center">
		<td>ID</td>
		<td><input id="memberId" type="text" name="memberId" style="ime-mode:disabled"></td>
		<td><input type="button" onclick="checkId()" value="중복체크"> &nbsp;&nbsp;  <input type="text" value="${requestScope.msg}"></input></td>
	</tr>
	<tr style = "text-align:center">
		<td>이름</td>
		<td><input type="text" name="memberName"></td>
	</tr>
	<tr style = "text-align:center">
		<td>비밀번호</td>
		<td><input id="pw1" type="password" name="readMemberPassword"></td>
		<td>비밀번호 재입력</td>
		<td><input id="pw2" type="password" name="memberPassword"></td>
		<td><input type="button" onclick="foo2()" value="확인"></input></td>
	</tr>
	<tr style = "text-align:center">
		<td>이메일</td>
		<td><input type="email" name="memberEmail"></td>
	</tr>
	<tr style = "text-align:center">
		<td>성별</td>
		<td>
		<select name="memberSex">
			<option value="남">남</option>
			<option value="여">여</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>나이(세)</td>
		<td><input type="number" name="memberAge"></td>
	</tr>
	<tr>
		<td></td>
		<td><input id="submitBtn" type="submit" value="등록" disabled="true"></td>
	</tr>
</table>
<input type="hidden" name="isdup" value="N">
</form>

<script type="text/javascript">
function foo() {
	//indow.open("id_check.jsp", "id_check", "width=500,height=300");
}

function foo2() {
	var pw1 = document.getElementById("pw1").value;
	var pw2 = document.getElementById("pw2").value;
	
	if(pw1 === pw2) {
		alert("일치합니다");
		document.getElementById("submitBtn").disabled = false;
	} else {
		alert("일치하지 않습니다");
	}
}

// 아이디 중복확인(아이디를 입력하고 중복확인 버튼을 누르면 실행됨)
function checkId() {
 	var sid = document.getElementById("memberId") .value;         
 	location.href="/project_mini/memberIdCheck?memberId=" + sid;	 
}
</script>
</body>
</html>