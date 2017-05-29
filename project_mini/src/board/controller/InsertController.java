package board.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.impl.BoardServiceImpl;
import board.vo.Board;

public class InsertController extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession session = req.getSession();
      int movieId = Integer.parseInt(req.getParameter("movieId"));
      String boardTitle = req.getParameter("boardTitle");
      String boardContent = req.getParameter("boardContent");
      int boardScore = Integer.parseInt(req.getParameter("boardScore"));
      String memberId = req.getParameter("memberId");
      int boardReference = Integer.parseInt(req.getParameter("boardReference"));
      String movieTitle = req.getParameter("movieTitle");
      
      BoardServiceImpl service = BoardServiceImpl.getInstance();  
      service.InsertBoardService(new Board(1,boardTitle,new Date(),boardContent,boardScore,boardReference,memberId,movieId,movieTitle,0));
      session.setAttribute("insertMessage", "insertMessage");
      
      resp.sendRedirect("/project_mini/SelectController");
   }
}