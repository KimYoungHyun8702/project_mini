<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신이 원하는 바로 그 영화!@KOSTA탈주</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
	<h1>회원탈퇴</h1>
	
	<h2>주의! 계정탈퇴는 신중히 하시기 바랍니다</h2>
	<p>
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
	<td><input id="submitButton" type="submit" value="등록" disabled="true"></td>
	</tr>
	</table>
	</form>
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
	</script>
</body>
</html>