package board.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.dao.BoardDao;
import board.dao.impl.BoardDaoImpl;
import board.service.BoardService;
import board.util.BoardBean;
import board.util.SqlSessionFactoryManager;
import board.vo.Board;


public class BoardServiceImpl implements BoardService{

	private SqlSessionFactory factory;
	private BoardDao dao;
	private static BoardServiceImpl instance;

	private BoardServiceImpl() throws IOException {
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		dao = BoardDaoImpl.getInstance();
	}
	
	public static BoardServiceImpl getInstance() throws IOException {
		if (instance == null) {
			instance = new BoardServiceImpl();
		}
		return instance;
	}

	@Override
	public String InsertBoardService(Board board) {
		BoardDaoImpl daoImpl = BoardDaoImpl.getInstance();
		SqlSession session = factory.openSession();
		try{
			int cnt = daoImpl.insertBoard(session, board);
			if(cnt == 0){
				return "실패";
			}
			session.commit();
		}finally{
			session.close();
		}
		return "성공";
	}

	@Override
	public String UpdateBoardService(Board board) {
		BoardDaoImpl daoImpl = BoardDaoImpl.getInstance();
		SqlSession session = factory.openSession();
		try {
			int cnt = daoImpl.updateBoard(session, board);
			if(cnt == 0) {
				return "실패";
			}
			session.commit();
		} finally {
			session.close();
		}
		return "성공";
	}

	@Override
	public String deleteBoardService(int boardId) {
		BoardDaoImpl daoImpl = BoardDaoImpl.getInstance();
		SqlSession session = factory.openSession();
		try{
			int cnt = daoImpl.deleteBoard(session, boardId);
			if(cnt == 0){
				return "실패";
			}
			session.commit();
		}finally{
			session.close();
		}
		return "성공";
	}

	@Override
	public Map<String, Object> selectBoardListService(int boardId) {
		HashMap<String, Object> map = new HashMap<>();
		SqlSession session = factory.openSession();
		try{
			List<Board> list = dao.selectBoardById(session, boardId);
			map.put("Info", list);
			return map;
		}finally{
			session.close();
		}
	}

	@Override
	public Map<String, Object> getBoardList(int page) {
		HashMap<String, Object> map = new HashMap<>();// 결과값을 담을 Map
		SqlSession session = factory.openSession();
		try {
			// 1. PagingBean 객체 생성 -> Paging 계산 처리하는 객체 -> 보려는 페이지, 총 item 수
			int totalCount = dao.selectBoardCount(session);
			BoardBean boardBean = new BoardBean(totalCount, page); // java.util
			map.put("pageBean", boardBean);
			//2. page에 보여줄 item 리스트
			List<Board> list = dao.selectBoardList(session, boardBean.getBeginBoardInPage(), boardBean.getEndBoardInPage());
			map.put("list", list);
			return map;
		} finally {
			session.close();
		}
	}
	
	@Override
	public void movieTitleConvertService(String movieTitle){
		SqlSession session = factory.openSession();
		try{
			dao.movieTitleConvert(session, movieTitle);
		}finally{
			session.close();
		}
	}
}
