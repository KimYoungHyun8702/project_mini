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
				
				//회원관리와 연동
			/*"	HttpSession session = req.getSession();
				String loginId = "바꿔야함;
				session.setAttribute("memberLoginInfo", loginId);*/
				/*HttpSession session = req.getSession();
				String loginId = (String) session.getAttribute("loginId");
				session.setAttribute("memberLoginInfo", loginId);*/
				
				
				req.setAttribute("list", map.get("list"));
				req.setAttribute("boardBean", map.get("pageBean"));
				req.getRequestDispatcher("/boardJsp/boardView.jsp").forward(req,resp);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
