<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGW</title>
</head>
<body>
	<jsp:include page="/layout.jsp" />
	<h1 align="center">영화 검색하기</h1>
	<hr color="#3498DB" size="3" noshade>
	<div style="width: 33%; margin: 0 0 0 41%;">
		<form action="${initParam.rootPath }/searchServlet" method="post">
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
					type="number" name="searchNumByDate" value="2017"></label><br>
			</p>
			<p style="margin: 0 0 0 80px;">
				<input type="submit" value="검색" style="width: 100px; height: 30px">
			</p>
		</form>
	</div>
</body>
</html>