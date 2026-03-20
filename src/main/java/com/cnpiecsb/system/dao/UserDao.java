package com.cnpiecsb.system.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cnpiecsb.system.entity.User;

@Repository  // 这个注释只能注释到dao的实现上
public class UserDao {
	@Resource
	private SqlSessionTemplate sessionTemplate;
	
    public List<User> getUsersByPage(Map map){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.UserDao.getUsersByPage", map);
    }
    
    public int getUsersCount(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.UserDao.getUsersCount", map);
    }
    
    public List<Map> getStaff(Map map){
    	return sessionTemplate.selectList("com.cnpiecsb.system.dao.UserDao.getStaff", map);
    }

    public void addUser(User user){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.UserDao.addUser", user);
    }
    
    public User getUser(int id){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.UserDao.getUser", id);
    }
    
    public User getUserByAccount(String account){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.UserDao.getUserByAccount", account);
    }
    
    public void editUser(User user){
    	sessionTemplate.update("com.cnpiecsb.system.dao.UserDao.editUser", user);
    }
    
    public void editUserByJobNo(User user){
    	sessionTemplate.update("com.cnpiecsb.system.dao.UserDao.editUserByJobNo", user);
    }
    
    public void deleteUser(int id){
    	sessionTemplate.delete("com.cnpiecsb.system.dao.UserDao.deleteUser", id);
    }
    
    public void enableUser(int id){
    	sessionTemplate.update("com.cnpiecsb.system.dao.UserDao.enableUser", id);
    }
    
    public void disableUser(int id){
    	sessionTemplate.update("com.cnpiecsb.system.dao.UserDao.disableUser", id);
    }
    
    public User login(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.UserDao.login", map);
    }
    
    public User loginWithAccount(Map map){
    	return sessionTemplate.selectOne("com.cnpiecsb.system.dao.UserDao.loginWithAccount", map);
    }
    
    // ---------- 以下用户快捷菜单相关            ------------------------//
    public void addUserMenu(Map map){
    	sessionTemplate.insert("com.cnpiecsb.system.dao.UserDao.addUserMenu", map);
    }
    
    public void deleteUserMenu(String account){
    	sessionTemplate.delete("com.cnpiecsb.system.dao.UserDao.deleteUserMenu", account);
    }
}
