<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/project_mini/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%-- <jsp:include page="/layout.jsp" />
<h1 style = "text-align:center">로그인</h1>

<p>
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
</p> --%>
  <body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>
			<form action=/project_mini/memberLogin method="post">
			<div class="login-form">
				<div class="control-group">
				<input type="text" class="login-field" value="" placeholder="MemberID" id="memberId" name="memberId">
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>

				<div class="control-group">
				<input type="password" class="login-field" value="" placeholder="MemberPassword" id="memberPassword" name="memberPassword">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
				<a><input class="btn btn-primary btn-large btn-block" type="submit" value=로그인></a>
				<a class="login-link" href="/project_mini/index.jsp">메인페이지로</a>
				<a class="login-link" href="/project_mini/member/join.jsp">회원가입페이지로</a>
				</form>
			</div>
		</div>
	</div>
</body>
</body>
</html>