package member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberService;
import member.vo.Member;

public class MemberUpdateServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String memberPassword = request.getParameter("memberPassword");
		String memberEmail = request.getParameter("memberEmail");
		String memberSex = request.getParameter("memberSex");
		int memberAge = Integer.parseInt(request.getParameter("memberAge"));
		
		Member member = new Member(memberId,memberName,memberPassword,memberEmail,memberSex,memberAge);
		MemberService service = MemberService.getInstance();
		service.renewMember(member);
		session.setAttribute("memberId", member.getMemberId());
		session.setAttribute("memberName", member.getMemberName());
		session.setAttribute("memberPassword", member.getMemberPassword());
		session.setAttribute("memberEmail", member.getMemberemail());
		session.setAttribute("memberSex", member.getMemberSex());
		session.setAttribute("memberAge", member.getMemberAge());
		//System.out.println(member);
		
		request.setAttribute("memberLoginInfo", member);
		session.setAttribute("memberLoginInfo", member);
		request.getRequestDispatcher("/member/update_result.jsp").forward(request, response);
		 
		 
	}
}
