package com.cnpiecsb.csu.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.csu.entity.DynamicColumn;

/**
 * 基础配置库的dao, 配置query及列信息
 * 
 * @author user
 *
 */
@Repository  // 这个注释只能注释到dao的实现上
public class CommonConfigDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
    
    /**
     * 取自基础库, 获得queryid对应的sql文本
     * 
     * @param id
     * @return
     */
    public String getSqlTextById(int id){
    	return sessionTemplate.selectOne("com.cnpiecsb.csu.dao.CommonConfigDao.getSqlTextById", id);
    }
    
    //--------- 以下跟动态列维护有关  ----------------- 均取自基础库 //
    public List<DynamicColumn> getColumnAttribute(Map map){
    	return sessionTemplate.selectList("com.cnpiecsb.csu.dao.CommonConfigDao.getColumnAttribute", map);
    }
    
    public DynamicColumn getOneColumnAttribute(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.csu.dao.CommonConfigDao.getOneColumnAttribute", map);
    }
    
    public int getColumnAttributeCount(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.csu.dao.CommonConfigDao.getColumnAttributeCount", map);
    }
    
    public int deleteColumnAttribute(Map map){
    	return sessionTemplate.delete("com.cnpiecsb.csu.dao.CommonConfigDao.deleteColumnAttribute", map);
    }
    
    public void addColumnAttribute(Map map){
    	sessionTemplate.insert("com.cnpiecsb.csu.dao.CommonConfigDao.addColumnAttribute", map);
    }
    //---------------------------------------------------//
    
    /**
     * 获得errorCode对应的中文字符串
     * 
     * @param code
     * @return
     */
    public String getErrorByCode(int code) {
		return sessionTemplate.selectOne("com.cnpiecsb.csu.dao.CommonConfigDao.getErrorByCode", code);
	}
}
