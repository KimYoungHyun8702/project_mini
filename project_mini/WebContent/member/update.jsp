<%@page import="member.vo.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>정보수정</h1>
<p>
<form action="/project_mini/memberUpdate" method="post">
아이디 : <input type="text" name="memberId" value="<%=((Member)session.getAttribute("memberLoginInfo")).getMemberId()%>" readonly>
이름 : <input type="text" name="memberName"><br>
비밀번호 : <input type="password" name="memberPassword"><br>
이메일 : <input type="email" name="memberEmail"><br>
성별 : <select name="memberSex"><br>
			<option value="남">남</option>
			<option value="여">여</option>
		</select>
나이(세) : <input type="number" name="memberAge"><br>
</p>
<input type="submit" value="등록">
</form>
</body>
</html>