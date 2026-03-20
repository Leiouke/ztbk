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
 * 结算单直接开发票
 * 这个结算单直接开发票功能作废不用了
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np")
public class StatementInvoiceController extends ZtbkServiceController {
	// 结算单表头查询
	private int statementInvoiceManageQueryId = 5130001;	
	private GridHeadConfig statementInvoiceManageQueryHeadConfig;
	
	private int statementInvoiceOneQueryId = 5130001;
	
	public StatementInvoiceController(){
		statementInvoiceManageQueryHeadConfig = new GridHeadConfig(statementInvoiceManageQueryId,true,true,true,false);
//		statementInvoiceManageQueryHeadConfig.setOperatorWidth(120);
	}
	
	/**
	 * 进入结算单开票界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/statementInvoiceManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView statementInvoiceManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/statementInvoice/statementInvoiceManage");
        String tableHeader = this.getTableHeader(httpSession,statementInvoiceManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", statementInvoiceManageQueryId);
        return mv;
    }
	
	/**
	 * 获得结算单数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getStatementInvoiceList")
	@ResponseBody
	public Object getStatementInvoiceList(@RequestBody Map postData){
		return this.getTableDataList(postData,statementInvoiceManageQueryId);
	}
	
    /**
     * 进入开票界面
     * 
     * @param postData
     * @param httpSession
     * @return
     * @throws JsonProcessingException
     */
	@RequestMapping(value="/toStatementKp",method=RequestMethod.GET)
    public ModelAndView toStatementKp(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException {  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(statementInvoiceOneQueryId, postData);	
		oneQuery.put("c_id", oneQuery.get("custom_f_id"));
		oneQuery.remove("kp_no");
		
		String kp_type = oneQuery.get("kp_type").toString();
		if (kp_type.equals("0")) {
			oneQuery.put("invoice_type", "0002");  // 开普通发票
		} else if (kp_type.equals("1")) {
			oneQuery.put("invoice_type", "0003");  // 开增值税发票
		}
		
		oneQuery.remove("memo");
		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/statementInvoice/statementInvoice");
		
        return mv;
    }
	
	/**
	 * 开票操作
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/statementKp")
	@ResponseBody
    public Object statementKp(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"statement_no", "kp_no", "invoice_type", "tax_rate", 
				"tax_money", "kp_date", "is_item", "memo", "o_id_input"};
		String returnNames[] = new String[]{"kp_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_invoice_kp_statement_direct");
		postData.put("o_id_input", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		paramNames = new String[]{"kp_id", "is_to_edit"};
		postData.put("is_to_edit", 0);
		postData.put("spName", "u_finance_invoice_kp_statement_item_calculate");
		code = baseService.doCallSp(postData, paramNames, null);
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
}
