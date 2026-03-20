package com.cnpiecsb.np.bd.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.YhServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 货源对照相关控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np")
public class FactoryMappingController extends YhServiceController {
	// 货源对照查询
	private int factoryMappingManageQueryId = 5110032;	
	private GridHeadConfig factoryMappingManageQueryHeadConfig;
	
	// 货源对照匹配查询
	private int factoryMappingResultManageQueryId = 5110024;	
	private GridHeadConfig factoryMappingResultManageQueryHeadConfig;
	
	public FactoryMappingController(){
		factoryMappingManageQueryHeadConfig = new GridHeadConfig(factoryMappingManageQueryId,true,false,true,false);
		
		factoryMappingResultManageQueryHeadConfig = new GridHeadConfig(factoryMappingResultManageQueryId,true,false,false,false);
	}
	
	/**
	 * 货源对照查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/factoryMappingManage", method=RequestMethod.GET)
    public ModelAndView factoryMappingManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/factoryMapping/factoryMappingManage");
        String tableHeader = this.getTableHeader(httpSession,factoryMappingManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", factoryMappingManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-货源对照
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryMappingManageList")
	@ResponseBody
	public Object getFactoryMappingManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, factoryMappingManageQueryId);
	}
	
	/**
	 * 新增货源对照界面
	 * 
	 * 
	 */
	@RequestMapping(value="/factoryMappingAdd",method=RequestMethod.GET)
    public ModelAndView factoryMappingAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/factoryMapping/factoryMappingAdd");
        return mv;
    }
	
	/**
	 * 新增货源对照关联操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addFactoryMapping")
	@ResponseBody
    public Object addFactoryMapping(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"dh_f_id", "dh_f_department","dx_f_id","dx_f_department", "input_code", "input_name"};
		// 加入sp的名称
		postData.put("spName", "u_IT_db_factory_sitemapping_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());
		
		int code = yhService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除货源对照关联
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFactoryMapping")
	@ResponseBody
    public Object deleteSaleReport(@RequestParam Map postData, HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"inc_no", "delete_code", "delete_name"};
		// 加入sp的名称
		postData.put("spName", "u_IT_db_factory_sitemapping_del");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("delete_code", user.getAccount());
		postData.put("delete_name", user.getUserName());
				
		int code = yhService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 货源对照匹配查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/factoryMappingResultManage", method=RequestMethod.GET)
    public ModelAndView factoryMappingResultManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/factoryMapping/factoryMappingResultManage");
        String tableHeader = this.getTableHeader(httpSession,factoryMappingResultManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", factoryMappingResultManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-货源对照匹配
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryMappingResultManageList")
	@ResponseBody
	public Object getFactoryMappingResultManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, factoryMappingResultManageQueryId);
	}
}
