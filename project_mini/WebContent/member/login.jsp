<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/project_mini/css/style.css" rel="stylesheet" type="text/css">

<title>당신이 원하는 바로 그 영화!@KOSTA탈주</title>
</head>
<body>
<%-- <jsp:include page="/layout.jsp" /> --%>

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