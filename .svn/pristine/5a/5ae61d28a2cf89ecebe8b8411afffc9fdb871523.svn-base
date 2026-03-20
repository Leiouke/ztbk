package com.cnpiecsb.system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.viewobject.TreeNode;
import com.cnpiecsb.system.entity.Menu;
import com.cnpiecsb.system.service.MenuService;

@Controller
@RequestMapping("/system")
public class MenuController {
	@Resource(name="menuService")
	private MenuService menuService;
	
	/**
	 * 进入菜单管理界面
	 * 
	 * @return
	 */
	@RequestMapping(value="/menuManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView menuList(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/menuManage");
        return mv;
    }
	
	/**
	 * 获得角色的所有菜单信息, 扁平模式的菜单信息 
	 * 
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/getRoleMenus")
	@ResponseBody
	public Object getRoleMenus(@RequestParam int roleId){
		List<Integer> roleIds = new ArrayList<Integer>();
		roleIds.add(roleId);
		List<Menu> menus = menuService.getMenusByRoles(roleIds);
		return menus;
	}
	
	/**
	 * 获得子系统的所有菜单信息, 扁平模式的菜单信息
	 * 
	 * @param subsystemId
	 * @return
	 */
	@RequestMapping(value="/getSubsystemMenus")
	@ResponseBody
	public Object getSubsystemMenus(@RequestParam int subsystemId){
		List<Menu> menus = menuService.getMenusBySubsystem(subsystemId);
		return menus;
	}
	
	/**
	 * 获得整颗菜单树
	 * 
	 * 格式形如 [{"text":"系统管理","id":1,"nodes":[{"text":"用户管理","id":2,"nodes":null}]},{"text":"业务1","id":3,"nodes":[]}]
	 * 
	 * @return
	 */
	@RequestMapping(value="/getMemuTree")
	@ResponseBody
	public Object getMemuTree(){
		List<TreeNode> menuTree = menuService.getMenuTree();
		return menuTree;
	}
	
	/**
	 * 获得整棵菜单树结构, 已经根据所属子系统做了筛选了
	 * 
	 * @param subsystemId
	 * @return
	 */
	@RequestMapping(value="/getMenuTreeBySubsystem")
	@ResponseBody
	public Object getMenuTreeBySubsystem(@RequestParam int subsystemId){
		List<TreeNode> menuTree = menuService.getMenuTreeBySubsystem(subsystemId);
		return menuTree;
	}
	
	/**
	 * 获得一级菜单列表
	 * 
	 * @return
	 */
	@RequestMapping(value="/getTopMemuNode")
	@ResponseBody
	public Object getTopMemuNode(){
		List<TreeNode> menuTree = menuService.getTopMemuNode();
		return menuTree;
	}
	
	/**
	 * 判断一个菜单项是否有子菜单
	 * 
	 * @param menuId
	 * @return
	 */
	@RequestMapping(value="/hasChildren")
	@ResponseBody
	public Object hasChildren(@RequestParam int menuId){
		boolean result = menuService.hasChildren(menuId);
		return "{\"success\":" + result + "}";
	}
	
	/**
	 * 进入增加菜单界面
	 * 
	 * @return
	 */
	@RequestMapping(value="/menuAdd",method=RequestMethod.GET)
    public ModelAndView toAdd(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        mv.addObject("my_pid", id);
        mv.setViewName("system/menuAdd");
        return mv;
    }
	
	/**
	 * 增加菜单
	 * 
	 * @param menu
	 * @return
	 */
	@RequestMapping(value="/addMenu",method=RequestMethod.POST)
	@ResponseBody
    public Object addMenu(@ModelAttribute("menu") Menu menu){
		menuService.addMenu(menu);
		return "{\"success\":true}";
    }
	
	/**
	 * 进入菜单修改界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/menuEdit",method=RequestMethod.GET)
    public ModelAndView toEdit(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
        ModelAndView mv = new ModelAndView();
        mv.addObject("menu", menuService.getMenu(id));
        mv.setViewName("system/menuEdit");
        return mv;
    }
	
	/**
	 * 修改菜单
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/editMenu",method=RequestMethod.POST)
	@ResponseBody
    public Object editMenu(@ModelAttribute("menu") Menu menu){
		menuService.editMenu(menu);
		return "{\"success\":true}";
    }
	
	/**
	 * 删除菜单
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteMenu",method=RequestMethod.POST)
	@ResponseBody
    public Object deleteMenu(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		menuService.deleteMenu(id);
		return "{\"success\":true}";
    }
}
