package com.cnpiecsb.fc.payment.controller;

import java.util.List;
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

import com.cnpiecsb.common.util.GuidUtil;
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 货源余额页面
 * @author by zc 2022/1/11
 *
 */
@Controller
@RequestMapping("/fc/payment")
public class PaymentFactoryPayController extends BaseServiceController {
	// 货源余额查询
	private int paymentFactoryPaySearchQueryId = 8450001;	
	private GridHeadConfig paymentFactoryPaySearchQueryHeadConfig;
	
	// 单个货源查询
	private int factoryPayOneQueryId = 8450002;
		
	// 支出单查询
	private int factoryPayItemManageQueryId = 8450003;
	private GridHeadConfig factoryPayItemManageGridHeadConfig;
	
	// 支出发票记录临时表查询
	private int factoryPayItemAddDetailQueryId = 8450004;
	private GridHeadConfig factoryPayItemAddDetailHeadConfig;
	
	// 发票明细引入
	private int factoryPayItemItemPullQueryId = 8450005;	
	private GridHeadConfig factoryPayItemItemPullHeadConfig;
	
	// 余额支出明细查询
	private int factoryPayItemDetailManageQueryId = 8450006;
	private GridHeadConfig factoryPayItemDeatilManageGridHeadConfig;
		
	public PaymentFactoryPayController() {
		paymentFactoryPaySearchQueryHeadConfig = new GridHeadConfig(paymentFactoryPaySearchQueryId,true,false,true,false);
		paymentFactoryPaySearchQueryHeadConfig.setOperatorWidth(120);
		factoryPayItemManageGridHeadConfig = new GridHeadConfig(factoryPayItemManageQueryId,true,false,true,false);
		factoryPayItemManageGridHeadConfig.setOperatorWidth(190);
		factoryPayItemAddDetailHeadConfig = new GridHeadConfig(factoryPayItemAddDetailQueryId,true,false,true,false);
		factoryPayItemAddDetailHeadConfig.setOperatorWidth(190);
		factoryPayItemItemPullHeadConfig = new GridHeadConfig(factoryPayItemItemPullQueryId,true,true,false,false);
		factoryPayItemDeatilManageGridHeadConfig = new GridHeadConfig(factoryPayItemDetailManageQueryId,true,false,false,false);
	}
	
	/**
	 * 进入货源余额页面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/factoryPayManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView factoryPayManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentFactoryPay/factoryPayManage");
        String tableHeader = this.getTableHeader(httpSession,paymentFactoryPaySearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", paymentFactoryPaySearchQueryId);
        return mv;
    }
	
	/**
	 * 获得货源余额数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getFactoryPayList")
	@ResponseBody
	public Object getFactoryPayList(@RequestBody Map postData, HttpSession httpSession) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		return this.getTableDataList(postData, paymentFactoryPaySearchQueryId);
	}
	
	/**
	 * 余额认领记录 列表查询
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/factoryPayItemManage",method=RequestMethod.GET)
    public ModelAndView factoryPayItemManage(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentFactoryPay/factoryPayItemManage");
        Map<String, Object> oneQuery = baseService.getOneQuery(factoryPayOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        String tableHeader = this.getTableHeader(httpSession, factoryPayItemManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", factoryPayItemManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-余额认领记录列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryPayItemManageList")
	@ResponseBody
	public Object getFactoryPayItemManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, factoryPayItemManageQueryId);
	}
	
	/**
	 * 新增支出单页面
	 * 
	 * 
	 */
	@RequestMapping(value="/factoryPayItemAdd",method=RequestMethod.GET)
    public ModelAndView factoryPayItemAdd(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentFactoryPay/factoryPayItemAdd");
        
        String factoryPayItem_guid = GuidUtil.create32Guid();
        httpSession.setAttribute("factoryPayItem_guid", factoryPayItem_guid);
        
        Map<String, Object> oneQuery = baseService.getOneQuery(factoryPayOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        
        String tableHeader = this.getTableHeader(httpSession, factoryPayItemAddDetailHeadConfig);
        mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", factoryPayItemAddDetailQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-新增支出单明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryPayItemAddList")
	@ResponseBody
	public Object getFactoryPayItemAddList(@RequestBody Map postData,HttpSession httpSession){
		String factoryPayItem_guid = (String)httpSession.getAttribute("factoryPayItem_guid");
		postData.put("guid", factoryPayItem_guid);
		return this.getTableDataList(postData, factoryPayItemAddDetailQueryId);
	}
	
	
	/**
	 * 引入明细页面 发票明细
	 * 
	 * 
	 */
	@RequestMapping(value="/factoryPayItemItemPull",method=RequestMethod.GET)
    public ModelAndView factoryPayItemItemPull(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentFactoryPay/factoryPayItemItemPull");
        String tableHeader = this.getTableHeader(httpSession, factoryPayItemItemPullHeadConfig);
        
        Map<String, Object> oneQuery = baseService.getOneQuery(factoryPayOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", factoryPayItemItemPullQueryId);
        return mv;
    }
	
	/**
   	 * 获得动态列表数据-引入支出单发票明细
   	 * 
   	 * param postData
   	 * return
   	 */
   	@RequestMapping(value="/getFactoryPayItemItemPullList")
   	@ResponseBody
   	public Object getFactoryPayItemItemPullList(@RequestBody Map postData,HttpSession httpSession) {
   		// 获得权限代码参数
   		AccessControlUtil.accessParams(postData, httpSession);
   		return this.getTableDataList(postData, factoryPayItemItemPullQueryId);
   	}
   	
   	/**
	 * 引入发票
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/pullFactoryPayItemItem")
	@ResponseBody
	public Object pullFactoryPayItemItem(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession){
		String factoryPayItem_guid = (String)httpSession.getAttribute("factoryPayItem_guid");
		if(postData != null && postData.size()>0){
			for(Map<String,Object> item_map : postData){
				String paramNames[] = new String[]{"guid","f_id","currency","inv_id","can_c_real_money"};
				// 加入sp的名称
				item_map.put("spName", "fc_payment_factory_pay_item_pull");
				item_map.put("guid", factoryPayItem_guid);		

				int code = baseService.doCallSp(item_map, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}		
		}				
		return "{\"success\":true}";
	}
	
	/**
	 * 返回操作清空临时表
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/returnFactoryPayItem")
	@ResponseBody
    public Object returnFactoryPayItem(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"guid"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_return");
		
		String factoryPayItem_guid = (String)httpSession.getAttribute("factoryPayItem_guid");
		postData.put("guid", factoryPayItem_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		httpSession.setAttribute("factoryPayItem_guid", "");
		return "{\"success\":true}";
    }
	
	/**
	 * 删除明细操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFactoryPayItemItem")
	@ResponseBody
    public Object deleteFactoryPayItemItem(@RequestParam Map postData,HttpSession httpSession, HttpServletRequest request){	
		String factoryPayItem_guid = (String)httpSession.getAttribute("factoryPayItem_guid");
		postData.put("guid", factoryPayItem_guid);
		
		String[] inv_ids = request.getParameterValues("inv_ids");
		if(inv_ids != null && inv_ids.length > 0){
			for(int i=0; i < inv_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "inv_id"};
				// 加入sp的名称
				postData.put("spName", "fc_payment_factory_pay_item_delete");					
				
				postData.put("inv_id", inv_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
    }
	
	/**
	 * 货源余额认领新增操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addFactoryPayItem")
	@ResponseBody
   public Object addFactoryPayItem(@RequestParam Map postData,HttpSession httpSession) {
		// 入参, 注意按照顺序
		String paramNames[] = {"guid", "f_id","currency","memo","o_id_operator"};
		// 出参, 有顺序
		String returnNames[] = {"fb_id"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_new");
		
		String factoryPayItem_guid = (String)httpSession.getAttribute("factoryPayItem_guid");
		postData.put("guid", factoryPayItem_guid);
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_operator", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("fb_id", postData.get("fb_id"));
		code = do_sp_factory_pay_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		code = do_sp_factory_balance_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
   }
	
	// 重算这次货源余额支出后的冲销货源发票已冲销金额
	private int do_sp_factory_pay_item_calculate(Map postData){
		String paramNames[] = {"fb_id", "is_to_edit"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_item_calculate");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	// 货源剩余余额重算
	private int do_sp_factory_balance_calculate(Map postData){
		String paramNames[] = {"f_id","currency"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_balance_calculate");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 修改明细折扣操作
	 * 
	 * @param dynamicColumns
	 * @return
	 */
	@RequestMapping(value="/updateFactoryPayItemItem")
	@ResponseBody
	public Object updateFactoryPayItemItem(@RequestParam Map postData, HttpSession httpSession) {
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"guid", "f_id", "currency","inv_id","against_c_real_money"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_item_update");
		
		String factoryPayItem_guid = (String)httpSession.getAttribute("factoryPayItem_guid");
		postData.put("guid", factoryPayItem_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
	}
	
	/**
   	 * 单条记录查询
   	 * 
   	 * param postData
   	 * return
   	 */
   	@RequestMapping(value="/getFactoryPayItemOneClient")
   	@ResponseBody
   	public Object getFactoryPayItemOneClient(@RequestParam Map postData) {
   		return baseService.getOneQuery(factoryPayOneQueryId, postData);
   	}
   	
   	/**
	 * 删除操作 - 货源余额支出单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFactoryPayItem")
	@ResponseBody
    public Object deleteFactoryPayItem(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"fb_id","o_id_destroy"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_destroy", user.getAccount());
        
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("fb_id", postData.get("fb_id"));
		code = do_sp_factory_pay_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		code = do_sp_factory_balance_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/factoryPayItemEdit",method=RequestMethod.GET)
    public ModelAndView factoryPayItemEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(factoryPayItemManageQueryId, postData);		//factoryPayOneQueryId
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("fc/paymentFactoryPay/factoryPayItemEdit");
        
        String tableHeader = this.getTableHeader(httpSession, factoryPayItemAddDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", factoryPayItemAddDetailQueryId);
		
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"fb_id","guid"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_toUpdate");
		
		String factoryPayItem_guid = GuidUtil.create32Guid();
        httpSession.setAttribute("factoryPayItem_guid", factoryPayItem_guid);
		postData.put("guid", factoryPayItem_guid);
		postData.put("fb_id", postData.get("fb_id"));
		
		
		mv.addObject("fb_id", postData.get("fb_id"));
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	 * 修改支出单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editFactoryPayItem")
	@ResponseBody
    public Object editFactoryPayItem(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"fb_id","guid", "f_id","currency","memo","o_id_operator"};
		
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_update");
		
		String factoryPayItem_guid = (String)httpSession.getAttribute("factoryPayItem_guid");
		postData.put("guid", factoryPayItem_guid);
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_modify", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("fb_id", postData.get("fb_id"));
		code = do_sp_factory_pay_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		code = do_sp_factory_balance_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 审核通过支出单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/auditFactoryPayItemPass")
	@ResponseBody
    public Object auditFactoryPayItemPass(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"fb_id", "is_audit_pass", "o_id_audit"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_audit");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_audit", user.getAccount());
		postData.put("is_audit_pass", 1);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 审核通过的后置
		postData.remove("paramNames");
		postData.put("bill_id", postData.get("fb_id"));
		postData.put("o_id_operator", user.getAccount());
		
		paramNames = new String[]{"bill_id", "f_id", "currency", "o_id_operator"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_discount_adjustment_new");
		
		code = baseService.doCallSp(postData, paramNames, null);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 审核不通过支出单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/auditFactoryPayItemNotPass")
	@ResponseBody
    public Object auditFactoryPayItemNotPass(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"fb_id", "is_audit_pass", "o_id_audit"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_factory_pay_audit");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_audit", user.getAccount());
		postData.put("is_audit_pass", 0);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("fb_id", postData.get("fb_id"));
		code = do_sp_factory_pay_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		code = do_sp_factory_balance_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	
	/**
	 * 余额支出明细页面
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/factoryPayItemDetailManage",method=RequestMethod.GET)
    public ModelAndView factoryPayItemDetailManage(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentFactoryPay/factoryPayItemDetailManage");
        String tableHeader = this.getTableHeader(httpSession, factoryPayItemDeatilManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", factoryPayItemDetailManageQueryId);
		mv.addObject("f_id", (String)postData.get("f_id"));
		mv.addObject("currency", (String)postData.get("currency"));
        return mv;
    }
	
	/**
	 * 获得余额支出明细
	 * 
	 * @return
	 */
	@RequestMapping(value="/getFactoryPayItemDetail")
	@ResponseBody
	public Object getFactoryPayItemDetail(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, factoryPayItemDetailManageQueryId);
	}
}
