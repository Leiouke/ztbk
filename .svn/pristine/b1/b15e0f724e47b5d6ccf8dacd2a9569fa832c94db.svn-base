package com.cnpiecsb.np.finance.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/np")
public class ClientSurplusMoneyController extends ZtbkServiceController{
	private int clientSurplusMoneyManageQueryId = 5400005;
	private GridHeadConfig clientSurplusMoneyManageGridHeadConfig;
	
	private int clientSurplusMoneyDetailQueryId = 5400001;
	private GridHeadConfig clientSurplusMoneyDetailGridHeadConfig;
	
	private int oneClientReceiptManageQueryId = 5400002;
	private GridHeadConfig oneClientReceiptManageGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public ClientSurplusMoneyController(){
		clientSurplusMoneyManageGridHeadConfig = new GridHeadConfig(clientSurplusMoneyManageQueryId,true,false,true,false);
		clientSurplusMoneyManageGridHeadConfig.setOperatorWidth(80);
		
		clientSurplusMoneyDetailGridHeadConfig = new GridHeadConfig(clientSurplusMoneyDetailQueryId,true,false,true,false);
		clientSurplusMoneyDetailGridHeadConfig.setOperatorWidth(80);
		
		oneClientReceiptManageGridHeadConfig = new GridHeadConfig(oneClientReceiptManageQueryId,true,false,false,false);
	}
	
	@RequestMapping(value="/clientSurplusMoneyManage",method=RequestMethod.GET)
    public ModelAndView clientSurplusMoneyManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/clientSurplusMoney/clientSurplusMoneyManage");
        String tableHeader = this.getTableHeader(httpSession,clientSurplusMoneyManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", clientSurplusMoneyManageQueryId);
        return mv;
    }
	
	
	@RequestMapping(value="/getClientSurplusMoneyManageList")
	@ResponseBody
	public Object getClientSurplusMoneyManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,clientSurplusMoneyManageQueryId);
	}
	
	

	@RequestMapping(value="/clientSurplusMoneyDetail",method=RequestMethod.GET)
    public ModelAndView clientSurplusMoneyDetail(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/clientSurplusMoney/clientSurplusMoneyDetail");
        Map<String, Object> oneQuery = baseService.getOneQuery(clientSurplusMoneyManageQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        String tableHeader = this.getTableHeader(httpSession,clientSurplusMoneyDetailGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", clientSurplusMoneyDetailQueryId);
        return mv;
    }
	
	@RequestMapping(value="/getClientSurplusMoneyDetail")
	@ResponseBody
	public Object getClientSurplusMoneyDetail(@RequestBody Map postData){
		return this.getTableDataList(postData,clientSurplusMoneyDetailQueryId);
	}
	
	/**
	 * 单客户预收管理
	 * 
	 */
	@RequestMapping(value="/clientSurplusMoneyReceiptDetailMange",method=RequestMethod.GET)
    public ModelAndView clientSurplusMoneyReceiptDetailMange(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> oneQuery = baseService.getOneQuery(clientSurplusMoneyDetailQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/clientSurplusMoney/clientSurplusMoneyReceiptDetail");
        String tableHeader = this.getTableHeader(httpSession,oneClientReceiptManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", oneClientReceiptManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-单客户预收管理列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getClientSurplusMoneyReceiptDetailList")
	@ResponseBody
	public Object getClientSurplusMoneyReceiptDetailList(@RequestBody Map postData){
		return this.getTableDataList(postData,oneClientReceiptManageQueryId);
	}
}
