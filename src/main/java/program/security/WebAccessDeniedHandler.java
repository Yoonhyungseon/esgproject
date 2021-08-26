package program.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

@Component
public class WebAccessDeniedHandler implements AccessDeniedHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(WebAccessDeniedHandler.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		response.setStatus(HttpStatus.FORBIDDEN.value());
		
		boolean adminPage = false;
		if(request.getRequestURI().indexOf("/admin")>=0) {
			adminPage = true;
		}
		
		if(accessDeniedException instanceof AccessDeniedException) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if(auth != null) {
				if(adminPage && !( (Account) auth.getPrincipal()).getRole().equals("ROLE_ADMIN") ) {
					request.setAttribute("msg", "로그인 후 이용해 주세요.");
					request.setAttribute("nextPage", "/admin/login");
				}else if (!adminPage && !( (Account) auth.getPrincipal()).getRole().equals("ROLE_USER") ) {
					request.setAttribute("msg", "로그인 후 이용해 주세요.");
					request.setAttribute("nextPage", "/member/login");
				}
			}else {
				request.setAttribute("msg", "로그인 권한이 없는 사용자입니다.");
				if(adminPage) {
					request.setAttribute("nextPage", "/admin/login");					
				}else {
					request.setAttribute("nextPage", "/member/login");
				}
				response.setStatus(HttpStatus.UNAUTHORIZED.value());
				SecurityContextHolder.clearContext();
			}
		}else {
			logger.info(accessDeniedException.getClass().getCanonicalName());
		}
		if(adminPage) {
			request.getRequestDispatcher("/admin/access-denied").forward(request, response);
		}else {
			request.getRequestDispatcher("/access-denied").forward(request, response);
		}
	}
}
