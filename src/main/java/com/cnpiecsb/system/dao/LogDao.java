package com.cnpiecsb.system.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.system.entity.Log;

@Repository  // 这个注释只能注释到dao的实现上
public class LogDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
	
    public void addLog(Log log){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.LogDao.addLog", log);
    }
    
    public List<Log> getLogsByPage(Map map){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.LogDao.getLogsByPage", map);
    }
    
    public int getLogsCount(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.LogDao.getLogsCount", map);
    }
}
