package com.cnpiecsb.fc.declare.controller;

import java.util.HashMap;
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
import com.cnpiecsb.system.entity.DicDirectory;
import com.cnpiecsb.system.entity.Dictionary;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 退税发票界面
 */
@Controller
@RequestMapping("/fc/declare")
public class TaxbackInvoiceController extends BaseServiceController{
	
	private int taxbackSearchQueryId = 8001020;  //报关单查询
	private GridHeadConfig taxbackSearchQueryHeadConfig;
	
	private int taxbackItemTempSearchQueryId = 8001023;  //发票明细临时表查询
	private GridHeadConfig taxbackItemTempSearchQueryHeadConfig;
	
	private int taxbackOneSearchQueryId = 8001024;  //报关单单条查询
	
	private int taxbackDetailSearchQueryId = 8001039;  //报关单明细查询
	private GridHeadConfig taxbackDetailSearchQueryHeadConfig;
	
	private int declareInvoiceSearchQueryId = 8001028;  //报关单发票查询
	private GridHeadConfig declareInvoiceSearchQueryHeadConfig; 
	
	private int declareInvoiceTempSumSearchQueryId = 8001040;  //报关单发票临时表价格汇总
	

	
	public TaxbackInvoiceController(){
		taxbackSearchQueryHeadConfig = new GridHeadConfig(taxbackSearchQueryId,true,false,true,false);
		taxbackSearchQueryHeadConfig.setOperatorWidth(180);
		declareInvoiceSearchQueryHeadConfig = new GridHeadConfig(declareInvoiceSearchQueryId,true,true,true,false);
		declareInvoiceSearchQueryHeadConfig.setOperatorWidth(180);
		taxbackItemTempSearchQueryHeadConfig = new GridHeadConfig(taxbackItemTempSearchQueryId,true,true,true,false);
		taxbackItemTempSearchQueryHeadConfig.setOperatorWidth(120);
		taxbackDetailSearchQueryHeadConfig = new GridHeadConfig(taxbackDetailSearchQueryId,true,true,false,false);
	}
	
	/**
	 * 进入退税发票界面
	 */
	@RequestMapping(value="/taxbackInvoiceManage")
    public ModelAndView taxbackInvoiceManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,taxbackSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", taxbackSearchQueryId);
        mv.setViewName("fc/declareTaxbackInvoice/taxbackInvoiceManage");
        return mv;
    }
	
	/**
	 * 获得退税发票界面信息
	 * @return
	 */
	@RequestMapping(value="/getTaxbackInvoiceList")
	@ResponseBody
	public Object getTaxbackInvoiceList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		Map<String,Object> map=this.getTableDataList(postData,taxbackSearchQueryId);
		return map;
	}
	
	/**
	* 发票查询界面
	* 
	* 
	*/
	@RequestMapping(value="/toDecalreInvoiceManage",method=RequestMethod.GET)
	public ModelAndView toDecalreInvoiceManage(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		// 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(taxbackOneSearchQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
	    mv.setViewName("fc/declareTaxbackInvoice/declareInvoiceManage");
	    String tableHeader = this.getTableHeader(httpSession,declareInvoiceSearchQueryHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
	    mv.addObject("queryId", declareInvoiceSearchQueryId);
	    return mv;
	}
	
	/**
	 * 获得发票查询界面数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getDecalreInvoiceList")
	@ResponseBody
	public Object getDecalreInvoiceList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,declareInvoiceSearchQueryId);
	}
	
	/**
	* 新增退税发票页面
	* 
	* 
	*/
	@RequestMapping(value="/toDeclareInvoiceNew",method=RequestMethod.GET)
	public ModelAndView toDeclareInvoiceNew(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String taxback_invoice_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("taxback_invoice_guid", taxback_invoice_guid);
	    mv.setViewName("fc/declareTaxbackInvoice/declareInvoiceAdd");
	    String tableHeader = this.getTableHeader(httpSession,taxbackItemTempSearchQueryHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
	    mv.addObject("queryId", taxbackItemTempSearchQueryId);
	    mv.addObject("dcl_id", (String)postData.get("dcl_id"));
	    mv.addObject("taxback_invoice_guid",taxback_invoice_guid);
	    return mv;
	}
	
	/**
	 * 获得退税发票明细临时数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getTaxbackInvoiceItemTempList")
	@ResponseBody
	public Object getTaxbackInvoiceItemTempList(@RequestBody Map postData,HttpSession httpSession){
		String taxback_invoice_guid=(String)httpSession.getAttribute("taxback_invoice_guid");
		postData.put("guid", taxback_invoice_guid);
		return this.getTableDataList(postData,taxbackItemTempSearchQueryId);
	}
	
	/**
	* 删除退税发票明细临时数据
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/deleteInvoiceTaxbackItemTemp")
	@ResponseBody
	public Object deleteInvoiceTaxbackItemTemp(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		//放入GUID
		String taxback_invoice_guid=(String)httpSession.getAttribute("taxback_invoice_guid");
		postData.put("guid", taxback_invoice_guid);
				
		String[] inc_nos = request.getParameterValues("inc_nos");
		if(inc_nos != null && inc_nos.length > 0){
			for(int i=0;i<inc_nos.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "inc_no"};
				// 加入sp的名称
				postData.put("spName", "fc_declare_taxback_item_temp_delete");					
				
				postData.put("inc_no", inc_nos[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
	 }
	
	
	/**
	* 新增退税发票明细临时数据页面
	* 
	* 
	*/
	@RequestMapping(value="/taxbackInvoiceItemTempAdd",method=RequestMethod.GET)
	public ModelAndView taxbackInvoiceItemTempAdd(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("fc/declareTaxbackInvoice/taxbackInvoiceItemAdd");
		String tableHeader = this.getTableHeader(httpSession,taxbackDetailSearchQueryHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
	    mv.addObject("queryId", taxbackDetailSearchQueryId);
	    mv.addObject("dcl_id", (String)postData.get("dcl_id"));
		return mv;
	}
	
	/**
	 * 获得退税发票明细临时中对应报关单明细数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getTaxbackInvoiceRelatedItemList")
	@ResponseBody
	public Object getTaxbackInvoiceRelatedItemList(@RequestParam String dcl_id,HttpSession httpSession){
		//放入GUID
		String taxback_invoice_guid=(String)httpSession.getAttribute("taxback_invoice_guid");
		Map postData = new HashMap();
		postData.put("dcl_id", dcl_id);
		postData.put("guid", taxback_invoice_guid);
		return this.getTableDataList(postData,taxbackDetailSearchQueryId);
	}
		
	/**
	* 新增退税发票明细临时数据
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/addTaxbackInvoiceItemTemp")
	@ResponseBody
	public Object addTaxbackInvoiceItemTemp(@RequestParam Map postData,HttpSession httpSession) {	
		//放入GUID
		String taxback_invoice_guid=(String)httpSession.getAttribute("taxback_invoice_guid");
		postData.put("guid", taxback_invoice_guid);
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
		          "unit_count",
		          "real_money",
		          "tax_rate",
		          "tax_money",
		          "taxback_rate",
		          "pre_taxback",     
		          "dcl_inc_no"};

		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_item_temp_new");
			
		int code = baseService.doCallSp(postData, paramNames, null);
			
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
	}
	

	/**
	* 新增退税发票
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/addDeclareInvoice")
	@ResponseBody
	public Object addTaxback(@RequestParam Map postData,HttpSession httpSession) {	
		//放入GUID
		String taxback_invoice_guid=(String)httpSession.getAttribute("taxback_invoice_guid");
		postData.put("guid", taxback_invoice_guid);
				
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());
		
		// 出参, 有顺序
		String returnNames[] = {"inv_id"};
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
		          "dcl_id",
		          "inv_no",
		          "input_code",
		          "input_name",
		          "total_real_money",
		          "detail_real_money",
		          "total_tax_money",
		          "detail_tax_money",
		          "detail_pre_taxback"};

		// 加入sp的名称
		postData.put("spName", "fc_declare_invoice_new");
			
		int code = baseService.doCallSp(postData, paramNames, returnNames);
			
		if (code != 0) {
				return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
	}
	
	/**
	 * 获得发票明细临时表汇总金额
	 * 
	 */
	@RequestMapping(value="/getDeclareInvoiceItemSum")
	@ResponseBody
	public Object getDeclareInvoiceItemSum(@RequestParam String guid){
		Map<String,Object> postData = new HashMap<String,Object>();
		postData.put("guid", guid);
		Map<String, Object> oneQuery = baseService.getOneQuery(declareInvoiceTempSumSearchQueryId, postData);
		return oneQuery;
	}
	
	
	/**
	* 删除发票
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/deleteDeclareInvoice")
	@ResponseBody
	public Object deleteDeclareInvoice(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		String[] inv_ids = request.getParameterValues("inv_ids");
		if(inv_ids != null && inv_ids.length > 0){
			for(int i=0;i<inv_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"inv_id", "input_code"};
				// 加入sp的名称
				postData.put("spName", "fc_declare_invoice_del");						
				
				postData.put("inv_id", inv_ids[i]);
				
				User user=(User)httpSession.getAttribute("user");
				postData.put("input_code", user.getAccount());

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
	@RequestMapping(value="/toDecalreInvoiceEdit",method=RequestMethod.GET)
    public ModelAndView toDecalreInvoiceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(declareInvoiceSearchQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("is_detail", (String)postData.get("is_detail"));
		mv.addObject("dcl_id", (String)postData.get("dcl_id"));
        mv.setViewName("fc/declareTaxbackInvoice/declareInvoiceEdit");
        
        // 假如 是应收发票, 放结算单明细
        String tableHeader = this.getTableHeader(httpSession,taxbackItemTempSearchQueryHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
	    mv.addObject("queryId", taxbackItemTempSearchQueryId);
        
 	    //单据修改准备
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"inv_id","guid"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_invoice_toUpdate");
		
		String taxback_invoice_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("taxback_invoice_guid", taxback_invoice_guid);
		postData.put("guid", taxback_invoice_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	* 修改发票
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/editDecalreInvoice")
	@ResponseBody
	public Object editDecalreInvoice(@RequestParam Map postData,HttpSession httpSession) {	
		//放入GUID
		String taxback_invoice_guid=(String)httpSession.getAttribute("taxback_invoice_guid");
		postData.put("guid", taxback_invoice_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
						"inv_id",
				        "dcl_id",
				        "inv_no",
				        "input_code",
				        "input_name",
				        "total_real_money",
				        "detail_real_money",
				        "total_tax_money",
				        "detail_tax_money",
				        "detail_pre_taxback"};

		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());

		// 加入sp的名称
		postData.put("spName", "fc_declare_invoice_update");
			
		int code = baseService.doCallSp(postData, paramNames, null);
			
		if (code != 0) {
				return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
	}
	
	/**
	 * 提交操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/sumbmitTaxbackInvoice")
	@ResponseBody
	public Object sumbmitTaxbackInvoice(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"dcl_id","submit_type","role","input_code","input_name"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_submit");
		
		User user=(User)httpSession.getAttribute("user");
		Role role=(Role)httpSession.getAttribute("defaultRole");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());
		postData.put("role", role.getApprove_role());
		postData.put("submit_type","1");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	* 复制发票
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/copyDeclareInvoice")
	@ResponseBody
	public Object copyDeclareInvoice(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		String[] inv_ids = request.getParameterValues("inv_ids");
		String[] dcl_id = request.getParameterValues("dcl_id");
//		System.out.println(dcl_id[0]);
		if(inv_ids != null && inv_ids.length > 0){
			for(int i=0;i<inv_ids.length;i++){
//				System.out.println(inv_ids[i]);
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"inv_id","dcl_id","input_code","input_name"};
				// 加入sp的名称
				postData.put("spName", "fc_declare_invoice_copy");						
				
				postData.put("inv_id", inv_ids[i]);
				postData.put("dcl_id", dcl_id[0]);
				
				User user=(User)httpSession.getAttribute("user");
				postData.put("input_code", user.getAccount());
				postData.put("input_name", user.getUserName());

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
	 }
	
	/**
	 * 退回操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/backTaxbackInvoice")
	@ResponseBody
	public Object backTaxbackInvoice(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"dcl_id","input_code"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_backtozd");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}

}
