<%@page import="vo.Movie"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGW</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
	<h1 align="center">추천영화</h1>
	<hr>
	<table style="align:center;width:100%;">
		<tr>
			<c:forEach var="top5Movie" items="${requestScope.top5MovieList }">
				<td><a
					href="${initParam.rootPath }/detailServlet?movie=${top5Movie.movieId }">
						<img src="${top5Movie.movieImage}" width="240px" height="344px">
				</a></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="top5Movie" items="${requestScope.top5MovieList }">
				<td><a
					href="${initParam.rootPath }/detailServlet?movie=${top5Movie.movieId }">${top5Movie.movieTitle}</a></td>
			</c:forEach>
		</tr>
	</table>
</body>
</html>
