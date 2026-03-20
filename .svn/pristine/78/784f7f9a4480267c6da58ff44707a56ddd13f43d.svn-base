package com.cnpiecsb.fc.collection.controller;

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

@Controller
@RequestMapping("/fc/collection")
public class CollectionIncomingClaimController extends BaseServiceController {
	// 来款单查询
	private int incomingClaimQueryId = 8310001;
	private GridHeadConfig incomingClaimGridHeadConfig;
	
	private int incomingClaimOneQueryId = 8310001;
	
	// 认领单查询
	private int incomingClaimItemManageQueryId = 8310002;
	private GridHeadConfig incomingClaimItemManageGridHeadConfig;
	
	// 认领单单条查询
	private int incomingClaimItemOneQueryId = 8310002;
	
	// 认领单发票明细
	private int incomingClaimItemAddDetailQueryId = 8310003;
	private GridHeadConfig incomingClaimItemAddDetailHeadConfig;
	
	// 发票明细引入
	private int incomingClaimItemItemPullQueryId = 8310004;	
	private GridHeadConfig incomingClaimItemItemPullHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public CollectionIncomingClaimController(){
		incomingClaimGridHeadConfig = new GridHeadConfig(incomingClaimQueryId,true,false,true,false);
		incomingClaimGridHeadConfig.setOperatorWidth(80);
		
		incomingClaimItemManageGridHeadConfig = new GridHeadConfig(incomingClaimItemManageQueryId,true,false,true,false);
		incomingClaimItemManageGridHeadConfig.setOperatorWidth(100);
		
		incomingClaimItemAddDetailHeadConfig = new GridHeadConfig(incomingClaimItemAddDetailQueryId,true,false,true,false);
		
		incomingClaimItemItemPullHeadConfig = new GridHeadConfig(incomingClaimItemItemPullQueryId,true,true,false,false);	
	}
	
	/**
	 * 到款认领 到款单查询
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/incomingClaimManage",method=RequestMethod.GET)
    public ModelAndView incomingClaimManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/collectionIncomingClaim/incomingClaimManage");
        String tableHeader = this.getTableHeader(httpSession,incomingClaimGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", incomingClaimQueryId);
        return mv;
    }	
	
	/**
	 * 获得动态列表数据-到款认领 到款单列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getIncomingClaimManageList")
	@ResponseBody
	public Object getIncomingClaimManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, incomingClaimQueryId);
	}
	
	/**
	 * 到款认领记录 列表查询
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/incomingClaimItemManage",method=RequestMethod.GET)
    public ModelAndView incomingClaimItemManage(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/collectionIncomingClaim/incomingClaimItemManage");
        Map<String, Object> oneQuery = baseService.getOneQuery(incomingClaimOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        String tableHeader = this.getTableHeader(httpSession, incomingClaimItemManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", incomingClaimItemManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-到款认领记录列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getIncomingClaimItemManageList")
	@ResponseBody
	public Object getIncomingClaimItemManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, incomingClaimItemManageQueryId);
	}
	
	/**
	 * 认领单新增和修改返回操作
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/returnIncomingClaimItem")
	@ResponseBody
    public Object returnIncomingClaimItem(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"guid"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_claim_return");
		
		String incomingClaimItem_guid=(String)httpSession.getAttribute("incomingClaimItem_guid");
		postData.put("guid", incomingClaimItem_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		httpSession.setAttribute("incomingClaimItem_guid", "");
		return "{\"success\":true}";
    }
	
	/**
	 * 新增认领单页面
	 * 
	 * 
	 */
	@RequestMapping(value="/incomingClaimItemAdd",method=RequestMethod.GET)
    public ModelAndView incomingClaimItemAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/collectionIncomingClaim/incomingClaimItemAdd");
        
        String incomingClaimItem_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("incomingClaimItem_guid", incomingClaimItem_guid);
        
        String tableHeader = this.getTableHeader(httpSession, incomingClaimItemAddDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", incomingClaimItemAddDetailQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-新增认领单明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getIncomingClaimItemAddList")
	@ResponseBody
	public Object getIncomingClaimItemAddList(@RequestBody Map postData,HttpSession httpSession){
		String incomingClaimItem_guid = (String)httpSession.getAttribute("incomingClaimItem_guid");
		postData.put("guid", incomingClaimItem_guid);
		return this.getTableDataList(postData, incomingClaimItemAddDetailQueryId);
	}
	
	/**
	 * 来款认领新增操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addIncomingClaimItem")
	@ResponseBody
    public Object addIncomingClaimItem(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid", "c_id","ci_id","claim_source","switch_to_balance","memo","o_id_operator"};
		// 出参, 有顺序
		String returnNames[] = {"ca_id"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_claim_new");
		
		String incomingClaimItem_guid = (String)httpSession.getAttribute("incomingClaimItem_guid");
		postData.put("guid", incomingClaimItem_guid);
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_operator", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("bill_id", postData.get("ca_id"));
		code = do_sp_incoming_claim_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		code = do_sp_incoming_surplus_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
    }
	
	// 重算这次领用单 对应的发票已收款金额
	private int do_sp_incoming_claim_item_calculate(Map postData){
		String paramNames[] = {"bill_id", "is_to_edit"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_against_item_calculate");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	// 重算来款单剩余金额
	private int do_sp_incoming_surplus_calculate(Map postData){
		String paramNames[] = {"ci_id"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_surplus_calculate");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 删除操作 -领用单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteIncomingClaimItem")
	@ResponseBody
    public Object deleteIncomingClaimItem(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"ca_id","o_id_destroy"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_claim_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_destroy", user.getAccount());
        
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("bill_id", postData.get("ca_id"));
		code = do_sp_incoming_claim_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		code = do_sp_incoming_surplus_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 引入明细页面 发票明细
	 * 
	 * 
	 */
	@RequestMapping(value="/incomingClaimItemItemPull",method=RequestMethod.GET)
    public ModelAndView incomingClaimItemItemPull(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/collectionIncomingClaim/incomingClaimItemItemPull");
        String tableHeader = this.getTableHeader(httpSession, incomingClaimItemItemPullHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", incomingClaimItemItemPullQueryId);
        return mv;
    }
	
	/**
   	 * 获得动态列表数据-引入领用单发票明细
   	 * 
   	 * param postData
   	 * return
   	 */
   	@RequestMapping(value="/getIncomingClaimItemItemPullList")
   	@ResponseBody
   	public Object getIncomingClaimItemItemPullList(@RequestBody Map postData,HttpSession httpSession) {
   		// 获得权限代码参数
   		AccessControlUtil.accessParams(postData, httpSession);
   		return this.getTableDataList(postData, incomingClaimItemItemPullQueryId);
   	}
   	
   	/**
	 * 到款单引入发票
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/pullIncomingClaimItemItem")
	@ResponseBody
	public Object pullIncomingClaimItemItem(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession){
		String incomingClaimItem_guid = (String)httpSession.getAttribute("incomingClaimItem_guid");
		if(postData != null && postData.size()>0){
			for(Map<String,Object> item_map : postData){
				// 然后发票支出操作
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid","kp_id","kp_money"};
				// 加入sp的名称
				item_map.put("spName", "fc_collection_against_item_pullin");
				item_map.put("guid", incomingClaimItem_guid);		

				int code = baseService.doCallSp(item_map, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}		
		}				
		return "{\"success\":true}";
	}
	
	/**
	 * 修改明细折扣操作
	 * 
	 * @param dynamicColumns
	 * @return
	 */
	@RequestMapping(value="/updateIncomingClaimItemItem")
	@ResponseBody
	public Object updateIncomingClaimItemItem(@RequestParam Map postData, HttpSession httpSession) {
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"guid", "kp_id", "kp_money", "rebate_money"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_against_item_update");
		
		String incomingClaimItem_guid = (String)httpSession.getAttribute("incomingClaimItem_guid");
		postData.put("guid", incomingClaimItem_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
	}
	
	/**
	 * 删除明细操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteIncomingClaimItemItem")
	@ResponseBody
    public Object deleteSaleInvoiceItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){	
		String incomingClaimItem_guid = (String)httpSession.getAttribute("incomingClaimItem_guid");
		postData.put("guid", incomingClaimItem_guid);
		
		String[] kp_ids = request.getParameterValues("kp_ids");
		if(kp_ids != null && kp_ids.length > 0){
			for(int i=0; i < kp_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "kp_id"};
				// 加入sp的名称
				postData.put("spName", "fc_collection_against_item_delete");					
				
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
	 * 修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/incomingClaimItemEdit",method=RequestMethod.GET)
    public ModelAndView saleInvoiceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(incomingClaimItemOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("fc/collectionIncomingClaim/incomingClaimItemEdit");
        
        String tableHeader = this.getTableHeader(httpSession, incomingClaimItemAddDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", incomingClaimItemAddDetailQueryId);
		
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"bill_id","guid"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_claim_toUpdate");
		
		String incomingClaimItem_guid = GuidUtil.create32Guid();
        httpSession.setAttribute("incomingClaimItem_guid", incomingClaimItem_guid);
		postData.put("guid", incomingClaimItem_guid);
		postData.put("bill_id", postData.get("ca_id"));
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	 * 获得动态列表数据-编辑发票明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getIncomingClaimItemList")
	@ResponseBody
	public Object getSaleInvoiceEditItemList(@RequestBody Map postData,HttpSession httpSession){
		String incomingClaimItem_guid = (String)httpSession.getAttribute("incomingClaimItem_guid");
		postData.put("guid", incomingClaimItem_guid);
		return this.getTableDataList(postData, incomingClaimItemAddDetailQueryId);
	}
	
	/**
	 * 修改领用单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editIncomingClaimItem")
	@ResponseBody
    public Object editIncomingClaimItem(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"ca_id","guid","c_id","ci_id","claim_source","switch_to_balance","memo","o_id_modify"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_claim_update");
		
		String incomingClaimItem_guid = (String)httpSession.getAttribute("incomingClaimItem_guid");
		postData.put("guid", incomingClaimItem_guid);
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_modify", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("bill_id", postData.get("ca_id"));
		code = do_sp_incoming_claim_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		code = do_sp_incoming_surplus_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 审核通过领用单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/auditIncomingClaimItemPass")
	@ResponseBody
    public Object auditIncomingClaimItemPass(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"ca_id","o_id_audit"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_claim_audit_pass");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_audit", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 产生折扣单
		postData.remove("paramNames");
		postData.put("bill_id", postData.get("ca_id"));
		postData.put("is_claim", 1);  // 代表是认领单
		
		paramNames = new String[]{"bill_id", "c_id", "rebate_money", "is_claim"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_discount_adjustment_new");
		
		code = baseService.doCallSp(postData, paramNames, null);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 审核不通过领用单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/auditIncomingClaimItemNotPass")
	@ResponseBody
    public Object auditIncomingClaimItemNotPass(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"ca_id","o_id_audit"};
		// 加入sp的名称
		postData.put("spName", "fc_collection_incoming_claim_audit_not_pass");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_audit", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		postData.put("bill_id", postData.get("ca_id"));
		code = do_sp_incoming_claim_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");
		code = do_sp_incoming_surplus_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
}
