<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<%-- <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/layout.jsp" />
<h1>마이 페이지</h1>
ID : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberId()%><br> 
이름 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberName()%><br> 
이메일 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberemail()%><br>
성별 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberSex()%><br>
나이 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberAge()%><br>

<p><a href="/project_mini/index.jsp">메인페이지로이동</a></p><br>
<a href="/project_mini/boardJsp/index.jsp">게시판으로 이동</a>
<a href="/project_mini/member/delete.jsp">회원탈퇴</a><br>
<a href="/project_mini/member/update.jsp">정보수정하기</a><br>
</body>
</html> --%>
<HTML>
<HEAD>
<TITLE>회원가입</TITLE>
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