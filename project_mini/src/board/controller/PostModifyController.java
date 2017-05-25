package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostModifyController extends HttpServlet{
	@Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      doPost(req, resp);
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
	      //1.요청파라미터 조회
	      String memberId = req.getParameter("memberId");
	      String boardTitle = req.getParameter("boardTitle");
	      String boardContent = req.getParameter("boardContent");
	      int movieId = Integer.parseInt(req.getParameter("movieId"));
	      int boardScore = Integer.parseInt(req.getParameter("boardScore"));
	      int boardId = Integer.parseInt(req.getParameter("boardId"));
	      String boardDate = req.getParameter("boardDate");
	      int boardReference = Integer.parseInt(req.getParameter("boardReference"));
	      
	    		  
	      
	   
	      //2. 비즈니스로직
	      req.setAttribute("boardId", boardId);
	      req.setAttribute("memberId", memberId);
	      req.setAttribute("boardTitle", boardTitle);
	      req.setAttribute("movieId", movieId);
	      req.setAttribute("boardScore", boardScore);
	      req.setAttribute("boardContent", boardContent);
	      req.setAttribute("boardDate", boardDate);
	      req.setAttribute("boardReference", boardReference);
	      
	      
	      
	      //modify.jsp로 이동
	      req.getRequestDispatcher("/boardJsp/modify.jsp").forward(req, resp);
	   }

}
