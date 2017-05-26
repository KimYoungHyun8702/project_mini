package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			Board board = service.selectBoardById(boardId);
			Reference reference = service.selectReferenceService(boardId, memberId);
			
			req.setAttribute("reference",reference);
			req.setAttribute("board", board);
			req.getRequestDispatcher("/boardJsp/boardInfo.jsp").forward(req, resp);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
