package member.dao.impl;

import org.apache.ibatis.session.SqlSession;

import member.dao.MemberDao;
import member.vo.Member;

public class MemberDaoImpl implements MemberDao{
	
	//싱글톤 패턴
	private static MemberDaoImpl instance = new MemberDaoImpl();
	public static MemberDaoImpl getInstance(){
		return instance;
	}
	private MemberDaoImpl(){}

	
	
	//하나의 회원 정보를 등록한다.
	public int insertMember(SqlSession session, Member member) {
		return session.insert("memberMapper.insertMember",member);
	}

	@Override
	public int updateMember(SqlSession session, Member member) {
		return session.update("memberMapper.updateMember", member);
	}

	@Override
	public int deleteMemberById(SqlSession session, String memberId) {
		return session.delete("memberMapper.deleteMemberById", memberId);
	}
	
	public Member selectMemberById(SqlSession session, String memberId){
		return session.selectOne("memberMapper.selectMemberById", memberId);
	}
	
}
