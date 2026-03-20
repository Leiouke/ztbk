package com.cnpiecsb.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.common.aop.BussinessAnnotation;
import com.cnpiecsb.common.viewobject.TreeNode;
import com.cnpiecsb.system.dao.MenuDao;
import com.cnpiecsb.system.entity.Menu;
import com.cnpiecsb.system.entity.viewobject.MenuNode;

@Service
public class MenuService {
	@Autowired  // 怎么感觉跟@Resource没什么区别?注意，注入的bean不用写get/set对了
	private MenuDao menuDao;
	
	@BussinessAnnotation(context="添加新菜单")
    public void addMenu(Menu menu){
		menuDao.addMenu(menu);
    }
    
    @BussinessAnnotation(context="修改菜单信息")
    public void editMenu(Menu menu){
    	menuDao.editMenu(menu);
    }
    
    @BussinessAnnotation(context="删除菜单")
    public void deleteMenu(int id){
    	menuDao.deleteMenu(id);
    }
    
    public Menu getMenu(int id){
    	return menuDao.getMenuById(id);
    }
    
    /**
     * 获得菜单树结构, 用于维护的菜单树
     * 
     * @return
     */
    public List<TreeNode> getMenuTree(){
    	List<TreeNode> topMenus = menuDao.getMenuNodesByParent(null);
    	for (TreeNode treeNode : topMenus) {
			List<TreeNode> childMenus = menuDao.getMenuNodesByParent(treeNode.getId());
			treeNode.setNodes(childMenus);
		}
    	return topMenus;
    }
    
    /**
     * 获得整棵菜单树结构, 已经根据所属子系统做了筛选了
     * 
     * @param subsystemId
     * @return
     */
    public List<TreeNode> getMenuTreeBySubsystem(int subsystemId){
    	List<TreeNode> topMenus = menuDao.getMenuNodesBySubsystem(subsystemId);
    	for (TreeNode treeNode : topMenus) {
			List<TreeNode> childMenus = menuDao.getMenuNodesByParent(treeNode.getId());
			treeNode.setNodes(childMenus);
		}
    	return topMenus;
    }
    
    /**
     * 获得一级菜单 列表
     * 
     * @return
     */
    public List<TreeNode> getTopMemuNode(){
    	return menuDao.getMenuNodesByParent(null);
    }
    
    /**
     * 根据角色id获得所有菜单, 扁平的, 支持多角色菜单合并
     * 
     * @param roleId
     * @return
     */
    public List<Menu> getMenusByRoles(List<Integer> roleIds){
    	return menuDao.getMenusByRoles(roleIds);
    }
    
    //获根据角色id获得所有菜单, 扁平的, 支持多角色菜单合和个人独特菜单，
    public List<Menu> getMenusByRolesSingle(Map<String,Object> param){
    	return menuDao.getMenusByRolesSingle(param);
    }
    
    /**
     * 根据子系统id获得所有菜单, 扁平的
     * 
     * @param subsystemId
     * @return
     */
    public List<Menu> getMenusBySubsystem(int subsystemId){
    	return menuDao.getMenusBySubsystem(subsystemId);
    }
    
    /**
     * 菜单是否有子菜单
     * 
     * @param menuId
     * @return
     */
    public boolean hasChildren(int menuId){
    	List<TreeNode> childrenNodes = menuDao.getMenuNodesByParent(menuId);
    	return childrenNodes.size() == 0 ? false : true;
    }
    
    /**
     * 获得超级管理员的菜单结构
     * 
     * @return
     */
    public List<MenuNode> getMenusCascade() {
    	List<MenuNode> topMenuNodes = new ArrayList<MenuNode>();
    	List<Menu> topMenus = menuDao.getMenusByParent(null);  
    	for (Menu menu : topMenus) {
    		MenuNode node = new MenuNode();
    		BeanUtils.copyProperties(menu, node);
    		topMenuNodes.add(node);
		}
    	
    	for (MenuNode menuNode : topMenuNodes) {
			List<Menu> childMenus = menuDao.getMenusByParent(menuNode.getId());
			menuNode.setChildMenu(childMenus);
		}
    	return topMenuNodes;
    }
    
    /**
     * 获得一般角色菜单结构, 角色菜单获得的时候需要去判断下有没有在子系统菜单中
     * 
     * @param roleId
     * @param isSubsystem 是否是子系统菜单
     * @return
     */
    public List<MenuNode> getMenusCascade(List<Integer> roleIds, int subsystemId, boolean isSubsystem,String account){
    	
    	Map<String,Object> map_dao = new HashMap<>();
    	
    	map_dao.put("roleIds", roleIds);
    	map_dao.put("account",account);
    	
    	List<Menu> menuList = this.getMenusByRolesSingle(map_dao);
    	
    	//List<Menu> menuList = this.getMenusByRoles(roleIds);
    	
    	List<Menu> menusBySubsystemList = this.getMenusBySubsystem(subsystemId);
    	
    	List<MenuNode> topMenuNodes = new ArrayList<MenuNode>(); // 放一级菜单,包含所有对应的二级菜单
    	
    	Map map = new HashMap();  // 临时的二级菜单存放map, key--一级菜单 value--二级菜单
    	// 先导入一级菜单
    	for (Menu menu : menuList) {
    		if (menu.getpId() == null){  // 一级菜单逻辑
    			if (this.hasMenuContain(menusBySubsystemList, menu, isSubsystem)) {  // 必须子系统菜单有, 才可以装载
    				MenuNode menuNode = new MenuNode();
        			BeanUtils.copyProperties(menu, menuNode);
    				topMenuNodes.add(menuNode);  
    			}
    		} else {  // 二级菜单逻辑
    			List<Menu> childMenu = map.get(menu.getpId()) == null ? new ArrayList<Menu>() : (List<Menu>) map.get(menu.getpId());
    			if (this.hasMenuContain(menusBySubsystemList, menu, isSubsystem)) {  // 必须子系统菜单有, 才可以装载
    				childMenu.add(menu);
    			}
    			map.put(menu.getpId(), childMenu); 
    		}
		}
    	
    	// 再装载二级菜单
    	for (MenuNode menuNode : topMenuNodes) {
			menuNode.setChildMenu((List<Menu>) map.get(menuNode.getId()));
		}
    	return topMenuNodes;
    }
    
    /**
     * 判断当前的菜单是否是子系统菜单
     * 
     * @param menusBySubsystemList
     * @param menu
     * @param isSubsystem 是否是子系统菜单
     * @return
     */
    private boolean hasMenuContain(List<Menu> menusBySubsystemList, Menu menu, boolean isSubsystem) {
    	if (!isSubsystem) {
    		return true;
    	}
    	for (Menu subsystemMenu : menusBySubsystemList) {
			if (subsystemMenu.getId() == menu.getId()) {
				return true;
			}
		}
    	return false;
    }

    public static void main(String[] args) {
    	// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();  
		context.setValidating(false);  
		context.load("classpath*:spring-mybatis.xml");
		context.refresh();
		
		MenuService menuService = (MenuService) context.getBean("menuService");
		
//		List<MenuNode> menus = menuService.getMenusCascade(9,4,true);
		
		System.out.println("");
	}
}
