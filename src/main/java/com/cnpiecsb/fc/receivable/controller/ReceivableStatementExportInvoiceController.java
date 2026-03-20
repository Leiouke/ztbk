package com.cnpiecsb.fc.receivable.controller;

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
 * 结算单外销查询相关控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/fc/receivable")
public class ReceivableStatementExportInvoiceController extends BaseServiceController {
	// 外销发票表头查询
	private int exportInvoiceQueryId = 8150001;
	private GridHeadConfig exportInvoiceGridHeadConfig;
	
	// 外销发票明细查询
	private int exportInvoiceItemQueryId = 8150002;
	private GridHeadConfig exportInvoiceItemGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public ReceivableStatementExportInvoiceController(){
		exportInvoiceGridHeadConfig = new GridHeadConfig(exportInvoiceQueryId,true,false,true,false);
		exportInvoiceGridHeadConfig.setOperatorWidth(100);
		
		exportInvoiceItemGridHeadConfig = new GridHeadConfig(exportInvoiceItemQueryId,true,false,false,false);
	}
	
	/**
	 * 结算单外销发票表头查询
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/exportInvoiceManage",method=RequestMethod.GET)
    public ModelAndView exportInvoiceManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/receivableStatementExportInvoice/exportInvoiceManage");
        String tableHeader = this.getTableHeader(httpSession, exportInvoiceGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", exportInvoiceQueryId);
        return mv;
    }	
	
	/**
	 * 获得动态列表数据-结算单外销发票表头查询
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getExportInvoiceManageList")
	@ResponseBody
	public Object getExportInvoiceManageList(@RequestBody Map postData, HttpSession httpSession){
		return this.getTableDataList(postData, exportInvoiceQueryId);
	}
	
	/**
	 * 结算单外销发票明细查询
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/exportInvoiceItem",method=RequestMethod.GET)
    public ModelAndView exportInvoiceItem(@RequestParam Map postData, HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/receivableStatementExportInvoice/exportInvoiceItem");
        
        Map<String, Object> oneQuery = baseService.getOneQuery(exportInvoiceQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		
        String tableHeader = this.getTableHeader(httpSession, exportInvoiceItemGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", exportInvoiceItemQueryId);
        return mv;
    }	
	
	/**
	 * 获得动态列表数据-结算单外销发票明细查询
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getExportInvoiceItemList")
	@ResponseBody
	public Object getExportInvoiceItemList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, exportInvoiceItemQueryId);
	}
}
