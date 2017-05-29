<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="enconding">
<title>CGW</title>
<link href="/project_mini/css/board_input.css" rel="stylesheet" type="text/css">
<style>
form {
   font-family : "batang";
   font-size:20px;
   text-align:center;
}
body {
    background-image: url("https://cdn.pixabay.com/photo/2014/04/16/17/08/bulletin-board-325721_960_720.jpg");
     
    /* padding : 10px;
    margin:10px; */
}
</style>
</head>
<body>
   <jsp:include page="/layout.jsp" />
   <br><br><br>
   <h2>게시글을 수정 하세용 ~~</h2>
   <%-- 제목 : ${requestScope.title }<br>
   내용 <br>
   ${requestScope.content }<br>
   작성 일자 : ${requestScope.date }<br> --%>
   
   <form action="${initParam.rootPath }/ModifyController" method="post">
         영화 제목 : <input type="text" value="${requestScope.board.movieTitle }" size = 40 name = "movieTitle" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         평점 : <input type="number" value="${requestScope.board.boardScore }" size = 30 name = "boardScore" max="5" min="1"/><br><br>
         제목 : <input type="text" value="${requestScope.board.boardTitle}" size = 70 name="boardTitle"/><br><br><br>
         내용<br><br>
         <textarea rows = "10" cols = "100" name = "boardContent">${requestScope.board.boardContent}</textarea><br><br>
         <input type="hidden" name="memberId" value="${sessionScope.memberLoginInfo.memberId }"/>
         <input type="hidden" name="boardId" value="${requestScope.board.boardId }"/>
         <input type="hidden" name="movieId" value="${requestScope.board.movieId }"/>
         <input type="hidden" name="boardReference" value="${requestScope.board.boardReference }"/>
         <input type="hidden" name="boardCount" value="${requestScope.board.boardCount }"/>
         <input type="hidden" name="modifyMessage" value="message"/>
         <input type = "submit" onclick="msg()" value="수정완료"/><br><br>
   </form>
   <center><button onclick="location.href='${initParam.rootPath }/SelectByIdController?boardId=${requestScope.board.boardId }&memberId=${sessionScope.memberLoginInfo.memberId }&back=back'">뒤로가기</button></center>
</body>
</html>