<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGW</title>
</head>
<body>
<jsp:include page="/layout.jsp" />
<br><br><br><br><br><br><br><br>
<h1 style = "text-align:center">로그인이 실패하였습니다</h1>
<h2  style = "text-align:center">아이디 또는 비밀번호가 맞지 않습니다.</h2><br><br>
<center>
<TABLE width="700" border="10" cellspacing="10" cellpadding="5" bordercolor="#3498DB" style = "align:center;border-radius:5px;">
<tr>
<td><a style = "text-align:center" href="/project_mini/member/login.jsp">로그인 페이지로</a></td>
<td><a style = "text-align:center" href="/project_mini/member/join.jsp">회원가입 페이지로</a></td>
</tr>
</TABLE>
</center>
</body>
</html>