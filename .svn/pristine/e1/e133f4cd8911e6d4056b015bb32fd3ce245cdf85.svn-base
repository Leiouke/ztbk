package com.cnpiecsb.logistics.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.GuidUtil;
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/bk/logistics")
public class InventoryController extends ZtbkServiceController{

	// 库存表头查询
	private int inventoryManageSearchQueryId = 10000035;
	private GridHeadConfig inventoryManageGridHeadConfig;
		
	// 库存日志查询
	private int inventoryLogSearchQueryId = 10000036;
	private GridHeadConfig inventoryLogGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public InventoryController(){
		inventoryManageGridHeadConfig = new GridHeadConfig(inventoryManageSearchQueryId,true,false,true,false);
		
		inventoryLogGridHeadConfig = new GridHeadConfig(inventoryLogSearchQueryId,true,false,false,false);
		
	}
	
	/**
	 * 库存查询界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/inventoryManage",method=RequestMethod.GET)
    public ModelAndView inventoryManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("logistics/inventory/inventoryManage");
        String tableHeader = this.getTableHeader(httpSession, inventoryManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", inventoryManageSearchQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-库存查询
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInventoryList")
	@ResponseBody
	public Object getInventoryList(@RequestBody Map postData){
		return this.getTableDataList(postData, inventoryManageSearchQueryId);
	}
	
	/**
	 * 库存日志页面
	 * 
	 * 
	 */
	@RequestMapping(value="/inventoryLogManage",method=RequestMethod.GET)
    public ModelAndView inBoundEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();      
        
        String tableHeader = this.getTableHeader(httpSession, inventoryLogGridHeadConfig);
		
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", inventoryLogSearchQueryId);
		mv.addObject("c_id", postData.get("c_id"));
		mv.addObject("qk_id", postData.get("qk_id"));
		mv.addObject("shelf_no", postData.get("shelf_no"));
		mv.addObject("period_id", postData.get("period_id"));
        
        mv.setViewName("logistics/inventory/inventoryLogManage");
			        
        return mv;
    }
	
	/**
	 * 获得动态列表数据-库存日志查询
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInventoryLogList")
	@ResponseBody
	public Object getInventoryLogList(@RequestBody Map postData){
		return this.getTableDataList(postData, inventoryLogSearchQueryId);
	}
}
