package com.cnpiecsb.fc.declare.controller;

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
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 问题处理界面
 */
@Controller
@RequestMapping("/fc/declare")
public class TaxbackInvoiceProcessController extends BaseServiceController{
	
	private int declareInvoiceProcessSearchQueryId = 8001030;  //报关单发票问题处理查询
	private GridHeadConfig declareInvoiceProcessSearchQueryHeadConfig;
	
	public TaxbackInvoiceProcessController(){
		declareInvoiceProcessSearchQueryHeadConfig = new GridHeadConfig(declareInvoiceProcessSearchQueryId,true,false,true,false);
		declareInvoiceProcessSearchQueryHeadConfig.setOperatorWidth(80);
	}
	
	/**
	 * 进入问题处理界面
	 */
	@RequestMapping(value="/taxbackInvoiceProcessManage")
    public ModelAndView taxbackInvoiceProcessManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,declareInvoiceProcessSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", declareInvoiceProcessSearchQueryId);
        mv.setViewName("fc/declareTaxbackInvoiceProcess/taxbackInvoiceProcessManage");
        return mv;
    }
	
	/**
	 * 获得问题处理界面信息
	 * @return
	 */
	@RequestMapping(value="/getTaxbackInvoiceProcessList")
	@ResponseBody
	public Object getTaxbackInvoiceProcessList(@RequestBody Map postData,HttpSession session) {
		Map<String,Object> map=this.getTableDataList(postData,declareInvoiceProcessSearchQueryId);
		return map;
	}
	
	/**
	 * 发票处理页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toInvoiceProcessDeal",method=RequestMethod.GET)
    public ModelAndView toInvoiceProcessDeal(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
		mv.addObject("inv_id", (String)postData.get("inv_id"));
        mv.setViewName("fc/declareTaxbackInvoiceProcess/taxbackInvoiceProcessDeal");
		
        return mv;
    }
	
	/**
	 * 发票处理
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/dealInvoiceProcess")
	@ResponseBody
    public Object dealInvoiceProcess(@RequestParam Map postData,HttpSession httpSession) {	
		
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id","role","process_type","process_memo","process_code","process_name"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_invoice_process");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("process_code", user.getAccount());
		postData.put("process_name", user.getUserName());
		Role role=(Role)httpSession.getAttribute("defaultRole");
		postData.put("role", role.getApprove_role());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }

}
