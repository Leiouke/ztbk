package com.cnpiecsb.fc.purchaseReport.controller;

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
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 归档明细维护相关的控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/fc/purchaseReport")
public class PurchaseReportFileItemController extends BaseServiceController {
	// 报表归档明细临时表
	private int purchaseReportFileItemManageQueryId = 8470004;	
	private GridHeadConfig purchaseReportFileItemManageGridHeadConfig;
	
	// 查单条报表归档明细汇总金额
	private int purchaseReportFileItemSumQueryId = 8470005;	
	
	/**
	* 初始化工作, 修改内容后需要重新启动服务生效
	* 
	*/
	public PurchaseReportFileItemController() {
		purchaseReportFileItemManageGridHeadConfig = new GridHeadConfig(purchaseReportFileItemManageQueryId,true,false,true,false);
		purchaseReportFileItemManageGridHeadConfig.setOperatorWidth(130);
	}
	
	/**
	* 报表查询界面
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/purchaseReportFileItemManage", method=RequestMethod.GET)
	public ModelAndView purchaseReportFileItemManage(@RequestParam Map postData, HttpSession httpSession) throws JsonProcessingException {
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("fc/purchaseReport/purchaseReportFileItemManage");
	    
	    Map<String, Object> oneQuery = baseService.getOneQuery(purchaseReportFileItemSumQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		
		// 数据转移到临时表
		String paramNames[] = {"report_id", "f_id", "currency", "cost_classification"};
		// 加入sp的名称
		postData.put("spName", "fc_purchase_report_item_file_temp_create");
		
		int code = baseService.doCallSp(postData, paramNames, null);
	    
	    String tableHeader = this.getTableHeader(httpSession, purchaseReportFileItemManageGridHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", purchaseReportFileItemManageQueryId);
	    return mv;
	}
		
	/**
	* 获得动态列表数据-销售报表管理
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/getPurchaseReportFileItemManageList")
	@ResponseBody
	public Object getPurchaseReportFileItemManageList(@RequestBody Map postData, HttpSession httpSession){
		return this.getTableDataList(postData, purchaseReportFileItemManageQueryId);
	}
	
	/**
	 * 新增报表明细界面
	 * 
	 * 
	 */
	@RequestMapping(value="/purchaseReportFileItemAdd",method=RequestMethod.GET)
    public ModelAndView purchaseReportFileItemAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/purchaseReport/purchaseReportFileItemAdd");
        return mv;
    }
	
	/**
	 * 新增报表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/addPurchaseReportFileItem")
	@ResponseBody
    public Object addPurchaseReportFileItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id", "f_id", "currency", "cost_classification", "cw_type","c_real_money","total_money", "predict_real_money", "rebate_money", "real_money"};
		// 加入sp的名称
		postData.put("spName", "fc_purchase_report_item_file_temp_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 修改报表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/purchaseReportFileItemEdit",method=RequestMethod.GET)
    public ModelAndView purchaseReportFileItemEdit(@RequestParam Map postData, HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
		
        Map<String, Object> oneQuery = baseService.getOneQuery(purchaseReportFileItemManageQueryId, postData);		
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		
        mv.setViewName("fc/purchaseReport/purchaseReportFileItemEdit");
        return mv;
    }
	
	/**
	 * 修改报表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/editPurchaseReportFileItem")
	@ResponseBody
    public Object editPurchaseReportFileItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		// 入参, 注意按照顺序
		String paramNames[] = {"id", "report_id", "f_id", "currency", "cost_classification", "cw_type","c_real_money","total_money", "predict_real_money", "rebate_money", "real_money"};
		// 加入sp的名称
		postData.put("spName", "fc_purchase_report_item_file_temp_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 删除明细
	 * 
	 * 
	 */
	@RequestMapping(value="/deletePurchaseReportFileItem")
	@ResponseBody
    public Object deletePurchaseReportFileItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		// 入参, 注意按照顺序
		String paramNames[] = {"id"};
		// 加入sp的名称
		postData.put("spName", "fc_purchase_report_item_file_temp_delete");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 更新明细
	 * 
	 * 
	 */
	@RequestMapping(value="/updatePurchaseReportFileItem")
	@ResponseBody
    public Object updatePurchaseReportFileItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		// 入参, 注意按照顺序
		String paramNames[] = {"report_id", "f_id", "currency", "cost_classification"};
		// 加入sp的名称
		postData.put("spName", "fc_purchase_report_item_file_temp_to_file");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
}
