package com.cnpiecsb.messageIntergration.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class PushItomsMsgToOaService extends signUtil{
	
	private int getOAMsgQueryId = 1000029;
	
	@Autowired
	GetOaComTokenByGetService getOaComTokenByGetService;
	
	public String pushMessage(){
		//ObjectMapper提供了将 Java对象与JSON数据相互转换的功能
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		//测试库地址
		//String url = "http://192.168.0.196/seeyon/rest/thirdpartyMessage/receive/messageList";
		//正式库地址
		String url = "https://oa.cnpiecsb.com/seeyon/rest/thirdpartyMessage/receive/messageList";
		
		//声明请求体属性
		String thirdpartyRegisterCode = "3002";  // 系统注册编码
		String thirdpartyMessageId = "pk10289289122315";  // 访问应用用户名
		String messageContent = "";	  // 消息内容
		String thirdpartySenderId = "";  // 第三方消息发起人（保证唯一）,需要与用户绑定时的用户主键一致
		String thirdpartyReceiverId = "";  // 第三方消息接收人（保证唯一）,需要与用户绑定时的用户主键一致
		String creation_date = "";  // 消息创建时间（格式：yyyy-MM-dd HH:mm:ss）
		//String downloadUrl = "https://www.baidu.com";  // 原生应用下载地址
		//String messageH5URL = "https://www.baidu.com";  // 移动端穿透链接
		//String messageURL = "https://www.baidu.com";  // PC 端穿透链接
		//String appParam = "";  // 原生应用穿透命令
		
		try {
			//获得token
			Map<String, Object> comToken = getOaComTokenByGetService.getOaComTokenByGet();
			//System.out.println(comTokenMap);
			//获得token中的id属性
			String id = (String)comToken.get("id");
			System.out.println("token="+id);
			
			Map<String, Object> postData = new HashMap<String,Object>();
			postData.put("queryId", getOAMsgQueryId);
			//查询并返回不带分页的oa消息列表
			List<Map<String, Object>> msgs= this.getDataListByQueryId(postData);
			
			//循环每一个的消息，并根据其状态执行不同的操作
			for (Map<String, Object> msg : msgs) {
				if (msg.get("flag_OA").equals("未发送")) {
					messageContent = (String) msg.get("message");	  // 消息内容
					thirdpartySenderId = (String) msg.get("name");  // 第三方消息发起人（保证唯一）,需要与用户绑定时的用户主键一致
					thirdpartyReceiverId = (String) msg.get("name");  // 第三方消息接收人（保证唯一）,需要与用户绑定时的用户主键一致
					Date date = (Date) msg.get("send_date");
			        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			        creation_date = sdf.format(date);  // 消息创建时间（格式：yyyy-MM-dd HH:mm:ss）
			        //System.out.println("当前时间：" + creation_date);
					
			        //创建一个请求体对象
					Map<String,Object> requestBody = new HashMap<String, Object>();
					//创建一个消息对象列表
					List<Map<String,Object>> messagelist = new ArrayList<Map<String,Object>>();
			        //创建一个消息
					Map<String, Object> message = new HashMap<String, Object>();
					//添加属性
					message.put("thirdpartyRegisterCode", thirdpartyRegisterCode);
					message.put("thirdpartyMessageId", thirdpartyMessageId);
					message.put("messageContent", messageContent);
					message.put("thirdpartySenderId", thirdpartySenderId);
					message.put("thirdpartyReceiverId", thirdpartyReceiverId);
					message.put("creation_date", creation_date);
					//message.put("downloadUrl", downloadUrl);
					//message.put("messageH5URL", messageH5URL);
					//message.put("messageURL", messageURL);
					//将消息添加至消息列表
					messagelist.add(message);
					
					//将消息列表添加至请求体
					requestBody.put("messages", messagelist);
					
					//将请求体对象转换为JSON类型字符串
					String requestBodyJson = objectMapper.writeValueAsString(requestBody);
					System.out.println("requestBodyJson==" + requestBodyJson);
					
					//向指定地址发送携带token请求头的post请求
					String result = sendPostToken(url, requestBodyJson, id);
					//System.out.println("result==" + result);
					
					//修改发送状态
					Map<String, Object> resultMap = objectMapper.readValue(result, Map.class);
					System.out.println("resultMap==" + resultMap);
					if ((boolean) resultMap.get("success") == true) {
						Map<String, Object> postData2 = new HashMap<String,Object>();
						postData2.put("inc_no", (int)msg.get("inc_no"));
						postData2.put("flag_OA", "发送成功");
						
						String[] paramNames = {"inc_no","flag_OA"};
						
						postData2.put("spName", "oa_message_flag_update");
						int return_code = baseService.doCallSp(postData2, paramNames, null);
					} else {
						Map<String, Object> postData2 = new HashMap<String,Object>();
						postData2.put("inc_no", (int)msg.get("inc_no"));
						postData2.put("flag_OA", "发送失败");
						
						String[] paramNames = {"inc_no","flag_OA"};
						
						postData2.put("spName", "oa_message_flag_update");
						int return_code = baseService.doCallSp(postData2, paramNames, null);
					}
				}
			}
			return "推送完毕";
			
		} catch (Exception e) {
			//对所有异常进行处理
			e.printStackTrace();
			System.out.println("-----------------------");
			System.out.println(e.getMessage());
			return "出现异常，推送失败";
		}
			
	}
	
	public static void main(String[] args) {
		//以下代码可以脱离web容器
		//加载Spring上下文环境
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
						
		//加载需测试的bean的实例
		PushItomsMsgToOaService pushWxMsgToOaService = (PushItomsMsgToOaService) context.getBean("pushItomsMsgToOaService");
		String result = pushWxMsgToOaService.pushMessage();
		System.out.println(result);
		
	}
	
}
