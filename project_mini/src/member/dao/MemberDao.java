package member.dao;

import org.apache.ibatis.session.SqlSession;

import member.vo.Member;

public interface MemberDao {
	/**
	 * 하나의 회원 정보를 등록하는 Dao메소드
	 */
	int insertMember(SqlSession session, Member member);
	/**
	 * 하나의 회원 정보를 삭제하는 Dao메소드
	 */
	int updateMember(SqlSession session, Member member);
	/**
	 * 하나의 회원 정보를 수정하는 Dao메소드
	 */
	int deleteMemberById(SqlSession session, String memberId);
	
	Member selectMemberById(SqlSession session, String memberId);
}
