package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.LoginFailException;
import member.service.MemberService;
import member.vo.Member;

public class SendEmailServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {
		request.setCharacterEncoding("UTF-8");
		String memberEmail = request.getParameter("email");
		MemberService service = MemberService.getInstance();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Member member = service.checkMemberEmail(memberEmail);
			
			String host     = "smtp.naver.com";
			  final String user   = 	"guedae";		//"NAVER_ID";
			  final String password  = 	"rladudgus1";		//"PASSWORD";

			  String to     = memberEmail;  // 수신자 이메일

			  
			  // Get the session object
			  Properties props = new Properties();
			  props.put("mail.smtp.host", host);
			  props.put("mail.smtp.auth", "true");

			  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(user, password);
			   }
			  });
			
			  // Compose the message
			
			  MimeMessage message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(user));
			   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			   // Subject
			   message.setSubject("[영화 그 이상의 감동! CGW] 요청하신 가입 정보입니다.");
			   
			   // Text
			   message.setText("영화 그 이상의 감동! CGW 에서 알려드립니다. " + member.getMemberName()+"님의 가입정보는 ID : "+member.getMemberId()
			   +"  PASSWORD : "+member.getMemberPassword()+"입니다.");

			   // send the message
			   Transport.send(message);
			   System.out.println("message sent successfully...");
			
			   response.sendRedirect("/project_mini/member/find_info_success.jsp");
		} catch (LoginFailException | MessagingException | NullPointerException e) {
			out.println("<script> alert('전송실패!! 뒤로가기를 눌러 다시 확인하세요');</script>");
			
		}
			
	}
	
}
