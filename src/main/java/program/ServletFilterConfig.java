package program;

import java.util.Properties;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;



/*

사이트매시 설정

*/

@Configuration
public class ServletFilterConfig {

	@Bean
	public FilterRegistrationBean siteMeshFilter() {
		FilterRegistrationBean filter = new FilterRegistrationBean();
		filter.setFilter(new SitemeshFilter()); //filter에 	SitemeshFilter클래스 지정
		return filter;
	}
	
	@Bean
	public static JavaMailSender mailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		
		// 구글: smtp.gmail.com
		// 네이버: smtp.naver.com
		// 다음: smtp.daum.net
		mailSender.setHost("smtp.naver.com");
		// 구글: 587
		// 네이버: 465
		// 다음: 465
		mailSender.setPort(465);
		// 이메일 주소
		mailSender.setUsername("hanium2021esg@naver.com");
		// 이메일 패스워드
		mailSender.setPassword("fightingesg!!");
		
		Properties javaMailProperties = new Properties();
		
		javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");
        javaMailProperties.put("mail.smtp.ssl.enable", "true");
 
        mailSender.setJavaMailProperties(javaMailProperties);
		
		return mailSender;
	}

}