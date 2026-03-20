package com.cnpiecsb.system.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.common.aop.BussinessAnnotation;
import com.cnpiecsb.common.aop.OperationLogAnnotation;
import com.cnpiecsb.common.exception.SqlException;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.dao.MenuDao;
import com.cnpiecsb.system.dao.RoleDao;
import com.cnpiecsb.system.dao.UserDao;
import com.cnpiecsb.system.entity.Menu;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Service
public class UserService {
	@Autowired  // 怎么感觉跟@Resource没什么区别?注意，注入的bean不用写get/set对了
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private MenuDao menuDao;
    
    public Page<User> getUserList(Map<String,String> map){
    	Page<User> page = new Page<User>();
    	page.setTotalCount(userDao.getUsersCount(map));
    	page.setDataList(userDao.getUsersByPage(map));
        return page;
    }
    
    /**
     * 获得员工, 非账号
     * 
     * @param map
     * @return
     */
    public List<Map> getStaff(Map<String,String> map) {
    	return userDao.getStaff(map);
    }
    
    @BussinessAnnotation(context="添加用户")
    public void addUser(User user){
		userDao.addUser(user);
		roleDao.addUserRole(user);
    }
    
    /**
     * 获得包含角色信息的用户, 包含其中1个角色
     * 
     * @param id
     * @return
     */
    public User getUser(int id){
    	User user = userDao.getUser(id);
    	try {
    		List<Role> roles = roleDao.getRolesByAccount(user.getAccount());
    		user.setRoleId(roles.get(0).getRoleId());
    	} catch (Exception e){
    		
    	}
    	return user;
    }
    
    /**
     * 获得包含角色信息的用户, 包含其中1个角色
     * 
     * @param id
     * @return
     */
    public User getUserByAccount(String account){
    	User user = userDao.getUserByAccount(account);
    	return user;
    }
    
    @BussinessAnnotation(context="修改用户信息")
    public void editUser(User user){
		userDao.editUser(user);
		/*if(user.getRoleId()>0){
			// 如果有角色信息, 修改角色关联, 如果没有角色信息 新增角色关联
			if (roleDao.getUserRoleCount(user) > 0) {
				roleDao.editUserRole(user);
			} else {
				roleDao.addUserRole(user);
			}
		}*/
		
    }
    
    /**
     * 将同一个工号对应的账号信息全修改掉
     * 
     * @param user
     */
    public void editUserByJobNo(User user){
		userDao.editUserByJobNo(user);
    }
    
    @BussinessAnnotation(context="删除用户")
    public void deleteUser(int id){
    	userDao.deleteUser(id);
    }
    
    @BussinessAnnotation(context="启用用户")
    public void doEnableUser(int id){
    	userDao.enableUser(id);
    }
    
    @BussinessAnnotation(context="停用用户")
    public void doDisableUser(int id){
    	userDao.disableUser(id);
    }
    
    // ---------- 以下登录登出相关            ------------------------//
    /**
     * 登陆并且获得登录用户
     * 
     * @param account
     * @param password  密文密码
     * @return
     */
    @BussinessAnnotation(context="登录")
    public User doLogin(String account, String password){
    	Map map = new HashMap();
    	map.put("account", account);
    	map.put("password", password);
    	User user = userDao.login(map);
    	if (user != null){
    		user.setLoginDate(new Date()); // 修改登录时间字段
    		userDao.editUser(user);
    	}
    	return user;
    }
    
    @BussinessAnnotation(context="登录")
    public User loginWithAccount(String job_no, String account){
    	Map map = new HashMap();
    	map.put("job_no", job_no);
    	map.put("account", account);
    	User user = userDao.loginWithAccount(map);
    	if (user != null){
    		user.setLoginDate(new Date()); // 修改登录时间字段
    		userDao.editUser(user);
    	}
    	return user;
    }
    
    @BussinessAnnotation(context="退出登录")
    public void doLogout(int id) throws SqlException{
    	User user = this.getUser(id);		
		user.setLogoutDate(new Date());  // 增加登出时间
		userDao.editUser(user);
    }
    
    // ---------- 以下用户快捷菜单相关            ------------------------//
    
    /**
     * 获得用户的快捷菜单
     * 
     * @param account
     * @return
     */
    public List<Menu> getShortcutMenu(String account) {
    	return menuDao.getMenusByAccount(account);
    }
    
    @BussinessAnnotation(context="用户设置快捷菜单")
    public void doCommitUserMenu(int[] menuIds, String account){
    	// 先删除用户的所有关联菜单
    	userDao.deleteUserMenu(account);
    	
    	// 增加角色关联菜单
    	Map map = new HashMap();
    	map.put("account", account);
    	for (int menuId : menuIds) {
        	map.put("menuId", menuId);   	
        	userDao.addUserMenu(map);
		}
    }
    
    public static void main(String[] args) throws JsonProcessingException {
    	// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
		
		UserService userService = (UserService) context.getBean("userService");	
		List<Menu> shortcutMenu = userService.getShortcutMenu("wkh");
		
		
		System.out.println("hello");
	}
}
