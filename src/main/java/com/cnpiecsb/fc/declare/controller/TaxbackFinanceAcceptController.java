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
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 财务接收界面
 */
@Controller
@RequestMapping("/fc/declare")
public class TaxbackFinanceAcceptController extends BaseServiceController{
	
	private int taxbackSearchQueryId = 8001020;  //报关单查询
	private GridHeadConfig taxbackSearchQueryHeadConfig;
	
	public TaxbackFinanceAcceptController(){
		taxbackSearchQueryHeadConfig = new GridHeadConfig(taxbackSearchQueryId,true,false,true,false);
		taxbackSearchQueryHeadConfig.setOperatorWidth(180);
	}

	/**
	 * 进入财务接收界面
	 */
	@RequestMapping(value="/taxbackFinanceAcceptManage")
    public ModelAndView taxbackManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,taxbackSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", taxbackSearchQueryId);
        mv.setViewName("fc/declareTaxbackFinanceAccept/taxbackFinanceAcceptManage");
        return mv;
    }
	
	/**
	 * 获得财务接收界面信息
	 * @return
	 */
	@RequestMapping(value="/getTaxbackFinanceAcceptManageList")
	@ResponseBody
	public Object getTaxbackFinanceAcceptManageList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		Map<String,Object> map=this.getTableDataList(postData,taxbackSearchQueryId);
		return map;
	}
	
	
	/**
	* 进入接收退回界面
	* 
	* 
	*/
	@RequestMapping(value="/toDealDecalreAcceptTaxbackManage",method=RequestMethod.GET)
	public ModelAndView toDealDecalreAcceptTaxbackManage(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		//取得
		String dcl_id=(String)postData.get("dcl_id");
	    mv.setViewName("fc/declareTaxbackFinanceAccept/dealTaxbackFinanceAcceptManage");
	    mv.addObject("dcl_id", dcl_id);
	    return mv;
	}
	
	/**
	 * 接收操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/acceptTaxback")
	@ResponseBody
	public Object acceptTaxback(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"dcl_id","submit_type","role","input_code","input_name"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_submit");
		
		User user=(User)httpSession.getAttribute("user");
		Role role=(Role)httpSession.getAttribute("defaultRole");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());
		postData.put("role", role.getApprove_role());
//		postData.put("submit_type","2");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
}
