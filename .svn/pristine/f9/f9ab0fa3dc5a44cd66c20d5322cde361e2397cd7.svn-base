package com.cnpiecsb.system.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/system")
public class RoleMenuController extends ZtbkServiceController {
	
	private int roleMenuQueryId = 1000033;	
	private GridHeadConfig roleMenuGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public RoleMenuController(){
		roleMenuGridHeadConfig = new GridHeadConfig(roleMenuQueryId,true,true,false,false);
	}
	
	/**
	 * 进入增加角色菜单界面
	 * 
	 * @return
	 */
	@RequestMapping(value="/menuRoleAdd",method=RequestMethod.GET)
    public ModelAndView menuRoleAdd(HttpServletRequest request,HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        
        String tableHeader = this.getTableHeader(httpSession,roleMenuGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", roleMenuQueryId);
        
        int id = Integer.parseInt(request.getParameter("id"));
        mv.addObject("id", id);
        mv.setViewName("system/menuRoleAdd");
        return mv;
    }
	
	/**
	 * 获得应收结算单数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getMenuRoleAdd")
	@ResponseBody
	public Object getMenuRoleAdd(@RequestBody Map postData, HttpSession httpSession) {
		
		return this.getTableDataList(postData, roleMenuQueryId);
	}
	
	/**
	 * 授权操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addMenuRole")
	@ResponseBody
    public Object addMenuRole(@RequestParam Map postData,HttpServletRequest request,HttpSession httpSession){
		String[] role_ids=request.getParameterValues("role_ids");
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		if(role_ids !=null && role_ids.length>0){
			for(int i=0;i < role_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"role_id","menu_id"};
				// 加入sp的名称
				postData.put("spName", "it_system_menu_role_insert");
				
				postData.put("role_id", role_ids[i]);
						
				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 取消授权操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteMenuRole")
	@ResponseBody
    public Object deleteMenuRole(@RequestParam Map postData,HttpServletRequest request,HttpSession httpSession){
		String[] ids=request.getParameterValues("ids");
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		if(ids !=null && ids.length>0){
			for(int i=0;i < ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"menu_id","id"};
				// 加入sp的名称
				postData.put("spName", "it_system_menu_role_delete");
				
				postData.put("id", ids[i]);
						
				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}
		return "{\"success\":true}";
    }

}
