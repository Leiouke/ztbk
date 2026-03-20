package com.cnpiecsb.np.finance.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/np")
public class SaleAccountController extends ZtbkServiceController {
	private int saleAccountQueryId = 5100003;
	private GridHeadConfig saleAccountGridHeadConfig;
	
	// 未记账汇总
	private int notAccountSummaryQueryId = 5100004;
	private GridHeadConfig notAccountSummaryHeadConfig;
	
	// 记账月度汇总
	private int accountSummaryQueryId = 5100005;
	private GridHeadConfig accountSummaryHeadConfig;
	
	// 财务明细记账月度汇总
	private int accountPurchaseSummaryQueryId = 5100011;
	private GridHeadConfig accountPurchaseSummaryHeadConfig;
	
	// 查询记账年月
	private int accountMonthListSearchQueryId = 5100002; 
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public SaleAccountController(){
		saleAccountGridHeadConfig = new GridHeadConfig(saleAccountQueryId,true,true,false,false);
		
		notAccountSummaryHeadConfig = new GridHeadConfig(notAccountSummaryQueryId,true,false,false,false);
		
		accountSummaryHeadConfig=new GridHeadConfig(accountSummaryQueryId,true,false,false,false);
		
		accountPurchaseSummaryHeadConfig=new GridHeadConfig(accountPurchaseSummaryQueryId,true,false,false,false);
	}
	
	/**
	 * 获得动态列表数据-记账年月-搜索自动补全
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getAccountMonthSearchList")
	@ResponseBody
	public Object getAccountMonthSearchList(@RequestParam Map postData){
		return this.getTableDataList(postData, accountMonthListSearchQueryId);
	}
	
	/**
	 * 销售记账主界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleAccount",method=RequestMethod.GET)
    public ModelAndView saleAccount(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleAccount/saleAccount");
        String tableHeader = this.getTableHeader(httpSession,saleAccountGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleAccountQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售记账列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleAccountList")
	@ResponseBody
	public Object getSaleAccountList(@RequestBody Map postData){
		return this.getTableDataList(postData,saleAccountQueryId);
	}
	
	/**
	 * 未记账汇总
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/notAccountSummary",method=RequestMethod.GET)
    public ModelAndView notAccountSummary(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleAccount/notAccountSummary");
        String tableHeader = this.getTableHeader(httpSession,notAccountSummaryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", notAccountSummaryQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-未记账汇总
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getNotAccountSummaryList")
	@ResponseBody
	public Object getNotAccountSummaryList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,notAccountSummaryQueryId);
	}
	
	/**
	 * 记账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/accountSale")
	@ResponseBody
    public Object accountSale(@RequestParam Map postData,HttpServletRequest request,HttpSession httpSession){
		String[] kp_ids=request.getParameterValues("kp_ids");
		User user=(User)httpSession.getAttribute("user");
		postData.put("account_person", user.getAccount());
		if(kp_ids!=null&&kp_ids.length>0){
			for(int i=0;i<kp_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"kp_id","account_person","account_month"};
				// 加入sp的名称
				postData.put("spName", "u_finance_invoice_kp_account");
				
				postData.put("kp_id", kp_ids[i]);
						
				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
				postData.remove("paramNames");
				code = do_sp_account_item_classify(postData);
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 产生销售报表记录
	 * 
	 * @param postData
	 * @return
	 */
	private int do_sp_account_item_classify(Map postData){
		String paramNames[] = {"kp_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_invoice_kp_item_classify");
				
		return  baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 撤销记账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteSaleAccount")
	@ResponseBody
    public Object deleteSaleAccount(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){		
		String[] kp_ids=request.getParameterValues("kp_ids");
		if(kp_ids!=null&&kp_ids.length>0){
			for(int i=0;i<kp_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"kp_id"};
				// 加入sp的名称
				postData.put("spName", "u_finance_invoice_kp_account_cancel");					
				
				postData.put("kp_id", kp_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
    }
	
	/**
	 * 记账月度汇总
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/accountSummary",method=RequestMethod.GET)
    public ModelAndView accountSummary(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleAccount/accountSummary");
        String tableHeader = this.getTableHeader(httpSession,accountSummaryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", accountSummaryQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-记账月度汇总
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getAccountSummaryList")
	@ResponseBody
	public Object getAccountSummaryList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,accountSummaryQueryId);
	}
	
	/**
	 * 财务明细记账月度汇总
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/accountPurchaseSummary",method=RequestMethod.GET)
    public ModelAndView accountPurchaseSummary(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleAccount/accountPurchaseSummary");
        String tableHeader = this.getTableHeader(httpSession,accountPurchaseSummaryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", accountPurchaseSummaryQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-财务明细记账月度汇总
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getAccountPurchaseSummaryList")
	@ResponseBody
	public Object getAccountPurchaseSummaryList(@RequestBody Map postData){
		return this.getTableDataList(postData,accountPurchaseSummaryQueryId);
	}
}
