
/**
설명
작성자 : 오효원
최초 작성일 : 2017.05.23
**평균평점 수정필요.
변경이력
-김경혜) movieAvgScore메소드 return 타입 변경) double -> Movie객체   : 2017.05.24수정
-김경혜) movieAvgScore 메소드 삭제. findMovieById, getMovieList메소드 수정(평점평균 추가) : 2017.05.24 수정
-김경혜) top5Movie 메소드 추가. 전체 instance변수 -> 로컬변수화(값이 유지되기 때문에 로컬변수로 선언해야한다._강사님말씀) : 2017.05.25

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

	@Override
	public List<Movie> getMovieList() throws SQLException {
		SqlSession session = null;
		List<Movie> movieList = null;
		try {
			session = factory.openSession();
			movieList = dao.selectAllMovie(session);
			for (Movie movie : movieList) {
				movie.setMovieAvgScore(Math.round(movie.getMovieAvgScore() * 10) / 10.0);
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
		Movie movie = null;
		try {
			session = factory.openSession();
			movie = dao.selectMovieById(session, movieId);
			movie.setMovieAvgScore(Math.round(movie.getMovieAvgScore() * 10) / 10.0);
			session.commit();
		} finally {
			session.close();
		}

		return movie;
	}

	@Override
	public List<Movie> findMovieByName(String movieTitle) throws SQLException {
		SqlSession session = null;
		List<Movie> movieList = null;
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
		List<Movie> movieList = null;
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
		List<Movie> movieList = null;
		try {
			session = factory.openSession();
			movieList = dao.selectMovieByDate(session, movieDate);
			session.commit();
		} finally {
			session.close();
		}

		return movieList;
	}

	@Override
	public List<Movie> top5Movie() throws SQLException, IOException {
		SqlSession session = null;
		List<Movie> movieList = new ArrayList<>();
		try {
			session = factory.openSession();
			ArrayList<Movie> allMovieRankList = (ArrayList) dao.selectMovieRank(session);
			// System.out.println(allMovieRankList);
			// movieList = dao.selectMovieRank(session);
			//System.out.println(allMovieRankList.size());
			if (allMovieRankList.size() >= 5) {
				for (int i = 0; i < 5; i++) {
					Movie movie = allMovieRankList.get(i);
					System.out.println(movie);
					movieList.add(movie);
				}
			}else{
				//평점 등록수가 부족하여 top5안되는 경우 random으로 영화 5개 선정.
				//등록된 영화ID와 일치하는 중복없는 랜덤수 배열생성.
				System.out.println("평점등록수가 부족하여 top5를 선정할 수 없습니다.");
				int randomList[]=new int[5];
				for(int i=0;i<randomList.length;i++){
					randomList[i]=(int)(Math.random()*dao.countMovie(session))+1;
					for(int j=0;j<i;j++){
						if(randomList[i]==randomList[j]){
							i--;
						}
					}
				}
				for(int i=0;i<randomList.length;i++){
				System.out.println(randomList[i]);
				}
				//생성한 랜덤수를 movieId로 하는 영화5개정보 list에 저장.
				for(int i=0;i<5;i++){
					movieList.add(MovieServiceImpl.getInstance().findMovieById(randomList[i]));
				}
			}
			session.commit();
		} finally {
			session.close();
		}

		return movieList;
	}

	// 수정필요
	/*
	 * @Override public List<Movie> top5Movie() throws SQLException,IOException
	 * { movieList=MovieServiceImpl.getInstance().getMovieList();
	 * HashMap<Integer,Double> scoreMap=new HashMap(); ArrayList<Double>
	 * avgScoreList=new ArrayList<>(); ArrayList<Integer> movieIdList=new
	 * ArrayList<>();
	 * 
	 * for(Movie movie : movieList){ scoreMap.put(movie.getMovieId(),
	 * movie.getMovieAvgScore()); } for(Movie movie : movieList){
	 * scoreMap.put(movie.getMovieId(),movie.getMovieAvgScore()); }
	 * 
	 * //avgScore만 List생성 Set entries=scoreMap.entrySet(); for(Object e: entries
	 * ){ Entry entry=(Entry)e; int movieId=(Integer)entry.getKey(); double
	 * avgScore=(Double)entry.getValue(); movieIdList.add(movieId);
	 * avgScoreList.add(avgScore); } System.out.println("변경전(id)"+movieIdList);
	 * System.out.println("변경전"+avgScoreList); //avgScoreList 내림차순정렬
	 * Collections.sort(avgScoreList);//오름차순 정렬 후
	 * Collections.reverse(avgScoreList);//순서 반대로 = 내림차순 정렬
	 * 
	 * for(Double avgScore : avgScoreList){ int
	 * i=avgScoreList.indexOf(avgScore);
	 * System.out.print(i+"-"+avgScore+",   "); }
	 * System.out.println(avgScoreList);
	 * System.out.println(avgScoreList.size());
	 * 
	 * System.out.println("index"); for(int i=0;i<avgScoreList.size();i++){
	 * for(int movieId : movieIdList){
	 * System.out.println(scoreMap.get(movieId));
	 * if(scoreMap.get(movieId)==avgScoreList.get(i)){
	 * System.out.print(movieIdList.indexOf(movieId)+", "); } } }
	 * 
	 * //top 5 객체만 top5List생성.
	 * 
	 * return movieList; }
	 */

	/*
	 * @Override public Movie movieAvgScore(int movieId) throws SQLException {
	 * SqlSession session = null;
	 * 
	 * try { session = factory.openSession(); movie = dao.movieAvgScore(session,
	 * movieId); //double avgScore=movie.getMovieAvgScore();
	 * movie.setMovieAvgScore(Math.round(movie.getMovieAvgScore()*10)/10.0); //
	 * System.out.println(avgScore); //
	 * System.out.println(Math.round(avgScore*10)/10.0); session.commit(); }
	 * finally { session.close(); }
	 * 
	 * return movie; }
	 */

}
