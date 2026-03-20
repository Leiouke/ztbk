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
 * 付款审批页面
 * 
 * select * from v_it_system_userrole where account in (
select account from it_system_user where password = '011c945f30ce2cbafc452f39840f025693339c42'
) order by dep_org_code
 */
@Controller
@RequestMapping("/fc/depositFinance")
public class FreeApprove extends BaseServiceController{
	
	private int feeApproveSearchQueryId = 8730003;
	private GridHeadConfig feeApproveSearchQueryHeadConfig;
	
	public FreeApprove(){
		feeApproveSearchQueryHeadConfig = new GridHeadConfig(feeApproveSearchQueryId,true,false,true,false);
		feeApproveSearchQueryHeadConfig.setOperatorWidth(80);
	}
	
	/**
	 * 进入付款审批页面
	 */
	@RequestMapping(value="/freeApproveManage")
    public ModelAndView freeApproveManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,feeApproveSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", feeApproveSearchQueryId);
        mv.setViewName("fc/depositFeeApprove/depositFeeApproveManage");
        
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
	@RequestMapping(value="/getFeeApproveManageList")
	@ResponseBody
	public Object getFeeApproveManageList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		User user=(User)session.getAttribute("user");
		postData.put("approval_account", user.getAccount());
		Map<String,Object> map=this.getTableDataList(postData,feeApproveSearchQueryId);
		return map;
	}
	
	/**
	 * 进入审核页面
	 */
	@RequestMapping(value="/toFreeApproveDealPage")
	public ModelAndView toFreeApproveDealPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String pr_id=request.getParameter("pr_id");
		String flow_id=request.getParameter("flow_id");
		mv.addObject("pr_id", pr_id);
		mv.addObject("flow_id",flow_id);
		mv.setViewName("fc/depositFeeApprove/depositFeeApproveDealPage");
		return mv;
	}
	
	

	/**
	 * 审批审核
	 * @return
	 */
	@RequestMapping(value="/toFreeApproveDeal")
	@ResponseBody
	public Object toFreeApproveDealFirst(@RequestParam Map postData,HttpSession session) {
		
		// 加入sp的名称
		postData.put("spName", "fc_process_approval_operate");
						
		String paramNames[] = {"account","bill_code","flow_id","audit_status","audit_memo"};
				
		User user=(User)session.getAttribute("user");
		postData.put("account", user.getAccount());
						
		int code=baseService.doCallSp(postData, paramNames,null);
						
		if (code != 0) {
			return this.getAjaxResult(code);
		}
				
		return "{\"success\":true}";
	}

}
