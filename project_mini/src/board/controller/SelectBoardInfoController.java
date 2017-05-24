package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectBoardInfoController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardTitle = req.getParameter("boardTitle");
		String boardContent = req.getParameter("boardContent");
		String boardDate = req.getParameter("boardDate");
		String memberId = req.getParameter("memberId");
		int movieId = Integer.parseInt(req.getParameter("movieId"));
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		int boardScore = Integer.parseInt(req.getParameter("boardScore"));
		int boardReference = Integer.parseInt(req.getParameter("boardReference"));
		
		req.setAttribute("boardScore", boardScore);
		req.setAttribute("boardReference", boardReference);
		req.setAttribute("movieId", movieId);
		req.setAttribute("boardId", boardId);
		req.setAttribute("boardDate", boardDate);
		req.setAttribute("boardTitle", boardTitle);
		req.setAttribute("boardContent", boardContent);
		req.setAttribute("memberId", memberId);
		req.getRequestDispatcher("/boardJsp/boardInfo.jsp").forward(req, resp);
	}
}
