/**
설명
작성자 :  김경혜,오효원
최초 작성일 : 2017.05.23
변경이력
-movie데이터 List로 변경 2017.05.24 수정
-top5movieList로 변경. 2017.05.25 수정
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

public class MovieMainServlet extends HttpServlet {
	/**
	 * 영화 메인페이지 평균평점top1~5보여줌.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// System.out.println("mainServlet doGet실행");
		try {
			ArrayList<Movie> top5MovieList=new ArrayList<>();
			MovieService test = MovieServiceImpl.getInstance();
			top5MovieList=(ArrayList)test.top5Movie();
/*			top5MovieList.add(test.findMovieById(1));
			top5MovieList.add(test.findMovieById(2));
			top5MovieList.add(test.findMovieById(3));
			top5MovieList.add(test.findMovieById(4));
			top5MovieList.add(test.findMovieById(5));*/
			
/*			Movie movie1 = test.findMovieById(1);
			Movie movie2 = test.findMovieById(2);
			Movie movie3 = test.findMovieById(3);
			Movie movie4 = test.findMovieById(4);
			Movie movie5 = test.findMovieById(5);*/

			// 1. 요청파라미터 조회+검증
			// HttpSession session = req.getSession();
			// 2. 비즈니스로직 처리

			// 3. 처리결과 응답
			// System.out.println(movie1);
			req.setAttribute("top5MovieList", top5MovieList);
/*			req.setAttribute("movie1", movie1);
			req.setAttribute("movie2", movie2);
			req.setAttribute("movie3", movie3);
			req.setAttribute("movie4", movie4);
			req.setAttribute("movie5", movie5);*/
			System.out.println(top5MovieList);
			req.getRequestDispatcher("/movieJsp/main/recommand.jsp").forward(req, resp);
		} catch (SQLException e) {
			System.out.println("SQLException");
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
