package board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardService;
import board.service.impl.BoardServiceImpl;
import board.vo.Board;

public class SelectController extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try{
         int page = 1;
         try{
            page=Integer.parseInt(req.getParameter("page"));
         }catch(Exception e){}
            BoardService service = BoardServiceImpl.getInstance();
            Map<String, Object> map = service.getBoardList(page);
            List<Board> board = service.selectBoardTop3Service();
            HttpSession session = req.getSession();
            
            session.setAttribute("top", board);
            session.setAttribute("list", map.get("list"));
            session.setAttribute("boardBean", map.get("pageBean"));
            resp.sendRedirect("/project_mini/boardJsp/boardView.jsp");      
      }catch(Exception ex){
         ex.printStackTrace();
      }
   }
}