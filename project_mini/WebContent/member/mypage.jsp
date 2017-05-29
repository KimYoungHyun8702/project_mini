<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<title>CGW</title>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
</HEAD>
<BODY>
<br><br><br><br><br>
<jsp:include page="/layout.jsp" />
<center>
<form action="/project_mini/memberJoin" method="post" name="joinform">

<TABLE width="700" border="10" cellspacing="8" cellpadding="5" bordercolor="green">

<tr style="background-color:pink">
<td colspan="2" style="text-align:center">※마이페이지※</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr>
<td width="170">아이디</TD>
<td width="530">
<%=((Member)session.getAttribute("memberLoginInfo")).getMemberId()%>
</TD>


<tr>
<td>이름</TD>
<td>
<%=((Member)session.getAttribute("memberLoginInfo")).getMemberName()%>
</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr>
<td> 이메일 주소 </TD>
<td>
<%=((Member)session.getAttribute("memberLoginInfo")).getMemberemail()%>
</TD>
</TR>

<tr>
<td>*성별 </TD>
<td>
<%=((Member)session.getAttribute("memberLoginInfo")).getMemberSex()%>
</TD>
</TR>

<tr>
<td> 나이 </TD>
<td>
<%=((Member)session.getAttribute("memberLoginInfo")).getMemberAge()%>세
</TD>
</TR>

<tr>
<!-- <td colspan="2"> </TD>-->
</TR>

<tr align="center">
<td colspan="2">
<tr>
<td><a style = "text-align:center" href="/project_mini/member/delete.jsp">회원탈퇴 페이지로</a></td>
<td><a style = "text-align:center" href="/project_mini/member/update.jsp">정보수정 페이지로</a></td>
</tr>

</TABLE>
<input type="hidden" name="isdup" value="N">
</form>
</center>

</BODY>
</HTML>