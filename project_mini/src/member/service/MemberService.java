package member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import exception.LoginFailException;
import member.dao.MemberDao;
import member.dao.impl.MemberDaoImpl;
import member.util.SqlSessionFactoryManager;
import member.vo.Member;

public class MemberService {

	private static MemberService instance = new MemberService();

	public static MemberService getInstance() {
		return instance;
	}

	private MemberService() {
	}

	MemberDao dao = MemberDaoImpl.getInstance();
	SqlSession session = null;

	public void addMember(Member member) throws IOException {
		try {
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			int cnt = dao.insertMember(session, new Member(member.getMemberId(), member.getMemberName(),
					member.getMemberPassword(), member.getMemberemail(), member.getMemberSex(), member.getMemberAge()));
			session.commit();
		} finally {
			session.close();
		}
	}

	public void removeMember(String memberId) throws IOException {
		try {
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			int cnt = dao.deleteMemberById(session, memberId);
			session.commit();
		} finally {
			session.close();
		}
	}

	public void renewMember(Member member) throws IOException {
		try {
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			int cnt = dao.updateMember(session, member);
			session.commit();
		} finally {
			session.close();
		}
	}

	public Member memberLog(String memberId, String memberPassword) throws LoginFailException, IOException {
		// id/password

		try {
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			Member member = dao.selectMemberById(session, memberId);

			// if(id.equals(dbId)){//맞는 아이디
			if (member != null) { // 맞는 아이디
				// if(password.equals(dbPassword)){//인증 성공
				if (memberPassword.equals(member.getMemberPassword())) {// 인증 성공
					return member;// 로그인한 회원의 정보를 리턴
				} else {// 아이디는 맞지만 비밀번호가 틀림
					throw new LoginFailException("패스워드를 확인하세요");
				}
			} else {// 아이디가 틀려서 인증 실패
				throw new LoginFailException("아이디를 확인하세요");
			}
		} finally {
			session.close();
		}
	}	

	public Member checkMemberId(String memberId) throws LoginFailException,IOException{
		try{
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			Member member = dao.selectMemberById(session, memberId);
			return member;
			
		}finally{
			session.close();
		}
	}

	public Member selectMemberById(String memberId) throws IOException {
		session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
		try {
			return dao.selectMemberById(session, memberId);
		} finally {
			session.close();
		}

	}
}
