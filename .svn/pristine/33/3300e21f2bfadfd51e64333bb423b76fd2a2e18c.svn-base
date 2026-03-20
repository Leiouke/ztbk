package com.cnpiecsb.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.system.dao.WarningDao;
import com.cnpiecsb.system.entity.Warning;
import com.fasterxml.jackson.core.JsonProcessingException;

@Service
public class WarningService {
	@Autowired  // 怎么感觉跟@Resource没什么区别?注意，注入的bean不用写get/set对了
	private WarningDao warningDao;
	
	/**
	 * 根据用户账号获得预警信息
	 * 
	 * @param account
	 * @return
	 */
    public List<Warning> getWarningByAccount(String account){
    	return warningDao.getWarningByAccount(account);
    }
    
    /**
     * 获得所有的预警信息
     * 
     * @return
     */
    public List<Warning> getAllWarning() {
    	return warningDao.getAllWarning();
    }
    
    /**
     * 获得某预警的配置用户
     * 
     * @param tableId
     * @return
     */
    public List<String> getWarningAccount(int tableId) {
    	return warningDao.getWarningAccount(tableId);
    }
    
    /**
     * 提交预警配置用户, 逻辑是假如没有就新增 有就无视
     * 
     * @param tableId
     * @param accounts
     */
    public void doCommitWarningAccount(int tableId, List<String> accounts) {
//    	warningDao.deleteWarningAccount(tableId);
    	
    	Map map = new HashMap();
    	for (String account : accounts) {
    		map.put("tableId", tableId);
    		map.put("account", account);
    		warningDao.addWarningAccount(map);
		}
    }
    
    /**
     * 删除某个账号的配置预警信息
     * 
     * @param map
     */
    public void deleteWarningTableAndAccount(Map map) {
    	warningDao.deleteWarningTableAndAccount(map);
    }
    
    public static void main(String[] args) throws JsonProcessingException {
    	// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml"); 
		context.refresh(); 
		
		WarningService warningService = (WarningService) context.getBean("warningService");		
		
		List<String> accounts = new ArrayList<String>();
		accounts.add("wkh");
		accounts.add("xc");
		
		warningService.doCommitWarningAccount(3, accounts);
		
		System.out.println("hello");
	}
}
