<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="enconding">
<title>게시글 정보</title>
</head>
<body>
<h1>테이블 정보입니다</h1>
<table border = "1" width="1000">
	<thead>
		<tr>
			<td>작성자 </td>
			<td>영화</td>
			<td>제목 </td>
			<td>내용 </td>
			<td>작성일자 </td>
			<td>추천수 </td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${requestScope.board.memberId}</td>
			<td>${requestScope.board.movieId}</td>
			<td>${requestScope.board.boardTitle}</td>
			<td>${requestScope.board.boardContent}</td>
			<td>${requestScope.board.boardDate}</td>
			<td>${requestScope.board.boardReference}</td>
		</tr>
	</tbody>
</table>
	
	<c:if test="${requestScope.board.memberId == sessionScope.memberLoginInfo }">
	<button onclick="location.href='${initParam.rootPath }/PostModifyController?boardId=${requestScope.board.boardId }'">수정</button>
	<button onclick="location.href='${initParam.rootPath }/DeleteController?boardId=${requestScope.board.boardId }'">삭제</button>
	</c:if>
	
	<c:if test="${requestScope.reference == null}">
	<button onclick="location.href='${initParam.rootPath }/ReferenceController?boardId=${requestScope.board.boardId }&memberId=${sessionScope.memberLoginInfo }'">추천하기 꾸욱~</button>
	</c:if>
	
	<button onclick="location.href='${initParam.rootPath }/SelectController?memberId=${sessionScope.memberLoginInfo }'">뒤로가기</button>
</body>
</html>