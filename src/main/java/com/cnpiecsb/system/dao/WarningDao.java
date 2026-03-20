package com.cnpiecsb.system.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.system.entity.Warning;

@Repository  // 这个注释只能注释到dao的实现上
public class WarningDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
 
    public List<Warning> getWarningByAccount(String account){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.WarningDao.getWarningByAccount", account);
    }
    
    public List<Warning> getAllWarning(){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.WarningDao.getAllWarning");
    }
    
    public List<String> getWarningAccount(int tableId) {
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.WarningDao.getWarningAccount", tableId);
    }
    
    /**
     * no use
     * 
     * @param tableId
     * @return
     */
    public int deleteWarningAccount(int tableId){
    	return sessionTemplate.delete("com.cnpiecsb.system.dao.WarningDao.deleteWarningAccount", tableId);
    }
    
    public void addWarningAccount(Map map){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.WarningDao.addWarningAccount", map);
    }
    
    public int deleteWarningTableAndAccount(Map map){
    	return sessionTemplate.delete("com.cnpiecsb.system.dao.WarningDao.deleteWarningTableAndAccount", map);
    }
}
