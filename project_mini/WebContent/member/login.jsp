<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/layout.jsp" />
<h1 style = "text-align:center">로그인</h1>
<form action=/project_mini/memberLogin method="post">
<table cellpadding="5">
	<tr style = "text-align:center">
	 <td>ID</td>
	<td><input type="text" name="memberId" size="25"></td>
	</tr>
	<tr style = "text-align:center">
	<td>패스워드</td>
	<td><input type="text" name="memberPassword" size="25"></td>
	</tr>
	<tr style = "text-align:center">
	<td><input type="submit" value="로그인"></td>
	</tr>
	</table>
	</form>
</body>
</html>