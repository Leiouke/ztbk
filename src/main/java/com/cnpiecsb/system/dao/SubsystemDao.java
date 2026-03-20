package com.cnpiecsb.system.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.system.entity.Subsystem;

@Repository  // 这个注释只能注释到dao的实现上
public class SubsystemDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
	
    public List<Subsystem> getSubsystemsByPage(Map map){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.SubsystemDao.getSubsystemsByPage", map);
    }
    
    public int getSubsystemsCount(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.SubsystemDao.getSubsystemsCount", map);
    }

    public void addSubsystem(Subsystem subsystem){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.SubsystemDao.addSubsystem", subsystem);
    }
//    
//    public Role getRole(String account){
//    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.RoleDao.getRole", account);
//    }
//    
//    public Role getRoleById(int id){
//    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.RoleDao.getRoleById", id);
//    }
    
    public void editSubsystem(Subsystem subsystem){
    	sessionTemplate.update("com.cnpiecsb.system.dao.SubsystemDao.editSubsystem", subsystem);
    }
    
    public void deleteSubsystem(int id){
    	sessionTemplate.delete("com.cnpiecsb.system.dao.SubsystemDao.deleteSubsystem", id);
    }
//    
//    public void addUserRole(User user){
//    	sessionTemplate.insert("com.cnpiecsb.system.dao.RoleDao.addUserRole", user);
//    }
//    
//    public void editUserRole(User user){
//    	sessionTemplate.update("com.cnpiecsb.system.dao.RoleDao.editUserRole", user);
//    }
//    
//    public int getUserRoleCount(User user){
//    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.RoleDao.getUserRoleCount", user);
//    }
    
    public void addSubsystemMenu(Map map){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.SubsystemDao.addSubsystemMenu", map);
    }
    
    public void deleteSubsystemMenu(int subsystemId){
    	sessionTemplate.delete("com.cnpiecsb.system.dao.SubsystemDao.deleteSubsystemMenu", subsystemId);
    }
}
