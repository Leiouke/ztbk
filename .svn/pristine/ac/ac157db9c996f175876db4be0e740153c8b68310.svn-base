package com.cnpiecsb.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.service.RoleService;

@Controller
@RequestMapping("/system")
public class RoleController {
	@Resource(name="roleService")
	private RoleService roleService;
	
	@RequestMapping(value="/roleManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView roleList(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/roleManage");
        return mv;
    }
	
	@RequestMapping(value="/getRoleList")
	@ResponseBody
	public Object getRoleList(@RequestBody Map postData){
		Map searchMap = new HashMap();  //封装查询条件
		
		Map<String, Object> result = new HashMap<String, Object>();	
		int limit=0,offset=0;
		if(postData.get("limit")!=null&&!"".equals(postData.get("limit"))){
			limit = Integer.parseInt(postData.get("limit").toString());  //所取记录数
		}
		if(postData.get("offset")!=null&&!"".equals(postData.get("offset"))){
			offset = Integer.parseInt(postData.get("offset").toString());  //记录偏离值 	
		}
		if(postData.get("limit")==null&&postData.get("offset")==null){
			limit=Integer.MAX_VALUE;
		}
		
		searchMap.put("limit", limit);
		searchMap.put("offset", offset);
		 		
		Page<Role> rolePage = roleService.getRoleList(searchMap);
		result.put("rows", rolePage.getDataList());
		result.put("total", rolePage.getTotalCount());

		return result;
	}
	
	/**
	 * 获得所有的角色
	 * 
	 * @return
	 */
	@RequestMapping(value="/getAllRoles")
	@ResponseBody
	public Object getAllRoles(){
		Map searchMap = new HashMap();  //封装查询条件
		searchMap.put("limit", Integer.MAX_VALUE);
		searchMap.put("offset", 0);
		Page<Role> rolePage = roleService.getRoleList(searchMap);
		return rolePage.getDataList();
	}
	
	/**
	 * 角色的菜单授权
	 * 
	 * @param menuIds 菜单id数组
	 * @param roleId  角色id   
	 * @return
	 */
	@RequestMapping(value="/menuAuthorize")
	@ResponseBody
    public Object menuAuthorize(@RequestParam(value="menuIds", required=true) int[] menuIds, // required = true 说明这个参数前端必须得传过来
			@RequestParam int roleId){
		//ModelAndView mv = new ModelAndView();
		roleService.doMenuAuthorize(menuIds, roleId);
		return "{\"success\":true}";
       /* mv.setViewName("system/roleList");
        return mv;*/
    }
	
	@RequestMapping(value="/roleAdd",method=RequestMethod.GET)
    public ModelAndView toAdd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/roleAdd");
        return mv;
    }
	
	@RequestMapping(value="/addRole",method=RequestMethod.POST)
	@ResponseBody
    public Object addRole(@ModelAttribute("role") Role role){
		roleService.addRole(role);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/roleEdit",method=RequestMethod.GET)
    public ModelAndView toEdit(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		
        ModelAndView mv = new ModelAndView();
        mv.addObject("role", roleService.getRole(id));
        mv.setViewName("system/roleEdit");
        return mv;
    }
	
	@RequestMapping(value="/editRole",method=RequestMethod.POST)
	@ResponseBody
    public Object editRole(@ModelAttribute("role") Role role){
		roleService.editRole(role);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/deleteRole",method=RequestMethod.POST)
	@ResponseBody
    public Object deleteRole(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		roleService.deleteRole(id);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/roleUpdate",method=RequestMethod.GET)
    public ModelAndView roleUpdate(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		
        ModelAndView mv = new ModelAndView();
        mv.addObject("role", roleService.getRole(id));
        mv.setViewName("system/roleUpdate");
        return mv;
    }
}
