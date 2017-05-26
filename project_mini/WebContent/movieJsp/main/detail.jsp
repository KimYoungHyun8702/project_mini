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
	<section>
		<table style="width:66%;margin:30px auto auto auto;">
			<tr>
				<th colspan="3" style="font-size:30px;padding:20px;"><%=((Movie) request.getAttribute("movieDetail")).getMovieTitle()%></th>
			</tr>
			<tr>
				<td>장르</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieGenre()%></td>
				<td rowspan="5">
					<a href="<%=((Movie) request.getAttribute("movieDetail")).getMovieImage()%>" target="_blank">
						<img src="<%=((Movie) request.getAttribute("movieDetail")).getMovieImage()%>" style="width:100px"></a>
				</td>
			</tr>
			<tr>
				<td>감독</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieDirector()%></td>
			</tr>
			<tr>
				<td>배우</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieActor()%></td>
			</tr>
			<tr>
				<td>개봉년도</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieDate()%></td>
			</tr>
			<tr>
				<td>평균 평점</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieAvgScore()%></td>
			</tr>
		</table>
	</section>
	<section>
		<div style="width:600px;margin:30px auto;">
			<iframe style="align:center" width="600" height="300" src="<%=((Movie) request.getAttribute("movieDetail")).getMovieVideo()%>"></iframe>
		</div>
	</section>
	<c:if test="${sessionScope.memberLoginInfo.memberId != null }">
	<a href="${initParam.rootPath }/InputDataController?movieId=<%=((Movie) request.getAttribute("movieDetail")).getMovieId()%>&movieTitle=<%=((Movie) request.getAttribute("movieDetail")).getMovieTitle()%>">게시글 쓰기</a>
	</c:if>
</body>
</html>