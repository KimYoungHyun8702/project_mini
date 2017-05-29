package board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.dao.BoardDao;
import board.vo.Board;
import board.vo.Reference;

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
      return "project_mini.config.mapper.boardMapper."+sqlId;
   }

   @Override
   public int insertBoard(SqlSession session, Board board) {
      return session.insert(makeSql("insertBoard"),board);
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
   public Board selectBoardById(SqlSession session, int boardId) {
      return session.selectOne(makeSql("selectBoard"), boardId);
   }

   @Override
   public List<Board> selectBoardList(SqlSession session, int beginItemNo, int endItemNo) {
      HashMap<String, Object> param = new HashMap<>();
      param.put("beginItemNum", beginItemNo);
      param.put("endItemNum", endItemNo);
      return session.selectList(makeSql("selectBoardList"),param);
   }   

   @Override
   public int selectBoardCount(SqlSession session) {
      return session.selectOne(makeSql("selectBoardCount"));
   }
   
   @Override
   public int updateBoardReference(SqlSession session, int boardId){
      return session.update(makeSql("updateBoardReference"), boardId);
   }
   
   @Override
   public int insertReference(SqlSession session, Reference reference){
      return session.insert(makeSql("referenceInsert"), reference);
   }
   
   @Override
   public Reference selectReference(SqlSession session, int boardId, String memberId){
      HashMap<String, Object> referenceMap = new HashMap<>();
      referenceMap.put("boardId", boardId);
      referenceMap.put("memberId", memberId);
      return session.selectOne(makeSql("referenceSelect"),referenceMap);
   }
   
   @Override
   public int deleteReference(SqlSession session, int boardId) {
      return session.delete(makeSql("deleteReferenceBoard"), boardId);
   }
   @Override
   public List<Board> boardSerachByBoardTitle(SqlSession session, int beginItemNo, int endItemNo, String keyWord) {
      HashMap<String, Object> map = new HashMap<>();
      map.put("beginItemNo", beginItemNo);
      map.put("endItemNo", endItemNo);
      map.put("boardTitle", keyWord);
      return session.selectList(makeSql("boardSerachByBoardTitle"), map);
   }
   @Override
   public List<Board> boardSerachByMovieTitle(SqlSession session, int beginItemNo, int endItemNo, String keyWord) {
      HashMap<String, Object> map = new HashMap<>();
      map.put("beginItemNo", beginItemNo);
      map.put("endItemNo", endItemNo);
      map.put("movieTitle", keyWord);
      return session.selectList(makeSql("boardSerachByMovieTitle"), map);
   }
   @Override
   public List<Board> boardSerachByMemberId(SqlSession session, int beginItemNo, int endItemNo, String keyWord) {
      HashMap<String, Object> map = new HashMap<>();
      map.put("beginItemNo", beginItemNo);
      map.put("endItemNo", endItemNo);
      map.put("memberId", keyWord);
      return session.selectList(makeSql("boardSerachByMemberId"), map);
   }
   @Override
   public int deleteReferenceMember(SqlSession session, String memberId) {
      return session.delete(makeSql("deleteReferenceMember"),memberId);
   }
   @Override
   public List<Board> selectBoardTop3(SqlSession session) {
      return session.selectList(makeSql("selectBoardTop3"));
   }
   @Override
   public int updateBoardCount(SqlSession session, int boardId) {
      return session.update(makeSql("updateBoardCount"),boardId);
   }
   
   
}