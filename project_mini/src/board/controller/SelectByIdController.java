package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardService;
import board.service.impl.BoardServiceImpl;
import board.vo.Board;
import board.vo.Reference;

public class SelectByIdController extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try{
         int boardId = Integer.parseInt(req.getParameter("boardId"));
         String memberId = req.getParameter("memberId");
         BoardService service = BoardServiceImpl.getInstance();
         HttpSession session = req.getSession();

         if(req.getParameter("modifyMessage") != null){
            session.setAttribute("msg", "delete");
         }else if(req.getParameter("back") == null && req.getParameter("reference") == null){
            service.updateBoardCountService(boardId);            
         }
         
         Board board = service.selectBoardById(boardId);
         Reference reference = service.selectReferenceService(boardId, memberId);
         
         session.setAttribute("reference", reference);
         session.setAttribute("board", board);
         resp.sendRedirect("/project_mini/boardJsp/boardInfo.jsp");
      }catch(Exception ex){
         ex.printStackTrace();
      }
   }
}