<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<HTML>
<HEAD>
<title>CGW</title>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
</HEAD>
<%-- <c:choose> 
	<c:when test="${requestScope.msg != null }">
		<body onload="window.alert('${requestScope.msg}')">
	</c:when>
	<c:otherwise>
		<body>
	</c:otherwise>
</c:choose> --%>
<body>
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
<td width="170">*아이디입력</TD>
<td width="530">
<input id="memberId" name="memberId" type="text" size="10" value="${requestScope.msg}" maxlength="10" style="ime-mode:disabled;">
<input type="button" onclick="checkId()" value="중복체크" style='background-color:orange' >
<c:choose>
<c:when test="${requestScope.msg != null }">
<input type="text" value="${requestScope.msg} 는 사용가능한 아이디입니다" readonly size="40" style="text-align:center"></input><br>
</c:when>
<c:otherwise>
<input type="text" value="다른 아이디를 입력해 주세요" readonly size="40" style="text-align:center"></input><br>
</c:otherwise>
</c:choose>
한글아이디를 입력할 수 없습니다
</TD>
</TR>

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
<input id="pw1" name="readMemberPassword" type="password" size="10" maxlength="10"><br> 
비밀번호는 10자를 넘을 수 없습니다
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
<td> *이메일 주소 </TD>
<td>
<!-- <input name="memberEmail" type="email" size="20" maxlength="20"><br> -->
<input id="memberEmail" name="memberEmail" type="email" size="20" value="${requestScope.msg2}" maxlength="20" style="ime-mode:disabled;">
<input type="button" onclick="checkEmail()" value="중복체크" style='background-color:brown' >
<c:choose>
<c:when test="${requestScope.msg2 != null }">
<input type="text" value="${requestScope.msg2} 는 사용가능한 이메일입니다" readonly size="40" style="text-align:center"></input><br>
</c:when>
<c:otherwise>
<input type="text" value="다른 이메일을 입력해 주세요" readonly size="40" style="text-align:center"></input><br>
</c:otherwise>
</c:choose>
<br>아이디/비밀번호 분실, 변경시 <br>본인확인 방법으로 사용됩니다
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
<td> *나이 </TD>
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
<c:choose>
	<c:when test="${sessionScope.msg == 'fail' }">
	<script>alert("입력한 값이 바르지 않습니다");</script>
	</c:when>
</c:choose>
	<%session.removeAttribute("msg"); %>

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

// 이메일 중복 확인(이메일을 입력하고 중복확인 버튼을 누르면 실행)
function checkEmail() {
 	var sid = document.getElementById("memberEmail") .value;         
 	location.href="/project_mini/memberEmailCheck?memberEmail=" + sid;	 
}
</script>
</BODY>
</HTML>