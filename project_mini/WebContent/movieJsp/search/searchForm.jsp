<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신이 원하는 바로 그 영화!@KOSTA탈주</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
	<h1 align=center>영화 검색하기</h1>
	<div style="width: 33%; margin: 0 0 0 41%;">
		<form action="/project_mini/searchServlet" method="post">
			<label for="title">영화 제목 : <input type="radio"
				name="searchField" value="searchByTitle" id="title" checked="true">
				<input type="text" name="searchTextByTitle"></label><br>

			<p>
				<label for="genre">영화 장르 : <input type="radio"
					name="searchField" value="searchByGenre" id="genre"> <input
					type="text" name="searchTextByGenre"></label><br>
			</p>

			<p>
				<label for="date">개봉 년도 : <input type="radio"
					name="searchField" value="searchByDate" id="date"> <input
					type="number" name="searchNumByDate" value="2015"></label><br>
			</p>
			<p style="margin: 0 0 0 80px;">
				<input type="submit" value="검색" style="width:100px;height:30px">
			</p>
		</form>
	</div>
</body>
</html>