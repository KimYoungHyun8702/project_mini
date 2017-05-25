<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신이 원하는 바로 그 영화!@KOSTA탈주</title>
</head>
<body style="align: center">
	<jsp:include page="/layout.jsp" />
	<h1 align="center">검색 결과</h1>
	<hr>
	<section>
		<c:choose>
			<c:when test="${requestScope.resultMovieList.size()>0 }">
				<table style="align: center; width: 100%;">
					<tr>

						<c:forEach var="resultMovie"
							items="${requestScope.resultMovieList }" varStatus="loop">
							<c:choose>
								<c:when test="${loop.count%5==0 }">
									<td><a
										href="/project_mini/detailServlet?movie=${resultMovie.movieId }">
											<img src="${resultMovie.movieImage}" width="240px"
											height="344px">
									</a><br> <a
										href="/project_mini/detailServlet?movie=${resultMovie.movieId }">${resultMovie.movieTitle}</a>
									</td>
									<tr>
								</c:when>
								<c:otherwise>
									<td><a
										href="/project_mini/detailServlet?movie=${resultMovie.movieId }">
											<img src="${resultMovie.movieImage}" width="240px"
											height="344px">
									</a><br> <a
										href="/project_mini/detailServlet?movie=${resultMovie.movieId }">${resultMovie.movieTitle}</a>
									</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<p align="center">해당하는 영화가 없습니다.</p>
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>