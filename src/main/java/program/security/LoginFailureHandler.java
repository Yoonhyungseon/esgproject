package program.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String loginId = request.getParameter("loginId");
		String loginPass = request.getParameter("password");
		
		request.setAttribute("msg", "아이디 및 비밀번호를 확인해주세요.");
		request.setAttribute("loginId", loginId);
		request.setAttribute("loginPass", loginPass);
		
		String retUrl = "/member/login";
		if(request.getRequestURI().indexOf("/admin")>=0) {
			retUrl = "/admin/login";
		}
		request.getRequestDispatcher(retUrl).forward(request, response);
	}
}
