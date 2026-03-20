package com.cnpiecsb.messageIntergration.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.messageIntergration.util.signUtil;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class GetUserBindingInfoService extends signUtil{
	
	@Autowired
	GetOaComTokenByGetService getOaComTokenByGetService;
	
	/**
	 * 用户绑定，每个用户只需绑定一次
	 * @param accounts
	 * @return
	 */
	public Map<String, Object> getUserBindingInfo(List<String> accounts) {
		//ObjectMapper提供了将 Java对象与JSON数据相互转换的功能
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		try {
			//获得token
			Map<String, Object> comToken = getOaComTokenByGetService.getOaComTokenByGet();
			//System.out.println(comTokenMap);
			//获得token中的id属性
			String id = (String)comToken.get("id");
			//System.out.println(id);
		
			//测试库地址
			String url = "http://192.168.0.196/seeyon/rest/thirdpartyUserMapper/binding";
			//正式库地址
			//String url = "https://oa.cnpiecsb.com/seeyon/rest/thirdpartyUserMapper/binding";
		
			String registerCode = "3002"; 		// 系统注册编码
			//String thirdUserId = account; 		// 第三方人员主键（保证唯一)
			//尽量保证thirdUserId和thirdLoginName一致
			//String thirdLoginName = account;	// 第三方人员登录名称，默认匹配项
			
			//创建一个请求体对象
			Map<String,Object> requestBody = new HashMap<String,Object>();
			//创建一个用户列表
			List<Map<String,Object>> userlist = new ArrayList<Map<String,Object>>();
			//循环添加用户
			for(String account:accounts){
				Map<String, Object> user = new HashMap<String, Object>();
				//添加属性
				user.put("registerCode", registerCode);
				user.put("thirdUserId", account);
				user.put("thirdLoginName", account);
				//将用户添加至用户列表
				userlist.add(user);
			}
			
			//将用户列表添加至请求体
			requestBody.put("userlist", userlist);
			
			//将请求体对象转换为JSON类型字符串
			String requestBodyJson = objectMapper.writeValueAsString(requestBody);
			//System.out.println(requestBodyJson);
			//向指定地址发送携带token请求头的post请求
			String result = sendPostToken(url, requestBodyJson, id);
			//System.out.println("result==" + result);
			Map<String, Object> resultMap = objectMapper.readValue(result, Map.class);
			//System.out.println("resultMap==" + resultMap);
			return resultMap;
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
		GetUserBindingInfoService getUserBindingInfoService = (GetUserBindingInfoService) context.getBean("getUserBindingInfoService");
		List<String> accounts = new ArrayList<>();
		accounts.add("倪文杰");
		accounts.add("柏玉华");
		accounts.add("张宸");
		Map<String,Object> resultMap = getUserBindingInfoService.getUserBindingInfo(accounts);
		System.out.println(resultMap);
	}
	*/
}
