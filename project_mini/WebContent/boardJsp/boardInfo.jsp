<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="enconding">
<title>CGW</title>
<link href="/project_mini/css/board_boardInfo.css" rel="stylesheet" type="text/css">
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
<jsp:include page="/layout.jsp" />
<br><br><br><br><br>
   <center><p><h1>게시글 정보입니다</h1></center><br><br>
   <c:if test="${sessionScope.msg != null}">
      <script type="text/javascript">
         alert("수정되었습니다.");
      </script>
   </c:if>
      <% session.removeAttribute("msg"); %>
   <center><table border="1" width="1000">
      <thead>
         <tr>
            <td>게시글 번호</td>
            <td>영화 제목</td>
            <td>제목</td>
            <td>작성자</td>
            <td>내용</td>
            <td>작성일자</td>
            <td>추천수</td>
            <td>평점</td>
            <td>조회수</td>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>${sessionScope.board.boardId }</td>
            <td>${sessionScope.board.movieTitle }</td>
            <td>${sessionScope.board.boardTitle}</td>
            <td>${sessionScope.board.memberId}</td>
            <td>${sessionScope.board.boardContent}</td>
            <td>${sessionScope.board.boardDate}</td>
            <td>${sessionScope.board.boardReference}</td>
            <td>${sessionScope.board.boardScore }</td>
            <td>${sessionScope.board.boardCount }</td>
         </tr>
      </tbody>
   </table><br><br>
   <c:if
      test="${sessionScope.board.memberId == sessionScope.memberLoginInfo.memberId }">&nbsp;&nbsp;
      <button onclick="location.href='${initParam.rootPath }/PostModifyController?boardId=${sessionScope.board.boardId }'">수정</button>&nbsp;&nbsp;
      <button onclick="location.href='${initParam.rootPath }/DeleteController?boardId=${sessionScope.board.boardId }'">삭제</button>&nbsp;&nbsp;
   </c:if>
   <c:if test="${sessionScope.memberLoginInfo.memberId != null}">
      <c:if test="${sessionScope.reference == null}">
         <button onclick="location.href='${initParam.rootPath }/ReferenceController?boardId=${sessionScope.board.boardId }&memberId=${sessionScope.memberLoginInfo.memberId }'">추천하기 꾸욱~</button>&nbsp;&nbsp;
      </c:if>
   </c:if>
   <button
      onclick="location.href='${initParam.rootPath }/SelectController?memberId=${sessionScope.memberLoginInfo.memberId }'">뒤로가기</button></center>
</body>
</html>