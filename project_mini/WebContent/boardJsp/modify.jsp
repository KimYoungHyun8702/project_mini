<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="enconding">
<title>수정</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
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
			<input type="hidden" name="memberId" value="${requestScope.memberId }"/>
			<input type="hidden" name="boardId" value="${requestScope.boardId }"/>
		<%-- 	<input type="hidden" name="boardReference" value="${requestScope.boardReference}"/>
			<input type="hidden" name = "boardScore" value="${requestScope.boardScore }"/> --%>
			<input type = "submit" value="수정완료"/>
	</form>
			<%-- <input type="submit" value="수정완료"/>
			<input type="reset" value="삭제"/>
			<input type="button" value="뒤로가기" onclick="location.href='${initParam.rootPath }/index.jsp'"/>
			<input type="hidden" name="memberId" value=12/> --%>
		<!-- </form> -->
		
		
	
	<%-- <c:if test="${memberId == sessionScope.memberId }">
	</c:if> --%>
	<button onclick="location.href='${initParam.rootPath }/SelectBoardInfoController?movieId=${requestScope.movieId }&boardScore=${requestScope.boardScore }&boardTitle=${requestScope.boardTitle }&boardContent=${requestScope.boardContent }&memberId=${requestScope.memberId }&boardId=${requestScope.boardId }&boardReference=${requestScope.boardReference }&boardDate=${requestScope.boardDate}'">뒤로가기</button>

	<!-- http://127.0.0.1:8088/project_mini/SelectBoardInfoController?boardReference=0
	&boardId=92
	&boardScore=2
	&boardTitle=%EB%9D%BC%EB%A7%88%EB%B0%94
	&boardContent=%EB%9D%BC%EB%B0%94%EB%A7%88
	&boardDate=Wed%20May%2024%2020:44:28%20KST%202017
	&memberId=%EB%B0%94%EA%BF%94%EC%95%BC%ED%95%A8
	&movieId=2 -->
</body>
</html>