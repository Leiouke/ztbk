package com.cnpiecsb.onInterface.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.utils.URIBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.onInterface.util.signUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GetOaOrgService extends signUtil{
	
	@Autowired
	GetOaTokenService getOaTokenService;
	
	public Map<String,Object> getOaOrg() {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		//Map<String,Object> token_map= getOaTokenService.getOaToken();//获得token
		
		 //String token = String.valueOf(token_map.get("id"));
		
		//公共参数
		//String url ="http://192.168.0.196/seeyon/rest/orgAccounts";//测试库
		
		String url ="https://oa.cnpiecsb.com/seeyon/rest/orgAccounts";//正式库
		
		try {
			//1.创建urlBuilder
	        URIBuilder uriBuilder = new URIBuilder(url);
	        
	        //2.设置参数
	        //uriBuilder.setParameter("token",token);
	        uriBuilder.setParameter("token","6ddc3363-34f1-4239-ad18-0cf9bc4c4bfa");
	        
	        System.out.println(uriBuilder);
			
			String result=sendGet(uriBuilder);
			
			System.out.println("result="+result);
			
			Map<String,Object> map = mapper.readValue(result, Map.class);
			System.out.println("org="+map.toString());
			return map;
		} catch (Exception e) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("code","000");
			map.put("message",e.getMessage());
			map.put("data",e.getMessage());
			return null;
		}
	}
	
	//测试方法
	public static void main(String[] args) throws JsonProcessingException, InterruptedException, ParseException,IOException {
		// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
						
		GetOaOrgService testService = (GetOaOrgService) context.getBean("getOaOrgService");		
						
		try {
					
			testService.getOaOrg();	
		} catch (Exception e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
						
		System.out.println("hello");
	}
}
