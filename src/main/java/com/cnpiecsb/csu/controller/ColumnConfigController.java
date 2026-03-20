package com.cnpiecsb.csu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.entity.DynamicColumn;
import com.cnpiecsb.csu.service.CommonConfigService;
import com.cnpiecsb.system.entity.User;

/**
 * 用户列配置控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/csu")
public class ColumnConfigController {	
	// 需要用到通用配置服务
	@Resource(name="commonConfigService")
	protected CommonConfigService commonConfigService;
	
	/**
	 * 进入用户列配置
	 * 
	 * @return
	 */
	@RequestMapping(value="/columnConfig",method=RequestMethod.GET)
    public ModelAndView columnConfig(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
        mv.setViewName("csu/columnConfig");
        mv.addObject("queryId",request.getParameter("queryId"));
        return mv;
    }
	
	/**
	 * 获得当前用户的查询grid columns
	 * 
	 * 界面上显示属性    width 列宽
	 *              title 列标签
	 *              visible 是否可见
	 *              index 排序号
	 *              
	 * 其他列都需要隐藏在界面上, 后续提交的时候将所有列(包括隐藏列)都上传上来
	 * 
	 * @param request
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/getUserColumns")
	@ResponseBody
	public Object getUserColumns(HttpServletRequest request, HttpSession httpSession){  
		// 获得当前用户
		User user = (User) httpSession.getAttribute("user");
		
		Map searchMap = new HashMap();
		searchMap.put("id", request.getParameter("queryId"));  // 传入的查询参数id
		searchMap.put("account", user.getAccount());
		
		List<DynamicColumn> columnAttribute = commonConfigService.getConfigurationColumn(searchMap);
		return columnAttribute;
	}
	
	/**
	 * 提交修改后的用户列
	 * 
	 * @param dynamicColumns
	 * @return
	 */
	@RequestMapping(value="/commitUserColumns")
	@ResponseBody
	public Object commitUserColumns(HttpServletRequest request, HttpSession httpSession, @RequestBody List<DynamicColumn> dynamicColumns){
		String queryId = request.getParameter("queryId");  // 传入的查询参数id
		
		// 获得当前用户
		User user = (User) httpSession.getAttribute("user");
		
		Map searchMap = new HashMap();
		searchMap.put("id", queryId);  
		searchMap.put("account", user.getAccount());
		commonConfigService.doCommitUserColumns(searchMap, dynamicColumns);
		return "{\"success\":true}";
	}
}
