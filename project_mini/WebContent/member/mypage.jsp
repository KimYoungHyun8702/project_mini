<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이 페이지</h1>
ID : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberId()%><br> 
이름 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberName()%><br> 
이메일 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberemail()%><br>
성별 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberSex()%><br>
나이 : <%=((Member)session.getAttribute("memberLoginInfo")).getMemberAge()%><br>

<p>메인페이지로이동</p><br>
<a href="/project_mini/member/delete.jsp">회원탈퇴</a><br>
<a href="/project_mini/member/update.jsp">정보수정하기</a><br>
</body>
</html>