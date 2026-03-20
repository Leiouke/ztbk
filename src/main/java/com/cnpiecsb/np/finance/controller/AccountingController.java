package com.cnpiecsb.np.finance.controller;

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
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 成本核算、利润率估算相关的控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np")
public class AccountingController extends ZtbkServiceController {
	// 成本核算管理查询
	private int costAccountingManageQueryId = 5110020;	
	private GridHeadConfig costAccountingManageQueryHeadConfig;
	
	// 单条成本核算
	private int costAccountingOneQueryId = 5110020;	
	
	// 利润率估算管理查询
	private int profitRateAccountingManageQueryId = 5110021;	
	private GridHeadConfig profitRateAccountingManageQueryHeadConfig;
	
	// 利润率估算明细查询
	private int profitRateAccountingItemQueryId = 5110022;	
	private GridHeadConfig profitRateAccountingItemQueryHeadConfig;
	
	public AccountingController(){
		costAccountingManageQueryHeadConfig = new GridHeadConfig(costAccountingManageQueryId,true,false,true,false);
		
		profitRateAccountingManageQueryHeadConfig = new GridHeadConfig(profitRateAccountingManageQueryId,true,false,true,false);
		
		profitRateAccountingItemQueryHeadConfig = new GridHeadConfig(profitRateAccountingItemQueryId,true,false,false,false);
	}
	
	/**
	 * 成本核算查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/costAccountingManage", method=RequestMethod.GET)
    public ModelAndView costAccountingManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/accounting/costAccountingManage");
        String tableHeader = this.getTableHeader(httpSession,costAccountingManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", costAccountingManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-成本核算
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getCostAccountingManageList")
	@ResponseBody
	public Object getCostAccountingManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,costAccountingManageQueryId);
	}
	
	/**
	 * 同步成本核算
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/syncCostAccounting")
	@ResponseBody
    public Object syncCostAccounting(@RequestParam Map postData){
		// 加入sp的名称
		postData.put("spName", "u_np_cost_accounting_add");
				
		int code = baseService.doCallSp(postData, null, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 成本修改界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/toCostAccountingEdit", method=RequestMethod.GET)
    public ModelAndView toCostAccountingEdit(HttpSession httpSession,@RequestParam Map postData) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/accounting/costAccountingEdit");
        
        // 单记录查询
     	Map<String, Object> oneQuery = baseService.getOneQuery(costAccountingOneQueryId, postData);
     	mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        return mv;
    }
	
	/**
	 * 修改成本操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editCostAccounting")
	@ResponseBody
    public Object editCostAccounting(@RequestParam Map postData,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		// 入参, 注意按照顺序
		String paramNames[] = {"inc_id","money_type", "stock_cost", "exchange_rate", "rmb_cost", "o_id_input"};
		// 加入sp的名称
		postData.put("spName", "u_np_cost_accounting_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 利润率估算查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/profitRateAccountingManage", method=RequestMethod.GET)
    public ModelAndView profitRateAccountingManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/accounting/profitRateAccountingManage");
        String tableHeader = this.getTableHeader(httpSession,profitRateAccountingManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", profitRateAccountingManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-利润率估算
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getProfitRateAccountingManageList")
	@ResponseBody
	public Object getProfitRateAccountingManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,profitRateAccountingManageQueryId);
	}
	
	/**
	 * 利润率估算新增界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/toProfitRateAccountingAdd", method=RequestMethod.GET)
    public ModelAndView toProfitRateAccountingAdd(HttpSession httpSession,@RequestParam Map postData) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/accounting/profitRateAccountingAdd");
        return mv;
    }
	
	/**
	 * 新增利润率估算报表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addProfitRateAccounting")
	@ResponseBody
    public Object addProfitRateAccounting(@RequestParam Map postData,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input","start_date", "end_date"};
		
		String returnNames[] = {"estimate_no"};
		// 加入sp的名称
		postData.put("spName", "u_np_estimate_new");
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 利润率估算明细查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/profitRateAccountingItem", method=RequestMethod.GET)
    public ModelAndView profitRateAccountingItem(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/accounting/profitRateAccountingItem");
        String tableHeader = this.getTableHeader(httpSession,profitRateAccountingItemQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", profitRateAccountingItemQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-利润率估算
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getProfitRateAccountingItemList")
	@ResponseBody
	public Object getProfitRateAccountingItemList(@RequestBody Map postData){
		return this.getTableDataList(postData,profitRateAccountingItemQueryId);
	}
}
