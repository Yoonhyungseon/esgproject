package program;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;



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

}