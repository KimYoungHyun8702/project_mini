/**
설명
작성자 :  김경혜,오효원
최초 작성일 : 2017.05.23
변경이력
xxx 며칠날 수정
*/
package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MovieService;
import service.impl.MovieServiceImpl;
import vo.Movie;

public class MovieSearchServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MovieService movieService = MovieServiceImpl.getInstance();
		ArrayList<Movie> resultMovieList = null;
		try {
			// 1.요청파라미터 검색
			String searchField = req.getParameter("searchField");
			String searchTextByTitle = req.getParameter("searchTextByTitle");
			String searchTextByGenre = req.getParameter("searchTextByGenre");
			String searchNumByDate = req.getParameter("searchNumByDate");

			// 2. 비즈니스로직
			if (searchField.equals("searchByTitle")) {
				if (searchTextByTitle.isEmpty()) {// 안하면 전체값 조회됨. - 질문!
					System.out.println("null검색");
				} else {
					System.out.println("title" + searchTextByTitle);
					resultMovieList = (ArrayList) movieService.findMovieByName(searchTextByTitle);
				}
			} else if (searchField.equals("searchByGenre")) {
				if(searchTextByGenre.isEmpty()){
					System.out.println("null검색");
				}else{
				System.out.println("genre" + searchTextByGenre);
				resultMovieList = (ArrayList) movieService.findMovieByGenre(searchTextByGenre);
				}
			} else {
				System.out.println("date" + searchNumByDate);
				if (searchNumByDate.isEmpty()) {
					System.out.println("null검색");
				} else {
					resultMovieList = (ArrayList) movieService.selectMovieByDate(Integer.parseInt(searchNumByDate));
				}
			}

			// 3.응답
			System.out.println(resultMovieList);
			resp.setContentType("text/html;charset=UTF-8");
			req.setAttribute("resultMovieList", resultMovieList);
			req.getRequestDispatcher("/movieJsp/search/searchResult.jsp").forward(req, resp);

		} catch (SQLException e) {
			System.out.println("SQLException");
		}

	}

}
