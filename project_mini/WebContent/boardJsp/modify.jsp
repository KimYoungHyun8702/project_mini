<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="enconding">
<title>수정</title>
</head>
<body>
	<h2>수정 하세용 ~~</h2>
	<%-- 제목 : ${requestScope.title }<br>
	내용 <br>
	${requestScope.content }<br>
	작성 일자 : ${requestScope.date }<br> --%>
	
	<form action="${initParam.rootPath }/ModifyController" method="post">
			영화 : <input type="text" value="${requestScope.movieId }" name = "movieId"/><br>
			평점 : <input type="number" value="${requestScope.boardScore }" name = "boardScore" max="5" min="1"/><br>
			제목 : <input type="text" value="${requestScope.boardTitle}" name="boardTitle"/><br>
			내용<br>
			<textarea rows = "10" cols = "100" name = "boardContent">${requestScope.boardContent}</textarea><br>
			<input type="hidden" name="memberId" value="${sessionScope.loginId }"/>
			<input type="hidden" name="boardId" value="${requestScope.boardId }"/>
			<input type="hidden" name="boardReference" value="0"/>
			<input type = "submit" value="수정완료"/>
	</form>
			<%-- <input type="submit" value="수정완료"/>
			<input type="reset" value="삭제"/>
			<input type="button" value="뒤로가기" onclick="location.href='${initParam.rootPath }/index.jsp'"/>
			<input type="hidden" name="memberId" value=12/> --%>
		<!-- </form> -->
		
		
	
	<%-- <c:if test="${memberId == sessionScope.memberId }">
	</c:if> --%>
	<button onclick="location.href='${initParam.rootPath }/boardInfo.jsp'">뒤로가기</button>
</body>
</html>