package com.cnpiecsb.fc.basic.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
public class FcFactoryBankController extends BaseServiceController {
//	private int bankSearchQueryId = 5000003;
	
	private int factoryBankQueryId = 8000009;
	
//	private int factoryBankQueryId = 5000008;
	
	/**
	 * 获得动态列表数据-银行信息-搜索自动补全
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFBankListSearch")
	@ResponseBody
	public Object getContactListSearch(@RequestParam Map postData){
		return this.getTableDataList(postData, factoryBankQueryId);
	}
	
	/**
	 * 获得动态列表数据-银行账号-客户
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryBankList")
	@ResponseBody
	public Object getFactoryBankList(@RequestBody Map postData){
		return this.getTableDataList(postData, factoryBankQueryId);
	}
	
//	/**
//	 * 获得动态列表数据-银行账号-货源
//	 * 
//	 * param postData
//	 * return
//	 */
//	@RequestMapping(value="/getFactoryBankList")
//	@ResponseBody
//	public Object getFactoryBankList(@RequestBody Map postData){
//		return this.getTableDataList(postData, factoryBankQueryId);
//	}
	
	/**
	 * 新增客户银行
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addFactoryBank")
	@ResponseBody
    public Object addFactoryBank(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"f_id","f_companyName","f_companyAddress",
				"f_companyPhone","f_bank","f_account","f_default","memo", "swift_code"};	
		// 加入sp的名称
		postData.put("spName", "fc_basic_factory_bank_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 修改操作 银行
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editFactoryBank")
	@ResponseBody
    public Object editFactoryBank(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"id","f_companyName","f_companyAddress",
				"f_companyPhone","f_bank","f_account","f_default","memo", "swift_code"};	
		// 加入sp的名称
		postData.put("spName", "fc_basic_factory_bank_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 删除操作 银行
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFactoryBank")
	@ResponseBody
    public Object deleteFactoryBank(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"id"};
		// 加入sp的名称
		postData.put("spName", "fc_basic_factory_bank_delete");
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
     * 进入货源开票信息编辑界面
     * 
     * @param postData
     * @param httpSession
     * @return
     * @throws JsonProcessingException
     */
	@RequestMapping(value="/toFactoryBankEdit",method=RequestMethod.GET)
    public ModelAndView toFactoryBankEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException {  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(factoryBankQueryId, postData);
		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("fc/basic/factoryBankEdit");
		
        return mv;
    }
}
