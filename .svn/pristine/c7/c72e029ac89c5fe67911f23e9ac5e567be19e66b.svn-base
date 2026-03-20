package com.cnpiecsb.system.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.entity.Log;
import com.cnpiecsb.system.service.LogService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/system")
public class LogController {
	@Resource(name="logService")
	private LogService logService;
	
	@RequestMapping(value="/logManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView logList(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/logManage");
        return mv;
    }
	
	@RequestMapping(value="/getLogList")
	@ResponseBody
	public Object getLogList(@RequestBody Map postData){
		Map searchMap = new HashMap();  //封装查询条件
		
		if (postData.get("userAccount") != null && StringUtils.isNotEmpty(postData.get("userAccount").toString())){
			searchMap.put("userAccount", postData.get("userAccount"));
		}
		
		if (postData.get("context") != null && StringUtils.isNotEmpty(postData.get("context").toString())){
			searchMap.put("context", postData.get("context"));
		}
		
		Map<String, Object> result = new HashMap<String, Object>();	
		int limit = Integer.parseInt(postData.get("limit").toString());  //所取记录数
		int offset = Integer.parseInt(postData.get("offset").toString());  //记录偏离值
		
		searchMap.put("limit", limit);
		searchMap.put("offset", offset);
		 		
		Page<Log> logPage = logService.getLogList(searchMap);
		result.put("rows", logPage.getDataList());
		result.put("total", logPage.getTotalCount());

		return result;
	}
	
	public static void main(String[] args) throws JsonProcessingException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		List<Log> logList = new ArrayList<Log>();
		Log log = new Log();
		log.setContext("hello");
		log.setUserAccount("admin");
		log.setLogTime(new Date());
		logList.add(log);
		
		Log log1 = new Log();
		log1.setContext("完美");
		log1.setUserAccount("wkh");
		log1.setLogTime(new Date());
		logList.add(log1);
		
		result.put("total", 100);
//		result.put("log", log);
		result.put("rows", logList);
		
		
		ObjectMapper mapper = new ObjectMapper();  
//		mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		mapper.setDateFormat(sdf);

		System.out.println(mapper.writeValueAsString(log));  // 单对象转化为json
		System.out.println(mapper.writeValueAsString(result));   //map转化为json
	}
}
