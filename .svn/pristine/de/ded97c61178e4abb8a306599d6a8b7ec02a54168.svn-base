package com.cnpiecsb.system.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/system")
public class NewWarningController extends ZtbkServiceController {
	// 预警查询
	private int warningAccountManageQueryId = 1020001;	
	private GridHeadConfig warningAccountManageHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public NewWarningController(){
		warningAccountManageHeadConfig = new GridHeadConfig(warningAccountManageQueryId,true,false,false,false);
	}
	
	/**
	 * 预警查询界面
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/warningAccountManage",method=RequestMethod.GET)
    public ModelAndView warningAccountManage(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("system/warningAccountManage");
        
        String tableHeader = this.getTableHeader(httpSession,warningAccountManageHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", warningAccountManageQueryId);
		
        return mv;
    }
	
	/**
	 * 获得动态列表数据-预警信息
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getWarningAccountManageList")
	@ResponseBody
	public Object getWarningAccountManageList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData, warningAccountManageQueryId);
	}
}
