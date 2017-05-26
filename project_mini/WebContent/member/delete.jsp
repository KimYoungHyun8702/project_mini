<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:pink">
<%-- <center>
  <br><br><br>
<h1>회원탈퇴</h1><br><br><br>
<h1>주의! 계정탈퇴는 신중히 하시기 바랍니다</h1>
<p>
<center>
<TABLE width="700" border="10" cellspacing="8" cellpadding="5" bordercolor="red" style = "align:center">
<tr>
<tr>
<form action="/project_mini/memberDelete" method="post">
<input type="hidden" name="memberId" value= "${sessionScope.memberLoginInfo.memberId}">
<input  id="pw1" type="hidden" name="readPassword" value= "${sessionScope.memberLoginInfo.memberPassword}">
<table cellpadding="5">
<tr>
<td>비밀번호확인</td>  
<td><input id="pw2" type="password" name="memberPassword"></td>
<td><input type="button" onclick="foo2()" value="확인"></input></td>
</tr>
<tr>

<td><input id="submitButton" type="submit" value="삭제" disabled="true"></td>
</tr>
</table>
</form>
</TABLE>
</center>
</p>
<script type="text/javascript">
function foo() {
	window.open()
}

function foo2() {
	var pw1 = document.getElementById("pw1").value;
	var pw2 = document.getElementById("pw2").value;
	
	if(pw1 === pw2) {
		alert("일치합니다");
		document.getElementById("submitButton").disabled = false;
	} else {
		alert("일치하지않습니다");
	}
}
</script> --%>
<br><br><br><br><br><br><br><br>

<h1 style = "text-align:center">회원탈퇴</h1>
<h2  style = "text-align:center">주의! 계정탈퇴는 신중히 하시기 바랍니다</h2><br><br>
<center>
<form action="/project_mini/memberDelete" method="post">
<TABLE width="700" border="10" cellspacing="8" cellpadding="5" bordercolor="red" style = "align:center">
<tr>

<input type="hidden" name="memberId" value= "${sessionScope.memberLoginInfo.memberId}">
<input  id="pw1" type="hidden" name="readPassword" value= "${sessionScope.memberLoginInfo.memberPassword}">

<tr>
<td>*비밀번호 확인 (완료시 등록 가능)</TD> 
<td>
<input id="pw2" name="memberPassword" type="password" size="10" maxlength="8">
<input type="button" onclick="foo2()" value="확인"></input>
</TD>
</TR>
<tr align="center">
<td colspan="2">
<input id="submitButton" type="submit"  onclick="foo()" value="삭제" disabled="true">
</td>
</tr>
</TABLE>
</form>
</center>
<script type="text/javascript">
function foo() {
	alert("수정완료");
}

function foo2() {
	var pw1 = document.getElementById("pw1").value;
	var pw2 = document.getElementById("pw2").value;
	
	if(pw1 === pw2) {
		alert("일치합니다");
		document.getElementById("submitButton").disabled = false;
	} else {
		alert("일치하지않습니다");
	}
}
</script>
</body>
</html>