package com.cnpiecsb.fc.payment.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.listener.InitialBeanListener;
import com.cnpiecsb.common.util.GuidUtil;
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.common.viewobject.AjaxResult;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
/**
 * 
 * @author 货源发票  by zc 2021/12/21
 *
 */
@Controller
@RequestMapping("/fc/payment")
public class PaymentSourceInvoiceController extends BaseServiceController {
	// 货源发票查询
	private int sourceInvoiceManageQueryId = 8420001;	
	private GridHeadConfig sourceInvoiceManageGridHeadConfig;
	
	// 发票结算单明细
	private int sourceInvoiceAddDetailQueryId = 8420002;
	private GridHeadConfig sourceInvoiceAddDetailHeadConfig;
	
	// 结算单明细引入
	private int sourceInvoiceStatementItemPullQueryId = 8420003;	
	private GridHeadConfig sourceInvoiceStatementItemPullHeadConfig;
	
	// 单条发票查询
	private int sourceInvoiceOneQueryId = 8420004;
	
	// 单条余额查询
	private int factoryYueOneQueryId = 8450002;
	
	//单条货源查询
	private int factoryQueryId = 8000008;
	
	// 附件表查询
	private int picManageQueryId = 8420006;	
	private GridHeadConfig picQueryHeadConfig;
	
	@Resource
	private InitialBeanListener initialBeanListener;  //存放了system.property配置项
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public PaymentSourceInvoiceController(){
		sourceInvoiceManageGridHeadConfig = new GridHeadConfig(sourceInvoiceManageQueryId,true,false,true,false);
		sourceInvoiceManageGridHeadConfig.setOperatorWidth(150);
		
		sourceInvoiceAddDetailHeadConfig = new GridHeadConfig(sourceInvoiceAddDetailQueryId,true,true,true,false);		
		sourceInvoiceStatementItemPullHeadConfig = new GridHeadConfig(sourceInvoiceStatementItemPullQueryId,true,true,false,false);
		
		picQueryHeadConfig = new GridHeadConfig(picManageQueryId,true,false,true,false);
		picQueryHeadConfig.setOperatorWidth(80);
	}
	
	/**
	 * 货源发票查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/sourceInvoiceManage", method=RequestMethod.GET)
    public ModelAndView sourceInvoiceManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentSourceInvoice/sourceInvoiceManage");
        String tableHeader = this.getTableHeader(httpSession,sourceInvoiceManageGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sourceInvoiceManageQueryId);
        return mv;
    }
	
	/**
	 * 获得货源发票数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSourceInvoiceManageList")
	@ResponseBody
	public Object getSourceInvoiceManageList(@RequestBody Map postData, HttpSession httpSession){
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		return this.getTableDataList(postData,sourceInvoiceManageQueryId);
	}
	
	/**
	 * 新增和修改返回操作
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/returnSourceInvoice")
	@ResponseBody
    public Object returnSourceInvoice(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"guid"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_invoice_return");
		
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		postData.put("guid", sourceInvoice_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		httpSession.setAttribute("sourceInvoice_guid", "");
		return "{\"success\":true}";
    }
	
	/**
	 * 新增发票页面
	 * 
	 * 
	 */
	@RequestMapping(value="/sourceInvoiceAdd",method=RequestMethod.GET)
    public ModelAndView sourceInvoiceAdd(@RequestParam Map postData, HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentSourceInvoice/sourceInvoiceAdd");
        
        String sourceInvoice_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("sourceInvoice_guid", sourceInvoice_guid);
        
        String is_red = postData.get("is_red").toString();
        
        // 假如 是应收发票, 放结算单明细
	   String tableHeader = this.getTableHeader(httpSession,sourceInvoiceAddDetailHeadConfig);
	   mv.addObject("tableHeader", tableHeader);
	   mv.addObject("is_red", is_red);
	   mv.addObject("queryId", sourceInvoiceAddDetailQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-新增发票明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSourceInvoiceAddItemList")
	@ResponseBody
	public Object getSourceInvoiceAddItemList(@RequestBody Map postData,HttpSession httpSession){
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		postData.put("guid", sourceInvoice_guid);
		return this.getTableDataList(postData,sourceInvoiceAddDetailQueryId);
	}	
	
	/**
	 * 引入明细页面 进货单明细
	 * 
	 * 
	 */
	@RequestMapping(value="/sourceInvoiceStatementItemPull",method=RequestMethod.GET)
    public ModelAndView sourceInvoiceStatementItemPull(HttpSession httpSession,@RequestParam Map postData)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentSourceInvoice/sourceInvoiceStatementItemPull");
        String tableHeader = this.getTableHeader(httpSession, sourceInvoiceStatementItemPullHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sourceInvoiceStatementItemPullQueryId);
		Map<String, Object> oneQuery = new HashMap<String,Object>();
		if(postData.get("f_id")==null || postData.get("f_id").equals("")){
			oneQuery.put("f_id","");
			mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		}else{
			oneQuery = baseService.getOneQuery(factoryQueryId, postData);		
			mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		}
        return mv;
    }
	
	/**
   	 * 获得动态列表数据-引入发票到货单明细
   	 * 
   	 * param postData
   	 * return
   	 */
   	@RequestMapping(value="/getSourceInvoiceStatementItemPullList")
   	@ResponseBody
   	public Object getSourceInvoiceStatementItemPullList(@RequestBody Map postData,HttpSession httpSession) {
   		// 获得权限代码参数
   		AccessControlUtil.accessParams(postData, httpSession);
   		return this.getTableDataList(postData, sourceInvoiceStatementItemPullQueryId);
   	}
   	  	
	/**
	 * 引入发票到货单明细操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/pullSourceInvoiceItem")
	@ResponseBody
    public Object pullSourceInvoiceItem(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession, HttpServletRequest request){
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		if(postData!=null&&postData.size()>0){
			for(Map<String,Object> kp_map:postData){				
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "ps_id ", "c_real_money", "real_money"};
				// 加入sp的名称
				kp_map.put("spName", "fc_payment_invoice_item_pullin");				
				kp_map.put("guid", sourceInvoice_guid);			
				int code = baseService.doCallSp(kp_map, paramNames, null);					
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改明细操作
	 * 
	 * @param dynamicColumns
	 * @return
	 */
	@RequestMapping(value="/updateSourceInvoiceItem")
	@ResponseBody
	public Object updateSourceInvoiceItem(@RequestParam Map postData, HttpSession httpSession) {
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"guid", "ps_id", "c_real_money "};
		// 加入sp的名称
		postData.put("spName", "fc_payment_invoice_item_update");
		
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		postData.put("guid", sourceInvoice_guid);
		
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
	@RequestMapping(value="/deleteSourceInvoiceItem")
	@ResponseBody
    public Object deleteSourceInvoiceItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){	
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		postData.put("guid", sourceInvoice_guid);
		
		String[] ps_ids = request.getParameterValues("ps_ids");
		if(ps_ids != null && ps_ids.length > 0){
			for(int i=0;i<ps_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "ps_id"};
				// 加入sp的名称
				postData.put("spName", "fc_payment_invoice_item_delete");					
				
				postData.put("ps_id", ps_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
    }
	
	/**
	 * 新增销售发票操作
	 * 
	 * param postData
	 * return
	 * @throws IOException 
	 */
	@RequestMapping(value="/addSourceInvoice")
	@ResponseBody
    public Object addSourceInvoice(@RequestParam Map postData,HttpSession httpSession) {	
//		if(file.getSize()!=0){
//			if (file != null) {
//				// 首先获得图片存放的根路径
//				Properties props = initialBeanListener.getProps();
//				String imagePath = (String) props.get("images.rootPath");
//				
//				// 目前以原文件名的方式上传, 后续在看看有无改进需要
//				String fileName = file.getOriginalFilename();
//				
//				// 先找到后缀之前的内容
//				String title = fileName.substring(0,fileName.lastIndexOf("."));
//				String[] fileSplits = fileName.split("\\.");
//				
//				long currentTimeMillis = System.currentTimeMillis();  //时间戳
//				
//				String newFileName = "";
//				if (fileSplits.length > 1) {
//					newFileName = title + '-' + currentTimeMillis + "." + fileSplits[fileSplits.length - 1];
//				} else {
//					return "{\"success\":false}";
//				}
//				// 将上传的文件放到本地路径下
//				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(imagePath + "payment_invoice/" + newFileName));
//				postData.put("file_address",newFileName);
//			}	
//		}
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid", "inv_no","f_id","fc_invoice_class","is_red","inv_date","currency","c_real_money","memo","o_id_input","org_code","unit_code", "file_address"};
		// 出参, 有顺序
		String returnNames[] = {"inv_id"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_invoice_new");  // 临时的
		
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		postData.put("guid", sourceInvoice_guid);
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		code = do_sp_source_invoice_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 带文件上传模式的正确值返回必须得这么写
		AjaxResult result = new AjaxResult();
		result.setSuccess(true);
		return result;
    }
	
	// 重算这次发票对应的结算单/预收单明细的已开票金额 
	private int do_sp_source_invoice_item_calculate(Map postData){
		String paramNames[] = {"inv_id", "is_to_edit"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_invoice_item_calculate");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/sourceInvoiceEdit",method=RequestMethod.GET)
    public ModelAndView sourceInvoiceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(sourceInvoiceOneQueryId, postData);
		oneQuery.remove("export_invoice_no");  // 外销发票号去掉
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("is_detail", (String)postData.get("is_detail"));
        mv.setViewName("fc/paymentSourceInvoice/sourceInvoiceEdit");
        
       String tableHeader = this.getTableHeader(httpSession,sourceInvoiceAddDetailHeadConfig);
 	   mv.addObject("tableHeader", tableHeader);
 	   mv.addObject("queryId", sourceInvoiceAddDetailQueryId);
        
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"inv_id","guid"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_invoice_toUpdate");
		
		String sourceInvoice_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("sourceInvoice_guid", sourceInvoice_guid);
		postData.put("guid", sourceInvoice_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	 * 获得动态列表数据-编辑页面编辑发票明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSourceInvoiceEditItemList")
	@ResponseBody
	public Object getSourceInvoiceEditItemList(@RequestBody Map postData,HttpSession httpSession){
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		postData.put("guid", sourceInvoice_guid);
		return this.getTableDataList(postData, sourceInvoiceAddDetailQueryId);
	}
	
	/**
	 * 修改发票操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editSourceInvoice")
	@ResponseBody
    public Object editSourceInvoice(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id","guid","inv_no ","f_id", "fc_invoice_class", "inv_date","currency","c_real_money","memo","o_id_modify","unit_code"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_invoice_update");
		
		String sourceInvoice_guid=(String)httpSession.getAttribute("sourceInvoice_guid");
		postData.put("guid", sourceInvoice_guid);
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_modify", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		code = do_sp_source_invoice_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	

	/**
	 * 删除操作 -销售发票
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteSourceInvoice")
	@ResponseBody
    public Object deleteSaleInvoice(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"inv_id","o_id_destroy","guid"};
		// 加入sp的名称
		postData.put("spName", "fc_payment_invoice_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_destroy", user.getAccount());
        
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		postData.remove("paramNames");	
		postData.put("is_to_edit", 0);
		code = do_sp_source_invoice_item_calculate(postData);				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	//获得单一的货源余额
	/**
	 * 获得查询单一货源
	 * 
	 * param postData
	 * return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/getOneFactoryYue")
	@ResponseBody
	public Object getOneFactoryYue(@RequestParam Map postData) throws JsonProcessingException{
		Map<String, Object> oneQuery = baseService.getOneQuery(factoryYueOneQueryId, postData);
		if(oneQuery==null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("balance_c_real_money", 0);
			return JsonUtil.mapToString(map);
		}
		return JsonUtil.mapToString(oneQuery);
	}

	/**
	 * 下载文件
	 * 
	 * @return
	 */
	//下载上传文件模板数据
	@RequestMapping(value="/downloadPaymentInvoiceFile")
    public void downloadPaymentInvoiceFile(String filename,HttpServletResponse response) throws EncryptedDocumentException, InvalidFormatException, IOException {
		if(filename != null && !"".equals(filename)){
			ByteArrayOutputStream out = new ByteArrayOutputStream();  
			// 首先获得图片存放的根路径
			Properties props = initialBeanListener.getProps();
			String webroot = (String) props.get("images.rootPath");
			FileInputStream fis = new FileInputStream(webroot + "payment_invoice/"+filename);
			
			byte[] arr = new byte[5];// 这里 如果没ByteArrayOutputStream 就有可能会产生乱码  
	        int len = -1;  
	        while ((len = fis.read(arr)) != -1) {  
	        	out.write(arr, 0, len);// 写到内存数组中去  
	        }  

	        byte[] bytes = out.toByteArray();
	        response.setContentType("application/x-msdownload");  
	        response.setContentLength(bytes.length);  
	        response.setHeader("Content-Disposition", "attachment;filename="  
	                + new String(filename.getBytes("gb2312"), "ISO8859-1"));

	        response.getOutputStream().write(bytes);
		}	 
    }
	
	/**
	 * 进入上传发票文件页面(no use)
	 * 
	 * @return
	 */
	@RequestMapping(value="/paymentInvoiceFileUpload") 
    public ModelAndView paymentInvoiceFileUpload(@RequestParam Map postData, HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/paymentSourceInvoice/paymentInvoiceFileUpload");
        
        httpSession.setAttribute("paymentInvoice_file_inv_id", postData.get("inv_id"));
        return mv;
    }
	
	/**
	 * 上传编目文件(no use)
	 * 
	 * @param httpSession
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws InvalidFormatException 
	 * @throws EncryptedDocumentException 
	 */
	@RequestMapping(value="/uploadPaymentInvoiceFile",method=RequestMethod.POST)
	@ResponseBody
    public Object uploadPaymentInvoiceFile(MultipartFile file_address,HttpSession httpSession, HttpServletRequest request) throws EncryptedDocumentException, InvalidFormatException, IOException {
		if (file_address != null) {
			Properties props = initialBeanListener.getProps();
			String imagePath = (String) props.get("images.rootPath");
			
			// 目前以原文件名的方式上传, 后续在看看有无改进需要
			String fileName = file_address.getOriginalFilename();
			
			// 先找到后缀之前的内容
			String title = fileName.substring(0,fileName.lastIndexOf("."));
			String[] fileSplits = fileName.split("\\.");
			
			long currentTimeMillis = System.currentTimeMillis();  //时间戳
			
			String newFileName = "";
			if (fileSplits.length > 1) {
				newFileName = title + '-' + currentTimeMillis + "." + fileSplits[fileSplits.length - 1];
			} else {
				return "{\"success\":false}";
			}
			// 将上传的文件放到本地路径下
			FileUtils.copyInputStreamToFile(file_address.getInputStream(), new File(imagePath + "payment_invoice/" + newFileName));
			
			String paramNames[] = {"inv_id", "file_address"};
			
			Map postData = new HashMap();
			// 加入sp的名称
			postData.put("spName", "fc_payment_invoice_upload_file");
			postData.put("inv_id", httpSession.getAttribute("paymentInvoice_file_inv_id"));
			postData.put("file_address", newFileName);
			
			int code = baseService.doCallSp(postData, paramNames, null);
			
			return "{\"success\":true}";
		}			

		return "{\"success\":false}";
	}
	
	/**
	 * 修改附件页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toPaymentInvoicePicEdit",method=RequestMethod.GET)
    public ModelAndView toPaymentInvoicePicEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
       ModelAndView mv = new ModelAndView();
        
       mv.setViewName("fc/paymentSourceInvoice/sourceInvoicePicEdit");
        
 	   String tableHeader = this.getTableHeader(httpSession, picQueryHeadConfig);
 	   mv.addObject("tableHeader", tableHeader);
 	   mv.addObject("queryId", picManageQueryId);
 	   
       return mv;
    }
	
	/**
	 * 上传附件图片文件
	 * 
	 * 
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/addPaymentInvoicePic")
	@ResponseBody
	public Object addPaymentInvoicePic(@RequestParam Map postData,HttpSession session,@RequestParam("pic")MultipartFile file) throws IOException {
		if(file.getSize()!=0){
			if (file != null) {
				// 首先获得图片存放的根路径
				Properties props = initialBeanListener.getProps();
				String imagePath = (String) props.get("images.rootPath");
				
				// 目前以原文件名的方式上传, 后续在看看有无改进需要
				String fileName = file.getOriginalFilename();
				
				// 先找到后缀之前的内容
				String title = fileName.substring(0,fileName.lastIndexOf("."));
				String[] fileSplits = fileName.split("\\.");
				
				long currentTimeMillis = System.currentTimeMillis();  //时间戳
				
				String newFileName = "";
				if (fileSplits.length > 1) {
					newFileName = title + '-' + currentTimeMillis + "." + fileSplits[fileSplits.length - 1];
				} else {
					return "{\"success\":false}";
				}
				// 将上传的文件放到本地路径下
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(imagePath + "payment_invoice/" + newFileName));
				postData.put("pic_path",imagePath + "payment_invoice/" + newFileName);
				postData.put("pic_name",newFileName);
			}	
		}else{
			return "{\"success\":false}";
		}
		
		User user = (User)session.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
		postData.put("pic_type","002");
        
        // 加入sp的名称
		postData.put("spName", "fc_attachment_pic_new");
     		
        String paramNames[] = {"order_no","pic_name","pic_path","pic_type","input_code"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	* 获得附件表页面
	* 
	* @return
	*/
	@RequestMapping(value="/getPaymentInvoicePic")
	@ResponseBody
	public Object getPaymentInvoicePic(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, picManageQueryId);
	}
	
	/**
	 * 删除图片
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/deletePaymentInvoicePic")
	@ResponseBody
	public Object deletePaymentInvoicePic(@RequestParam Map postData,HttpSession session) {
        // 加入sp的名称
		postData.put("spName", "fc_attachment_pic_delete");
     		
        String paramNames[] = {"pic_id"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
}
