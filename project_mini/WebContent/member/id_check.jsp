<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function use(){
	alert(opener.document.joinform.isdup.value);
	opener.document.joinform.isdup.value = 'Y';
	window.close();
}
</script>
</head>
<body>
<form action="/project_mini/memberIdCheck" method="post">
<tr style = "text-align:center">
		<td>아이디 입력</td>
		<td><input id="memberId" type="text" name="Id"></td>
	</tr>
<input type="submit" value="중복확인"><br><br>
<button type="button" onclick="use();"> 사용</button>
</body>
</html>