package member.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exception.LoginFailException;
import member.service.MemberService;
import member.vo.Member;


public class MemberLoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청 파라미터 - id/password 조회
		String memberId = request.getParameter("memberId");
		String memberPassword = request.getParameter("memberPassword");
		
		MemberService service = MemberService.getInstance();
		
		try{
			Member member = service.memberLog(memberId, memberPassword);
			//로그인 성공
			HttpSession session = request.getSession();
			//로그아웃 할때까지 가지고 있는 속성값
			session.setAttribute("memberLoginInfo", member);
			//System.out.println(member);
			request.getRequestDispatcher("/member/login_success.jsp").forward(request, response);
		}catch(LoginFailException e){
			request.getRequestDispatcher("/member/login_fail.jsp").forward(request, response);
		}
		}
}