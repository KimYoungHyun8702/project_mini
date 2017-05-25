/**
설명
작성자 :  김경혜
최초 작성일 : 2017.05.23
-김경혜) movieAvgScore메소드 return 타입 변경) double -> Movie객체 ->double  : 2017.05.24수정
-김경혜) selectMovieRank메소드 추가. countMovie메소드 추가. : 2017.05.25 수정
-김경혜) 코드 정리(필요없는 주석 제거) : 2017.05.25 수정
xxx 며칠날 수정
*/

package dao;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Movie;

public interface MovieDao {
	/**
	 * 전체 영화정보를 조회하는 메소드
	 * @param conn
	 * @return
	 * @throws SQLException
	 */
	List<Movie> selectAllMovie(SqlSession session) throws SQLException;
	
	/**
	 * 매개변수로 받은 영화ID와 일치하는 영화정보를 영화 테이블에서 조회하는 메소드
	 * @param conn
	 * @param movieId
	 * @return
	 * @throws SQLException
	 */
	Movie selectMovieById(SqlSession session, int movieId) throws SQLException;

	/**
	 * 매개변수로 받은 영화제목과 일치하는 영화정보를 조회하는 메소드.
	 *  이름은 부분일치로 조회한다.
	 *  조회되는 column : movieId, movieTitle, movieImage
	 * @param conn
	 * @param movieTitle
	 * @return
	 * @throws SQLException
	 */
	List<Movie> selectMovieByName(SqlSession session, String movieTitle) throws SQLException;
	
	/**
	 * 매개변수로 받은 영화장르와 일치하는 영화정보를 조회하는 메소드.
	 * 장르는 부분일치로 조회한다.
	 * 조회되는 column : movieId, movieTitle, movieImage
	 * @param conn
	 * @param movieGenre
	 * @return
	 * @throws SQLException
	 */
	List<Movie> selectMovieByGenre(SqlSession session, String movieGenre) throws SQLException;
	
	/**
	 * 매개변수로 받은 영화개봉년도와 일치하는 영화정보를 조회하는 메소드.
	 * 조회되는 column : movieId, movieTitle, movieImage
	 * @param conn
	 * @param movieDate
	 * @return
	 * @throws SQLException
	 */
	List<Movie> selectMovieByDate(SqlSession session, int movieDate) throws SQLException;
	
	/**
	 * 평점이 입력된 영화들만 순위가 추가한 영화정보를 조회하는 메소드
	 * @param session
	 * @return
	 * @throws SQLException
	 */
	List<Movie> selectMovieRank(SqlSession session) throws SQLException;
	
	/**
	 * 등록된 영화 수 조회하는 메소드
	 * @param session
	 * @return
	 * @throws SQLException
	 */
	int countMovie(SqlSession session) throws SQLException;

}
