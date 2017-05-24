package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		 
		 out.println("<!doctype html>");
		 out.println("<html><head><title>입력 결과</title></head>");
		 out.println("<body>");
		 out.println("<h1>계정삭제가 완료되었습니다<h1><br>");
		 out.println("<a href=/project_mini/member/login.jsp>로그인 페이지로</a>");
		 out.println("</body></html>");	 
	}
}
