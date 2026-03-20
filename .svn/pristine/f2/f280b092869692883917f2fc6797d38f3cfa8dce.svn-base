package com.cnpiecsb.fc.payment.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 付款查询页面
 * @author by zc 2021/12/17
 *
 */
@Controller
@RequestMapping("/fc/payment")
public class PaymentApplicationSearchController extends BaseServiceController{
	
	// 货源发票查询
	private int applicationSearchManageQueryId = 8430008;	
	private GridHeadConfig applicationSearchManageGridHeadConfig;
	
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public PaymentApplicationSearchController(){
		applicationSearchManageGridHeadConfig = new GridHeadConfig(applicationSearchManageQueryId,true,false,false,false);
		applicationSearchManageGridHeadConfig.setOperatorWidth(180);
		
	}


	/**
	 * 付款查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/applicationSearchManage", method=RequestMethod.GET)
	public ModelAndView applicationSearchManage(HttpSession httpSession) throws JsonProcessingException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("fc/paymentApplicationSearch/applicationSearchManage");
		String tableHeader = this.getTableHeader(httpSession,applicationSearchManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", applicationSearchManageQueryId);
		return mv;
	}

	/**
	 * 获得付款查询界面数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getApplicationSearchManageList")
	@ResponseBody
	public Object getApplicationSearchManageList(@RequestBody Map postData, HttpSession httpSession){
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		return this.getTableDataList(postData,applicationSearchManageQueryId);
	}

}
