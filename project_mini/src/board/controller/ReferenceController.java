package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardService;
import board.service.impl.BoardServiceImpl;
import board.vo.Reference;

public class ReferenceController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardId = Integer.parseInt(req.getParameter("boardId"));	
		String memberId = req.getParameter("memberId");
		
		BoardService service = BoardServiceImpl.getInstance();
		String message = service.updateBoardReference(boardId);
		service.insertReferenceService(new Reference(boardId, memberId));
		
		resp.sendRedirect("/project_mini/SelectByIdController?boardId="+boardId+"&memberId="+memberId);
	}
}
