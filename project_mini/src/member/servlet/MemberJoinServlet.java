package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.dao.MemberDao;
import member.dao.impl.MemberDaoImpl;
import member.service.MemberService;
import member.util.SqlSessionFactoryManager;
import member.vo.Member;



public class MemberJoinServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String memberPassword = request.getParameter("memberPassword");
		String memberEmail = request.getParameter("memberEmail");
		String memberSex = request.getParameter("memberSex");
		int memberAge = Integer.parseInt(request.getParameter("memberAge"));
		
		Member member = new Member(memberId,memberName,memberPassword,memberEmail,memberSex,memberAge);
		MemberService seivice = MemberService.getInstance();
		seivice.addMember(member);
		request.setAttribute("member", member);
		//request.getRequestDispatcher("/member/join_result.jsp").forward(request, response);
		response.sendRedirect("/project_mini/member/join_result.jsp");
		 
	}
}
