package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exception.LoginFailException;
import member.service.MemberService;
import member.vo.Member;

public class MemberIdCheckServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("memberId");
		MemberService service = MemberService.getInstance();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
		Member member = service.checkMemberId(memberId);
		HttpSession session = request.getSession();
		session.setAttribute("memberIdInfo", member);

		} catch (LoginFailException e) {
		request.getRequestDispatcher("/member/check_success.jsp").forward(request, response);	
		}
		
		
		
	}
}
