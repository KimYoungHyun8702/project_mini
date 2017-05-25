
/**
설명
작성자 : 오효원
최초 작성일 : 2017.05.23
변경이력
-김경혜) movieAvgScore메소드 return 타입 변경) double -> Movie객체  : 2017.05.24수정
-김경혜) selectMovieRank메소드 추가. countMovie메소드 추가. : 2017.05.25 수정
xxx 며칠날 수정
*/

package dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.MovieDao;
import vo.Movie;

public class MovieDaoImpl implements MovieDao{
	//Singleton Pattern적용
	private static MovieDao instance;
	private MovieDaoImpl(){}
	public static MovieDao getInstance(){
		if(instance==null){
			instance=new MovieDaoImpl(){};
		}
		return instance;
	}
	
	private String makeSqlId(String id){
		return "dao.config.mapper.movieMapper."+id;
	}
	@Override
	public List<Movie> selectAllMovie(SqlSession session) throws SQLException {
		return session.selectList(makeSqlId("selectAllMovie"));
	}
	@Override
	public Movie selectMovieById(SqlSession session, int movieId) throws SQLException {
		return session.selectOne(makeSqlId("selectMovieById"),movieId);
	}
	@Override
	public List<Movie> selectMovieByName(SqlSession session, String movieTitle) throws SQLException {
		return session.selectList(makeSqlId("selectMovieByName"),movieTitle);
	}
	@Override
	public List<Movie> selectMovieByGenre(SqlSession session, String movieGenre) throws SQLException {
		return session.selectList(makeSqlId("selectMovieByGenre"),movieGenre);
	}
	@Override
	public List<Movie> selectMovieByDate(SqlSession session, int movieDate) throws SQLException {
		return session.selectList(makeSqlId("selectMovieByDate"),movieDate);
	}
	@Override
	public List<Movie> selectMovieRank(SqlSession session) throws SQLException {
		return session.selectList(makeSqlId("selectMovieRank"));
	}
	@Override
	public int countMovie(SqlSession session) throws SQLException {
		return session.selectOne(makeSqlId("countMovie"));
	}
	/*	@Override
	public double movieAvgScore(SqlSession session, int movieId) throws SQLException {
		return session.selectOne(makeSqlId("movieAvgScore"),movieId);
	}*/


}
