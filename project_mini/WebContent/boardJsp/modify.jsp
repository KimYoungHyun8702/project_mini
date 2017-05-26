<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="enconding">
<title>CGW</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
	<h2>게시글을 수정 하세용 ~~</h2>
	<%-- 제목 : ${requestScope.title }<br>
	내용 <br>
	${requestScope.content }<br>
	작성 일자 : ${requestScope.date }<br> --%>
	
	<form action="${initParam.rootPath }/ModifyController" method="post">
			영화 : <input type="text" value="${requestScope.board.movieId }" name = "movieId"/><br>
			평점 : <input type="number" value="${requestScope.board.boardScore }" name = "boardScore" max="5" min="1"/><br>
			제목 : <input type="text" value="${requestScope.board.boardTitle}" name="boardTitle"/><br>
			내용<br>
			<textarea rows = "10" cols = "100" name = "boardContent">${requestScope.board.boardContent}</textarea><br>
			<input type="hidden" name="memberId" value="${sessionScope.memberLoginInfo.memberId }"/>
			<input type="hidden" name="boardId" value="${requestScope.board.boardId }"/>
			<input type="hidden" name="boardReference" value="${requestScope.board.boardReference }"/>
			<input type = "submit" onclick="msg()" value="수정완료"/>
	</form>
	<button onclick="location.href='${initParam.rootPath }/SelectByIdController?boardId=${requestScope.board.boardId }&memberId=${sessionScope.memberLoginInfo.memberId }'">뒤로가기</button>
</body>
<script type="text/javascript">
function msg(){
	alert("게시글 수정을 완료 했습니다 !!!");
}
</script>
</html>