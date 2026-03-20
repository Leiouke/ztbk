package com.cnpiecsb.messageIntergration.service;

import java.util.Map;

import org.apache.http.client.utils.URIBuilder;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.messageIntergration.util.signUtil;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GetOaComTokenByGetService extends signUtil{
	/**
	 * 获得一个通用的token
	 * @return 
	 */
	public Map<String,Object> getOaComTokenByGet() {
		//ObjectMapper提供了将 Java对象与JSON数据相互转换的功能
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		//测试库地址
		//String url = "http://192.168.0.196/seeyon/rest/token/";
		//正式库地址
		String url = "https://oa.cnpiecsb.com/seeyon/rest/token/";
		
		//测试库用户名密码
		//String username = "forThirdKK";
		//String password = "41d49be5-ce75-4b8b-a89d-be537b616992";
		//正式库用户名和密码
		String username = "forThirdKK";
		String password = "8bcda9d1-e8a1-49fc-b9c7-dcb0ff22e42e";
		
		String searchUrl = url + username + "/" +password;
		
		try {
			//创建URIBuilder对象
			URIBuilder uriBuilder = new URIBuilder(searchUrl);
			//获得json字符串类型的响应对象
			String responseJson = sendGet(uriBuilder);
			//System.out.println(json);
			//将json类型的字符串转换为map对象
			Map<String, Object> responseMap = objectMapper.readValue(responseJson, Map.class);
			//System.out.println(map);
			return responseMap;
		} catch (Exception e) {
			//对所有异常进行处理
			System.out.println("-----------------------");
			e.printStackTrace();
			System.out.println("-----------------------");
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	/*
	public static void main(String[] args) {
		//以下代码可以脱离web容器
		//加载Spring上下文环境
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
		
		//加载需测试的bean的实例
		GetOaComTokenByGetService getOaComTokenService = (GetOaComTokenByGetService) context.getBean("getOaComTokenService");
		
		Map<String, Object> comToken = getOaComTokenService.getOaComTokenByGet();
		
		System.out.println(comToken);
	}
	*/
}
