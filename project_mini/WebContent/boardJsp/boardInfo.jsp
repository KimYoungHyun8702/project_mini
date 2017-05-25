<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="enconding">
<title>게시글 정보</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
	<h1>테이블 정보입니다</h1>
	<table border = "1" width="1000">
		<thead>
			<tr>
				<td>작성자 </td>
				<td>영화</td>
				<td>제목 </td>
				<td>내용 </td>
				<td>작성일자 </td>
			</tr>
		</thead>
		<tbody>
			<td>${requestScope.memberId}</td>
			<%-- <td>${sessionScope.memberId }</td> --%>
			<td>${requestScope.movieId}</td>
			<td>${requestScope.boardTitle}</td>
			<td>${requestScope.boardContent}</td>
			<td>${requestScope.boardDate}</td>
		</tbody>
	</table>
	
		
		<c:if test="${requestScope.memberId == sessionScope.memberLoginInfo.memberId }">
		<button onclick="location.href='${initParam.rootPath }/PostModifyController?boardId=${requestScope.boardId }&memberId=${requestScope.memberId}&boardTitle=${requestScope.boardTitle}&movieId=${requestScope.movieId}&boardScore=${requestScope.boardScore}&boardContent=${requestScope.boardContent}&boardReference=${requestScope.boardReference }&boardDate=${requestScope.boardDate }'">수정</button>
		<button onclick="location.href='${initParam.rootPath }/DeleteController?boardId=${requestScope.boardId }'">삭제</button>
		</c:if>
		<button onclick="location.href='${initParam.rootPath }/SelectController'">뒤로가기</button>
	</body>
</html>