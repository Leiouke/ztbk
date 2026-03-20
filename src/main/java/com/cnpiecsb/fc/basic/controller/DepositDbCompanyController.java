package com.cnpiecsb.fc.basic.controller;

import java.sql.SQLException;
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
/*
 * 招标单位银行页面 2022-08-29 by zc
 * */
@Controller
@RequestMapping("/fc/basic")
public class DepositDbCompanyController extends BaseServiceController{
	
	private int DepositDbCompanyQueryId = 8700001;
	private GridHeadConfig DepositDbCompanyQueryHeadConfig;
	private int DepositDbBankQueryId = 8700002;
	private GridHeadConfig DepositDbBankQueryHeadConfig;

	public DepositDbCompanyController(){
		DepositDbCompanyQueryHeadConfig = new GridHeadConfig(DepositDbCompanyQueryId,true,false,true,false);
		DepositDbCompanyQueryHeadConfig.setOperatorWidth(80);
		DepositDbBankQueryHeadConfig = new GridHeadConfig(DepositDbBankQueryId,true,false,true,false);
		DepositDbBankQueryHeadConfig.setOperatorWidth(80);
	}

	/**
	 * 进入招标单位页面
	 */
	@RequestMapping(value="/depositDbCompanyManage")
    public ModelAndView depositDbCompanyManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession, DepositDbCompanyQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", DepositDbCompanyQueryId);
        mv.setViewName("fc/basicDepositCompany/depositDbCompanyManage");
      
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
	 * 获得招标单位页面信息
	 * @return
	 */
	@RequestMapping(value="/getDepositDbCompanyList")
	@ResponseBody
	public Object getDepositDbCompanyList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		Map<String,Object> map=this.getTableDataList(postData,DepositDbCompanyQueryId);
		return map;
	}
	
	/**
	 * 进入新增招标单位页面
	 */
	@RequestMapping(value="/toDepositDbCompanyNew")
    public ModelAndView toDepositDbCompanyNew(HttpSession session) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		User user=(User)session.getAttribute("user");
		String account= user.getAccount();
		String userName= user.getUserName();
		Role role=(Role)session.getAttribute("defaultRole");
		String dep_org_code = "";
		String dep_org_name = "";
		if(role != null){
			dep_org_code = role.getDep_org_code();
			dep_org_name = role.getDep_org_name();
		}
        mv.setViewName("fc/basicDepositCompany/depositDbCompanyNew");
        mv.addObject("account", account);
        mv.addObject("userName", userName);
        mv.addObject("dep_org_code", dep_org_code);
        mv.addObject("dep_org_name", dep_org_name);
        return mv;
    }
	
	/**
	 * 新增招标单位页面信息
	 * @return
	 */
	@RequestMapping(value="/saveDepositDbCompany")
	@ResponseBody
	public Object saveDepositDbCompany(@RequestParam Map postData,HttpSession session) {
		User user=(User)session.getAttribute("user");
		
		postData.put("o_id",user.getAccount());
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_basic_company_new");
				
		String paramNames[] = {"company_type","c_department","o_id","c_charge_man",
								"custom_id","c_address","contact_man","contact_phone","dep_org_code"};
		
		String returnNames[] = {"c_id"};
				
		int code=baseService.doCallSp(postData, paramNames, returnNames);
		
		return "{\"success\":true}";
	}
	
	/**
	 * 删除招标单位页面信息
	 * @return
	 */
	@RequestMapping(value="/toDeleteDepositDbCompany")
	@ResponseBody
	public Object toDeleteDepositDbCompany(@RequestParam Map postData,HttpSession session) {
		User user=(User)session.getAttribute("user");
		
		postData.put("delete_person",user.getAccount());
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_basic_company_delete");
				
		String paramNames[] = {"c_id","delete_person"};
		
				
		int code=baseService.doCallSp(postData, paramNames,null);
		
		return "{\"success\":true}";
	}
	
	/**
	 * 进入编辑招标单位页面
	 */
	@RequestMapping(value="/toUpdateDepositDbCompanyPage")
    public ModelAndView toUpdateDepositDbCompanyPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String c_id=request.getParameter("c_id");
		// 单记录查询
		Map postData = new HashMap<String,Object>();
		postData.put("c_id", c_id);
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		Map<String, Object> oneQuery = baseService.getOneQuery(DepositDbCompanyQueryId, postData);		
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("c_id", c_id);
        mv.setViewName("fc/basicDepositCompany/depositDbCompanyUpdate");
        return mv;
    }
	
	/**
	 * 编辑招标单位页面信息
	 * @return
	 */
	@RequestMapping(value="/updateDepositDbCompany")
	@ResponseBody
	public Object updateDepositDbCompany(@RequestParam Map postData,HttpSession session) {
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_basic_company_update");
				
		String paramNames[] = {"c_id","company_type","c_department","c_charge_man",
				"custom_id","c_address","contact_man","contact_phone"};
				
		int code=baseService.doCallSp(postData, paramNames, null);
		
		return "{\"success\":true}";
	}

	/**
	 * 进入银行页面
	 */
	@RequestMapping(value="/toDepositDbBankPage")
    public ModelAndView toDepositDbBankPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		String c_id=request.getParameter("c_id");
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession, DepositDbBankQueryHeadConfig);
		mv.addObject("c_id", c_id);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", DepositDbBankQueryId);
        mv.setViewName("fc/basicDepositCompany/depositDbBankManage");
        return mv;
    }
	
	/**
	 * 获得银行页面信息
	 * @return
	 */
	@RequestMapping(value="/getDepositDbBankList")
	@ResponseBody
	public Object getDepositDbBankList(@RequestBody Map postData) {
		Map<String,Object> map=this.getTableDataList(postData,DepositDbBankQueryId);
		return map;
	}
	
	/**
	 * 进入新增银行页面
	 */
	@RequestMapping(value="/toDepositDbBankNew")
    public ModelAndView toDepositDbBankNew(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String c_id=request.getParameter("c_id");
		mv.addObject("c_id", c_id);
        mv.setViewName("fc/basicDepositCompany/depositDbBankNew");
        return mv;
    }
	
	/**
	 * 新增银行页面信息
	 * @return
	 */
	@RequestMapping(value="/saveDepositDbBank")
	@ResponseBody
	public Object saveDepositDbBank(@RequestParam Map postData) {
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_basic_bank_new");
				
		String paramNames[] = {"c_id","f_companyName","f_registMark","f_companyAddress","f_companyPhone",
		          "f_bank","f_account","f_default"};
				
		int code=baseService.doCallSp(postData, paramNames, null);
		
		return "{\"success\":true}";
	}
	
	/**
	 * 删除银行页面信息
	 * @return
	 */
	@RequestMapping(value="/toDeleteDepositDbBank")
	@ResponseBody
	public Object toDeleteDepositDbBank(@RequestParam Map postData,HttpSession session) {
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_basic_bank_delete");
				
		String paramNames[] = {"id"};
		
				
		int code=baseService.doCallSp(postData, paramNames,null);
		
		return "{\"success\":true}";
	}
	
	/**
	 * 进入编辑银行页面
	 */
	@RequestMapping(value="/toUpdateDepositDbBankPage")
    public ModelAndView toUpdateDepositDbBankPage(HttpSession httpSession,HttpServletRequest request) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String id=request.getParameter("id");
		// 单记录查询
		Map postData = new HashMap<String,Object>();
		postData.put("id", id);
		Map<String, Object> oneQuery = baseService.getOneQuery(DepositDbBankQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("id", id);
        mv.setViewName("fc/basicDepositCompany/depositDbBankUpdate");
        return mv;
    }
	
	/**
	 * 编辑招标单位页面信息
	 * @return
	 */
	@RequestMapping(value="/updateDepositDbBank")
	@ResponseBody
	public Object updateDepositDbBank(@RequestParam Map postData,HttpSession session) {
		
		// 加入sp的名称
		postData.put("spName", "fc_deposit_basic_bank_update");
				
		String paramNames[] = {"id","f_companyName","f_registMark","f_companyAddress",
		          "f_companyPhone","f_bank", "f_account","f_default"};
				
		int code=baseService.doCallSp(postData, paramNames, null);
		
		return "{\"success\":true}";
	}

}
