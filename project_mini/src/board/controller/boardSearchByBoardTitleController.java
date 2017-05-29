package board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardService;
import board.service.impl.BoardServiceImpl;

public class boardSearchByBoardTitleController extends HttpServlet{
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
            HttpSession session = req.getSession();
            BoardService service = BoardServiceImpl.getInstance();

         if (req.getParameter("searchBy").equals("boardTitle")) {
            String keyWord = req.getParameter("keyWord");
            Map<String, Object> map = service.boardSerachByBoardTitleService(page, keyWord);

            session.setAttribute("list", map.get("list"));
            session.setAttribute("boardBean", map.get("pageBean"));
            resp.sendRedirect("/project_mini/boardJsp/boardView.jsp");
         } else if(req.getParameter("searchBy").equals("movieTitle")){
            String keyWord = req.getParameter("keyWord");
            Map<String, Object> map = service.boardSerachByMovieTitleService(page, keyWord);

            session.setAttribute("list", map.get("list"));
            session.setAttribute("boardBean", map.get("pageBean"));
            resp.sendRedirect("/project_mini/boardJsp/boardView.jsp");
         }else{
            String keyWord = req.getParameter("keyWord");
            Map<String, Object> map = service.boardSerachByMemberIdService(page, keyWord);

            session.setAttribute("list", map.get("list"));
            session.setAttribute("boardBean", map.get("pageBean"));
            resp.sendRedirect("/project_mini/boardJsp/boardView.jsp");
         }
      }catch(Exception ex){
         ex.printStackTrace();
      }
   }
}