package com.cnpiecsb.system.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.cnpiecsb.system.entity.Warning;
import com.cnpiecsb.system.service.WarningService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/system")
public class WarningController extends ZtbkServiceController {
	@Resource(name="warningService")
	private WarningService warningService;
	
	/**
	 * 获得当前用户的所有预警信息
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/getWarningList")
	@ResponseBody
	public Object getWarningList(HttpSession httpSession){
		User user = (User) httpSession.getAttribute("user");	
		
		List<Warning> warningList = warningService.getWarningByAccount(user.getJob_no());
		return warningList;
	}
	
	/**
	 * 进入预警详细列表界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/toDetail")
    public ModelAndView toDetail(HttpSession httpSession, HttpServletRequest request) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/warningDetail");
        
        this.setQueryId(Integer.parseInt(request.getParameter("queryId")));  // 设置查询id, 必须设置
        
        Map<String,Object> postData=new HashMap<>();
		postData.put("query_id", Integer.parseInt(request.getParameter("queryId")));
        
        Map<String, Object> oneQuery = baseService.getOneQuery(8800099, postData);
        
        mv.addObject("description", oneQuery.get("Description").toString());
        
        String tableHeader = this.getTableHeader(httpSession, new GridHeadConfig(this.getQueryId(), true, false, false, true));
		mv.addObject("tableHeader", tableHeader);
        return mv;
    }
	
	/**
	 * 获取预警详细信息列表数据, 分页显示
	 * 
	 * @param postData
	 * @return
	 */
	@RequestMapping(value="/getDetailList")
	@ResponseBody
	public Object getDetailList(HttpSession httpSession, @RequestBody Map postData){
		User user = (User) httpSession.getAttribute("user");	
		// 加入当前账号名
		postData.put("account", user.getAccount());
		return this.getTableDataList(postData, this.getQueryId());
	}
	
	//-------------- 以下跟预警授权相关的方法         -------------------------------//
	
	/**
	 * 进入用户配置界面
	 * 
	 * @return
	 */
	@RequestMapping(value="/warningManage")
    public ModelAndView warningManage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/warningManage");
        
        Map<String,Object> postData=new HashMap<>();
		postData.put("table_id", request.getParameter("wariningId")==null?"0":request.getParameter("wariningId"));
        
        Map<String, Object> oneQuery = baseService.getOneQuery(8800099, postData);
        if(oneQuery!=null){
        	mv.addObject("description", oneQuery.get("Description").toString());
        }
        return mv;
    }
	
	/**
	 * 获得所有的预警信息
	 * 
	 * @return
	 */
	@RequestMapping(value="/getAllWarning")
	@ResponseBody
	public Object getAllWarning(){
		List<Warning> allWarning = warningService.getAllWarning();
		return allWarning;
	}
	
	/**
	 * 获得某个预警id的所有已配置账号列表
	 * 
	 * @param tableId
	 * @return
	 */
	@RequestMapping(value="/getWarningAccount")
	@ResponseBody
	public Object getWarningAccount(@RequestParam int tableId){
		List<String> accounts = warningService.getWarningAccount(tableId);  // tableId为前台的预警id
		return accounts;
	}
	
	/**
	 * 提交某预警的配置账号
	 * 
	 * @param request
	 * @param accounts
	 * @return
	 */
	@RequestMapping(value="/commitWarningAccount")
	@ResponseBody
	public Object commitWarningAccount(HttpServletRequest request,@RequestParam(required = false) String[] accounts){
		int tableId = Integer.parseInt(request.getParameter("tableId"));  // 传入的预警id
		List<String> accounts_list = new ArrayList<String>();
		if (accounts != null)
			accounts_list = Arrays.asList(accounts);
		
		warningService.doCommitWarningAccount(tableId, accounts_list);
		return "{\"success\":true}";
	}
	
	/**
	 * 删除某账户的配置预警
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/deleteWarningAccount")
	@ResponseBody
	public Object deleteWarningAccount(@RequestParam(required = false) Map map){
		warningService.deleteWarningTableAndAccount(map);
		return "{\"success\":true}";
	}
	
	/**
	 * 刷新预警数据操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/refreshControl")
	@ResponseBody
    public Object refreshControl(@RequestParam Map postData,HttpSession httpSession){
		
		// 加入sp的名称
		postData.put("spName", "sp_get_menu_count");
		
		int code = baseService.doCallSp(postData, null, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
}
