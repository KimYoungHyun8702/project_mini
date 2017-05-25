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
		<td><input id="aa" type="text" name="memberId" style="ime-mode:disabled"></td>
		<td><input type="button" onclick="checkId()" value="중복체크"></input></td>
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
	window.open("id_check.jsp", "id_check", "width=500,height=300");
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
 var sid = document.getElementById("aa") .value;               // 아이디값 가져오기
 if(sid == "") alert("입력된 아이디가 없습니다.")      // 없는 경우 메시지출력
 	/* 값이 있는 경우 체크창 출력
    window.open 명령을 사용하여 새로운 창을 하나 띄웁니다.
    첫번째 인자 : 새로 열 창의 주소 ( "check_Id.jsp?id="+sid --> jsp를 열며 id값을 함께 넘겨 줍니다.)
    두번째 인자 : 새로 열 창의 이름 ( "" )
    세번째 인자 : 새로 열 창의 옵션 ( "width=400 height=150" )
    받는 쪽에서는 String id= requset.getParameter("id"); 로 이 아이디 값을 받을수 있습니다. */        
 else window.open("check_Id.jsp?id="+ sid,"", "width=400 height=150")   
}
</script>
</body>
</html>