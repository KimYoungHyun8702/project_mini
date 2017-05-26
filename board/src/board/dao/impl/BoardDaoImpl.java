package board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.dao.BoardDao;
import board.vo.Board;

public class BoardDaoImpl implements BoardDao{
	private static BoardDaoImpl instance = new BoardDaoImpl();
	public static BoardDaoImpl getInstance(){
		if(instance == null){
			instance = new BoardDaoImpl();
		}
		return instance;
	}
	private BoardDaoImpl(){}
	
	private String makeSql(String sqlId){
		return "board.config.mapper.boardMapper."+sqlId;
	}

	@Override
	public int insertBoard(SqlSession session, Board board) {
		return session.insert(makeSql("insertBoard"),board);
	}

	@Override
	public int insertBoardSeq(SqlSession session, Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(SqlSession session, Board board) {
		return session.update(makeSql("updateBoard"),board);
	}

	@Override
	public int deleteBoard(SqlSession session, int boardId) {
		return session.delete(makeSql("deleteBoard"),boardId);
	}

	@Override
	public List<Board> selectBoardById(SqlSession session, int boardId) {
		return session.selectList(makeSql("selectBoard"));
	}

	@Override
	public List<Board> selectBoardList(SqlSession session, int beginItemNo, int endItemNo) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("beginItemNo", beginItemNo);
		param.put("endItemNo", endItemNo);
		return session.selectList(makeSql("selectBoardList"),param);
	}	

	@Override
	public int selectBoardCount(SqlSession session) {
		return session.selectOne(makeSql("selectBoardCount"));
	}
	
	@Override
	public int movieTitleConvert(SqlSession session, String movieTitle){
		return session.selectOne(makeSql("movieTitleConvert"));
	}
	@Override
	public int updateBoardReference(SqlSession session, int boardId) {
		// TODO Auto-generated method stub
		return 0;
	}
}
