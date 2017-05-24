<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
ID:${requestScope.memberLoginInfo.memberId}<br>
이름: ${requestScope.memberLoginInfo.memberName}<br>
비밀번호 :  ${requestScope.memberLoginInfo.memberPassword}<br>
이메일:${requestScope.memberLoginInfo.memberemail}<br>
성별:${requestScope.memberLoginInfo.memberSex}<br>
나이:${requestScope.memberLoginInfo.memberAge}<br>
</p>
<a href="/project_mini/member/login_success.jsp">로그인성공 화면으로 이동</a>
</body>
</html>