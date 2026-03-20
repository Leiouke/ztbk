package com.cnpiecsb.bd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.bd.util.InvoiceUtil;
import com.cnpiecsb.common.util.GuidUtil;
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/bk/bd")
public class qkInvoiceController extends ZtbkServiceController {
	private int invoiceManageQueryId = 5500001;	
	private GridHeadConfig invoiceManageGridHeadConfig;
	
	private int invoiceOneQueryId = 5500001;
	
	private int invoiceDetailQueryId = 10000017;	
	private GridHeadConfig invoiceAddDetailHeadConfig;	
	private GridHeadConfig invoiceEditDetailHeadConfig;
	//private GridHeadConfig invoiceQkDetailHeadConfig;
	
	private int invoiceItemPullQueryId = 10000015;
	private GridHeadConfig invoiceItemPullHeadConfig;
	//private GridHeadConfig invoiceItemChoosePullHeadConfig;
	
	// 进货发票核销数据查询
	private int invoiceBdSubQueryId = 10000016;	
	private GridHeadConfig invoiceBdSubQueryHeadConfig;
	
	//进货发票核销刊期明细
	private int invoiceOffsetDetailQueryId = 10000050;	
	private GridHeadConfig invoiceOffsetDetailHeadConfig;	

	
	// 商品信息查询
	private int productManageQueryId = 10000001;	
	private GridHeadConfig productManageQueryHeadConfig;
	
	// 代理进货发票明细
	private int invoiceAgentDetailQueryId = 10000053;	
	private GridHeadConfig invoiceAddAgentDetailHeadConfig;	
	private GridHeadConfig invoiceEditAgentDetailHeadConfig;
	
	private InvoiceUtil invoiceutil =new InvoiceUtil();
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public qkInvoiceController(){
		invoiceManageGridHeadConfig = new GridHeadConfig(invoiceManageQueryId,true,false,true,false);
		invoiceManageGridHeadConfig.setOperatorWidth(120);
		
		invoiceAddDetailHeadConfig=new GridHeadConfig(invoiceDetailQueryId,true,true,true,false);
		invoiceEditDetailHeadConfig=new GridHeadConfig(invoiceDetailQueryId,true,false,true,false);
		//invoiceQkDetailHeadConfig =new GridHeadConfig(invoiceDetailQueryId,true,false,false,false);
		
		invoiceItemPullHeadConfig=new GridHeadConfig(invoiceItemPullQueryId,true,true,false,false);
		//invoiceItemChoosePullHeadConfig=new GridHeadConfig(invoiceItemPullQueryId,false,false,true,false);
		
		invoiceBdSubQueryHeadConfig = new GridHeadConfig(invoiceBdSubQueryId,true,false,false,false);
		//invoiceBdSubQueryHeadConfig.setOperatorWidth(100);
		
		invoiceOffsetDetailHeadConfig = new GridHeadConfig(invoiceOffsetDetailQueryId,true,false,true,false);
		
		productManageQueryHeadConfig = new GridHeadConfig(productManageQueryId,true,true,false,false);
		
		invoiceAddAgentDetailHeadConfig=new GridHeadConfig(invoiceAgentDetailQueryId,true,true,true,false);
		invoiceEditAgentDetailHeadConfig=new GridHeadConfig(invoiceAgentDetailQueryId,true,true,true,false);
	}
	/**
	 * 进货发票 by fjs
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/invoiceManage",method=RequestMethod.GET)
    public ModelAndView invoiceManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/invoiceManage");
        String tableHeader = this.getTableHeader(httpSession,invoiceManageGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceManageQueryId);
        return mv;
    }
	/**
	 * 获得动态列表数据-进货发票管理 by fjs
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInvoiceManageList")
	@ResponseBody
	public Object getInvoiceManageList(@RequestBody Map postData){
		String inv_nos="";
   		if(!postData.get("inv_nos").toString().equals("")&&postData.get("sortName")==null){
   			postData.put("sortName", baseService.getInContentOrderby(postData.get("inv_nos").toString(), "inv_no"));
   		}
		return this.getTableDataList(postData,invoiceManageQueryId);
	}
	
	/**
	 * 新增蓝票页面 by fjs
	 * 
	 * 
	 */
	@RequestMapping(value="/invoiceAdd",method=RequestMethod.GET)
    public ModelAndView invoiceAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/invoiceAdd");
        
        String invoice_dh_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
        
        String tableHeader = this.getTableHeader(httpSession,invoiceAddDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceDetailQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-新增蓝票明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInvoiceAddItemList")
	@ResponseBody
	public Object getInvoiceAddItemList(@RequestBody Map postData,HttpSession httpSession){
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		return this.getTableDataList(postData,invoiceDetailQueryId);
	}	
	
	/**
	 * 修改明细操作
	 * 
	 * @param dynamicColumns
	 * @return
	 */
	@RequestMapping(value="/updateInvoiceDhPeriodTempItem")
	@ResponseBody
	public Object updateInvoiceDhPeriodTempItem(@RequestParam Map postData, HttpSession httpSession) {
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","inc_no","h_amount","jh_price"};
		// 加入sp的名称
		postData.put("spName", "n_np_invoice_dh_period_temp_update");
		
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
	}
	
	/**
	 * 新增蓝票操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addInvoiceDh")
	@ResponseBody
    public Object addInvoiceDh(@RequestParam Map postData,HttpSession httpSession) {	
		String invoice_dh_guid = (String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","inv_no","f_id","invoice_class","is_red","inv_date","currency","total_money","fee_traffic","fee_handling","memo","o_id_input","invoice_family","is_fh","agent_c_id","agent_real_money"};
		// 出参, 有顺序
		String returnNames[] = {"inv_id"};
		// 加入sp的名称
		postData.put("spName", "u_business_invoice_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 新增和修改返回操作 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/returnInvoiceDh")
	@ResponseBody
    public Object returnInvoiceDh(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"guid"};
		// 加入sp的名称
		postData.put("spName", "u_business_invoice_return");	// ***存储过程需要修改！！！！！！！！！！！***  
		
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);	
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		httpSession.setAttribute("invoice_dh_guid", "");
		return "{\"success\":true}";
    }
	
	/**
	 * 蓝票修改页面      by fjs
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/invoiceEdit",method=RequestMethod.GET)
    public ModelAndView invoiceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(invoiceOneQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("bd/invoice/invoiceEdit");
        
        String tableHeader = this.getTableHeader(httpSession,invoiceEditDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceDetailQueryId);
        
        // 入参, 注意按照顺序
 		String paramNames[] = {"inv_id", "guid"};
 		// 加入sp的名称
 		postData.put("spName", "n_np_invoice_dh_period_temp_todata");
 		
 		String invoice_dh_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
 		postData.put("guid", invoice_dh_guid);
 		
 		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	 * 获得动态列表数据-修改发票明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInvoiceEditItemList")
	@ResponseBody
	public Object getInvoiceEditItemList(@RequestBody Map postData,HttpSession httpSession){
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		return this.getTableDataList(postData,invoiceDetailQueryId);
	}
	
	/**
	 * 查询是否存在发票号
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/hasInviceNo")
	@ResponseBody
    public Object hasInviceNo(@RequestParam Map postData,HttpSession httpSession){
		Map<String, Object> oneQuery = baseService.getOneQuery(5500002, postData);
		if(oneQuery.get("count").equals(0))
			return "{\"success\":true}";
		else{
			return "{\"success\":false}";
		}
    }
	
	/**
	 * 修改操作 
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editInvoice")
	@ResponseBody
    public Object editInvoice(@RequestParam Map postData,HttpSession httpSession){
		//修改保存SP调用
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"inv_id","guid","inv_no","f_id","invoice_class","is_red","inv_date","currency","total_money","fee_traffic","fee_handling","memo","o_id_modify","invoice_family","is_fh","agent_c_id","agent_real_money"};
		// 加入sp的名称
		postData.put("spName", "u_business_invoice_update");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_modify", user.getAccount());
		
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 找到对应的申汇单, 假如有的话
		/*Map<String, Object> oneQuery = baseService.getOneQuery(5500005, postData);
		if (oneQuery != null) {
			String fh_id = oneQuery.get("fh_id").toString();
			
			// 先产生申汇报表
			paramNames = new String[]{"fh_id"};
			// 加入sp的名称
			postData.put("spName", "u_finance_fhsh_item_classify");
			postData.put("fh_id", fh_id);
			
			code = baseService.doCallSp(postData, paramNames, null);
			
			if (code != 0) {
				return this.getAjaxResult(code);
			}
			
			// 再补充付汇信息
			postData.put("spName", "u_finance_fhsh_fw_item_classify");
			code = baseService.doCallSp(postData, paramNames, null);
			
			if (code != 0) {
				return this.getAjaxResult(code);
			}
		}*/
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除发票操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteInvoiceDh")
	@ResponseBody
    public Object deleteInvoiceDh(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id","o_id_destroy", "guid"};
		// 加入sp的名称
		postData.put("spName", "u_business_invoice_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_destroy", user.getAccount());
		
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
        
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改运费操作
	 * 
	 * param postData
	 * return
	 */
	//***不确定是否需要***
	@RequestMapping(value="/editTrafficFee")
	@ResponseBody
    public Object editTrafficFee(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id","fee_traffic"};
		// 加入sp的名称
		postData.put("spName", "u_business_invoice_update_fee_traffic");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 红票新增页面
	 * 
	 * 
	 */
	@RequestMapping(value="/redInvoiceAdd",method=RequestMethod.GET)
    public ModelAndView redInvoiceAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/redInvoiceAdd");
        
        String invoice_dh_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
        String tableHeader = this.getTableHeader(httpSession,invoiceAddDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceDetailQueryId);
        return mv;
    }
	
	/**
	 * 红票修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/redInvoiceEdit",method=RequestMethod.GET)
    public ModelAndView redInvoiceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(invoiceOneQueryId, postData);		
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("bd/invoice/redInvoiceEdit");
        
        String tableHeader = this.getTableHeader(httpSession,invoiceEditDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceDetailQueryId);
        
        // 入参, 注意按照顺序
 		String paramNames[] = {"inv_id", "guid"};
 		// 加入sp的名称
 		postData.put("spName", "n_np_invoice_dh_period_temp_todata");
 		
 		String invoice_dh_guid=GuidUtil.create32Guid();
         httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
 		postData.put("guid", invoice_dh_guid);
 		
 		int code = baseService.doCallSp(postData, paramNames, null);
        return mv;
    }
	
	/**
	 * 修改红票表头页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/redInvoiceEditTitle",method=RequestMethod.GET)
    public ModelAndView redInvoiceEditTitle(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(invoiceOneQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("bd/invoice/redInvoiceEditTitle");		
        return mv;
    }
	
	/**
	 * 引入明细页面   by fjs
	 * 
	 * 
	 */
	@RequestMapping(value="/invoiceItemPull",method=RequestMethod.GET)
    public ModelAndView invoiceDhItemPull(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/invoiceItemPull");
        String tableHeader_result = this.getTableHeader(httpSession,invoiceItemPullHeadConfig);
		mv.addObject("tableHeader_result", tableHeader_result);
		//String tableHeader_pull_in = this.getTableHeader(httpSession,invoiceItemChoosePullHeadConfig);
		//mv.addObject("tableHeader_pull_in", tableHeader_pull_in);
		mv.addObject("queryId", invoiceItemPullQueryId);
        return mv;
    }
	
	/**
   	 * 获得动态列表数据-引入发票    by fjs
   	 * 
   	 * param postData
   	 * return
   	 */
   	@RequestMapping(value="/getInvoicePullList")
   	@ResponseBody
   	public Object getInvoicePullList(@RequestBody Map postData,HttpSession httpSession){
   		//String isbns="";
   		//String item_codes="";
   		//if(!postData.get("h_isbns").toString().equals("")&&postData.get("sortName")==null){
   			//postData.put("sortName", baseService.getInContentOrderby(postData.get("h_isbns").toString(), "h_isbn"));
   			/*isbns=postData.get("h_isbns").toString();
   			isbns=isbns.replaceAll("\t|\r\n", "','");
   	   		isbns="'"+isbns+"'";*/
   		//}
   		//if(!postData.get("item_codes").toString().equals("")){
   			//postData.put("sortName", baseService.getInContentOrderby(postData.get("item_codes").toString(), "item_code"));
   			/*item_codes=postData.get("item_codes").toString();
   			item_codes=item_codes.replaceAll("\t|\r|\n", "','");
   	   		item_codes="'"+item_codes+"'";*/
   		//}
   		return this.getTableDataList(postData,invoiceItemPullQueryId);
   	}
   	
   	/**
	 * 引入发票明细操作 by fjs
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/pullInvoiceItem")
	@ResponseBody
    public Object pullInvoiceItem(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession,HttpServletRequest request){
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		if(postData!=null&&postData.size()>0){
			for(Map<String,Object> kp_map:postData){				
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"qk_id","period_id","guid"};
				// 加入sp的名称
				kp_map.put("spName", "n_np_invoice_dh_period_temp_new");				
				kp_map.put("guid", invoice_dh_guid);			
				int code = baseService.doCallSp(kp_map, paramNames, null);					
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除明细操作 by fjs
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteInvoiceItem")
	@ResponseBody
    public Object deleteInvoiceItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){	
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		
		String[] inc_no_ids=request.getParameterValues("inc_no_ids");
		if(inc_no_ids!=null && inc_no_ids.length>0){
			for(int i=0;i<inc_no_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "inc_no"};
				// 加入sp的名称
				postData.put("spName", "n_np_invoice_dh_period_temp_delete");					
				
				postData.put("inc_no", inc_no_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
    }
	
	/**
	 * 刊期新增页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/invoiceInstanceAdd",method=RequestMethod.GET)
    public ModelAndView invoiceInstanceAdd(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("bd/invoice/invoiceInstanceAddManage");
		
        return mv;
    }
	
	/**
	 * 新增刊期单明细选择页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/invoiceInstanceItemSelect",method=RequestMethod.GET)
    public ModelAndView invoiceInstanceItemSelect(HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("bd/invoice/invoiceInstanceItemSelectManage");
        String tableHeader = this.getTableHeader(httpSession,productManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", productManageQueryId);
        
        return mv;
    }
	
	/**
	 * 刊期新增操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/addProductInstance")
	@ResponseBody
    public Object addProductInstance(@RequestParam Map postData,HttpSession httpSession){
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("o_id_input", user.getAccount());
		
		// 入参, 注意按照顺序
		String paramNames[] = {"qk_id","period_id","is_stop","mem","o_id_input","period_name","instance_tm",
				"instance_price","period_name_jh","start_sd_date","end_sd_date","end_bd_date","pub_date"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_product_instance_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	
	/**
	 * 到货发票提交
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/verifyInvoiceDh")
	@ResponseBody
    public Object deleteAddress(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id","is_verify","o_id_verify"};		// 出参, 有顺序
		
		// 加入sp的名称
		postData.put("spName", "n_np_invoice_dh_verify");
		
		User user=(User)httpSession.getAttribute("user");		
		postData.put("o_id_verify", user.getAccount());
		
		postData.put("is_verify", 1);//默认为1，提交
		
		int code = baseService.doCallSp(postData, paramNames, null);
		if (code != 0) {
			return this.getAjaxResult(code);
		}		
		return "{\"success\":true}";
    }
	
	
	
	/**
	 * 核销页面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/invoiceOffset",method=RequestMethod.GET)
    public ModelAndView invoiceOffset(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> oneQuery = baseService.getOneQuery(invoiceOneQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("bd/invoice/invoiceOffset");
        
        String tableHeader = this.getTableHeader(httpSession,invoiceOffsetDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceOffsetDetailQueryId);				
			
		return mv;
    }
	
	/**
	 * 获得动态列表数据-发票核销数据明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInvoiceOffsetItemList")
	@ResponseBody
	public Object getInvoiceOffsetItemList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,invoiceOffsetDetailQueryId);
	}
	
	/**
	 * 发货核销页面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/invoiceSubOffset",method=RequestMethod.GET)
    public ModelAndView invoiceSubOffset(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
       
        mv.setViewName("bd/invoice/invoiceSubOffset");
        
        String tableHeader = this.getTableHeader(httpSession,invoiceBdSubQueryHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceBdSubQueryId);		
//		mv.addObject("ItemExclusiveCode", postData.get("ItemExclusiveCode"));
//		mv.addObject("inv_id", postData.get("inv_id"));
		
		Map<String, Object> oneQuery = baseService.getOneQuery(invoiceOffsetDetailQueryId, postData);
		mv.addObject("oneJson_offset", JsonUtil.mapToString(oneQuery));
		
		
		String invoice_dh_offset_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_offset_guid", invoice_dh_offset_guid);
        
        postData.put("guid", invoice_dh_offset_guid);
        
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id", "guid","ItemExclusiveCode"};
	    
		// 核销明细插入临时表
		postData.put("spName", "n_np_invoice_dh_sub_temp_getdata"); 		
		int code = baseService.doCallSp(postData, paramNames, null);
			
		return mv;
    }
	
	
	/**
	 * 获得动态列表数据-发票核销到货数据明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInvoiceOffsetItemSubList")
	@ResponseBody
	public Object getInvoiceOffsetItemSubList(@RequestBody Map postData,HttpSession httpSession){
		String invoice_dh_offset_guid=(String)httpSession.getAttribute("invoice_dh_offset_guid");
		postData.put("guid", invoice_dh_offset_guid);
		return this.getTableDataList(postData,invoiceBdSubQueryId);
	}
	
	/**
	 * 修改发票核销到货数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/updateInvoiceOffsetItemSubTemp")
	@ResponseBody
    public Object updateInvoiceOffsetItemSubTemp(@RequestParam Map postData,HttpSession httpSession) {	
		String invoice_dh_offset_guid=(String)httpSession.getAttribute("invoice_dh_offset_guid");
		postData.put("guid", invoice_dh_offset_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid", "inc_no","jh_amount"};
		// 加入sp的名称
		postData.put("spName", "n_np_invoice_dh_sub_temp_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	
	
	/**
	 * 核销完成操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/offsetInvoice")
	@ResponseBody
    public Object offsetInvoice(@RequestBody Map postData, HttpSession httpSession) {
		String invoice_dh_offset_guid=(String)httpSession.getAttribute("invoice_dh_offset_guid");
		postData.put("guid", invoice_dh_offset_guid);
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_offset", user.getAccount());
		
		// 发票核销
	    String paramNames[] = invoiceutil.getParamNames_offset();
		postData.put("spName", invoiceutil.getSpName_offset());

		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 新增代理蓝票页面 by fjs
	 * 
	 * 
	 */
	@RequestMapping(value="/agentInvoiceAdd",method=RequestMethod.GET)
    public ModelAndView agentInvoiceAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/agentInvoiceAdd");
        
        String invoice_dh_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
        
        String tableHeader = this.getTableHeader(httpSession,invoiceAddAgentDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceAgentDetailQueryId);
        return mv;
    }
	

	/**
	 * 获得动态列表数据-新增蓝票明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInvoiceAddAgentItemList")
	@ResponseBody
	public Object getInvoiceAddAgentItemList(@RequestBody Map postData,HttpSession httpSession){
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		return this.getTableDataList(postData,invoiceAgentDetailQueryId);
	}	
	
	/**
	 * 新增代理明细页面
	 * 
	 * 
	 */
	@RequestMapping(value="/agentInvoiceItemAdd",method=RequestMethod.GET)
    public ModelAndView agentInvoiceItemAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/agentInvoiceItemAdd");
        return mv;
    }
	
	/**
	 * 新增代理明细
	 * 
	 * 
	 */
	@RequestMapping(value="/addInvoiceAgentItem")
	@ResponseBody
    public Object addInvoiceAgentItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        String invoice_dh_guid = (String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","mail_code","qk_name","h_amount","jh_price","memo"};
		// 加入sp的名称
		postData.put("spName", "n_np_invoice_dh_agent_item_temp_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 删除明细操作 by fjs
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteInvoiceAgentItem")
	@ResponseBody
    public Object deleteInvoiceAgentItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){	
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		
		String[] item_ids=request.getParameterValues("item_ids");
		if(item_ids!=null && item_ids.length>0){
			for(int i=0;i<item_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "item_id"};
				// 加入sp的名称
				postData.put("spName", "n_np_invoice_dh_agent_item_temp_delete");					
				
				postData.put("item_id", item_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
    }
	
	/**
	 * 编辑代理明细
	 */
	@RequestMapping(value="/agentInvoiceItemEdit")
    public ModelAndView agentInvoiceItemEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
		 ModelAndView mv = new ModelAndView();        
		 String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		 postData.put("guid", invoice_dh_guid);
	     // 单记录查询
	     Map<String, Object> oneQuery = baseService.getOneQuery(invoiceAgentDetailQueryId, postData);
			
		 ObjectMapper mapper = new ObjectMapper();
		 mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
	     mv.setViewName("bd/invoice/agentInvoiceItemEdit");

	     return mv;
    }
	
	/**
	 * 获得动态列表数据-编辑蓝票明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getInvoiceEditAgentItemList")
	@ResponseBody
	public Object getInvoiceEditAgentItemList(@RequestBody Map postData,HttpSession httpSession){
		String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		return this.getTableDataList(postData,invoiceAgentDetailQueryId);
	}	
	
	/**
	 * 修改代理明细--操作
	 * 
	 * 
	 */
	@RequestMapping(value="/editInvoiceAgentItem")
	@ResponseBody
    public Object editInvoiceAgentItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        String invoice_dh_guid = (String)httpSession.getAttribute("invoice_dh_guid");
		postData.put("guid", invoice_dh_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","item_id","mail_code","qk_name","h_amount","jh_price","memo"};
		// 加入sp的名称
		postData.put("spName", "n_np_invoice_dh_agent_item_temp_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 代理蓝票修改页面      by fjs
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/agentInvoiceEdit",method=RequestMethod.GET)
    public ModelAndView agentInvoiceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(invoiceOneQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("bd/invoice/agentInvoiceEdit");
        
        String tableHeader = this.getTableHeader(httpSession,invoiceEditAgentDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceAgentDetailQueryId);
        
        // 入参, 注意按照顺序
 		String paramNames[] = {"inv_id", "guid"};
 		// 加入sp的名称
 		postData.put("spName", "n_np_invoice_dh_agent_item_temp_todata");
 		
 		String invoice_dh_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
 		postData.put("guid", invoice_dh_guid);
 		
 		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	 * 进入上传代理发票明细
	 * 
	 * @return
	 */
	@RequestMapping(value="/agentInvoiceItemUpload") 
    public ModelAndView agentInvoiceItemUpload(@RequestParam Map postData,HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/agentInvoiceItemUpload");
        return mv;
    }
	
	/**
	 * 批量上传excel
	 * 
	 * @param httpSession
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws InvalidFormatException 
	 * @throws EncryptedDocumentException 
	 */
	@RequestMapping(value="/uploadAgentInvoiceItem",method=RequestMethod.POST)
	@ResponseBody
    public Object uploadAgentInvoiceItem(MultipartFile excel,HttpSession httpSession, HttpServletRequest request)throws EncryptedDocumentException, InvalidFormatException, IOException {
		if(!excel.isEmpty()){
			Workbook workbook = WorkbookFactory.create(excel.getInputStream());
			Sheet sheet = workbook.getSheetAt(0);  // 指代sheet1, 索引从0开始
			int rowNum = 0;
			int success=0;
			List<Map> excelData = new ArrayList<Map>();
			// 先产生一个guid
			String invoice_dh_guid=(String)httpSession.getAttribute("invoice_dh_guid");
			String value="";
			
			String errorMsg = "";
			for (rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++){  // 行数，真实数据索引也从1开始
				Row row = sheet.getRow(rowNum);	
				Map<String, Object> agent_invoice_itemMap = new HashMap();
				agent_invoice_itemMap.put("guid", invoice_dh_guid);
				//sd_itemMap.put("sort_number", rowNum);
				// 假如isbn列为空 跳到下一行
				//if (row.getCell(3) == null) {
					//continue;
				//}
				for (int i = 0; i < 5; i++) {
					Cell cell = row.getCell(i);
					if (cell != null){
						switch(i){
							case 0:{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								agent_invoice_itemMap.put("mail_code", cell.getStringCellValue().trim());break;}
							case 1:{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								agent_invoice_itemMap.put("qk_name", cell.getStringCellValue().trim());break;}
							case 2:{agent_invoice_itemMap.put("h_amount", cell.getNumericCellValue());break;}
							case 3:{agent_invoice_itemMap.put("jh_price", cell.getNumericCellValue());break;}
							case 4:{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								agent_invoice_itemMap.put("memo", cell.getStringCellValue().trim());break;}
							
						}						
					}
				}
				if(addOneAgentInvoiceItem(agent_invoice_itemMap)==0) {
					success++;
				} else {
					//errorMsg += "isbn" + agent_invoice_itemMap.get("h_isbn") + " import error！\\r\\n";
					errorMsg += "刊号" + agent_invoice_itemMap.get("mail_code") + " import error！\\r\\n";
				}
			}
			return "{\"success\":true, " + "\"errorMsg\":\"" + errorMsg +"\"}";
		}else{	
			return "{\"success\":false}";
		}
	}
	
	/**
	 * 新增单条明细
	 * 
	 * param postData
	 * return
	 */
    public int addOneAgentInvoiceItem(Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","mail_code","qk_name","h_amount","jh_price","memo"};
		// 加入sp的名称
		postData.put("spName", "n_np_invoice_dh_agent_item_temp_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		return code;
    }
    
    /**
	 * 新增代理红票页面 by fjs
	 * 
	 * 
	 */
	@RequestMapping(value="/redAgentInvoiceAdd",method=RequestMethod.GET)
    public ModelAndView redAgentInvoiceAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/invoice/redAgentInvoiceAdd");
        
        String invoice_dh_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
        
        String tableHeader = this.getTableHeader(httpSession,invoiceAddAgentDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceAgentDetailQueryId);
        return mv;
    }
	
	/**
	 * 代理红票修改页面      by fjs
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/redAgentInvoiceEdit",method=RequestMethod.GET)
    public ModelAndView redAgentInvoiceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(invoiceOneQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("bd/invoice/redAgentInvoiceEdit");
        
        String tableHeader = this.getTableHeader(httpSession,invoiceEditAgentDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceAgentDetailQueryId);
        
        // 入参, 注意按照顺序
 		String paramNames[] = {"inv_id", "guid"};
 		// 加入sp的名称
 		postData.put("spName", "n_np_invoice_dh_agent_item_temp_todata");
 		
 		String invoice_dh_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("invoice_dh_guid", invoice_dh_guid);
 		postData.put("guid", invoice_dh_guid);
 		
 		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
    
	/**
	 * 分发数据（关联报订表）页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	/*
	@RequestMapping(value="/invoiceBdSub",method=RequestMethod.GET)
    public ModelAndView invoiceBdSub(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		mv.setViewName("bd/invoice/invoiceBdSub");
		String tableHeader = this.getTableHeader(httpSession,invoiceBdSubQueryHeadConfig);
		mv.addObject("inv_id", (String)postData.get("inv_id"));
		mv.addObject("ItemExclusiveCode", (String)postData.get("ItemExclusiveCode"));
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", invoiceBdSubQueryId);
		
        return mv;
    }
	*/
	/**
	 * 获得关联报订临时表数据
	 * 
	 * @return
	 */
	/*
	@RequestMapping(value="/getinvoiceBdSubTempList")
	@ResponseBody
	public Object getinvoiceBdSubTempList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, invoiceBdSubQueryId);
	}
	*/
}
