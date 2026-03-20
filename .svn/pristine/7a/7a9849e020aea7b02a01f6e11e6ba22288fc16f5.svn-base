package com.cnpiecsb.onInterface.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.csu.controller.LdServiceController;
import com.fasterxml.jackson.core.JsonProcessingException;

@Service
public class LdSpService extends LdServiceController{

	/**
	* 文献申汇审批
	* 
	* param postData
	* return
	*/
	public int putWxFhShResultSp(Map postData) {	
		
		// 入参, 注意按照顺序
		String paramNames[] = {"bill_code",
				"audit_status",
		        "audit_memo"};

		// 加入sp的名称
		postData.put("spName", "u_finance_fhsh_audit_oa");
			
		int code = baseService.doCallSp(postData, paramNames, null);

		return code;
	}
	
	//测试方法
	public static void main(String[] args) throws JsonProcessingException, InterruptedException, ParseException,IOException {
		// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
							
		LdSpService testService = (LdSpService) context.getBean("ldSpService");		
							
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("fh_id", "FH00000001");
			map.put("guid", "1111");
			int code= testService.putWxFhShResultSp(map);	
			System.out.println(code);
		} catch (Exception e) {
					// TODO Auto-generated catch block
			e.printStackTrace();
		}
							
		System.out.println("hello");
	}
}
