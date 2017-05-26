/**
설명
작성자 :  김경혜,오효원
최초 작성일 : 2017.05.23
변경이력
-movie데이터 List로 변경 2017.05.24 수정
-top5movieList로 변경. 2017.05.25 수정
-김경혜) 코드정리 2017.05.25
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
		try {
			// 1. 요청파라미터 조회+검증
			req.setCharacterEncoding("UTF-8");
			// 2. 비즈니스로직 처리
			ArrayList<Movie> top5MovieList=new ArrayList<>();
			MovieService test = MovieServiceImpl.getInstance();
			top5MovieList=(ArrayList)test.top5Movie();

			// 3. 처리결과 응답
			req.setAttribute("top5MovieList", top5MovieList);
			req.getRequestDispatcher("/movieJsp/main/recommand.jsp").forward(req, resp);
		} catch (SQLException e) {
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
