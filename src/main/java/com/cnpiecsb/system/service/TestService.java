package com.cnpiecsb.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class TestService {
	
		
		public String testtz(){
			ObjectMapper mapper = new ObjectMapper();
			

			//正是库地址
			String url = "http://localhost:8080/hr/loginOa";//正式库
			
			Map<String,Object> map = new HashMap<String,Object>();//请求数据
			
			
			
			try {
				
				map.put("account", "wkh");
				map.put("password", "1111");
				
				String requestData = mapper.writeValueAsString(map);
				
				System.out.println("map="+requestData);
				
				String result=sendPost(url, requestData);
				
//				Map<String,Object> map = mapper.readValue(result, Map.class); //获得接口的结果
//				
//				if(map.containsKey("code")&&map.get("code").equals(0)){//0代表成功
//					
//					return "1";
//				}else{
//					
//					return "0";
//				}
				
				return "0";
				
			} catch (Exception e) {
				
				return "0";
			}
			
			
		}
	
	
	//通讯的方法post
	public static String sendPost(String url, String data) {
		try {
			CloseableHttpClient httpclient = null;
			CloseableHttpResponse httpresponse = null;
			try {
				httpclient = HttpClients.createDefault();
				HttpPost httppost = new HttpPost(url);
				//设置超时时间
//				RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(30000).setConnectTimeout(5000).build();//设置请求和传输超时时间
//				httppost.setConfig(requestConfig);
				StringEntity stringentity = new StringEntity(data,ContentType.create("application/json", "UTF-8"));
				httppost.setEntity(stringentity);
				httpresponse = httpclient.execute(httppost);
				String response = EntityUtils.toString(httpresponse.getEntity());
				System.out.println("response="+response);
				return response;
			} finally {
				if (httpclient != null) {
					httpclient.close();
				}					
				if (httpresponse != null) {
					httpresponse.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
