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
		
		try{
			Member member = service.checkMemberId(memberId);
			
			if(member ==null){
				request.setAttribute("msg", memberId);
				//request.setAttribute("msg", memberId+"은(는) 사용가능한 아이디입니다.");
				request.getRequestDispatcher("/member/join.jsp").forward(request, response);
			}else{
				//request.setAttribute("msg", memberId+"은(는) 중복된 아이디 입니다.");
				request.getRequestDispatcher("/member/join.jsp").forward(request, response);
			}
			/*request.setAttribute("msg", memberId);
			request.getRequestDispatcher("/member/join.jsp").forward(request, response);*/
		}catch(LoginFailException e){
			e.printStackTrace();
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
