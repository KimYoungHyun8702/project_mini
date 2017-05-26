<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
	<h2>게시판 등록</h2>
		<form action="${initParam.rootPath }/InsertController" method="post">
			영화 제목 : <input type="text" name="movieTitle" value="${requestScope.movieTitle }" readonly/>
			평점 : <input type="number" name="boardScore" max="5" min="1"/><br>
			제목 : <input type="text" name="boardTitle"/><br>
			내용<br>
			<textarea rows = "10" cols = "100" name = "boardContent"></textarea><br>
			<input type="submit" onclick="msg()" value="등록"/>
			<input type="reset" value="초기화"/>
			<input type="button" value="취소" onclick="location.href='${initParam.rootPath }/SelectController'"/>
			<input type="hidden" name="memberId" value="${sessionScope.memberLoginInfo.memberId  }"/>
			<input type="hidden" name="movieId" value="${requestScope.movieId }"/>
			<input type="hidden" name="boardReference" value="0"/>
		</form>
</body>
<script type="text/javascript">
function msg(){
	alert("게시물 등록 완료했습니다!!.!!");
}
</script>