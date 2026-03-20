package com.cnpiecsb.fc.despositFinance.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 申请付款页面
 */
@Controller
@RequestMapping("/fc/depositFinance")
public class FeeApply extends BaseServiceController{
	
	private int feeApplySearchQueryId = 8730001;  //付款页面查询
	private int tdBankSearchQueryId = 8730002;    //投标银行查询
	private int tdDepositFeeSearchQueryId = 8730004; //剩余保证金查询
	private GridHeadConfig feeApplySearchQueryHeadConfig;
	
	public FeeApply(){
		feeApplySearchQueryHeadConfig = new GridHeadConfig(feeApplySearchQueryId,true,false,true,false);
		feeApplySearchQueryHeadConfig.setOperatorWidth(120);
	}
	
	/**
	 * 进入申请付款页面
	 */
	@RequestMapping(value="/feeApplyManage")
    public ModelAndView feeApplyManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeApplySearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", feeApplySearchQueryId);
        mv.setViewName("fc/depositFeeApply/feeApplyManage");
        
        Role role=(Role)httpSession.getAttribute("defaultRole");
		String dep_org_code = "";
		String dep_org_name = "";
		if(role != null){
			dep_org_code = role.getDep_org_code();;
			dep_org_name = role.getDep_org_name();
		}
        mv.addObject("dep_org_code", dep_org_code);
        mv.addObject("dep_org_name", dep_org_name);
        return mv;
    }
	
	/**
	 * 获得申请付款页面信息
	 * @return
	 */
	@RequestMapping(value="/getFeeApplyManageList")
	@ResponseBody
	public Object getFeeApplyManageList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		Map<String,Object> map=this.getTableDataList(postData,feeApplySearchQueryId);
		return map;
	}
	
	/**
	 * 新增申请付款页面
	 */
	@RequestMapping(value="/toAddFeeApplyPage")
    public ModelAndView toAddFeeApplyPage(HttpSession session) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/depositFeeApply/addFeeApplyManage");
        User user=(User)session.getAttribute("user");
		String account= user.getAccount();
		String userName= user.getUserName();
		//权限控制
		Role role=(Role)session.getAttribute("defaultRole");
		String dep_org_code = "";
		String dep_org_name = "";
		if(role != null){
			dep_org_code = role.getDep_org_code();
			dep_org_name = role.getDep_org_name();
		}
		mv.addObject("account", account);
        mv.addObject("userName", userName);
        mv.addObject("dep_org_code", dep_org_code);
        mv.addObject("dep_org_name", dep_org_name);
        return mv;
    }
	
	/**
	 * 通过投标号获得银行
	 * 
	 * @param directoryId
	 * @return
	 */
	@RequestMapping(value="/getTdBankList")
	@ResponseBody
	public Object getTdBankList(@RequestParam String td_id){
		Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("td_id", td_id);
		Map<String, Object> oneQuery = this.getTableDataList(postData,tdBankSearchQueryId);
		
		return oneQuery;
	}
	
	/**
	 * 通过投标号获得剩余保证金
	 * 
	 * @param directoryId
	 * @return
	 */
	@RequestMapping(value="/getTdDepositFee")
	@ResponseBody
	public Object getTdDepositFee(@RequestParam String td_id){
		Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("td_id", td_id);
		Map<String, Object> oneQuery = this.getTableDataList(postData,tdDepositFeeSearchQueryId);
		return oneQuery;
	}
	
	/**
	 * 通过银行获得账号
	 * 
	 * @param directoryId
	 * @return
	 */
	@RequestMapping(value="/getTdBankAccountList")
	@ResponseBody
	public Object getTdBankAccountList(@RequestParam String f_account,@RequestParam String td_id){
		Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("f_account", f_account);
		postData.put("td_id", td_id);
		Map<String, Object> oneQuery = this.getTableDataList(postData,tdBankSearchQueryId);
		return oneQuery;
	}
	
	/**
	 * 新增申请付款信息
	 * @return
	 */
	@RequestMapping(value="/saveFeeApplyInformation")
	@ResponseBody
	public Object saveFeeApplyInformation(@RequestParam Map postData) {
		
		postData.put("fe_id","");
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_finance_fee_apply");
				
		String paramNames[] = {"td_id","fee_type","is_rebate","f_bank","f_account","payment_fee", 
				"apply_man","apply_dep_org_code","memo","fe_id"};
		
		String returnNames[] = {"pr_id"};
		
		int code=baseService.doCallSp(postData, paramNames,returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	 * 删除申请付款信息
	 * @return
	 */
	@RequestMapping(value="/toDeleteFeeApply")
	@ResponseBody
	public Object toDeleteFeeApply(@RequestParam Map postData,HttpSession session) {
		
		//获得添加当前删除人
		User user=(User)session.getAttribute("user");
				
		postData.put("operate_man",user.getAccount());
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_finance_fee_apply_delete");
				
		String paramNames[] = {"pr_id","operate_man"};
		
				
		int code=baseService.doCallSp(postData, paramNames,null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	 * 确认提交申请付款信息（财务系统暂未对接，所以提交完后直接审批完成）
	 * @return
	 */
	@RequestMapping(value="/toCommitFeeApply")
	@ResponseBody
	public Object toCommitFeeApply(@RequestParam Map postData,HttpSession httpSession) {
		
		// 加入sp的名称
		postData.put("spName", "fc_process_approval_operate");
				
		String paramNames[] = {"account","bill_code","flow_id","audit_status","audit_memo"};
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("account", user.getAccount());
		postData.put("audit_status", "0"); //初次提交传0
		postData.put("audit_memo", "");
				
		int code=baseService.doCallSp(postData, paramNames,null);
				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}

}
