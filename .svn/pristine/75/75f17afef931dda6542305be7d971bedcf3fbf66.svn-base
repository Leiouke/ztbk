package com.cnpiecsb.common.listener;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import com.cnpiecsb.common.constant.WebConstants;

public class InitSpringServletContext implements ServletContextAware {

	@Override
	public void setServletContext(ServletContext servletContext) {
		// 这里就已经得到了servletContext,  
		// 这个值是等配置文件的所有属性都set以后开始初始化的  
		String webroot = servletContext.getRealPath("/");
		System.setProperty(WebConstants.ITOMSWEBROOT, webroot); 
	}

}
