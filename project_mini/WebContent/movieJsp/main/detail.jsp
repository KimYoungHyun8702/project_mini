<%@page import="vo.Movie"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신이 원하는 바로 그 영화!@KOSTA탈주</title>
</head>
<body>
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
</body>
</html>