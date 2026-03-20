package com.cnpiecsb.fc.collection.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/fc/collection")
public class CollectionDiscountAdjustmentController extends BaseServiceController {
	// 折扣调整单表头查询
	private int discountAdjustmentManageQueryId = 8130001;
	private GridHeadConfig discountAdjustmentManageQueryHeadConfig;
	
	// 折扣调整单折扣明细查询
	private int discountAdjustmentItemsQueryId = 8130002;	
	private GridHeadConfig discountAdjustmentItemsQueryHeadConfig;
	
	public CollectionDiscountAdjustmentController() {
		discountAdjustmentManageQueryHeadConfig = new GridHeadConfig(discountAdjustmentManageQueryId, true, true, true, false);
		discountAdjustmentManageQueryHeadConfig.setOperatorWidth(80);
		
		discountAdjustmentItemsQueryHeadConfig = new GridHeadConfig(discountAdjustmentItemsQueryId,true,false,false,false);
	}
	
	/**
	 * 进入折扣调整单管理界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/discountAdjustmentManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView discountAdjustmentManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/collectionDiscountAdjustment/discountAdjustmentManage");
        String tableHeader = this.getTableHeader(httpSession,discountAdjustmentManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", discountAdjustmentManageQueryId);
        return mv;
    }
	
	/**
	 * 获得折扣调整单数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getDiscountAdjustmentList")
	@ResponseBody
	public Object getDiscountAdjustmentList(@RequestBody Map postData, HttpSession httpSession) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		return this.getTableDataList(postData, discountAdjustmentManageQueryId);
	}
	
	/**
	 * 进入折扣调整单折扣明细界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/discountAdjustmentItems")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView discountAdjustmentItems(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/collectionDiscountAdjustment/discountAdjustmentItems");
        String tableHeader = this.getTableHeader(httpSession, discountAdjustmentItemsQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", discountAdjustmentItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得折扣调整单折扣明细数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getDiscountAdjustmentItemsList")
	@ResponseBody
	public Object getDiscountAdjustmentItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, discountAdjustmentItemsQueryId);
	}
	
	/**
	 * 记账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/accountDiscountAdjustment")
	@ResponseBody
    public Object accountDiscountAdjustment(@RequestParam Map postData,HttpServletRequest request,HttpSession httpSession){
		String[] bill_ids = request.getParameterValues("bill_ids");
		User user=(User)httpSession.getAttribute("user");
		postData.put("account_person", user.getAccount());
		
		if(bill_ids !=null && bill_ids.length>0){
			for(int i=0;i < bill_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"bill_id","account_person","account_month"};
				// 加入sp的名称
				postData.put("spName", "fc_collection_discount_adjustment_account");
				
				postData.put("bill_id", bill_ids[i]);
						
				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 撤销记账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteDiscountAdjustmentAccount")
	@ResponseBody
    public Object deleteDiscountAdjustmentAccount(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){		
		String[] bill_ids = request.getParameterValues("bill_ids");
		if(bill_ids !=null && bill_ids.length>0){
			for(int i=0; i < bill_ids.length; i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"bill_id"};
				// 加入sp的名称
				postData.put("spName", "fc_collection_discount_adjustment_account_cancel");					
				
				postData.put("bill_id", bill_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}
		
		return "{\"success\":true}";
    }
}
