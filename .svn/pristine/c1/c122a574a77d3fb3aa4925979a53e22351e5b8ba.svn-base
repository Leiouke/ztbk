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

import com.cnpiecsb.common.util.GuidUtil;
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 发票核验界面
 */
@Controller
@RequestMapping("/fc/declare")
public class TaxbackInvoiceAuditController extends BaseServiceController{
	
	private int declareInvoiceAuditSearchQueryId = 8001029;  //报关单发票核验查询
	private GridHeadConfig declareInvoiceAuditSearchQueryHeadConfig; 
	
	private int declareInvoiceSearchQueryId = 8001028;  //报关单发票查询
	
	private int taxbackItemSearchQueryId = 8001041;  //发票明细临时表查询
	private GridHeadConfig taxbackItemSearchQueryHeadConfig;
	
	
	public TaxbackInvoiceAuditController(){
		declareInvoiceAuditSearchQueryHeadConfig = new GridHeadConfig(declareInvoiceAuditSearchQueryId,true,false,true,false);
		declareInvoiceAuditSearchQueryHeadConfig.setOperatorWidth(120);
		taxbackItemSearchQueryHeadConfig = new GridHeadConfig(taxbackItemSearchQueryId,true,false,false,false);
	}
	
	/**
	 * 进入发票核验界面
	 */
	@RequestMapping(value="/declareInvoiceAuditManage")
    public ModelAndView declareInvoiceAuditManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,declareInvoiceAuditSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", declareInvoiceAuditSearchQueryId);
        mv.setViewName("fc/declareInvoiceAudit/declareInvoiceAuditManage");
        return mv;
    }
	
	/**
	 * 获得发票核验界面信息
	 * @return
	 */
	@RequestMapping(value="/getDeclareInvoiceAuditList")
	@ResponseBody
	public Object getDeclareInvoiceAuditList(@RequestBody Map postData,HttpSession session) {
		Map<String,Object> map=this.getTableDataList(postData,declareInvoiceAuditSearchQueryId);
		return map;
	}
	
	
	/**
	 * 进入详情和核验页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toDeclareInvoiceAuditDetail",method=RequestMethod.GET)
    public ModelAndView toDeclareInvoiceAuditDetail(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(declareInvoiceSearchQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("is_detail", (String)postData.get("is_detail"));
		mv.addObject("dcl_id", (String)postData.get("dcl_id"));
        mv.setViewName("fc/declareInvoiceAudit/declareInvoiceAuditDetail");
        
        // 假如 是应收发票, 放结算单明细
        String tableHeader = this.getTableHeader(httpSession,taxbackItemSearchQueryHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
	    mv.addObject("queryId", taxbackItemSearchQueryId);
		
        return mv;
    }
	
	/**
	 * 获得退税发票明细数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getTaxbackInvoiceAuditItemList")
	@ResponseBody
	public Object getTaxbackInvoiceAuditItemList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,taxbackItemSearchQueryId);
	}
	
	/**
	 * 核验操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/auditInvoice")
	@ResponseBody
	public Object auditInvoice(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id","role","audit_result","audit_code","audit_name"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_invoice_audit");
		
		User user=(User)httpSession.getAttribute("user");
		Role role=(Role)httpSession.getAttribute("defaultRole");
		postData.put("audit_code", user.getAccount());
		postData.put("audit_name", user.getUserName());
		postData.put("role", role.getApprove_role());
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}

}
