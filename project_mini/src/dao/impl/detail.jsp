<%@page import="vo.Movie"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=((Movie) request.getAttribute("movieDetail")).getMovieId() %>
<%=((Movie) request.getAttribute("movieDetail")).getMovieTitle() %>
<%=((Movie) request.getAttribute("movieDetail")).getMovieGenre() %>
<%=((Movie) request.getAttribute("movieDetail")).getMovieDirector() %>
<%=((Movie) request.getAttribute("movieDetail")).getMovieActor() %>
<%=((Movie) request.getAttribute("movieDetail")).getMovieDate() %>
<%=((Movie) request.getAttribute("movieDetail")).getMovieImage() %>
<%=((Movie) request.getAttribute("movieDetail")).getMovieVideo() %>

</body>
</html>