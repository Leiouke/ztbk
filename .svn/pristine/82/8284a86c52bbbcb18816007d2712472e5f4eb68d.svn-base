package com.cnpiecsb.system.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;

@Repository  // 这个注释只能注释到dao的实现上
public class RoleDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
	
    public List<Role> getRolesByPage(Map map){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.RoleDao.getRolesByPage", map);
    }
    
    public int getRolesCount(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.RoleDao.getRolesCount", map);
    }

    public void addRole(Role role){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.RoleDao.addRole", role);
    }
    
    public List<Role> getRolesByAccount(String account){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.RoleDao.getRolesByAccount", account);
    }
    
    public Role getRoleById(int id){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.RoleDao.getRoleById", id);
    }
    
    public void editRole(Role role){
    	sessionTemplate.update("com.cnpiecsb.system.dao.RoleDao.editRole", role);
    }
    
    public void deleteRole(int id){
    	sessionTemplate.delete("com.cnpiecsb.system.dao.RoleDao.deleteRole", id);
    }
    
    public void addUserRole(User user){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.RoleDao.addUserRole", user);
    }
    
    public void editUserRole(User user){
    	sessionTemplate.update("com.cnpiecsb.system.dao.RoleDao.editUserRole", user);
    }
    
    public int getUserRoleCount(User user){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.RoleDao.getUserRoleCount", user);
    }
    
    public void addRoleMenu(Map map){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.RoleDao.addRoleMenu", map);
    }
    
    public void deleteRoleMenu(int roleId){
    	sessionTemplate.delete("com.cnpiecsb.system.dao.RoleDao.deleteRoleMenu", roleId);
    }
    
    public boolean subsystemHasRoles(int subsystemId) {
    	int hasRoles = sessionTemplate.selectOne("com.cnpiecsb.system.dao.RoleDao.subsystemHasRoles", subsystemId);
    	return hasRoles == 0 ? false : true;
    }
}
