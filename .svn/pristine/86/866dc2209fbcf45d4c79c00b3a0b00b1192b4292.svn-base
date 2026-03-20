package com.cnpiecsb.fc.declare.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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

import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 导入界面
 */
@Controller
@RequestMapping("/fc/declare")
public class TaxImportController extends BaseServiceController{
	
	private int declareTaxImportSearchQueryId = 8001031;  //导入界面表头查询
	private GridHeadConfig declareTaxImportSearchQueryHeadConfig;
	private int declareTaxImportDetailSearchQueryId = 8001032;  //导入界面明细查询
	private GridHeadConfig declareTaxImportDetailSearchQueryHeadConfig;
	
	public TaxImportController(){
		declareTaxImportSearchQueryHeadConfig = new GridHeadConfig(declareTaxImportSearchQueryId,true,false,true,false);
		declareTaxImportSearchQueryHeadConfig.setOperatorWidth(80);
		declareTaxImportDetailSearchQueryHeadConfig = new GridHeadConfig(declareTaxImportDetailSearchQueryId,true,false,true,false);
		declareTaxImportDetailSearchQueryHeadConfig.setOperatorWidth(180);
	}
	
	/**
	 * 进入导入界面
	 */
	@RequestMapping(value="/taxImportManage")
    public ModelAndView taxImportManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,declareTaxImportSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", declareTaxImportSearchQueryId);
        mv.setViewName("fc/declareTaxImport/taxImportManage");
        return mv;
    }
	
	/**
	 * 获得导入界面信息
	 * @return
	 */
	@RequestMapping(value="/getTaxImportList")
	@ResponseBody
	public Object getTaxImportList(@RequestBody Map postData,HttpSession session) {
		Map<String,Object> map=this.getTableDataList(postData,declareTaxImportSearchQueryId);
		return map;
	}
	
	/**
	 * 新增退税导入
	 * 
	 * 
	 */
	@RequestMapping(value="/taxImportAdd",method=RequestMethod.GET)
    public ModelAndView taxImportAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/declareTaxImport/taxImportAdd");
        return mv;
    }
	
//	/**
//	 * 新增退税导入操作
//	 * 
//	 * param postData
//	 * return
//	 */
//	@RequestMapping(value="/addTaxImport")
//	@ResponseBody
//    public Object addTaxImport(@RequestParam Map postData,HttpSession httpSession) {		
//		// 入参, 注意按照顺序
//		String paramNames[] = {"input_code",
//		          "input_name",
//		          "r_count",      
//		         "tax_filename"};
//		// 出参, 有顺序
//		String returnNames[] = {"tax_id"};
//		// 加入sp的名称
//		postData.put("spName", "fc_declare_tax_import_new");
//		
//		User user=(User)httpSession.getAttribute("user");
//		postData.put("input_code", user.getAccount());
//		postData.put("input_name", user.getUserName());
//		
//		int code = baseService.doCallSp(postData, paramNames, returnNames);
//		
//		if (code != 0) {
//			return this.getAjaxResult(code);
//		}
//		
//		return "{\"success\":true}";
//    }
	
	
	/**
	 * 新增退税导入操作
	 * @return
	 * @throws IOException 
	 * @throws InvalidFormatException 
	 * @throws EncryptedDocumentException 
	 */
	@RequestMapping(value="/addTaxImport")
	@ResponseBody
	public Object addTaxImport(@RequestParam Map postData,HttpSession httpSession,@RequestParam("document")MultipartFile excel) throws EncryptedDocumentException, InvalidFormatException, IOException {
		String fileName = excel.getOriginalFilename();//获得文件名
		
		//新增表头
		// 入参, 注意按照顺序
		String paramNames[] = {"input_code",
		          "input_name",
		          "r_count",      
		         "tax_filename"};
		// 出参, 有顺序
		String returnNames[] = {"tax_id"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_tax_import_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());
		postData.put("tax_filename",fileName);
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		//新增明细
		String tax_id = (String)postData.get("tax_id");//获得新增表头返回的tax_id
		
		if(!excel.isEmpty()) {
			Workbook workbook = WorkbookFactory.create(excel.getInputStream());
			Sheet sheet = workbook.getSheetAt(0);  // 指代sheet1, 索引从0开始
			int rowNum = 0;
			int success=0;  // 成功的记录数
			Map<String, Object> map = new HashMap();
			map.put("tax_id", tax_id);
			for (rowNum = 8; rowNum <= sheet.getLastRowNum(); rowNum++){  // 行数，真实数据索引也从1开始
				Row row = sheet.getRow(rowNum);	
				Map<String, Object> itemMap = new HashMap();
				itemMap.put("tax_id", tax_id);
				for (int i = 0; i < 20; i++) {
					if (row == null) {
						break;
					}
					Cell cell = row.getCell(i);
					if (cell != null){
						switch(i){
							case 0:{//序号
								break;
							}
							case 1:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//申报年月
								itemMap.put("apply_month", cell.getStringCellValue().trim());break;}
							case 2:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//申报批次
								itemMap.put("apply_batchno", cell.getStringCellValue().trim());
								break;
							}	
							case 3:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//出口发票号
								itemMap.put("export_invoice_no", cell.getStringCellValue().trim());
								break;
							}
							case 4:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//关联号
								itemMap.put("related_id", cell.getStringCellValue().trim());
								break;
							}
							case 5:{//税种，无此参数
								break;
							}
							case 6:{//凭证种类，无次参数
								break;
							}
							case 7:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//进货凭证号
								itemMap.put("inv_p_no", cell.getStringCellValue().trim());
								break;
							}
							case 8:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//供货方纳税人识别号
								itemMap.put("factory_id", cell.getStringCellValue().trim());
								break;
							}
							case 9:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//开票日期
								itemMap.put("inv_date", cell.getStringCellValue().trim());
								break;
							}
							case 10:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//出口商品代码
								itemMap.put("product_code", cell.getStringCellValue().trim());
								break;
							}
							case 11:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//商品名称
								itemMap.put("product_name", cell.getStringCellValue().trim());
								break;
							}
							case 12:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//计量单位
								itemMap.put("product_unit", cell.getStringCellValue().trim());
								break;
							}
							case 13:{//商品数量
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("product_amount", cell.getStringCellValue().trim());
								break;
							}
							case 14:{//计税金额
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("sales_money", cell.getStringCellValue().trim());
								break;
							}
							case 15:{//征税率
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_rate", cell.getStringCellValue().trim());
								break;
							}
							case 16:{//退税率
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_drawback_rate", cell.getStringCellValue().trim());
								break;
							}
							case 17:{//可退税额
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_drawback", cell.getStringCellValue().trim());
								break;
							}
							case 18:{//退税时间
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_drawback_date", cell.getStringCellValue().trim());
								break;
							}
						}						
					}
				}
				int item_code = addOneTaxImportItem(itemMap);
				if(item_code == 0) {
					success++;
				} else {
					return this.getAjaxResult(item_code);
				}
			}
			
			// 最后执行后置
			addOneTaxImportItemAfter(map,httpSession);

			return "{\"success\":true}";
		}else{
			return "{\"success\":false}";
		}
	}
	
	
	
	/**
	 * 退税导入明细界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/taxImportItem", method=RequestMethod.GET)
    public ModelAndView politicalInquiryItem(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/declareTaxImport/taxImportItem");
        String tableHeader = this.getTableHeader(httpSession,declareTaxImportDetailSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", declareTaxImportDetailSearchQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-退税导入明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getTaxImportItemList")
	@ResponseBody
	public Object getTaxImportItemList(@RequestBody Map postData){
		return this.getTableDataList(postData, declareTaxImportDetailSearchQueryId);
	}
	
	/**
	 * 进入上传退税导入明细
	 * 
	 * @return
	 */
	@RequestMapping(value="/taxImportItemUpload") 
    public ModelAndView taxImportItemUpload(@RequestParam Map postData,HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/declareTaxImport/taxImportItemUpload");
        return mv;
    }
	
	/**
	 * 批量上传excell
	 * 
	 * @param httpSession
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws InvalidFormatException 
	 * @throws EncryptedDocumentException 
	 */
	@RequestMapping(value="/uploadTaxImportItem",method=RequestMethod.POST)
	@ResponseBody
    public Object uploadTaxImportItem(MultipartFile excel,HttpSession httpSession, HttpServletRequest request) throws EncryptedDocumentException, InvalidFormatException, IOException {
		if(!excel.isEmpty()) {
			Workbook workbook = WorkbookFactory.create(excel.getInputStream());
			Sheet sheet = workbook.getSheetAt(0);  // 指代sheet1, 索引从0开始
			int rowNum = 0;
			int success=0;  // 成功的记录数
			String tax_id = request.getParameter("tax_id");
			Map<String, Object> map = new HashMap();
			map.put("tax_id", tax_id);
			for (rowNum = 8; rowNum <= sheet.getLastRowNum(); rowNum++){  // 行数，真实数据索引也从1开始
				Row row = sheet.getRow(rowNum);	
				Map<String, Object> itemMap = new HashMap();
				itemMap.put("tax_id", tax_id);
				for (int i = 0; i < 20; i++) {
					if (row == null) {
						break;
					}
					Cell cell = row.getCell(i);
					if (cell != null){
						switch(i){
							case 0:{//序号
								break;
							}
							case 1:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//申报年月
								itemMap.put("apply_month", cell.getStringCellValue().trim());break;}
							case 2:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//申报批次
								itemMap.put("apply_batchno", cell.getStringCellValue().trim());
								break;
							}	
							case 3:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//出口发票号
								itemMap.put("export_invoice_no", cell.getStringCellValue().trim());
								break;
							}
							case 4:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//关联号
								itemMap.put("related_id", cell.getStringCellValue().trim());
								break;
							}
							case 5:{//税种，无此参数
								break;
							}
							case 6:{//凭证种类，无次参数
								break;
							}
							case 7:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//进货凭证号
								itemMap.put("inv_p_no", cell.getStringCellValue().trim());
								break;
							}
							case 8:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//供货方纳税人识别号
								itemMap.put("factory_id", cell.getStringCellValue().trim());
								break;
							}
							case 9:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//开票日期
								itemMap.put("inv_date", cell.getStringCellValue().trim());
								break;
							}
							case 10:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//出口商品代码
								itemMap.put("product_code", cell.getStringCellValue().trim());
								break;
							}
							case 11:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//商品名称
								itemMap.put("product_name", cell.getStringCellValue().trim());
								break;
							}
							case 12:{
								cell.setCellType(Cell.CELL_TYPE_STRING);//计量单位
								itemMap.put("product_unit", cell.getStringCellValue().trim());
								break;
							}
							case 13:{//商品数量
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("product_amount", cell.getStringCellValue().trim());
								break;
							}
							case 14:{//计税金额
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("sales_money", cell.getStringCellValue().trim());
								break;
							}
							case 15:{//征税率
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_rate", cell.getStringCellValue().trim());
								break;
							}
							case 16:{//退税率
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_drawback_rate", cell.getStringCellValue().trim());
								break;
							}
							case 17:{//可退税额
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_drawback", cell.getStringCellValue().trim());
								break;
							}
							case 18:{//退税时间
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("tax_drawback_date", cell.getStringCellValue().trim());
								break;
							}
						}						
					}
				}
				int code = addOneTaxImportItem(itemMap);
				if(code == 0) {
					success++;
				} else {
					return this.getAjaxResult(code);
				}
			}
			
			// 最后执行后置
			int after_code = addOneTaxImportItemAfter(map,httpSession);
			
			if(after_code == 0) {
				return "{\"success\":true}";
			} else {
				return this.getAjaxResult(after_code);
			}
		}else{
			return "{\"success\":false}";
		}
	}
	
	/**
	 * 表新增单条明细-导入
	 * 
	 * param postData
	 * return
	 */
    private int addOneTaxImportItem(Map postData){
    	// 入参, 注意按照顺序
		String paramNames[] = {"tax_id",
		          "related_id",
		          "apply_month",
		          "apply_batchno",
		          "export_invoice_no",
		          "export_date",
		          "dcl_no",
		          "inv_p_no",
		          "factory_id",
		          "inv_date",
		          "product_code",
		          "product_name",
		          "product_unit",
		          "product_amount",
		          "sales_money",
		          "tax_rate",
		          "tax_drawback_rate",
		          "tax_drawback",
		          "tax_drawback_date"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_tax_import_item_new");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		return code;
    }

    
    /**
	 * 插入明细后置
	 * 
	 * param postData
	 * return
	 */
    private int addOneTaxImportItemAfter(Map postData,HttpSession httpSession){
    	// 入参, 注意按照顺序
		String paramNames[] = {"tax_id","input_code"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_tax_import_item_after");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		return code;
    }
    
    /**
	 * 修改可退税额页面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/taxImportItemUpdate", method=RequestMethod.GET)
    public ModelAndView taxImportItemUpdate(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/declareTaxImport/taxImportItemUpdate");
        return mv;
    }
	
	/**
	 * 修改可退税额
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/taxImportItemUpdateDeal")
	@ResponseBody
   public Object taxImportItemUpdateDeal(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"tax_id",
		          "item_inc_no",
		          "input_code",      
		         "tax_drawback"};

		// 加入sp的名称
		postData.put("spName", "fc_declare_tax_import_item_update");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
   }
	
	/**
	* 删除该退税信息导入
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/deleteTaxImport")
	@ResponseBody
	public Object deleteTaxImport(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"tax_id", "input_code"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_tax_import_del");					
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());

		int code = baseService.doCallSp(postData, paramNames, null);
						
		if (code != 0) {
			return this.getAjaxResult(code);
		}	
		
		return "{\"success\":true}";
	 }

}
