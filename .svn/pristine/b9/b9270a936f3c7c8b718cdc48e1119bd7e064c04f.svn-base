package com.cnpiecsb.fc.despositFinance.controller;

import java.util.HashMap;
import java.util.List;
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
 * 费用管理页面
 */
@Controller
@RequestMapping("/fc/depositFinance")
public class FreeManagement extends BaseServiceController{
	
	//费用部分查询
	private int feeManagementSearchQueryId = 8740001;
	//费用明细查询
	private int feeManagementDetailSearchQueryId = 8740002;
	//冲销金额计算
	private int fdDepositFeeSearchQueryId = 8740004;
	private GridHeadConfig feeManagementSearchQueryHeadConfig;
	private GridHeadConfig feeManagementDetailSearchQueryHeadConfig;
	
	public FreeManagement(){
		feeManagementSearchQueryHeadConfig = new GridHeadConfig(feeManagementSearchQueryId,true,false,true,false);
		feeManagementSearchQueryHeadConfig.setOperatorWidth(180);
		feeManagementDetailSearchQueryHeadConfig = new GridHeadConfig(feeManagementDetailSearchQueryId,true,false,false,false);
	}
	
	/**
	 * 进入费用管理页面
	 */
	@RequestMapping(value="/freeManagement")
    public ModelAndView freeManagement(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeManagementSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", feeManagementSearchQueryId);
        mv.setViewName("fc/depositFreeManagement/freeManagementPage");
        
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
	 * 获得费用管理页面信息
	 * @return
	 */
	@RequestMapping(value="/getFreeManagementList")
	@ResponseBody
	public Object getFreeManagementList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		Map<String,Object> map=this.getTableDataList(postData,feeManagementSearchQueryId);
		return map;
	}
	
	/**
	 * 进入费用管理详情页面
	 */
	@RequestMapping(value="/toFreeManagementDetailPage")
    public ModelAndView toFreeManagementDetailPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeManagementDetailSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", feeManagementDetailSearchQueryId);
		String fe_id=request.getParameter("fe_id");
		mv.addObject("fe_id", fe_id);
        mv.setViewName("fc/depositFreeManagement/freeManagementDetailPage");
        return mv;
    }
	
	/**
	 * 获得费用管理页面信息
	 * @return
	 */
	@RequestMapping(value="/getFreeManagementDetailList")
	@ResponseBody
	public Object getFreeManagementDetailList(@RequestBody Map postData) {
		Map<String,Object> map=this.getTableDataList(postData,feeManagementDetailSearchQueryId);
		return map;
	}
	
	
	
	/**
	 * 进入提醒页面
	 */
	@RequestMapping(value="/toFreeRemindManagementPage")
	public ModelAndView toFreeRemindManagementPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeManagementDetailSearchQueryHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", feeManagementDetailSearchQueryId);
		String fe_id=request.getParameter("fe_id");
		Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("fe_id", fe_id);
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		Map<String, Object> oneQuery = baseService.getOneQuery(feeManagementSearchQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("fe_id", fe_id);
		mv.setViewName("fc/depositFreeManagement/freeRemindManagementPage");
		return mv;
	}
	
	/**
	 * 设置提醒
	 * @return
	 */
	@RequestMapping(value="/toSetRemind")
	@ResponseBody
	public Object toSetRemind(@RequestParam Map postData) {
		// 加入sp的名称
		postData.put("spName","fc_deposit_finance_fee_recycle_remind");
		
		String paramNames[] = {"fe_id","fee_type","is_reminder","return_reminder_date"};
		
		int code=baseService.doCallSp(postData, paramNames,null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	 * 进入设置发票号页面
	 */
	@RequestMapping(value="/toSettoInvoicePage")
    public ModelAndView toSettoInvoicePage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeManagementDetailSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", feeManagementDetailSearchQueryId);
		String fe_id=request.getParameter("fe_id");
        Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("fe_id", fe_id);
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
        Map<String, Object> oneQuery = baseService.getOneQuery(feeManagementSearchQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("fe_id", fe_id);
        mv.setViewName("fc/depositFreeManagement/setInvoicePage");
        return mv;
    }
	
	/**
	 * 修改发票信息
	 * @return
	 */
	@RequestMapping(value="/toEditInvoice")
	@ResponseBody
	public Object toEditInvoice(@RequestParam Map postData) {
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_finance_fee_invoice_no_update");
						
		String paramNames[] = {"fe_id","invoice_no"};
						
		int code=baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	 * 进入归还新增页面
	 */
	@RequestMapping(value="/toFreeRecycleManagementPage")
    public ModelAndView toFreeRecycleManagementPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeManagementDetailSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", feeManagementDetailSearchQueryId);
		String fe_id=request.getParameter("fe_id");
        Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("fe_id", fe_id);
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
        Map<String, Object> oneQuery = baseService.getOneQuery(feeManagementSearchQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("fe_id", fe_id);
        mv.setViewName("fc/depositFreeManagement/freeRecycleManagementPage");
        return mv;
    }
	
	/**
	 * 归还新增
	 * @return
	 */
	@RequestMapping(value="/toFreeRecycleDeal")
	@ResponseBody
	public Object toFreeRecycleDeal(@RequestParam Map postData,HttpSession session) {
		User user=(User)session.getAttribute("user");
		
		//Map<String,Object> map=this.getTableDataList(postData,financeFeeManagementSearchQueryId);
		 
		postData.put("input_man",user.getAccount());
		// 加入sp的名称
		postData.put("spName", "fc_deposit_finance_fee_recycle");
					
		String paramNames[] = {"td_id","fe_id","fee_type","income_fee","memo","input_man","payment_no"};
		
		String returnNames[] = {"new_fe_id"};
				
		int code=baseService.doCallSp(postData, paramNames,returnNames);
			
		if (code != 0) {
			return this.getAjaxResult(code);
		}
			
		return "{\"success\":true}";
	}
	
	/**
	 * 撤销回收
	 * @return
	 */
	@RequestMapping(value="/toRecycleCancel")
	@ResponseBody
	public Object toRecycleCancel(@RequestParam Map postData,HttpSession session) {
		//获得添加当前删除人
		User user=(User)session.getAttribute("user");
				
		postData.put("operate_man",user.getAccount());
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_finance_fee_recycle_cancel");
				
		String paramNames[] = {"fe_id","operate_man"};
		
				
		int code=baseService.doCallSp(postData, paramNames,null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	 * 进入冲销新增页面
	 */
	@RequestMapping(value="/toFeeReverseManagementPage")
    public ModelAndView toFeeReverseManagementPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
        User user=(User)httpSession.getAttribute("user");
		String account= user.getAccount();
		String userName= user.getUserName();
		//权限控制
		Role role=(Role)httpSession.getAttribute("defaultRole");
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
        String td_id=request.getParameter("td_id");
        String fe_id=request.getParameter("fe_id");
        String bids_project=request.getParameter("bids_project");
        mv.addObject("td_id", td_id);
        mv.addObject("fe_id", fe_id);
        mv.addObject("bids_project", bids_project);
        mv.setViewName("fc/depositFreeManagement/feeReverseManagementPage");
        return mv;
    }
	
	/**
	 * 通过fd_id获得剩余金额
	 * 
	 * @param directoryId
	 * @return
	 */
	@RequestMapping(value="/getTdDepositFeeByFd")
	@ResponseBody
	public Object getTdDepositFeeByFd(@RequestParam String fe_id){
		Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("fe_id", fe_id);
		Map<String, Object> oneQuery = this.getTableDataList(postData,fdDepositFeeSearchQueryId);
		return oneQuery;
	}
	
	/**
	 * 新增冲销付款信息
	 * @return
	 */
	@RequestMapping(value="/saveFeeCXApplyInformation")
	@ResponseBody
	public Object saveFeeCXApplyInformation(@RequestParam Map postData) {
		
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

}
