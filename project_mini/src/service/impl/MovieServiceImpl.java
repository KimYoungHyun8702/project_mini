
/**
설명
작성자 : 오효원
최초 작성일 : 2017.05.23
**평균평점 수정필요.
변경이력
-김경혜) movieAvgScore메소드 return 타입 변경) double -> Movie객체   : 2017.05.24수정
-김경혜) movieAvgScore 메소드 삭제. findMovieById, getMovieList메소드 수정(평점평균 추가) : 2017.05.24 수정

*/
package service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.MovieDao;
import dao.impl.MovieDaoImpl;
import service.MovieService;
import util.SqlSessionFactoryManager;
import vo.Movie;

public class MovieServiceImpl implements MovieService {
	private static SqlSessionFactory factory;
	private static MovieService instance;

	private MovieServiceImpl() throws IOException {
		SqlSessionFactoryManager ssfm = SqlSessionFactoryManager.getInstance();
		factory = ssfm.getSqlSessionFactory();
	}

	public static MovieService getInstance() throws IOException {
		if (instance == null) {
			instance = new MovieServiceImpl();
		}
		return instance;
	}

	SqlSessionFactoryManager ssfm = SqlSessionFactoryManager.getInstance();
	MovieDao dao = MovieDaoImpl.getInstance();

	List<Movie> movieList = null;
	Movie movie = null;
	//double avgScore = 0.0;

	@Override
	public List<Movie> getMovieList() throws SQLException {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			movieList = dao.selectAllMovie(session);
			for(Movie movie:movieList){
				movie.setMovieAvgScore(Math.round(movie.getMovieAvgScore()*10)/10.0);
			}
			session.commit();
		} finally {
			session.close();
		}
		return movieList;
	}

	@Override
	public Movie findMovieById(int movieId) throws SQLException {
		SqlSession session = null;
		
		try { 
			session = factory.openSession();
			movie = dao.selectMovieById(session, movieId);
			movie.setMovieAvgScore(Math.round(movie.getMovieAvgScore()*10)/10.0);
			session.commit();
		} finally {
			session.close();
		}
		
		return movie;
	}

	@Override
	public List<Movie> findMovieByName(String movieTitle) throws SQLException {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			movieList = dao.selectMovieByName(session, movieTitle);
			session.commit();
		} finally {
			session.close();
		}
		
		return movieList;
	}

	@Override
	public List<Movie> findMovieByGenre(String movieGenre) throws SQLException {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			movieList = dao.selectMovieByGenre(session, movieGenre);
			session.commit();
		} finally {
			session.close();
		}
		
		return movieList;
	}

	@Override
	public List<Movie> selectMovieByDate(int movieDate) throws SQLException {
		SqlSession session = null;
		try {
			session = factory.openSession();
			movieList = dao.selectMovieByDate(session, movieDate);
			session.commit();
		} finally {
			session.close();
		}
		
		return movieList;
	}

	//수정필요
	@Override
	public List<Movie> top5Movie() throws SQLException,IOException {
		movieList=MovieServiceImpl.getInstance().getMovieList();
		HashMap<Integer,Double> scoreMap=new HashMap();
		ArrayList<Double> avgScoreList=new ArrayList<>();
		
/*		for(Movie movie : movieList){
			scoreMap.put(movie.getMovieId(), movie.getMovieAvgScore());
		}*/
		for(Movie movie : movieList){
			scoreMap.put(movie.getMovieId(),movie.getMovieAvgScore());
		}
		
		//avgScore만 List생성
		Set entries=scoreMap.entrySet();
		for(Object e: entries ){
			Entry entry=(Entry)e;
			int movieId=(Integer)entry.getKey();
			double avgScore=(Double)entry.getValue();
			
			avgScoreList.add(avgScore);
		}
		
		//avgScoreList 내림차순정렬
		Collections.sort(avgScoreList);//오름차순 정렬 후
		Collections.reverse(avgScoreList);//순서 반대로 = 내림차순 정렬

		System.out.println(avgScoreList);

		//top 5 객체만 top5List생성.
		
		return movieList;
	}

/*	@Override
	public Movie movieAvgScore(int movieId) throws SQLException {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			movie = dao.movieAvgScore(session, movieId);
			//double avgScore=movie.getMovieAvgScore();
			movie.setMovieAvgScore(Math.round(movie.getMovieAvgScore()*10)/10.0);
//			System.out.println(avgScore);
//			System.out.println(Math.round(avgScore*10)/10.0);
			session.commit();
		} finally {
			session.close();
		}
		
		return movie;
	}*/

}
