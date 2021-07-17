package program;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;


/*
 * 
사이트매시 필터: 사용자 정의 레이아웃
*
*/


public class SitemeshFilter extends ConfigurableSiteMeshFilter {
	
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder
		// Map decorators
		.addDecoratorPath("/*", "/WEB-INF/decorator/defaultDecorator.jsp")
	    .addDecoratorPath("/admin/*", "/WEB-INF/decorator/admin_default.jsp")
		.addExcludedPath("/sitemap")
		;
	}
}	