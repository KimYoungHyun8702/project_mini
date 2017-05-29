package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberService;
import member.vo.Member;

public class MemberUpdateServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		/*response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); */
		try{
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
		//request.getRequestDispatcher("/member/mypage.jsp").forward(request, response);
		response.sendRedirect("/project_mini/member/mypage.jsp");
		}catch(NumberFormatException e){
			/*out.println("<script> alert('입력값이 올바르지 않습니다.');</script>");
			request.getRequestDispatcher("/member/update.jsp").forward(request, response);*/
			response.sendRedirect("/project_mini/member/update.jsp");
		}
		 
	}
}
