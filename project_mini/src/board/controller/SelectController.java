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
import board.vo.Reference;

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
				
				HttpSession session = req.getSession();
				String loginId = "wish";
				session.setAttribute("memberLoginInfo", loginId);
			
				req.setAttribute("list", map.get("list"));
				req.setAttribute("boardBean", map.get("pageBean"));
				req.getRequestDispatcher("/boardJsp/boardView.jsp").forward(req,resp);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
