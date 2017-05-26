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
		
		
		System.out.println(request.getParameter("memberId"));
		
		try{
			Member member = service.checkMemberId(memberId);
			
			if(member ==null){
				//out.println("<script> alert('사용가능합니다');</script>");
				request.setAttribute("msg", memberId+"은(는) 사용가능한 아이디입니다.");
				request.getRequestDispatcher("/member/join.jsp").forward(request, response);
			}else{
				//out.println("<script> alert('이미사용중입니다');</script>");
				request.setAttribute("msg", memberId+"은(는) 중복된 아이디 입니다.");
				request.getRequestDispatcher("/member/join.jsp").forward(request, response);
			}
			/*//로그인 성공
			HttpSession session = request.getSession();
			//로그아웃 할때까지 가지고 있는 속성값
			session.setAttribute("memberLoginInfo", member);
			
			//System.out.println(member);
			request.getRequestDispatcher("/member/id_check.jsp").forward(request, response);*/
		}catch(LoginFailException e){
			e.printStackTrace();
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
