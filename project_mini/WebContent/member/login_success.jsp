
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
<h1>로그인 성공</h1>
${sessionScope.memberLoginInfo.memberName} 님 환영합니다.<br>
<p>
<a href="/project_mini/index.jsp">메인페이지로 이동</a>
<a href="${initParam.rootPath }/SelectController">게시판으로</a>
</p>
<p>
<a href="/project_mini/memberLogout">로그아웃</a><br>
</p>
<p>
<a href="/project_mini/member/mypage.jsp">마이페이지로 이동</a>
</p>
</body>
</html>