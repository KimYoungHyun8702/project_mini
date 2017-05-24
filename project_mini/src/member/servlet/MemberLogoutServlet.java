package member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그아웃
		 * 	로그아웃을 요청한 사용자의 상태값을 더이상 유지 하지 않겠다.
		 * 												=>HttpSession을 제거(무효화)
		 * 												-> session.invalidate(); <<구현되어 있는 기능
		 */
		//로그아웃 처리
		HttpSession session = request.getSession();
		session.invalidate();
		
		//System.out.println("out");
		//응답 - 메인페이지로 이동
		request.getRequestDispatcher("/member/login.jsp").forward(request, response);
	}
}
