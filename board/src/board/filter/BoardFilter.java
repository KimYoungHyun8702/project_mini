package board.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class BoardFilter implements Filter{
	private String encoding;//초기파라미터 encoding을 저장할 변수 선언

	   @Override
	   public void destroy() {
	      //filter객체가 소멸되기 전에 호출되는 메소드
	      System.out.println("EncodingFilter의  destroy()메소드 실행");
	      
	      
	   }

	   @Override
	   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	         throws IOException, ServletException {
	      //사용자 요청(서블릿이나 jsp)이 들어올 때 마다 호출되는 메소드
	      
	      request.setCharacterEncoding(encoding);
	      
	      chain.doFilter(request, response);
	      
	   }

	   @Override
	   public void init(FilterConfig config) throws ServletException {
	      //filter객체가 생성되는 시점에 호출되는 메소드
	      //매개변수 : FilterConfig - 이 filter객체가 일할 때 필요한 정보를 제공(초기파라미터)
	      this.encoding = config.getInitParameter("encoding");
	      System.out.println("EncodingFilter의  destroy()메소드 실행");
	      
}
}
