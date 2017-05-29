package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardService;
import board.service.impl.BoardServiceImpl;

public class DeleteController extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req,resp);
   }
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      int boardId = Integer.parseInt(req.getParameter("boardId"));
      BoardService service = BoardServiceImpl.getInstance();
      service.deleteBoardService(boardId);
      service.deleteReferenceService(boardId);
      String deleteMessage = "abc";
      HttpSession session = req.getSession();
      
      session.setAttribute("deleteMessage", deleteMessage);
      req.getRequestDispatcher("/SelectController").forward(req, resp);
   }
}