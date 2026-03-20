package com.cnpiecsb.onInterface.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.utils.URIBuilder;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.onInterface.util.signUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GetOaTokenService extends signUtil{
	
	public Map<String,Object> getOaToken(){
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		//测试库地址
//		String url ="http://192.168.0.196/seeyon/rest/token/";
		//正式库地址
		String url = "https://oa.cnpiecsb.com/seeyon/rest/token/";
		
		//测试库
//		String userName = "forThirdKK";
//		String password = "41d49be5-ce75-4b8b-a89d-be537b616992";
		//正式库
		String userName = "forThirdKK";
		String password = "8bcda9d1-e8a1-49fc-b9c7-dcb0ff22e42e";
		
		String search_url = url + userName + "/" +password;
		
		try {
			//1.创建urlBuilder
	        URIBuilder uriBuilder = new URIBuilder(search_url);
			
			String result=sendGet(uriBuilder);
			
			Map<String,Object> map = mapper.readValue(result, Map.class);
			System.out.println(map.toString());
			oaLogInsert("获取OA通用TOKEN",200,map.get("id"),"");
			return map;
		} catch (Exception e) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("code","000");
			map.put("message",e.getMessage());
			map.put("data",e.getMessage());
			oaLogInsert("获取OA通用TOKEN",000,e.getMessage(),"");
			return map;
		}
	}
	
	//记录oa接口日志
	public void oaLogInsert(String method,int code,Object msg,String id){
		Map<String,Object> postData = new HashMap<String,Object>();
				
		postData.put("method", method);
		postData.put("code", code);
		postData.put("msg", msg);
		postData.put("related", id);
				
				
		// 入参, 注意按照顺序
		String paramNames[] = {"method",
				        "code",
				        "msg",
				        "related"};

		// 加入sp的名称
		postData.put("spName", "u_oa_log_insert");//sp名称 todo
					
		int return_code = baseService.doCallSp(postData, paramNames, null);
				
	}
	
	//测试方法
	public static void main(String[] args) throws JsonProcessingException, InterruptedException, ParseException,IOException {
		// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
					
		GetOaTokenService testService = (GetOaTokenService) context.getBean("getOaTokenService");		
					
		try {
				
			testService.getOaToken();	
		} catch (Exception e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		System.out.println("hello");
	}

}
