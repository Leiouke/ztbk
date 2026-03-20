package com.cnpiecsb.onInterface.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
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
public class GetOaMemberCode extends signUtil{
	@Autowired
	GetOaTokenService getOaTokenService;
	
	public  void getOaMemberCode() {
		System.out.println(1);
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		Map<String,Object> token_map= getOaTokenService.getOaToken();//获得token
		
		String token = "";
		
		if(String.valueOf(token_map.get("code"))=="000"){
			oaLogInsert("获取OA员工账号",500,"token获取失败","");
			return;
		}else{
			token = String.valueOf(token_map.get("id"));
		}
		
		//公共参数
		//String url ="http://192.168.0.196/seeyon/rest/orgMembers/all/";//测试库
		String url ="https://oa.cnpiecsb.com/seeyon/rest/orgMembers/all/";//正式库
		
		String accountId = "670869647114347";
		
		String search_url = url+accountId;
		
		try {
			//1.创建urlBuilder
	        URIBuilder uriBuilder = new URIBuilder(search_url);
	        
	        //2.设置参数
	        uriBuilder.setParameter("token",token);
			
			String result=sendGet(uriBuilder);
			
			System.out.println("result="+result);
			
			List<Map<String,Object>> list = mapper.readValue(result, List.class);
			for(Map<String,Object> map:list){
				oaAccountInsert(String.valueOf(map.get("code")),String.valueOf(map.get("id")),String.valueOf(map.get("loginName")));
			}
			oaLogInsert("获取OA员工账号",200,"成功","");
		} catch (Exception e) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("code","000");
			map.put("message",e.getMessage());
			map.put("data",e.getMessage());
			oaLogInsert("获取OA员工账号",000,e.getMessage(),"");
		}
	}
	
	//新增OA账号记录
	public void oaAccountInsert(String account,String oaAccount,String loginName){
			Map<String,Object> postData = new HashMap<String,Object>();
				
			postData.put("account", account);
			postData.put("oa_account", oaAccount);
			postData.put("oa_loginName", loginName);
				
				
			// 入参, 注意按照顺序
			String paramNames[] = {"account",
				        "oa_account",
				        "oa_loginName"};

			// 加入sp的名称
			postData.put("spName", "u_oa_account_new");//sp名称 todo
					
			int return_code = baseService.doCallSp(postData, paramNames, null);
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
						
		GetOaMemberCode testService = (GetOaMemberCode) context.getBean("getOaMemberCode");		
						
		try {
					
			testService.getOaMemberCode();	
		} catch (Exception e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
						
		System.out.println("hello");
	}

}
