package com.cnpiecsb.common.util;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.Module;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.module.SimpleModule;

/**
 * 跟json转化相关的工具类
 * 
 * @author user
 *
 */
public class JsonUtil {
	/**
	 * 将 map数据类型转化为字符串
	 * 
	 * @param map
	 * @return
	 * @throws JsonProcessingException
	 */
	public static String mapToString(Map<String, Object> map) throws JsonProcessingException {
		// 迭代map, 去掉所有map中含有' 和 " 的内容
		String result = "";
		if(map!=null){
			for (Map.Entry<String, Object> entry : map.entrySet()) { 
				if (entry.getValue() instanceof String){
					entry.setValue(entry.getValue().toString().replaceAll("'", "").replaceAll("\"", ""));
				}
			}		
			ObjectMapper mapper = new ObjectMapper();
			
			//mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); // 禁用时间戳序列化
			// 禁用时间戳特性（可选，根据你的需求）
			mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
	        
	        // 设置全局日期格式
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        mapper.setDateFormat(dateFormat);
			result = mapper.writeValueAsString(map);
		}
		return result;		
	}
}
