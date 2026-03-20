package com.cnpiecsb.csu.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.csu.idao.IBusinessDao;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 基础业务库服务
 * 
 * @author user
 *
 */
@Service
public class BaseService extends ObjectService {
	// 多实现类必须用Resource注入,并需要指定对象名  Qualifier也可以按类注入
	@Resource(name="baseDao")
	private IBusinessDao iBusinessDao;

	/**
	 * 将当前的具体实现类覆盖到父类中, 保证父类的iBusinessDao用的是子类的对象
	 */
	@Override
	public IBusinessDao getiBusinessDao() {
		return iBusinessDao;
	}

	public static void main(String[] args) throws JsonProcessingException {
    	// 以下代码可以脱离web容器
//		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
//		context.setValidating(false);  
//		context.load("classpath*:spring-*.xml");  
//		context.refresh(); 
//		
//		ObjectService objectService = (ObjectService) context.getBean("objectService");		
//		Map searchMap = new HashMap();
//		
//		Map<String, Object> oneQuery = commonQueryService.getCollectData(searchMap, 1100001, "wkh");
//		
//		System.out.println("hello");
	}
}
