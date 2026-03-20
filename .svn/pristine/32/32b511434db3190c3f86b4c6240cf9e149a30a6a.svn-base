package com.cnpiecsb.fc.despositFinance.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
/**
 * 财务费用管理页面
 */
@Controller
@RequestMapping("/fc/depositFinance")
public class FeeFinanceManagement extends BaseServiceController{
	
	private int financeFeeManagementSearchQueryId = 8740003;
	private int feeManagementDetailSearchQueryId = 8740002;
	private GridHeadConfig financeFeeManagementSearchQueryHeadConfig;
	private GridHeadConfig feeManagementDetailSearchQueryHeadConfig;
	
	public FeeFinanceManagement(){
		financeFeeManagementSearchQueryHeadConfig = new GridHeadConfig(financeFeeManagementSearchQueryId,true,false,true,false);
		financeFeeManagementSearchQueryHeadConfig.setOperatorWidth(180);
		feeManagementDetailSearchQueryHeadConfig = new GridHeadConfig(feeManagementDetailSearchQueryId,true,false,false,false);
	}
	
	/**
	 * 进入财务费用管理页面
	 */
	@RequestMapping(value="/feeFinanceManagement")
    public ModelAndView feeFinanceManagement(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,financeFeeManagementSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", financeFeeManagementSearchQueryId);
        mv.setViewName("fc/depositFeeFinanceManagement/financeFreeManagementPage");
        return mv;
    }
	
	/**
	 * 获得费用管理页面信息
	 * @return
	 */
	@RequestMapping(value="/getFinanceFreeManagementList")
	@ResponseBody
	public Object getFinanceFreeManagementList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		Map<String,Object> map=this.getTableDataList(postData,financeFeeManagementSearchQueryId);
		return map;
	}
	
	/**
	 * 进入费用管理详情页面
	 */
	@RequestMapping(value="/toFinanceFreeManagementDetailPage")
    public ModelAndView toFinanceFreeManagementDetailPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeManagementDetailSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", feeManagementDetailSearchQueryId);
		String fe_id=request.getParameter("fe_id");
		mv.addObject("fe_id", fe_id);
        mv.setViewName("fc/depositFeeFinanceManagement/financeFreeManagementDetailPage");
        return mv;
    }
	
	/**
	 * 获得费用管理页面信息
	 * @return
	 */
	@RequestMapping(value="/getFinanceFreeManagementDetailList")
	@ResponseBody
	public Object getFinanceFreeManagementDetailList(@RequestBody Map postData) {
		Map<String,Object> map=this.getTableDataList(postData,feeManagementDetailSearchQueryId);
		return map;
	}
	
	/**
	 * 进入处理页面
	 */
	@RequestMapping(value="/toFreeDealManagementPage")
	public ModelAndView toFreeDealManagementPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeManagementDetailSearchQueryHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", feeManagementDetailSearchQueryId);
		String fe_id=request.getParameter("fe_id");
		Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("fe_id", fe_id);
		//权限处理
		User user=(User)httpSession.getAttribute("user");
		Role role=(Role)httpSession.getAttribute("defaultRole");
		String account = user.getAccount();
		if(role == null){
			postData.put("account",account);
			postData.put("roleId",0);
			postData.put("dep_org_code","0");
		}else{
			int roleId = role.getRoleId();
			String dep_org_code = role.getDep_org_code();
			postData.put("account",account);
			postData.put("roleId",roleId);
			postData.put("dep_org_code",dep_org_code);
		}
		Map<String, Object> oneQuery = baseService.getOneQuery(financeFeeManagementSearchQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("fe_id", fe_id);
		mv.setViewName("fc/depositFeeFinanceManagement/freeDealManagementPage");
		return mv;
	}
	
	/**
	 * 处理按钮
	 * @return
	 */
	@RequestMapping(value="/toFeeProcess")
	@ResponseBody
	public Object toFeeProcess(@RequestParam Map postData,HttpSession session) {
		User user=(User)session.getAttribute("user");
		
		postData.put("process_man", user.getAccount());
		
		// 加入sp的名称
		postData.put("spName","fc_deposit_finance_fee_process");
		
		String paramNames[] = {"fe_id","process_man","process_time","process_memo"};
		
		int code=baseService.doCallSp(postData, paramNames,null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	 * 发票签收
	 * @return
	 */
	@RequestMapping(value="/toInvoiceSign")
	@ResponseBody
	public Object toInvoiceSign(@RequestParam Map postData) {
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_finance_fee_invoice_sign");
				
		String paramNames[] = {"fe_id"};
		
				
		int code=baseService.doCallSp(postData, paramNames,null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}

}
