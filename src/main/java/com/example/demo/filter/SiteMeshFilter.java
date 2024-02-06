package com.example.demo.filter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.sitemesh.content.tagrules.html.DivExtractingTagRuleBundle;

public class SiteMeshFilter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/*", "/WEB-INF/jsp/template/main_page.jsp")
	        .addExcludedPath("/index/*")
	        .addExcludedPath("/500")
	        .addExcludedPath("/405")
	        .addExcludedPath("/404")
	        .addExcludedPath("/400")
	        .addExcludedPath("/error")
	        .addDecoratorPath("/index/main*", "/WEB-INF/jsp/template/main_page.jsp")
	        .addDecoratorPath("/index/password", "/WEB-INF/jsp/template/main_page.jsp");
		
		builder.addTagRuleBundle(new DivExtractingTagRuleBundle());
	}
	
}
