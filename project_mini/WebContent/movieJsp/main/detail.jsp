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
		<table style="align:center;min-width:600px;max-width:600px;margin:30px auto auto auto;border:1px solid #d9d9d9;border-collapse:collapse">
			<tr style="border:1px solid #d9d9d9;padding:20px auto;">
				<th colspan="3" style="font-size:30px;padding:20px auto;"><%=((Movie) request.getAttribute("movieDetail")).getMovieTitle()%></th>
			</tr>
			<tr style="border:1px solid #d9d9d9;">
				<td style="width:100px;border:1px solid #d9d9d9;">장르</td>
				<td style="border:1px solid #d9d9d9;"><%=((Movie) request.getAttribute("movieDetail")).getMovieGenre()%></td>
				<td rowspan="5" style="width:100px">
					<a href="<%=((Movie) request.getAttribute("movieDetail")).getMovieImage()%>" target="_blank">
						<img src="<%=((Movie) request.getAttribute("movieDetail")).getMovieImage()%>" style="width:100px"></a>
				</td>
			</tr>
			<tr style="border:1px solid #d9d9d9;">
				<td style="border:1px solid #d9d9d9;">감독</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieDirector()%></td>
			</tr>
			<tr style="border:1px solid #d9d9d9;">
				<td style="border:1px solid #d9d9d9;">배우</td>
				<td style="padding:0px 15px"><%=((Movie) request.getAttribute("movieDetail")).getMovieActor()%></td>
			</tr>
			<tr style="border:1px solid #d9d9d9;">
				<td style="border:1px solid #d9d9d9;">개봉년도</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieDate()%></td>
			</tr>
			<tr style="border:1px solid #d9d9d9;">
				<td style="border:1px solid #d9d9d9;">평균 평점</td>
				<td><%=((Movie) request.getAttribute("movieDetail")).getMovieAvgScore()%></td>
			</tr>
		</table>
	</section>
	<section>
		<div style="width:800px;margin:30px auto;">
			<iframe style="align:center" width="800px" height="400px" src="<%=((Movie) request.getAttribute("movieDetail")).getMovieVideo()%>"></iframe>
		</div>
	</section>
	<c:if test="${sessionScope.memberLoginInfo.memberId != null }">
	<div style="margin:auto;border-radius:5px; display:block; background-color:#3498DB; color:#ffffff;text-align:center;width:200px;padding:15px auto;">
	<a href="${initParam.rootPath }/InputDataController?movieId=<%=((Movie) request.getAttribute("movieDetail")).getMovieId()%>&movieTitle=<%=((Movie) request.getAttribute("movieDetail")).getMovieTitle()%>">게시글 쓰기</a>
	</div>
	</c:if>
</body>
</html>