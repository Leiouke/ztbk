package com.cnpiecsb.system.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnpiecsb.common.aop.BussinessAnnotation;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.dao.RoleDao;
import com.cnpiecsb.system.dao.SubsystemDao;
import com.cnpiecsb.system.entity.Subsystem;

@Service
public class SubsystemService {
	@Autowired  // @Resource注入模式可以修改bean id,注意，注入的bean不用写get/set对了
	private SubsystemDao subsystemDao;
	
	@Autowired
	private RoleDao roleDao;
    
//    public Role getRole(String account){
//    	return roleDao.getRole(account);
//    }
//    
//    public Role getRole(int id){
//    	return roleDao.getRoleById(id);
//    }
//    
    public Page<Subsystem> getSubsystemList(Map map){
    	Page<Subsystem> page = new Page<Subsystem>();
    	page.setTotalCount(subsystemDao.getSubsystemsCount(map));
    	page.setDataList(subsystemDao.getSubsystemsByPage(map));
        return page;
    }
    
    @BussinessAnnotation(context="添加新的子系统")
    public void addSubsystem(Subsystem subsystem){
    	subsystemDao.addSubsystem(subsystem);
    }
    
    @BussinessAnnotation(context="修改子系统信息")
    public void editSubsystem(Subsystem subsystem){
    	subsystemDao.editSubsystem(subsystem);
    }
    
    @BussinessAnnotation(context="删除子系统")
    public boolean deleteSubsystem(int id){
    	if (!roleDao.subsystemHasRoles(id)) {
    		subsystemDao.deleteSubsystem(id);
    		subsystemDao.deleteSubsystemMenu(id);
    		return true;
    	}
    	return false;
    }  
    
    @BussinessAnnotation(context="子系统菜单授权")
    public void doMenuAuthorize(int[] menuIds, int subsystemId){
    	// 先删除角色所有关联菜单
    	subsystemDao.deleteSubsystemMenu(subsystemId);
    	
    	// 增加角色关联菜单
    	Map map = new HashMap();
    	map.put("subsystemId", subsystemId);
    	for (int menuId : menuIds) {
        	map.put("menuId", menuId);   	
        	subsystemDao.addSubsystemMenu(map);
		}
    }
}
