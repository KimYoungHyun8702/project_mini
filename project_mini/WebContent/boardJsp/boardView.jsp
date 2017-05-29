<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGW</title>
<link href="/project_mini/css/board_boardView.css" rel="stylesheet" type="text/css">
<style>

c:link {	
   /*방문하지 않은 링크 설정.*/
   text-decoration: none; /*밑줄 안나오도록 처리.*/
   color: green;
}

c:visited {
   /*방문한 링크 설정*/
   text-decoration: none;
   color: green;
}

c:hover {
   /*마우스 포인터가 올라간 시점의 설정.*/
   text-decoration: underline;
   color: red;
}

c:active {
   /*마우스를 링크에 클릭하는 시점*/
   color: blue;
}

table, td {
   border: 1px solid #d9d9d9;
}
table {
   border-collapse: collapse;
   width: 1000px;
}

td {
   padding: 10px;
}
/* p.double{border-style: double;} */
/* p.seven {
    border-style: solid;
    border-width: 2px 10px 4px 20px;
} */
p {
	border-radius: 10px;
    border-left: 20px solid #3498DB;
    border-right:20px solid #3498DB;
    background-color: #d9d9d9;
    text-align:center;
    width:60%;
    padding:20px;
}

.boarddiv {
	text-align:center;
	border-radius: 10px;
	border-left: 20px solid #3498DB;
    border-right:20px solid #3498DB;
    background-color: #d9d9d9;
    padding:10px;
    width:800px;
}
</style>
</head>
<body>
   <jsp:include page="/layout.jsp" />
   <br><br><br>
   <center><h2>게시판 목록</h2><br>
   <c:if test="${sessionScope.deleteMessage != null}">
      <script type="text/javascript">
         alert("삭제 되었습니다.");
      </script>
   </c:if>
   <% session.removeAttribute("deleteMessage"); %>
   <c:if  test="${sessionScope.insertMessage != null}">
      <script type="text/javascript">
         alert("등록 되었습니다.");
      </script>
   </c:if>
   <% session.removeAttribute("insertMessage"); %>
   <!-- <p class="double" align = "center" size = "10">상위 TOP3 게시글</p> -->
   <p>추천수 상위 TOP3 게시글</p>
   <table>
      <thead>
         <tr>
            <td align="center">게시글 번호</td>
            <td align="center">영화 제목</td>
            <td align="center">게시글 제목</td>
            <td align="center">작성자</td>
            <td align="center">글쓴 날짜</td>
            <td align="center">추천수</td>
            <td align="center">평점</td>
            <td align="center">조회수</td>
         </tr>
      </thead>
      <tbody>
         <%-- ######################################################
                                          조회된 item 출력 
         ###################################################### --%>
         <c:forEach items="${sessionScope.top }" var="top">
            <tr>
               <td align="center">${top.boardId }</td>
               <td align="center">${top.movieTitle }</td>
               <td align="center"><a
                  href="${initParam.rootPath }/SelectByIdController?boardId=${top.boardId }&memberId=${sessionScope.memberLoginInfo.memberId}">${top.boardTitle }</a></td>
               <td align="center">${top.memberId }</td>
               <td align="center">${top.boardDate }</td>
               <td align="center">${top.boardReference }</td>
               <td align="center">${top.boardScore }</td>
               <td align="center">${top.boardCount }</td>
            </tr>
         </c:forEach>
      </tbody>
   </table><br><br><br>
   
   <p>전체 게시글 목록</p>
   <table>
      <thead>
         <tr>
            <td align="center">게시글 번호</td>
            <td align="center">영화 제목</td>
            <td class = "td3" align="center">게시글 제목</td>
            <td align="center">작성자</td>
            <td align="center">글쓴 날짜</td>
            <td align="center">추천수</td>
            <td align="center">평점</td>
            <td align="center">조회수</td>
         </tr>
      </thead>
      <tbody>
         <%-- ######################################################
                                          조회된 item 출력 
         ###################################################### --%>
         <c:forEach items="${sessionScope.list }" var="board">
            <tr>
               <td align="center">${board.boardId }</td>
               <td align="center">${board.movieTitle }</td>
               <td align="center"><a
                  href="${initParam.rootPath }/SelectByIdController?boardId=${board.boardId }&memberId=${sessionScope.memberLoginInfo.memberId}">${board.boardTitle }</a></td>
               <td align="center">${board.memberId }</td>
               <td align="center">${board.boardDate }</td>
               <td align="center">${board.boardReference }</td>
               <td align="center">${board.boardScore }</td>
               <td align="center">${board.boardCount }</td>
            </tr>
         </c:forEach>
      </tbody>
   </table><br><br>

   <form action="${initParam.rootPath}/boardSearchByBoardTitleController"
      method="post">
      검색 <select name="searchBy">
         <option value="boardTitle">게시글 제목</option>
         <option value="movieTitle">영화 제목</option>
         <option value="memberId">작성자 ID</option>
      </select> <input type="text" name="keyWord" /> 
      <input type="submit" value="검색" />
      <input type="reset" value="입력 초기화" />&nbsp;
   </form>
    <c:if test="${sessionScope.memberLoginInfo.memberId != null}">
      <button onclick="location.href='/project_mini/movieJsp/search/searchForm.jsp'">영화 검색후 글쓰기!!</button><br><br>
   </c:if>
   <div class="boarddiv">
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
         <c:when test="${sessionScope.boardBean.previousPageGroup}">
            <!--이전 페이지 그룹이 있다면 : isPreviousPageGroup()  -->
            <a
               href="${initParam.rootPath }/SelectController?page=${sessionScope.boardBean.beginPage-1}">◀</a>
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
      <c:forEach begin="${sessionScope.boardBean.beginPage }"
         end="${sessionScope.boardBean.endPage }" var="page">
         <c:choose>
            <c:when test="${sessionScope.boardBean.page != page }">
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
         <c:when test="${sessionScope.boardBean.nextPageGroup }">
            <a
               href="${initParam.rootPath }/SelectController?page=${sessionScope.boardBean.endPage+1}">▶</a>
         </c:when>
         <c:otherwise>
         ▶
         </c:otherwise>

      </c:choose>

      <!-- 마지막 페이지로 이동 -->
      <a
         href="${initParam.rootPath }/SelectController?page=${sessionScope.boardBean.totalPage}">마지막
         페이지</a>
         </div>
</body>
</html>

