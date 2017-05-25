package board.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.impl.BoardServiceImpl;
import board.vo.Board;
/**
 * 원래 등록되어 있던 글 정보들을 파라미터로 받아오는 서블릿
 * @author SaeromCho
 *
 */
public class ModifyController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 요청파라미터 조회
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		String boardTitle = req.getParameter("boardTitle");
		String boardContent = req.getParameter("boardContent");
		int boardReference = Integer.parseInt(req.getParameter("boardReference"));
		int boardScore = Integer.parseInt(req.getParameter("boardScore"));
		String memberId = req.getParameter("memberId");
		int movieId = Integer.parseInt(req.getParameter("movieId"));
		
		BoardServiceImpl service = BoardServiceImpl.getInstance();  
		String message = service.UpdateBoardService(new Board(boardId,boardTitle,new Date(),boardContent,boardScore,boardReference,memberId,movieId));
		Board board = service.selectBoardById(boardId);
		
		req.setAttribute("board", board);
		req.getRequestDispatcher("/boardJsp/boardInfo.jsp").forward(req, resp);
	}
}
