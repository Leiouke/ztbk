package com.cnpiecsb.np.print.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cnpiecsb.common.viewobject.AjaxResult;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.fc.print.utils.PrintUtil;
import com.cnpiecsb.system.entity.User;

/**
 * 报刊申汇单导出controller
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np/print")
public class FinanceFhshPrintController extends ZtbkServiceController{
	// 打印配置单条查询
	private int printCofigOneQueryId = 1030001;
	
	// 外汇付款通知单
	private String financeFhshPrintNoticeFileTemplate; //模板文件名
	private String financeFhshPrintNoticeFileTemp; //临时表名
	private String financeFhshPrintNoticeFileName; //导出文件名
	private int financeFhshPrintNoticeQueryId;
	
	/**
	 * 配置模板文件名称
	 * 
	 */
	public FinanceFhshPrintController(){
		// 付款申请单-外币
		financeFhshPrintNoticeFileTemplate = "np_fhsh_notice";
		financeFhshPrintNoticeFileTemp = "np_fhsh_notice_temp";
		financeFhshPrintNoticeFileName = "np_fhsh_notice";
		financeFhshPrintNoticeQueryId = 5600010;
	}
	
	/**
	 * 申汇单 导出/打印 国外汇款通知单
	 * 
	 * @param postData
	 * @param response
	 * @throws EncryptedDocumentException
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	@RequestMapping(value="/financeFhshPrintNotice")
	@ResponseBody
	public Object financeFhshPrintNotice(@RequestParam Map postData, HttpServletResponse response, HttpSession httpSession) throws EncryptedDocumentException, InvalidFormatException, IOException{
		String is_print = postData.get("is_print").toString();
		String printerName = "";
		// 假如是打印要判断下权限
		if (is_print.equals("1")) {
			User user = (User)httpSession.getAttribute("user");
			postData.put("account", user.getAccount());
			postData.put("printType", "A4");
			
			Map<String, Object> oneQuery = baseService.getOneQuery(printCofigOneQueryId, postData);	
			
			if (oneQuery != null) {
				printerName = oneQuery.get("printerName").toString();
			} else {
				AjaxResult result =  new AjaxResult();
				result.setSuccess(false);
				result.setErrorMsg("没有授权的打印服务！");
				return result;
			}
		}
		
		//获取表格头部信息
		Map<String, Object> one = baseService.getOneQuery(financeFhshPrintNoticeQueryId, postData);
		
		Calendar    rightNow    =    Calendar.getInstance();   
        /*用Calendar的get(int field)方法返回给定日历字段的值。
        HOUR 用于 12 小时制时钟 (0 - 11)，HOUR_OF_DAY 用于 24 小时制时钟。*/
        Integer year = rightNow.get(Calendar.YEAR); 
        Integer month = rightNow.get(Calendar.MONTH)+1; //第一个月从0开始，所以得到月份＋1
        Integer day = rightNow.get(rightNow.DAY_OF_MONTH);
        
        one.put("year", year);
        one.put("month", month);
        one.put("day", day);
		
		if (is_print.equals("0")) {
			// 处理excel模板
			byte[] bytes = PrintUtil.toHandle(financeFhshPrintNoticeFileTemplate + ".xlsx", one, financeFhshPrintNoticeFileTemp + ".xlsx");
			
	        response.setContentType("application/x-msdownload");
	        response.setContentLength(bytes.length);
	        response.setHeader("Content-Disposition", "attachment;filename=" + financeFhshPrintNoticeFileName + ".xlsx");
	        response.getOutputStream().write(bytes);
		} else if (is_print.equals("1")) {
			PrintUtil.toPrint(financeFhshPrintNoticeFileTemplate + ".xlsx", one, printerName + ".xlsx");//调用打印服务
			
			AjaxResult result =  new AjaxResult();
			result.setSuccess(true);
			return result;
		}
        
        return 0;
	}
}
