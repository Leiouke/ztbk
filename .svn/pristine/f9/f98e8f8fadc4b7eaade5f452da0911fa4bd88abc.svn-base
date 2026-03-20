package com.cnpiecsb.fc.declare.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 发票业务查询界面
 */
@Controller
@RequestMapping("/fc/declare")
public class TaxbackInvoiceSearchController extends BaseServiceController{
	
	private int declareInvoiceSearchQueryId = 8001042;  //报关单发票业务查询
	private GridHeadConfig declareInvoiceAuditQueryHeadConfig; 
	
	public TaxbackInvoiceSearchController(){
		declareInvoiceAuditQueryHeadConfig = new GridHeadConfig(declareInvoiceSearchQueryId,true,false,true,false);
		declareInvoiceAuditQueryHeadConfig.setOperatorWidth(120);
	}
	
	/**
	 * 进入发票查询界面
	 */
	@RequestMapping(value="/declareInvoiceSearchManage")
    public ModelAndView declareInvoiceAuditManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,declareInvoiceAuditQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", declareInvoiceSearchQueryId);
        mv.setViewName("fc/declareInvoiceSearch/declareInvoiceSearchManage");
        return mv;
    }
	
	/**
	 * 获得发票查询界面信息
	 * @return
	 */
	@RequestMapping(value="/getDeclareInvoiceSearchList")
	@ResponseBody
	public Object getDeclareInvoiceAuditList(@RequestBody Map postData,HttpSession session) {
		Map<String,Object> map=this.getTableDataList(postData,declareInvoiceSearchQueryId);
		return map;
	}

}
