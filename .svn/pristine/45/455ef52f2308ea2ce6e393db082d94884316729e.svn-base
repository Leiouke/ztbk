package com.cnpiecsb.system.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.system.entity.DicDirectory;
import com.cnpiecsb.system.entity.Dictionary;

@Repository  // 这个注释只能注释到dao的实现上
public class DictionaryDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
 
    public List<Dictionary> getDictionaryByDirectoryId(int directoryId){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.DictionaryDao.getDictionaryByDirectoryId", directoryId);
    }

    public void addDictionary(Dictionary dictionary){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.DictionaryDao.addDictionary", dictionary);
    }  
  
	public void editDictionary(Dictionary dictionary){
	  	sessionTemplate.update("com.cnpiecsb.system.dao.DictionaryDao.editDictionary", dictionary);
	}
  
	public void deleteDictionary(int id){
	  	sessionTemplate.delete("com.cnpiecsb.system.dao.DictionaryDao.deleteDictionary", id);
	} 	
	
	public void doUpdateStatus(Dictionary dictionary){
		sessionTemplate.update("com.cnpiecsb.system.dao.DictionaryDao.doUpdateStatus", dictionary);
	}
	  
	public Dictionary getDictionaryById(int id){
		return sessionTemplate.selectOne("com.cnpiecsb.system.dao.DictionaryDao.getDictionaryById", id);
	}
	
	public List<Dictionary> getUsingDictionaryByDirectoryId(int directoryId){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.DictionaryDao.getUsingDictionaryByDirectoryId", directoryId);
    }
	
    // ----  以下字典目录
    public DicDirectory getDirectoryByCode(String code){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.DictionaryDao.getDirectoryByCode", code);
    }
    
    public String getDirectoryCodeById(int id){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.DictionaryDao.getDirectoryCodeById", id);
    }
    
    public List<DicDirectory> getAllDirectory(){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.DictionaryDao.getAllDirectory");
    }
}
