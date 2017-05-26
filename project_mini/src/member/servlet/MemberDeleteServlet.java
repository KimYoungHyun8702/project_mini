package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberService;

public class MemberDeleteServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("memberId");
		String memberPassword = request.getParameter("memberPassword");
		
		MemberService seivice = MemberService.getInstance();
		seivice.removeMember(memberId);
		
		response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = response.getWriter(); 
		 
		 HttpSession session = request.getSession();
		 session.invalidate();
		 
		 out.println("<script> alert('삭제완료');</script>");
		 request.getRequestDispatcher("/member/login.jsp").forward(request, response);
	}
}
