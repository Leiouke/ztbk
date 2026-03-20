package com.cnpiecsb.system.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnpiecsb.common.aop.BussinessAnnotation;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.dao.RoleDao;
import com.cnpiecsb.system.entity.Role;

@Service
public class RoleService {
	@Autowired  // 怎么感觉跟@Resource没什么区别?注意，注入的bean不用写get/set对了
	private RoleDao roleDao;
    
    public List<Role> getRolesByAccount(String account){
    	return roleDao.getRolesByAccount(account);
    }
    
    public Role getRole(int id){
    	return roleDao.getRoleById(id);
    }
    
    public Page<Role> getRoleList(Map map){
    	Page<Role> page = new Page<Role>();
    	page.setTotalCount(roleDao.getRolesCount(map));
    	page.setDataList(roleDao.getRolesByPage(map));
        return page;
    }
    
    @BussinessAnnotation(context="添加新角色")
    public void addRole(Role role){
    	roleDao.addRole(role);
    }
    
    @BussinessAnnotation(context="修改角色信息")
    public void editRole(Role role){
    	roleDao.editRole(role);
    }
    
    @BussinessAnnotation(context="删除角色")
    public void deleteRole(int id){
    	roleDao.deleteRole(id);
    }  
    
    @BussinessAnnotation(context="角色菜单授权")
    public void doMenuAuthorize(int[] menuIds, int roleId){
    	// 先删除角色所有关联菜单
    	roleDao.deleteRoleMenu(roleId);
    	
    	// 增加角色关联菜单
    	Map map = new HashMap();
    	map.put("roleId", roleId);
    	for (int menuId : menuIds) {
        	map.put("menuId", menuId);   	
        	roleDao.addRoleMenu(map);
		}
    }
}
