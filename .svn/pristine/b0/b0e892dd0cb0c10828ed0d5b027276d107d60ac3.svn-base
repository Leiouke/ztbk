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

import com.cnpiecsb.common.viewobject.AjaxResult;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.entity.Subsystem;
import com.cnpiecsb.system.service.SubsystemService;

@Controller
@RequestMapping("/system")
public class SubsystemController {
	@Resource(name="subsystemService")
	private SubsystemService subsystemService;
	
	@RequestMapping(value="/subsystemManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView roleList(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/subsystemManage");
        return mv;
    }
	
	@RequestMapping(value="/getSubsystemList")
	@ResponseBody
	public Object getSubsystemList(@RequestBody Map postData){
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
		 		
		Page<Subsystem> rolePage = subsystemService.getSubsystemList(searchMap);
		result.put("rows", rolePage.getDataList());
		result.put("total", rolePage.getTotalCount());

		return result;
	}
	
	/**
	 * 定义菜单
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/defineMenus",method=RequestMethod.GET)
    public ModelAndView defineMenus() {
        ModelAndView mv = new ModelAndView();
//        mv.addObject("role", roleService.getRole(id));
        mv.setViewName("system/defineMenus");
        return mv;
    }
	
	/**
	 * 获得所有的子系统
	 * 
	 * @return
	 */
	@RequestMapping(value="/getAllSubsystems")
	@ResponseBody
	public Object getAllSubsystems(){
		Map searchMap = new HashMap();  //封装查询条件
		searchMap.put("limit", Integer.MAX_VALUE);
		searchMap.put("offset", 0);
		Page<Subsystem> subsystemPage = subsystemService.getSubsystemList(searchMap);
		return subsystemPage.getDataList();
	}
	
	/**
	 * 子系统的菜单定义
	 * 
	 * @param menuIds 菜单id数组
	 * @param roleId  角色id   
	 * @return
	 */
	@RequestMapping(value="/menuDefine")
	@ResponseBody
    public Object menuAuthorize(@RequestParam(value="menuIds", required=true) int[] menuIds, // required = true 说明这个参数前端必须得传过来
			@RequestParam int subsystemId){
		subsystemService.doMenuAuthorize(menuIds, subsystemId);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/subsystemAdd",method=RequestMethod.GET)
    public ModelAndView subsystemAdd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/subsystemAdd");
        return mv;
    }
	
	@RequestMapping(value="/addSubsystem",method=RequestMethod.POST)
	@ResponseBody
    public Object addSubsystem(@ModelAttribute("subsystem") Subsystem subsystem){
		subsystemService.addSubsystem(subsystem);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/editSubsystem",method=RequestMethod.POST)
	@ResponseBody
    public Object editSubsystem(@ModelAttribute("subsystem") Subsystem subsystem){
		subsystemService.editSubsystem(subsystem);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/deleteSubsystem",method=RequestMethod.POST)
	@ResponseBody
    public Object deleteSubsystem(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));  
		boolean isDelete = subsystemService.deleteSubsystem(id);  // 删除本身 另外还得释放对应的菜单   首先需要判断下有没有被角色给设为默认子系统了
		if (!isDelete) {
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("有角色已经将此子系统设为默认子系统了, 不能删除！");
			return result;
		}
		return "{\"success\":true}";
    }
}
