package com.cnpiecsb.fc.basic.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/fc/basic")
public class FcAccountMonthController extends BaseServiceController {
	// 查询记账年月
	private int accountMonthListSearchQueryId = 8010001;
	
	// 查询未关账的最新一个年月
	private int monthCloseOneQueryId = 8010002;
	
	/**
	 * 获得动态列表数据-记账年月-搜索自动补全
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getAccountMonthSearchList")
	@ResponseBody
	public Object getAccountMonthSearchList(@RequestParam Map postData){
		String is_close = postData.get("is_close").toString();
		
		if (is_close.equals("all")) {
			postData.remove("is_close");
		}
		return this.getTableDataList(postData, accountMonthListSearchQueryId);
	}
	
	/**
	 * 月度关账界面
	 * 
	 */
	@RequestMapping(value="/closeMonthManage",method=RequestMethod.GET)
    public ModelAndView receiptManage(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/basic/monthClose");
        Map<String, Object> oneQuery = baseService.getOneQuery(monthCloseOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        return mv;
    }
	
	/**
	 * 关账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/closeMonth")
	@ResponseBody
    public Object closeMonth(@RequestParam Map postData,HttpSession httpSession){		
		
		String paramNames[] = {"close_memo"};
		// 加入sp的名称
		postData.put("spName", "fc_finance_account_month_close");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
}
