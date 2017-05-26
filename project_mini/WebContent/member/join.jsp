<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<%-- <html>
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
		<td><input id="memberId" type="text" name="memberId" style="ime-mode:disabled;"></td>
		<td><input type="button" onclick="checkId()" value="중복체크"> &nbsp;&nbsp;  <input type="text" value="${requestScope.msg}" readonly size="40"></input></td>
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
 	var sid = document.getElementById("memberId") .value;         
 	location.href="/project_mini/memberIdCheck?memberId=" + sid;	 
}
</script>
</body>
</html> --%>
<HTML>
<HEAD>
<TITLE>회원가입</TITLE>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
</HEAD>
<BODY>
<jsp:include page="/layout.jsp" />
<center>
<form action="/project_mini/memberJoin" method="post" name="joinform">

<TABLE width="700" border="10" cellspacing="8" cellpadding="5" bordercolor="blue">

<tr style="background-color:skyblue">
<td colspan="2" style="text-align:center">*표시는 필수 입력 사항입니다.(다 필수임....)</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr>
<td width="170">아이디입력</TD>
<td width="530">
<input id="memberId" name="memberId" type="text" size="8" maxlength="8" style="ime-mode:disabled;">
<input type="button" onclick="checkId()" value="중복체크" style='background-color:orange'>
<input type="text" value="${requestScope.msg}" readonly size="40"></input><br>
한글아이디를 입력할 수 없습니다.
</TD>


<tr>
<td>*이름(실명) </TD>
<td>
<input name="memberName" type="text" size="12" maxlength="10">
</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr>
<td>*비밀번호 </TD>
<td>
<input id="pw1" name="readMemberPassword" type="password" size="10" maxlength="8"><br> 
4~10자 이하로 입력(해주세요ㅠㅠ)
</TD>
</TR>

<tr>
<td>*비밀번호 확인 (완료시 등록 가능)</TD> 
<td>
<input id="pw2" name="memberPassword" type="password" size="10" maxlength="8">
<input type="button" onclick="foo2()" value="확인"></input>
</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr>
<td> 이메일 주소 </TD>
<td>
<input name="memberEmail" type="email" size="20" maxlength="20"><br>
아이디/비밀번호 분실, 변경시 본인확인 방법으로 사용하실 수 (있게하고싶습니다..)
</TD>
</TR>

<tr>
<td>*성별 </TD>
<td>
<select name="memberSex">
<option value="남">남
<option value="여">여
</select>
</TD>
</TR>

<tr>
<td> 나이 </TD>
<td>
<input name="memberAge" type="number" size="20" maxlength="20"><br>
본인의 나이를 솔직하게 적어주세요<br>(반올림말고 미국나이 말고 한.국.나.이)
</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr align="center">
<td colspan="2">
<input id="submitBtn" type="submit" value="등록" disabled="true">
<input type="reset" value="취소">
</TD>
</TR>
</TABLE>
<input type="hidden" name="isdup" value="N">
</form>
</center>
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
 	var sid = document.getElementById("memberId") .value;         
 	location.href="/project_mini/memberIdCheck?memberId=" + sid;	 
}
</script>
</BODY>
</HTML>