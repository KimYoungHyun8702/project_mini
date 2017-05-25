
<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 성공</h1>
${sessionScope.memberLoginInfo.memberName} 님 환영합니다.<br>
<p>
<a href="${initParam.rootPath }/SelectController">메인페이지로 이동</a>
</p>
<p>
<a href="/project_mini/memberLogout">로그아웃</a><br>
</p>
<p>
<a href="/project_mini/member/mypage.jsp">마이페이지로 이동</a>
</p>
</body>
</html>