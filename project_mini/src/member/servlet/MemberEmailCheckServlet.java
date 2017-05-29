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

public class MemberEmailCheckServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memberEmail = request.getParameter("memberEmail");
		MemberService service = MemberService.getInstance();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		System.out.println(request.getParameter("memberEmail"));
		
		try{
			Member member = service.checkMemberEmail(memberEmail);
			
			if(member ==null){
				request.setAttribute("msg2", memberEmail);
				
				request.getRequestDispatcher("/member/join.jsp").forward(request, response);
			}else{
				
				request.getRequestDispatcher("/member/join.jsp").forward(request, response);
			}
		
		}catch(LoginFailException e){
			e.printStackTrace();
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
