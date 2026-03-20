package com.cnpiecsb.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnpiecsb.common.aop.BussinessAnnotation;
import com.cnpiecsb.system.dao.DictionaryDao;
import com.cnpiecsb.system.entity.DicDirectory;
import com.cnpiecsb.system.entity.Dictionary;

@Service
public class DictionaryService {
	@Autowired  // 怎么感觉跟@Resource没什么区别?注意，注入的bean不用写get/set对了
	private DictionaryDao dictionaryDao;
	
	@BussinessAnnotation(context="添加新字典项")
    public void addDictionary(Dictionary dictionary){
		String d_code = dictionaryDao.getDirectoryCodeById(dictionary.getDirectoryId());
		dictionary.setD_code(d_code);
		dictionaryDao.addDictionary(dictionary);
    }
    
    @BussinessAnnotation(context="修改字典项")
    public void editDictionary(Dictionary dictionary){
    	dictionaryDao.editDictionary(dictionary);
    }
    
    @BussinessAnnotation(context="删除字典项")
    public void deleteDictionary(int id){
    	dictionaryDao.deleteDictionary(id);
    }
    
    @BussinessAnnotation(context="修改字典项启用状态")
    public void doUpdateStatus(Dictionary dictionary){
    	dictionaryDao.doUpdateStatus(dictionary);
    }
    
    public Dictionary getDictionaryById(int id){
    	return dictionaryDao.getDictionaryById(id);
    }
    
    public List<Dictionary> getDictionaryByDirectoryId(int directoryId){
    	return dictionaryDao.getDictionaryByDirectoryId(directoryId);
    }
    
    public List<Dictionary> getUsingDictionaryByDirectoryId(int directoryId){
    	return dictionaryDao.getUsingDictionaryByDirectoryId(directoryId);
    }
    
    // --- 以下字典类目
    public List<DicDirectory> getAllDirectory(){
    	return dictionaryDao.getAllDirectory();
    }
    
    public List<Dictionary> getDictionaryByDirectoryCode(String code){
    	DicDirectory dicDirectory = dictionaryDao.getDirectoryByCode(code);
    	return this.getDictionaryByDirectoryId(dicDirectory.getId());
    }
}
