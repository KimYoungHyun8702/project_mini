package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardService;
import board.service.impl.BoardServiceImpl;
import board.vo.Board;

public class PostModifyController extends HttpServlet{
   @Override
      protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         doPost(req, resp);
      }
      
      @Override
      protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
             
         int boardId = Integer.parseInt(req.getParameter("boardId"));
                 
         BoardService service = BoardServiceImpl.getInstance();
         Board board = service.selectBoardById(boardId);

         req.setAttribute("board", board);  
         req.getRequestDispatcher("/boardJsp/modify.jsp").forward(req, resp);
      }
}