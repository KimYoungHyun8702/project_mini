<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
c:link{
   /*방문하지 않은 링크 설정.*/
   text-decoration:none; /*밑줄 안나오도록 처리.*/
   color:green;
}
c:visited{
   /*방문한 링크 설정*/
   text-decoration: none;
   color:green;
}
c:hover{
   /*마우스 포인터가 올라간 시점의 설정.*/
   text-decoration: underline;
   color:red;
}
c:active{
   /*마우스를 링크에 클릭하는 시점*/
   color:blue;
}
table, td{
   border: 1px solid gray;
}
table{
   border-collapse: collapse;
   width: 1000px;
}
td{
   padding: 10px;
}
</style>
</head>
<body>
<jsp:include page="/layout.jsp" />
<h2>게시판 목록</h2>
<table>
   <thead>
      <tr>
         <td align="center">게시판 번호</td>
         <td align="center">영화 제목</td>
         <td align="center">제목</td>
         <td align="center">작성자</td>
         <td align="center">글쓴 날짜</td>
         <td align="center">추천수</td>
         <td align="center">평점</td>
      </tr>
   </thead>
   <tbody>
      <%-- ######################################################
                                          조회된 item 출력 
         ###################################################### --%>
      <c:forEach items="${requestScope.list }" var="board">
         <tr>
            <td align="center">${board.boardId }</td>
            <td align="center">${board.movieId }</td>
            <td align="center"><a href="${initParam.rootPath }/SelectByIdController?boardId=${board.boardId }&memberId=${sessionScope.memberLoginInfo.memberId}">${board.boardTitle }</a></td>
            <td align="center">${board.memberId }</td>
            <td align="center">${board.boardDate }</td>
            <td align="center">${board.boardReference }</td>
            <td align="center">${board.boardScore }</td>
         </tr>
      </c:forEach>
      
   </tbody>
</table>

<p>
   <%-- ######################################################
                                          페이징 처리
         ###################################################### --%>
   <!-- 첫페이지로 이동 -->
   <a href="${initParam.rootPath }/SelectController?page=1">첫 페이지</a>

   <!--
      이전 페이지 그룹 처리.
      만약에 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리.
    -->
      <c:choose>
         <c:when test="${requestScope.boardBean.previousPageGroup}">
         <!--이전 페이지 그룹이 있다면 : isPreviousPageGroup()  -->
         <a href="${initParam.rootPath }/SelectController?page=${requestScope.boardBean.beginPage-1}">◀</a>
         </c:when>
         <c:otherwise>
         ◀
         </c:otherwise>
      </c:choose>




   <!-- 
      현재 page가 속한 page 그룹내의 페이지들 링크.
      현재 pageGroup의 시작page ~ 끝 page
    -->
    <!-- 만약에 p가 현재페이지면 링크처리를 하지 않고 p가 현재페이지가 아니라면 링크처리. -->
      <c:forEach begin="${requestScope.boardBean.beginPage }"
         end="${requestScope.boardBean.endPage }" var="page">
         <c:choose>
            <c:when test="${requestScope.boardBean.page != page }">
               <!--현재 페이지가 아니라면  -->
               <a href="${initParam.rootPath }/SelectController?page=${page}">${page }</a>
            </c:when>
            <c:otherwise>
               [${page }]&nbsp;
            </c:otherwise>
         </c:choose>
      </c:forEach>

      <!-- 
      다음페이지 그룹으로 이동
      만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
    -->
   <c:choose>
         <c:when test="${requestScope.boardBean.nextPageGroup }">
            <a href="${initParam.rootPath }/SelectController?page=${requestScope.boardBean.endPage+1}">▶</a>
         </c:when>
         <c:otherwise>
         ▶
         </c:otherwise>

      </c:choose> 
      
   <!-- 마지막 페이지로 이동 -->
   <a href="${initParam.rootPath }/SelectController?page=${requestScope.boardBean.totalPage}">마지막 페이지</a>


<button onclick="location.href='${initParam.rootPath }/boardJsp/input.jsp'">글쓰기</button>
</body>
</html>



