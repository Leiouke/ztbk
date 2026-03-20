package com.cnpiecsb.messageIntergration.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.messageIntergration.util.signUtil;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GetOaComTokenByPostService extends signUtil{
	/**
	 * 获得一个通用token
	 * @return
	 */
	public Map<String,Object> getOaComTokenByPost() {
		//ObjectMapper提供了将 Java对象与JSON数据相互转换的功能
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		try {
			//测试库地址
			String url = "http://192.168.0.196/seeyon/rest/token";
			//正式库地址
			//String url = "https://oa.cnpiecsb.com/seeyon/rest/token";
				
			//测试库用户名密码
			String username = "forThirdKK";
			String password = "41d49be5-ce75-4b8b-a89d-be537b616992";
			//正式库用户名和密码
			//String username = "forThirdKK";
			//String password = "8bcda9d1-e8a1-49fc-b9c7-dcb0ff22e42e";
			
		
			//创建一个Map类型的对象用于封装请求体数据
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("userName", username);
			requestMap.put("password", password);
			//System.out.println(requestMap);
			//将map类型对象转换为json类型对象
			String requestJson = objectMapper.writeValueAsString(requestMap);
			//System.out.println(requestJson);
			String responseJson = sendPost(url, requestJson);
			//System.out.println(responseJson);
			Map<String, Object> responseMap = objectMapper.readValue(responseJson, Map.class);
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
		GetOaComTokenByPostService getOaComTokenByPostService = (GetOaComTokenByPostService) context.getBean("getOaComTokenByPostService");
				
		Map<String, Object> comToken = getOaComTokenByPostService.getOaComTokenByPost();
		System.out.println(comToken);
	}
	*/
}
