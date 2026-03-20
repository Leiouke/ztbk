package com.cnpiecsb.onInterface.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.onInterface.util.signUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GetMemberTokenServivce extends signUtil{
	
	public String getMemberToken(String logName,String bill_code){
		ObjectMapper mapper = new ObjectMapper();
		try {
			//测试库地址
			//String url ="http://192.168.0.196/seeyon/rest/token";
			//正是库地址
			String url = "https://oa.cnpiecsb.com/seeyon/rest/token";
			
			//测试库用户名密码
//			String userName = "forThirdKK";
//			String password = "41d49be5-ce75-4b8b-a89d-be537b616992";
			
			//正式库用户名和密码
			String userName = "forThirdKK";
			String password = "8bcda9d1-e8a1-49fc-b9c7-dcb0ff22e42e";
			
			Map<String,Object> searchMap = new HashMap<String,Object>();//请求数据
			
			//拼接外面
			searchMap.put("userName", userName);
			searchMap.put("password", password);
			searchMap.put("loginName", logName);
			
			//System.out.println("map="+mapper.writeValueAsString(searchMap));
			
			String requestData = mapper.writeValueAsString(searchMap);
			
			String result=sendPost(url, requestData);
			
			//System.out.println(result);
			
			Map<String,Object> map = mapper.readValue(result, Map.class); //获得接口的结果
			
			String id = "";//返回的ID
			if(map.containsKey("code")&&map.get("code").equals(500)){
				id = "0";
				oaLogInsert("获取token",500,String.valueOf(map.get("message")),bill_code);
			}
			else if(map.get("bindingUser")==null){ //loginName为空
				id = "0";
				oaLogInsert("获取token",200,"LoginName为空",bill_code);
			}else{
				id = String.valueOf(map.get("id"));
				oaLogInsert("获取token",200,id,bill_code);
			}
			
			//System.out.println(id);
			
			return id;
		} catch (Exception e) {
			oaLogInsert("获取token",500,e.getMessage(),bill_code);
			return "0";
		}
		
	}
	
	//记录oa接口日志
	public void oaLogInsert(String method,int code,Object msg,String related_id){
		Map<String,Object> postData = new HashMap<String,Object>();
				
		postData.put("method", method);
		postData.put("code", code);
		postData.put("msg", msg);
		postData.put("related_id",related_id);
				
				
		// 入参, 注意按照顺序
		String paramNames[] = {"method",
				      "code",
				       "msg",
				       "related_id"};

		// 加入sp的名称
		postData.put("spName", "u_oa_log_insert");//sp名称 
					
		int return_code = baseService.doCallSp(postData, paramNames, null);
				
	}
	
	//测试方法
	public static void main(String[] args) throws JsonProcessingException, InterruptedException, ParseException,IOException {
		// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
						
		GetMemberTokenServivce testService = (GetMemberTokenServivce) context.getBean("getMemberTokenServivce");		
						
		try {
					
			testService.getMemberToken("张宸","TEST00000001");
		
		} catch (Exception e) {
					// TODO Auto-generated catch block
			e.printStackTrace();
		}
						
		System.out.println("hello");
	}

}
