package com.cnpiecsb.np.finance.controller;

import java.util.Calendar;
import java.util.Map;

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
public class SaleReportController extends ZtbkServiceController {
	// 报表查看
	private int saleReportManageQueryId = 5120001;	
	private GridHeadConfig saleReportManageGridHeadConfig;
	
	// 报表明细(老财务分类) 不在使用
	private int saleReportItemsQueryId = 5120002;	
	private GridHeadConfig saleReportItemsGridHeadConfig;
	
	// 报表明细(新财务分类) 不在使用
	private int saleReport1ItemsQueryId = 5120006;	
	private GridHeadConfig saleReport1ItemsGridHeadConfig;
	
	// 报表明细(收订)
	private int saleReportSdItemsQueryId = 5120003;	
	private GridHeadConfig saleReportSdItemsGridHeadConfig;
	
	// 财务报表汇总  不在使用
	private int saleReportCwItemsQueryId = 5120005;	
	private GridHeadConfig saleReportCwItemsGridHeadConfig;
	
	// 报表明细(代销/费用/代理)
	private int saleReportAgencyItemsQueryId = 5120007;	
	private GridHeadConfig saleReportAgencyItemsGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public SaleReportController(){
		saleReportManageGridHeadConfig = new GridHeadConfig(saleReportManageQueryId,true,false,true,false);
		saleReportManageGridHeadConfig.setOperatorWidth(150);
		
		saleReportItemsGridHeadConfig = new GridHeadConfig(saleReportItemsQueryId,true,false,false,false);
		
		saleReport1ItemsGridHeadConfig = new GridHeadConfig(saleReport1ItemsQueryId,true,false,false,false);
		
		saleReportSdItemsGridHeadConfig = new GridHeadConfig(saleReportSdItemsQueryId,true,false,false,false);
		
		saleReportCwItemsGridHeadConfig = new GridHeadConfig(saleReportCwItemsQueryId,true,false,false,false);
		
		saleReportAgencyItemsGridHeadConfig = new GridHeadConfig(saleReportAgencyItemsQueryId,true,false,false,false);
	}
	
	/**
	 * 销售报表查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportManage", method=RequestMethod.GET)
    public ModelAndView saleReportManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportManage");
        String tableHeader = this.getTableHeader(httpSession,saleReportManageGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReportManageQueryId);
		Calendar now = Calendar.getInstance();
		if(now.get(Calendar.MONTH)==11||now.get(Calendar.MONTH)==12){
			mv.addObject("current_yearmonth", now.get(Calendar.YEAR) + "." + (now.get(Calendar.MONTH) + 1));
		}else{
			mv.addObject("current_yearmonth", now.get(Calendar.YEAR) + "." +"0"+(now.get(Calendar.MONTH) + 1));
		}
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表管理
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReportManageList")
	@ResponseBody
	public Object getSaleReportManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,saleReportManageQueryId);
	}
	
	/**
	 * 新增销售报表界面
	 * 
	 * 
	 */
	@RequestMapping(value="/saleReportAdd",method=RequestMethod.GET)
    public ModelAndView saleReportAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportAdd");
        return mv;
    }
	
	/**
	 * 新增销售报表操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addSaleReport")
	@ResponseBody
    public Object addSaleReport(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"report_description", "account_month","report_type","o_id_input"};
		// 出参, 有顺序
		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_report_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改销售报表操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editSaleReport")
	@ResponseBody
    public Object editSaleReport(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id","report_description"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_report_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除销售报表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteSaleReport")
	@ResponseBody
    public Object deleteSaleReport(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_report_delete");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 归档销售报表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/toFileSaleReport")
	@ResponseBody
    public Object toFileSaleReport(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_report_tofile");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 销售报表明细界面(老财务分类)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportItems", method=RequestMethod.GET)
    public ModelAndView saleReportItems(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportItems");
        String tableHeader = this.getTableHeader(httpSession,saleReportItemsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReportItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReportItemsList")
	@ResponseBody
	public Object getSaleReportItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, saleReportItemsQueryId);
	}
	
	
	/**
	 * 销售报表明细界面(新财务分类)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReport1Items", method=RequestMethod.GET)
    public ModelAndView saleReport1Items(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReport1Items");
        String tableHeader = this.getTableHeader(httpSession,saleReport1ItemsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReport1ItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表明细(新财务分类)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReport1ItemsList")
	@ResponseBody
	public Object getSaleReport1ItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, saleReport1ItemsQueryId);
	}
	
	/**
	 * 销售报表明细界面(收订)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportSdItems", method=RequestMethod.GET)
    public ModelAndView saleReportSdItems(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportSdItems");
        String tableHeader = this.getTableHeader(httpSession,saleReportSdItemsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReportSdItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReportSdItemsList")
	@ResponseBody
	public Object getSaleReportSdItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, saleReportSdItemsQueryId);
	}
	
	/**
	 * 销售报表明细界面(代销\费用\代理)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportAgencyItems", method=RequestMethod.GET)
    public ModelAndView saleReportAgencyItems(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportAgencyItems");
        String tableHeader = this.getTableHeader(httpSession,saleReportAgencyItemsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReportAgencyItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表明细(代销\费用\代理)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReportAgencyItemsList")
	@ResponseBody
	public Object getSaleReportAgencyItemsList(@RequestBody Map postData){
//		postData.put("account_month_all_start",postData.get("account_month"));
//		postData.put("account_month_all_end",postData.get("account_month"));
		return this.getTableDataList(postData, saleReportAgencyItemsQueryId);
	}
	
	/**
	 * 销售报表财务分类明细界面(收订)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportCwItems", method=RequestMethod.GET)
    public ModelAndView saleReportCwItems(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportCwItems");
        String tableHeader = this.getTableHeader(httpSession,saleReportCwItemsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReportCwItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReportCwItemsList")
	@ResponseBody
	public Object getSaleReportCwItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, saleReportCwItemsQueryId);
	}
	
	/**
	 * 销售报表财务分类明细新增
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportCwItemAdd", method=RequestMethod.GET)
    public ModelAndView saleReportCwSdItems(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportCwItemAdd");
        return mv;
    }
	
	/**
	 * 新增销售报表财务分类明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addSaleReportCwItem")
	@ResponseBody
    public Object addSaleReportCwItem(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id", "account_month", "purchase_cw_type", "real_money"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_cw_new");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除销售报表财务分类明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteSaleReportCwItem")
	@ResponseBody
    public Object deleteSaleReportCwItem(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id", "cw_type"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_cw_delete");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改销售报表财务分类明细金额
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/updateSaleReportCwItem")
	@ResponseBody
    public Object updateSaleReportCwItem(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id", "account_month", "cw_type", "real_money"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_cw_update");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改销售报表明细备注
	 * 
	 * @param postData
	 * @return
	 */
	@RequestMapping(value="/updateSaleReportItemMemo")
	@ResponseBody
    public Object updateSaleReportItemMemo(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id", "item_memo"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_report_item_memo_update");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 获得单条报表信息,为了取到明细备注
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/querySaleReportItemMemo")
	@ResponseBody
    public Object querySaleReportItemMemo(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException {
		Map<String, Object> oneQuery = baseService.getOneQuery(saleReportManageQueryId, postData);
		return oneQuery;
    }
	
	/**
	 * 销售报表代销汇总界面(代销\费用\代理)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportAgencyCollect", method=RequestMethod.GET)
    public ModelAndView saleReportAgencyCollect(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportAgencyCollect");
        String tableHeader = this.getTableHeader(httpSession,saleReportAgencyItemsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReportAgencyItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表代销汇总明细(代销\费用\代理)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReportAgencyCollectList")
	@ResponseBody
	public Object getSaleReportAgencyCollectList(@RequestBody Map postData){
		if(postData.get("account_month_all_end")==null||postData.get("account_month_all_end").equals("")){
			postData.put("account_month_all_end", "2099.12");
		}
		if(postData.get("account_month_all_start")==null||postData.get("account_month_all_start").equals("")){
			postData.put("account_month_all_start", "1900.01");
		}
		return this.getTableDataList(postData, saleReportAgencyItemsQueryId);
	}
	
	/**
	 * 销售报表收订汇总界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saleReportSdCollect", method=RequestMethod.GET)
    public ModelAndView saleReportSdCollect(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/saleReport/saleReportSdCollect");
        String tableHeader = this.getTableHeader(httpSession,saleReportSdItemsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", saleReportSdItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-销售报表收订汇总明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSaleReportSdCollectList")
	@ResponseBody
	public Object getSaleReportSdCollectList(@RequestBody Map postData){
		return this.getTableDataList(postData, saleReportSdItemsQueryId);
	}
	
	public static void main(String[] args) {
		Calendar now = Calendar.getInstance();
		System.out.println(now.get(Calendar.YEAR) + "." + (now.get(Calendar.MONTH) + 1));
	}
	
	/**
	 * 提交销售报表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/toSubmitSaleReport")
	@ResponseBody
    public Object toSubmitSaleReport(@RequestParam Map postData,HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
		postData.put("submit_person", user.getAccount());
		
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id","submit_person"};
		// 加入sp的名称
		postData.put("spName", "u_finance_sale_report_tosumbit");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
}
