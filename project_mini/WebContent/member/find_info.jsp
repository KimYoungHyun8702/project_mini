<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<!-- <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <br><br><br><br>
<h1 style="text-align:center">아이디/비밀번호 찾기</h1>
<table>
<center>
<form action=/project_mini/sendEmail method="post">
<input type="email" placeholder="memberEmail" id="memberEmail" name="memberEmail">
<input type="submit" onclick=" foo()"  value=확인>
</center>
</table>
</form>



<script type="text/javascript">
//이메일 전송 버튼 클릭시 문구가 뜨게 하는 메소드
function checkEmail() {
 	var sid = document.getElementById("memberEmail") .value;         
 	location.href="/project_mini/sendEmail?memberEmail=" + sid;	 
}
function foo() {
	alert("입력하신 정보로 이메일을 발송합니다");
}
</script>
</body>
</html> -->
<html>
  <head>
    <meta charset="utf-8">
    <title>CGW</title>
    <link rel="stylesheet" href="/project_mini/css/style_mail.css">
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
  </head>
  <body>
    <form action=/project_mini/sendEmail method="post" name="sign up for beta form">
      <div class="header">
         <p>FIND ID/PASSWORD</p>
      </div>
      <div class="description">
        <p>회원가입시 등록하신 이메일 주소로 ID/PASSWORD를 발송합니다 이메일 정보를 정확하게 입력해주세요</p>
      </div>
      <div class="input">
        <input type="text" class="button" id="email" name="email" placeholder="NAME@EXAMPLE.COM">
        <input type="submit" class="button" id="submit" onclick=" foo()" value="SIGN UP">
      </div>
      <div class="description">
        <p><a href="/project_mini/member/login.jsp">로그인 페이지로</a></p>
      </div>
    </form>
    
    <script type="text/javascript">
//이메일 전송 버튼 클릭시 문구가 뜨게 하는 메소드
function foo() {
	alert("입력하신 정보로 이메일을 발송합니다");
}
</script>
    
  </body>
</html>