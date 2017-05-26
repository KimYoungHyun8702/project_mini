<%@page import="vo.Movie"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신이 원하는 바로 그 영화!@KOSTA탈주</title>
</head>
<body>
<<<<<<< HEAD
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
=======
   <jsp:include page="/layout.jsp" />
   <section>
      <table style="width:66%;margin:30px auto auto auto;">
         <tr>
            <th colspan="3" style="font-size:30px;padding:20px;">${requestScope.movieDetail.movieTitle}</th>
         </tr>
         <tr>
            <td>장르</td>
            <td>${requestScope.movieDetail.movieGenre}</td>
            <td rowspan="5">
               <a href="${requestScope.movieDetail.movieImage}" target="_blank">
                  <img src="${requestScope.movieDetail.movieImage}" style="width:100px"></a>
            </td>
         </tr>
         <tr>
            <td>감독</td>
            <td>${requestScope.movieDetail.movieDirector}</td>
         </tr>
         <tr>
            <td>배우</td>
            <td>${requestScope.movieDetail.movieActor}</td>
         </tr>
         <tr>
            <td>개봉년도</td>
            <td>${requestScope.movieDetail.movieDate}</td>
         </tr>
         <tr>
            <td>평균 평점</td>
            <td>${requestScope.movieDetail.movieAvgScore}</td>
         </tr>
      </table>
   </section>
   <section>
      <div style="width:600px;margin:30px auto;">
         <iframe style="align:center" width="600" height="300" src="${requestScope.movieDetail.movieVideo}"></iframe>
      </div>
   </section>
   <a href="${initParam.rootPath }/boardJsp/input.jsp">게시글등록</a>
>>>>>>> branch 'master' of https://github.com/KimYoungHyun8702/project_mini.git
</body>
</html>