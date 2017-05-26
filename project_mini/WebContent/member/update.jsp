<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>CGW</TITLE>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
</HEAD>
<BODY>
<jsp:include page="/layout.jsp" />
<center>
<form action="/project_mini/memberUpdate" method="post">

<TABLE width="700" border="10" cellspacing="8" cellpadding="5" bordercolor="blue">

<tr style="background-color:skyblue">
<td colspan="2" style="text-align:center">정보수정</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr>
<td width="170">아이디</TD>
<td width="530">
<input type="text" name="memberId" value="<%=((Member)session.getAttribute("memberLoginInfo")).getMemberId()%>" readonly>
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
</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr align="center">
<td colspan="2">
<input id="submitBtn" type="submit" onclick="foo()" value="수정" disabled="true">
<input type="reset" value="취소">
</TD>
</TR>
</TABLE>
<input type="hidden" name="isdup" value="N">
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