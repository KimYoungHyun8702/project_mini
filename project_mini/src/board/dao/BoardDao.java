package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.vo.Board;
import board.vo.Reference;

public interface BoardDao {

   /**
    * 게시판 등록  메소드
    * @param session
    * @param board
    * @return
    */
   int insertBoard(SqlSession session, Board board);
   
   /**
    * 게시판 수정 메소드
    * @param session
    * @param board
    * @return
    */
   int updateBoard(SqlSession session, Board board);
   
   /**
    * 게시판 삭제 메소드
    * @param session
    * @param board
    * @return
    */
   int deleteBoard(SqlSession session, int boardId);
   
   /**
    * 게시판 조회 메소드
    * @param session
    * @return
    */
   Board selectBoardById(SqlSession session, int boardId);
   
   /**
    * 
    * @param session
    * @param beginItemNo : 보려는 페이지의 시작 item 번호
    * @param endItemNo : 보려는 페이지의 마지막 item 번호
    * @return
    */
   List<Board> selectBoardList(SqlSession session, int beginItemNo, int endItemNo);

   /**
    * item_tb의 총 레코드 수를 조회
    * @param session
    * @return
    */
   int selectBoardCount(SqlSession session);
   
   /**
    * 추천수 메소드
    * @param session
    * @param boardId
    * @return
    */
   int updateBoardReference(SqlSession session, int boardId);
   
   /**
    * 추천수 등록 메소드
    * @param session
    * @param reference
    * @return
    */
   int insertReference(SqlSession session, Reference reference);
   
   /**
    * 추천수 조회 메소드
    * @param session
    * @param boardId
    * @return
    */
   Reference selectReference(SqlSession session, int boardId, String memberId);
   
   /**
    * 게시물 삭제와 동시에 추천 테이블 삭제 메소드
    * @param session
    * @param boardId
    * @param memberId
    * @return
    */
   int deleteReference(SqlSession session, int boardId);
   
   
   /**
    * 게시판 이름으로 조회 메소드
    * @param session
    * @param beginItemNo
    * @param endItemNo
    * @param boardTitle
    * @return
    */
   List<Board> boardSerachByBoardTitle(SqlSession session, int beginItemNo, int endItemNo, String keyWord);
   
   /**
    * 영화 제목으로 조회 메소드
    * @param session
    * @param beginItemNo
    * @param endItemNo
    * @param keyWord
    * @return
    */
   List<Board> boardSerachByMovieTitle(SqlSession session, int beginItemNo, int endItemNo, String keyWord);
   
   /**
    * 작성자 이름으로 조회 메소드
    * @param session
    * @param beginItemNo
    * @param endItemNo
    * @param keyWord
    * @return
    */
   List<Board> boardSerachByMemberId(SqlSession session, int beginItemNo, int endItemNo, String keyWord);
   
   /**
    * 회원 탈퇴와 동시에 추천 테이블 삭제 메소드
    * @param session
    * @param memberId
    * @return
    */
   int deleteReferenceMember(SqlSession session, String memberId);
   
   /**
    * TOP3 조회 메소드
    * @param session
    * @param boardId
    * @return
    */
   List<Board> selectBoardTop3(SqlSession session);
   
   /**
    * 조회수 업데이트 메소드
    * @param session
    * @param boardId
    * @return
    */
   int updateBoardCount(SqlSession session, int boardId);
}