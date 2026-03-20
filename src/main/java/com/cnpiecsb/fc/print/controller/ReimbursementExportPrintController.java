package com.cnpiecsb.fc.print.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cnpiecsb.common.constant.WebConstants;
import com.cnpiecsb.common.viewobject.AjaxResult;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.fc.print.utils.PrintUtil;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.User;

/**
 * 财务中心导出controller
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/fc/print")
public class ReimbursementExportPrintController extends BaseServiceController{
	
	//报销申请
	private String caFinanceExportFileTemplate;//模板文件名
	private String caFinanceExportFileTemp;//临时表明
	private String caFinanceExportFileName;//导出文件名
	private int cashApplicationManageQueryId;  //报销单表头查询
	private int cashApplicationItemManageQueryId; //报销单明细查询
	
	//业务招待
	private String brFinanceExportFileTemplate;//模板文件名
	private String brFinanceExportFileTemp;//临时表明
	private String brFinanceExportFileName;//导出文件名
	private int businessReceptionManageQueryId;	//业务招待表头查询
	
	//会议预算
	private String bgFinanceExportFileTemplate;//模板文件名
	private String bgFinanceExportFileTemp;//临时表明
	private String bgFinanceExportFileName;//导出文件名
	private int meetingBudgetManageQueryId;	//业务招待表头查询
	
	//差旅费申请
	private String btFinanceExportFileTemplate;//模板文件名
	private String btFinanceExportFileTemp;//临时表明
	private String btFinanceExportFileName;//导出文件名
	private int businessTripManageQueryId;  //差旅费表头查询
	private int businessTripItemManageQueryId; //差旅费表头查询明细查询
	
	// 打印配置单条查询
	private int printCofigOneQueryId = 1030001;
	
	/**
	 * 配置模板文件名称
	 * 
	 */
	public ReimbursementExportPrintController(){
		//报销申请
		caFinanceExportFileTemplate = "fc_CA_Finance_Export";
		caFinanceExportFileTemp = "fc_CA_Finance_Export_temp";
		caFinanceExportFileName = "fc_CA_Finance_Export";
		cashApplicationManageQueryId = 8001001;
		cashApplicationItemManageQueryId = 8001022;
		
		//业务招待
		brFinanceExportFileTemplate = "fc_BR_Finance_Export";
		brFinanceExportFileTemp = "fc_BR_Finance_Export_temp";
		brFinanceExportFileName = "fc_BR_Finance_Export";
		businessReceptionManageQueryId = 8001004;
		
		//会议预算
		bgFinanceExportFileTemplate = "fc_BG_Finance_Export";
		bgFinanceExportFileTemp = "fc_BG_Finance_Export_temp";
		bgFinanceExportFileName = "fc_BG_Finance_Export";
		meetingBudgetManageQueryId = 8001006;
		
		//差旅费用
		btFinanceExportFileTemplate = "fc_BT_Finance_Export";//模板文件名
		btFinanceExportFileTemp ="fc_BT_Finance_Export_temp";//临时表明
		btFinanceExportFileName ="fc_BT_Finance_Export";//导出文件名
		businessTripManageQueryId = 8001008;  //差旅费表头查询
		businessTripItemManageQueryId = 8001027; //差旅费表头查询明细查询
	}
	
	/**
	 * 报销申请导出打印
	 * 
	 * @param postData
	 * @param response
	 * @throws EncryptedDocumentException
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	@RequestMapping(value="/caFinanceExportPrint")
	@ResponseBody
	public Object caFinanceExportPrint(@RequestParam Map postData, HttpServletResponse response, HttpSession httpSession) throws EncryptedDocumentException, InvalidFormatException, IOException{
		//获取表格头部信息
		Map<String, Object> one =  new HashMap<String, Object>();
		//表格明细数据部分
		String ap_id=(String)postData.get("ap_id");
		int is_print=Integer.valueOf((String)postData.get("is_print"));
		String printerName = "";
		// 假如是打印要判断下权限
		if (is_print == 1) {
			User user = (User)httpSession.getAttribute("user");
			postData.put("account", user.getAccount());
			postData.put("printType", "A5");
			
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
		
		postData.put("ap_id", ap_id);
		postData.put("queryId", cashApplicationManageQueryId);
		
		
		List head = new ArrayList();
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		head = this.getDataListByQueryId(postData);
		
		//获取表格头部信息
		Map<String, Object> head_data =  new HashMap<String, Object>();
		if(head.size()>0){
			head_data = (HashMap<String, Object>)head.get(0);
			//放入头部信息
			one.put("company_title_name", head_data.get("company_title_name"));//抬头
			if(((String)head_data.get("pay_type")).equals("0")){
				one.put("payment_name","现金报销凭证");//抬头
				one.put("pay_type_name","现金");//贷方科目
				one.put("unit_name",head_data.get("unit_name"));//考核单位
			}else{
				one.put("payment_name","付出报销凭证");//抬头
				one.put("pay_type_name","银行存款");//贷方科目
				one.put("unit_name",head_data.get("unit_name"));//考核单位
			}
			//使用默认时区和语言环境获得一个日历。
	        Calendar    rightNow    =    Calendar.getInstance();   
	        /*用Calendar的get(int field)方法返回给定日历字段的值。
	        HOUR 用于 12 小时制时钟 (0 - 11)，HOUR_OF_DAY 用于 24 小时制时钟。*/
	        Integer year = rightNow.get(Calendar.YEAR); 
	        Integer month = rightNow.get(Calendar.MONTH)+1; //第一个月从0开始，所以得到月份＋1
	        Integer day = rightNow.get(rightNow.DAY_OF_MONTH);
	        one.put("year",year);//年
	        one.put("month",month);//月
	        one.put("day",day);//日
	        one.put("apply_real_money_print",head_data.get("apply_real_money_print"));//总金额
	        one.put("real_money_china",head_data.get("real_money_china"));//总金额大写
	        one.put("o_id_apply_name",head_data.get("o_id_apply_name"));//申请人名字
	        one.put("ps_count",head_data.get("ps_count"));//附件数量
	        one.put("bank_data",head_data.get("bank_data"));//银行信息
	        one.put("memo",head_data.get("memo"));//备注
		}
		
		//System.out.println("head_data="+head_data.toString());
		
		//处理明细数据
		postData.put("queryId", cashApplicationItemManageQueryId);
		
		//放入明细数据List
		List items = new ArrayList();
		
		items = this.getDataListByQueryId(postData);
		
		
		if(one!=null && items.size()>0){
			for(int i = items.size();i<8;i++){
				//获取表格头部信息
				Map<String, Object> test =  new HashMap<String, Object>();
				test.put("cw_km2_code", " ");
				test.put("cw_km2_name", " ");
				test.put("descript", " ");
				test.put("real_money", " ");
				items.add(test);
			}
			one.put("items", items);  // 注意明细要使用items这个标签
		}
		
		if(is_print == 0){//为0则导出
			// 处理excel模板
			byte[] bytes = PrintUtil.toHandle(caFinanceExportFileTemplate+".xls", one,caFinanceExportFileTemp+".xls");
			
			response.setContentType("application/x-msdownload");
			response.setContentLength(bytes.length);
			response.setHeader("Content-Disposition", "attachment;filename="+caFinanceExportFileName + ".xls");
			response.getOutputStream().write(bytes);
		}else{
			PrintUtil.toPrint(caFinanceExportFileTemplate + ".xls", one, printerName + ".xls");//调用打印服务
			
			AjaxResult result =  new AjaxResult();
			result.setSuccess(true);
			return result;
		}
		return 0;
	}
	
	/**
	 * 业务招待申请导出
	 * 
	 * @param postData
	 * @param response
	 * @throws EncryptedDocumentException
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	@RequestMapping(value="/brFinanceExportPrint")
	@ResponseBody
	public Object brFinanceExportPrint(@RequestParam Map postData, HttpServletResponse response, HttpSession httpSession) throws EncryptedDocumentException, InvalidFormatException, IOException{
		//获取表格头部信息
		Map<String, Object> one =  new HashMap<String, Object>();
		//表格明细数据部分
		String br_id=(String)postData.get("br_id");
		String title=(String)postData.get("title");
		int is_print=Integer.valueOf((String)postData.get("is_print"));
		
		String printerName = "";
		// 假如是打印要判断下权限
		if (is_print == 1) {
			User user = (User)httpSession.getAttribute("user");
			postData.put("account", user.getAccount());
			postData.put("printType", "A5");
			
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
		
		one.put("title", title);
		
		postData.put("br_id", br_id);
		postData.put("queryId", businessReceptionManageQueryId);
		
		
		List head = new ArrayList();
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		head = this.getDataListByQueryId(postData);
		
		//获取表格头部信息
		Map<String, Object> head_data =  new HashMap<String, Object>();
		if(head.size()>0){
			head_data = (HashMap<String, Object>)head.get(0);
			//放入头部信息
			one.put("input_date_convert", head_data.get("input_date_convert"));//录入时间
			one.put("org_name",head_data.get("org_name"));//部门
			one.put("br_persons",head_data.get("br_persons"));//参加人员
			one.put("br_p_count",head_data.get("br_p_count"));//参加人数
			one.put("br_company",head_data.get("br_company"));//招待单位
			one.put("br_company_p_count",head_data.get("br_company_p_count"));//招待单位人数
			one.put("br_typename",head_data.get("br_typename"));//招待类型
			one.put("br_payee_name",head_data.get("br_payee_name"));//领款人
			one.put("br_witness_name",head_data.get("br_witness_name"));//证明人
			one.put("br_checker_name",head_data.get("br_checker_name"));//验收人
			one.put("br_manager_name",head_data.get("br_manager_name"));//主管人人
			one.put("real_money_china",head_data.get("real_money_china"));//大写金额
			one.put("br_money_print",head_data.get("br_money_print"));//金额
			one.put("memo",head_data.get("memo"));//备注
			//使用默认时区和语言环境获得一个日历。
			Calendar    rightNow    =    Calendar.getInstance();   
			/*用Calendar的get(int field)方法返回给定日历字段的值。
	        HOUR 用于 12 小时制时钟 (0 - 11)，HOUR_OF_DAY 用于 24 小时制时钟。*/
			Integer year = rightNow.get(Calendar.YEAR); 
			Integer month = rightNow.get(Calendar.MONTH)+1; //第一个月从0开始，所以得到月份＋1
			Integer day = rightNow.get(rightNow.DAY_OF_MONTH);
			one.put("year",year);//年
			one.put("month",month);//月
			one.put("day",day);//日
		}
		
		//System.out.println("head_data="+head_data.toString());
		
		if(is_print == 0){//为0则导出
			// 处理excel模板
			byte[] bytes = PrintUtil.toHandle(brFinanceExportFileTemplate+".xls", one,brFinanceExportFileTemp+".xls");
			
			response.setContentType("application/x-msdownload");
			response.setContentLength(bytes.length);
			response.setHeader("Content-Disposition", "attachment;filename="+brFinanceExportFileName + ".xls");
			response.getOutputStream().write(bytes);
		}else{
			PrintUtil.toPrint(brFinanceExportFileTemplate + ".xls", one, printerName + ".xls");//调用打印服务
			
			AjaxResult result =  new AjaxResult();
			result.setSuccess(true);
			return result;
		}
		
		return 0;
		
	}
	
	/**
	 * 会议预算导出打印
	 * 
	 * @param postData
	 * @param response
	 * @throws EncryptedDocumentException
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	@RequestMapping(value="/bgFinanceExportPrint")
	@ResponseBody
	public Object bgFinanceExportPrint(@RequestParam Map postData, HttpServletResponse response, HttpSession httpSession) throws EncryptedDocumentException, InvalidFormatException, IOException{
		//获取表格头部信息
		Map<String, Object> one =  new HashMap<String, Object>();
		//表格明细数据部分
		String bg_id=(String)postData.get("bg_id");
		int is_print=Integer.valueOf((String)postData.get("is_print"));
		String printerName = "";
		// 假如是打印要判断下权限
		if (is_print == 1) {
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
		
		postData.put("bg_id", bg_id);
		postData.put("queryId", meetingBudgetManageQueryId);
		
		
		List head = new ArrayList();
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		head = this.getDataListByQueryId(postData);
		
		//获取表格头部信息
		Map<String, Object> head_data =  new HashMap<String, Object>();
		if(head.size()>0){
			head_data = (HashMap<String, Object>)head.get(0);
			//放入头部信息
			one.put("org_name",head_data.get("org_name"));//部门
			one.put("meeting_subject",head_data.get("meeting_subject"));//会议主题
			one.put("meeting_type",head_data.get("meeting_type"));//会议类型
			one.put("meeting_content",head_data.get("meeting_content"));//会议内容
			one.put("meeting_start_date",head_data.get("print_date"));//会议时间
			one.put("meeting_address",head_data.get("meeting_address"));//会议地点
			one.put("meeting_objects",head_data.get("meeting_objects"));//会议对象
			one.put("meeting_p_count",head_data.get("meeting_p_count"));//会议人数
			one.put("meeting_our_p_count",head_data.get("meeting_our_p_count"));//我司人数
			one.put("meeting_acc_fee",head_data.get("meeting_acc_fee"));//住宿费
			one.put("meeting_meal_fee",head_data.get("meeting_meal_fee"));//餐费
			one.put("meeting_hire_fee",head_data.get("meeting_hire_fee"));//场租费
			one.put("meeting_trans_fee",head_data.get("meeting_trans_fee"));//交通费
			one.put("meeting_other_fee",head_data.get("meeting_other_fee"));//其他费用
			one.put("total_fee",head_data.get("total_fee"));//总金额
//			one.put("last_approval_name",head_data.get("last_approval_name"));//最后审批人
//			one.put("last_approval_time",head_data.get("last_approval_time"));//最后审批时间
//			one.put("last_approval_memo",head_data.get("last_approval_memo"));//最后审批意见
			one.put("memo",head_data.get("memo"));//备注
//			//使用默认时区和语言环境获得一个日历。
//			Calendar    rightNow    =    Calendar.getInstance();   
//			/*用Calendar的get(int field)方法返回给定日历字段的值。
//	        HOUR 用于 12 小时制时钟 (0 - 11)，HOUR_OF_DAY 用于 24 小时制时钟。*/
//			Integer year = rightNow.get(Calendar.YEAR); 
//			Integer month = rightNow.get(Calendar.MONTH)+1; //第一个月从0开始，所以得到月份＋1
//			Integer day = rightNow.get(rightNow.DAY_OF_MONTH);
//			one.put("year",year);//年
//			one.put("month",month);//月
//			one.put("day",day);//日
		}
		
		//System.out.println("head_data="+head_data.toString());
		
		
		if(is_print == 0){//为0则导出
			// 处理excel模板
			byte[] bytes = PrintUtil.toHandle(bgFinanceExportFileTemplate+".xls", one,bgFinanceExportFileTemp+".xls");
			
			response.setContentType("application/x-msdownload");
			response.setContentLength(bytes.length);
			response.setHeader("Content-Disposition", "attachment;filename="+bgFinanceExportFileName + ".xls");
			response.getOutputStream().write(bytes);
		}else{
			PrintUtil.toPrint(bgFinanceExportFileTemplate + ".xls", one, printerName + ".xls");//调用打印服务
			
			AjaxResult result =  new AjaxResult();
			result.setSuccess(true);
			return result;
		}
		
		return 0;
	}
	
	
	/**
	 * 差旅费申请导出
	 * 
	 * @param postData
	 * @param response
	 * @throws EncryptedDocumentException
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	@RequestMapping(value="/btFinanceExportPrint")
	@ResponseBody
	public Object btFinanceExportPrint(@RequestParam Map postData, HttpServletResponse response, HttpSession httpSession) throws EncryptedDocumentException, InvalidFormatException, IOException{
		//获取表格头部信息
		Map<String, Object> one =  new HashMap<String, Object>();
		//表格明细数据部分
		String bt_id=(String)postData.get("bt_id");
		int is_print=Integer.valueOf((String)postData.get("is_print"));
		String printerName = "";
		// 假如是打印要判断下权限
		if (is_print == 1) {
			User user = (User)httpSession.getAttribute("user");
			postData.put("account", user.getAccount());
			postData.put("printType", "A5");
			
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
		
		
		postData.put("bt_id", bt_id);
		postData.put("queryId", businessTripManageQueryId);
		
		
		List head = new ArrayList();
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		head = this.getDataListByQueryId(postData);
		
		//获取表格头部信息
		Map<String, Object> head_data =  new HashMap<String, Object>();
		if(head.size()>0){
			head_data = (HashMap<String, Object>)head.get(0);
			//放入头部信息
			one.put("unit_name", head_data.get("unit_name"));//核算单位
			//one.put("o_id_apply_name",head_data.get("o_id_apply_name"));//出差人
			one.put("org_name",head_data.get("org_name"));//申请部门
			one.put("o_id_title_name",head_data.get("o_id_title_name"));//职别
			one.put("trip_reason",head_data.get("trip_reason"));//出差理由
			one.put("trip_address",head_data.get("trip_address"));//出差地点
			one.put("real_money_china",head_data.get("real_money_china"));//大写总金额
			one.put("person_count_total",head_data.get("person_count_total"));//总人数
			one.put("trip_days_total",head_data.get("trip_days_total"));//总天数
			one.put("trip_trans_fee_total",head_data.get("trip_trans_fee_total"));//总交通费
			one.put("trip_acc_fee_total",head_data.get("trip_acc_fee_total"));//总住宿费
			one.put("trip_meal_fee_total",head_data.get("trip_meal_fee_total"));//总伙食费
			one.put("trip_othertrans_fee_total",head_data.get("trip_othertrans_fee_total"));//总其他交通费
			one.put("trip_other_fee_total",head_data.get("trip_other_fee_total"));//总其他费用
			one.put("total_fee",head_data.get("total_fee"));//总费用
			//使用默认时区和语言环境获得一个日历。
	        Calendar    rightNow    =    Calendar.getInstance();   
	        /*用Calendar的get(int field)方法返回给定日历字段的值。
	        HOUR 用于 12 小时制时钟 (0 - 11)，HOUR_OF_DAY 用于 24 小时制时钟。*/
	        Integer year = rightNow.get(Calendar.YEAR); 
	        Integer month = rightNow.get(Calendar.MONTH)+1; //第一个月从0开始，所以得到月份＋1
	        Integer day = rightNow.get(rightNow.DAY_OF_MONTH);
	        one.put("year",year);//年
	        one.put("month",month);//月
	        one.put("day",day);//日
	        one.put("memo",head_data.get("memo"));//备注
	        one.put("o_id_apply_name",head_data.get("trip_persons"));//出差人
		}
		
		//处理明细数据
		postData.put("queryId", businessTripItemManageQueryId);
		
		//放入明细数据List
		List items = new ArrayList();
		
		items = this.getDataListByQueryId(postData);
		
		if(one!=null && items.size()>0){
			for(int i = items.size();i<5;i++){
				//获取表格头部信息
				Map<String, Object> test =  new HashMap<String, Object>();
				test.put("dep_month", " ");
				test.put("dep_day", " ");
				test.put("dep_hour", " ");
				test.put("departure_site", " ");
				test.put("arr_month", " ");
				test.put("arr_day", " ");
				test.put("arr_hour", " ");
				test.put("arrival_site", " ");
				test.put("person_count", " ");
				test.put("trip_days", " ");
				test.put("trip_trans_fee", " ");
				test.put("trip_acc_fee", " ");
				test.put("trip_meal_fee", " ");
				test.put("trip_othertrans_fee", " ");
				test.put("trip_other_fee", " ");
				items.add(test);
			}
			one.put("items", items);  // 注意明细要使用items这个标签
		}
		
		if(is_print == 0){//为0则导出
			// 处理excel模板
			byte[] bytes = PrintUtil.toHandle(btFinanceExportFileTemplate+".xls", one,btFinanceExportFileTemp+".xls");
			
			response.setContentType("application/x-msdownload");
			response.setContentLength(bytes.length);
			response.setHeader("Content-Disposition", "attachment;filename="+btFinanceExportFileName + ".xls");
			response.getOutputStream().write(bytes);
		}else{
			PrintUtil.toPrint(btFinanceExportFileTemplate + ".xls", one, printerName + ".xls");//调用打印服务
			
			AjaxResult result =  new AjaxResult();
			result.setSuccess(true);
			return result;
		}
		
		return 0;
	}
	
	/**
	 * 通用下载文件模板数据
	 * 
	 * @param filename
	 * @param response
	 * @throws EncryptedDocumentException
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	@RequestMapping(value="/downloadTemplate")
    public void downloadTemplate(String filename,HttpServletResponse response) throws EncryptedDocumentException, InvalidFormatException, IOException {
		if(filename!=null&&!"".equals(filename)){
			filename+=".xlsx";
			ByteArrayOutputStream out = new ByteArrayOutputStream();  
			
			String webroot = System.getProperty(WebConstants.ITOMSWEBROOT);
			FileInputStream fis = new FileInputStream(webroot + "template/fcDownloads/"+filename);
			Workbook workbook = WorkbookFactory.create(fis);
			
			workbook.write(out);
			//String filename = "import.xlsx";

	        byte[] bytes = out.toByteArray();
	        response.setContentType("application/x-msdownload");  
	        response.setContentLength(bytes.length);  
	        response.setHeader("Content-Disposition", "attachment;filename="  
	                + filename);
	        response.getOutputStream().write(bytes);
		}	 
    }
}
