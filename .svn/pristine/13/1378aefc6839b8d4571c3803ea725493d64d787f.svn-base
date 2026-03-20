package com.cnpiecsb.system.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.common.viewobject.TreeNode;
import com.cnpiecsb.system.entity.Menu;

@Repository  // 这个注释只能注释到dao的实现上
public class MenuDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
	
    public List<TreeNode> getMenuNodesByParent(Integer pId){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.MenuDao.getMenuNodesByParent", pId);
    }
    
    /**
     * 找到所属子系统的第一层菜单
     * 
     * @param subsystemId
     * @return
     */
    public List<TreeNode> getMenuNodesBySubsystem(int subsystemId){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.MenuDao.getMenuNodesBySubsystem", subsystemId);
    }
    
    public List<Menu> getMenusByParent(Integer pId){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.MenuDao.getMenusByParent", pId);
    }

    public void addMenu(Menu menu){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.MenuDao.addMenu", menu);
    } 
  
	public void editMenu(Menu menu){
	  	sessionTemplate.update("com.cnpiecsb.system.dao.MenuDao.editMenu", menu);
	}
	  
	public Menu getMenuById(int id){
		return sessionTemplate.selectOne("com.cnpiecsb.system.dao.MenuDao.getMenuById", id);
	}	
  
	public void deleteMenu(int id){
	  	sessionTemplate.delete("com.cnpiecsb.system.dao.MenuDao.deleteMenu", id);
	} 
	
	public List<Menu> getMenusByRoles(List<Integer> roleIds){
		return sessionTemplate.selectList("com.cnpiecsb.system.dao.MenuDao.getMenusByRoles", roleIds);
	}
	
	public List<Menu> getMenusByRolesSingle(Map<String,Object> param){
		return sessionTemplate.selectList("com.cnpiecsb.system.dao.MenuDao.getMenusByRolesSingle", param);
	}
	
	public List<Menu> getMenusByAccount(String account){
		return sessionTemplate.selectList("com.cnpiecsb.system.dao.MenuDao.getMenusByAccount", account);
	}
	
	public List<Menu> getMenusBySubsystem(int subsystemId){
		return sessionTemplate.selectList("com.cnpiecsb.system.dao.MenuDao.getMenusBySubsystem", subsystemId);
	}
}
