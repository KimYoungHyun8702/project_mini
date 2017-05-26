package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InputDataController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movieId = Integer.parseInt(req.getParameter("movieId"));
		String movieTitle = req.getParameter("movieTitle");
		
		req.setAttribute("movieId", movieId);
		req.setAttribute("movieTitle", movieTitle);
		req.getRequestDispatcher("/boardJsp/input.jsp").forward(req, resp);
	}
}
