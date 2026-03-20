package com.cnpiecsb.common.listener;

import java.io.IOException;
import java.util.Properties;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
//import org.springframework.web.context.support.WebApplicationContextUtils;

public class InitialBeanListener implements ApplicationListener<ContextRefreshedEvent> {

	// properties文件对象
	private Properties props;
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		//root application context 没有parent，他就是老大.  确保spring容器启动时候只执行一次
		if(event.getApplicationContext().getParent() == null){ 
			Resource resource = new ClassPathResource("/system.properties");	
			try {
				props = PropertiesLoaderUtils.loadProperties(resource);

//				System.setProperty("hello", "china");  这里可以写web全局常量
			} catch (IOException e) {
				e.printStackTrace();
			}
		}  	
	}

	public Properties getProps() {
		return props;
	}
}
