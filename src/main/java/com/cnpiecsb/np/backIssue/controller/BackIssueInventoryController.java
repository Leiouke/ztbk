package com.cnpiecsb.np.backIssue.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/np/backIssue")
public class BackIssueInventoryController extends ZtbkServiceController{
	private int backIssueInventoryQueryQueryId = 6420001;
	private GridHeadConfig backIssueInventoryQueryGridHeadConfig;
	
	private int backIssueInventoryLogQueryQueryId = 6420002;
	private GridHeadConfig backIssueInventoryLogQueryGridHeadConfig;	
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public BackIssueInventoryController(){
		backIssueInventoryQueryGridHeadConfig = new GridHeadConfig(backIssueInventoryQueryQueryId,true,false,false,false);
		backIssueInventoryLogQueryGridHeadConfig =new GridHeadConfig(backIssueInventoryLogQueryQueryId,true,false,false,false);
	}
	
	/**
	 * 过刊库存查询
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/backIssueInventoryQuery",method=RequestMethod.GET)
    public ModelAndView backIssueInventoryQuery(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/backIssue/inventoryQuery");
        String tableHeader = this.getTableHeader(httpSession, backIssueInventoryQueryGridHeadConfig);
		mv.addObject("tableHeader_sum", tableHeader);
		mv.addObject("queryId_sum", backIssueInventoryQueryQueryId);
		
		String tableHeader_log = this.getTableHeader(httpSession, backIssueInventoryLogQueryGridHeadConfig);
		mv.addObject("tableHeader_log", tableHeader_log);
		mv.addObject("queryId_log", backIssueInventoryLogQueryQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-过刊库存查询
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getBackIssueQueryList")
	@ResponseBody
	public Object getInventoryFactoryQueryList(@RequestBody Map postData){
		return this.getTableDataList(postData, backIssueInventoryQueryQueryId);
	}
	
	/**
	 * 获得动态列表数据-过刊库存台账
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getBackIssueLogQueryList")
	@ResponseBody
	public Object getBackIssueLogQueryList(@RequestBody Map postData){
		return this.getTableDataList(postData, backIssueInventoryLogQueryQueryId);
	}
}