<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<center>
<title>CGW</title>
</center>
<link href="/project_mini/css/board_input.css" rel="stylesheet" type="text/css">
<style>
h2 {
	font-family:godik;
}
form {
   font-family : "godik";
   font-size:20px;
   text-align:center;
}
body {
	background-color : #fef3d3;
}

</style>
</head>
<body>
   <jsp:include page="/layout.jsp" />
   <br><br><br>
   <center><h2>게시글 등록</h2>
      <form action="${initParam.rootPath }/InsertController" method="post">
         영화제목 : <input type="text" name="movieTitle" size=40 value="${requestScope.movieTitle }" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;
         평점 : <input type="number" name="boardScore" max="5" min="1" size = 30/><br><br>
         제목 : <input type="text" name="boardTitle" size = 70/><br><br>
         내용<br><br>
         <textarea rows = "10" cols = "100" name = "boardContent"></textarea><br><br><br>
         <input type="submit" onclick="msg()" value="등록"/>
         <input type="reset" value="초기화"/>
         <input type="button" value="취소" onclick="location.href='${initParam.rootPath }/SelectController'"/>
         <input type="hidden" name="memberId" value="${sessionScope.memberLoginInfo.memberId  }"/>
         <input type="hidden" name="movieId" value="${requestScope.movieId }"/>
         <input type="hidden" name="boardReference" value="0"/></center>
      </form>
</body>
</html>