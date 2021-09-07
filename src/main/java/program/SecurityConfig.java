package program;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import program.security.CustomAuthenticationProvider;
import program.security.CustomLoginSuccessHandler;
import program.security.LoginFailureHandler;
import program.security.WebAccessDeniedHandler;

/**************************************************
* @FileName : SecurityConfig.java
* @Description: 스프링 시큐리티 설정
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 8. 24.
**************************************************/
@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	    //return PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public AuthenticationProvider authenticationProvider() {
		return new CustomAuthenticationProvider();
	}
	
	@Configuration
	@Order(1)
	public class AdminSecurityConfig extends WebSecurityConfigurerAdapter {
		private final WebAccessDeniedHandler webAccessDeniedHandler;
		
		@Autowired
		private LoginFailureHandler loginFailureHandler;
		
		@Autowired
		public AdminSecurityConfig(WebAccessDeniedHandler webAccessDeniedHandler) {
			this.webAccessDeniedHandler = webAccessDeniedHandler;
		}
		
		@Override
		public void configure(WebSecurity web) throws Exception {
			// 허용목록 작성
			web.ignoring().antMatchers("/adminLayer/**", "/asset/**", "/assetYejin/**", "/table/**").antMatchers(HttpMethod.OPTIONS, "/**");
		}
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.antMatcher("/admin/**")
	        	.headers().cacheControl().disable()
	        	.and()
	        	.headers().frameOptions().disable()
	        	.and()
	        	.authorizeRequests()
	        		.antMatchers("/admin/login").permitAll()
	        		.antMatchers("/admin/**").hasRole("ADMIN")
	        		//.antMatchers("/").hasAuthority("USER")
	        	.anyRequest()
	        		.authenticated()
	        		.and().csrf().disable()
	        	.formLogin()
	        		.loginPage("/admin/login")
	        		.successHandler(successHandler())
	        		.usernameParameter("loginId")
	        		.passwordParameter("password")
	        		.failureHandler(loginFailureHandler).permitAll()
	        	.and()
	        		.logout()
	        		.logoutRequestMatcher(new AntPathRequestMatcher("/admin/logout"))
	        	.and()
	        	.exceptionHandling().accessDeniedHandler(webAccessDeniedHandler)
        		.authenticationEntryPoint(loginUrlAuthenticationEntryPoint());
	    }
	    
	    @Override
	    public void configure(AuthenticationManagerBuilder auth) throws Exception {
	    	auth.authenticationProvider(authenticationProvider());
	    }
	    
	    @Bean
	    @Override
	    public AuthenticationManager authenticationManagerBean() throws Exception {
	         return super.authenticationManagerBean();
	    }
	    
	    public AuthenticationSuccessHandler successHandler() {
	      return new CustomLoginSuccessHandler("/admin/index");
	    }
	    
	    public LoginUrlAuthenticationEntryPoint loginUrlAuthenticationEntryPoint(){
	        
	        LoginUrlAuthenticationEntryPoint entry = new LoginUrlAuthenticationEntryPoint("/admin/login"){
	            @Override
	            public void commence(final HttpServletRequest request, final HttpServletResponse response,
	                    final AuthenticationException authException) throws IOException, ServletException{
	                String ajaxHeader = request.getHeader("X-Requested-With");
	                if(ajaxHeader != null && "XMLHttpRequest".equals(ajaxHeader)){
	                    //InsufficientAuthenticationException
	                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
	                }
	                else{
	                	if(request.getHeader("Referer")!=null) {
	                		request.setAttribute("msg", "로그아웃 되었습니다.");
	                		request.setAttribute("nextPage", "/admin/login");
	                	}
	    				request.getRequestDispatcher("/admin/access-denied").forward(request, response);
	    				return;
	                    //super.commence(request, response, authException);
	                }
	            }
	        };
	        return entry;
	    }
	}
	
	@Configuration
	@Order(2)
	public class UserSecurityConfig extends WebSecurityConfigurerAdapter {
		private final WebAccessDeniedHandler webAccessDeniedHandler;
		
		@Autowired
		public UserSecurityConfig(WebAccessDeniedHandler webAccessDeniedHandler) {
			this.webAccessDeniedHandler = webAccessDeniedHandler;
		}
		
		@Override
		public void configure(WebSecurity web) throws Exception {
			// 허용목록 작성
			web.ignoring().antMatchers("/adminLayer/**", "/asset/**", "/assetYejin/**", "/table/**").antMatchers(HttpMethod.OPTIONS, "/**");
		}
		
		@Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.antMatcher("/**")
	        .headers().cacheControl().disable()
        	.and()
        	.headers().frameOptions().disable()
        	.and()
        	.authorizeRequests()
        		.antMatchers("/mypage/**").hasRole("USER")
        		.antMatchers("/common/**").permitAll()
        		.antMatchers("/rest/*/**").permitAll()
        		.antMatchers("/member/**").permitAll()
        		.antMatchers("/**").permitAll()
        		//.antMatchers("/").hasAuthority("USER")
        	.anyRequest()
        		.authenticated()
        		.and().csrf().disable()
//        	.formLogin()
//        		.loginPage("/login")
//        		.loginProcessingUrl("/login")
//        		.successHandler(successHandler())
//        		.usernameParameter("loginEmail")
//        		.passwordParameter("loginPass")
//        		.failureHandler(loginFailureHandler).permitAll()
//        	.and()
        		.logout()
        		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
        		.logoutSuccessUrl("/")
        	.and()
        	.exceptionHandling().accessDeniedHandler(webAccessDeniedHandler)
    		.authenticationEntryPoint(loginUrlAuthenticationEntryPoint());
	    }
	
	    public AuthenticationSuccessHandler successHandler() {
	      return new CustomLoginSuccessHandler("/index");
	    }
		
	    @Override
	    public void configure(AuthenticationManagerBuilder auth) throws Exception {
	    	auth.authenticationProvider(authenticationProvider());
	    }
	    
	    @Bean
	    @Override
	    public AuthenticationManager authenticationManagerBean() throws Exception {
	         return super.authenticationManagerBean();
	    }
	    
	    public LoginUrlAuthenticationEntryPoint loginUrlAuthenticationEntryPoint(){
	        
	        LoginUrlAuthenticationEntryPoint entry = new LoginUrlAuthenticationEntryPoint("/login"){
	            @Override
	            public void commence(final HttpServletRequest request, final HttpServletResponse response,
	                    final AuthenticationException authException) throws IOException, ServletException{
	                String ajaxHeader = request.getHeader("X-Requested-With");
	                if(ajaxHeader != null && "XMLHttpRequest".equals(ajaxHeader)){
	                    //InsufficientAuthenticationException
	                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
	                }
	                else{
	                	//request.setAttribute("msg", "로그아웃 되었습니다.");
	    				//request.setAttribute("nextPage", "/member/login");
	    				
	    				request.getRequestDispatcher("/access-denied").forward(request, response);
	    				return;
	                    //super.commence(request, response, authException);
	                }
	            }
	        };
	        return entry;
	    }
	}
}