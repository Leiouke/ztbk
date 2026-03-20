package com.cnpiecsb.fc.declare.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
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
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 报关录入界面
 */
@Controller
@RequestMapping("/fc/declare")
public class TaxbackController extends BaseServiceController{
	
	private int taxbackSearchQueryId = 8001020;  //报关单查询
	private int taxbackDetailTempSearchQueryId = 8001021;  //报关单临时明细查询
	private int taxbackOneQueryId = 8001024; //报关单单条查询
	private GridHeadConfig taxbackSearchQueryHeadConfig;
	private GridHeadConfig taxbackDetailTempSearchQueryHeadConfig;
	
	private int taxbackProductSearchQueryId = 8001043; //退税商品查询
	
	// 附件表查询
	private int picManageQueryId = 8420006;	
	private GridHeadConfig picQueryHeadConfig;
	
	@Resource
	private InitialBeanListener initialBeanListener;  //存放了system.property配置项
	
	public TaxbackController(){
		taxbackSearchQueryHeadConfig = new GridHeadConfig(taxbackSearchQueryId,true,false,true,false);
		taxbackSearchQueryHeadConfig.setOperatorWidth(220);
		taxbackDetailTempSearchQueryHeadConfig = new GridHeadConfig(taxbackDetailTempSearchQueryId,true,true,true,false);
		taxbackDetailTempSearchQueryHeadConfig.setOperatorWidth(120);
		
		picQueryHeadConfig = new GridHeadConfig(picManageQueryId,true,false,true,false);
		picQueryHeadConfig.setOperatorWidth(80);
	}
	
	/**
	 * 进入报关录入界面
	 */
	@RequestMapping(value="/taxbackManage")
    public ModelAndView taxbackManage(HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String tableHeader = this.getTableHeader(httpSession,taxbackSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", taxbackSearchQueryId);
        mv.setViewName("fc/declareTaxback/taxbackManage");
        return mv;
    }
	
	/**
	 * 获得报关录入界面信息
	 * @return
	 */
	@RequestMapping(value="/getTaxbackManageList")
	@ResponseBody
	public Object getTaxbackManageList(@RequestBody Map postData,HttpSession session) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, session);
		Map<String,Object> map=this.getTableDataList(postData,taxbackSearchQueryId);
		return map;
	}
	
	/**
	* 新增报关录入页面
	* 
	* 
	*/
	@RequestMapping(value="/taxbackAdd",method=RequestMethod.GET)
	public ModelAndView taxbackAdd(HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String taxback_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("taxback_guid", taxback_guid);
	    mv.setViewName("fc/declareTaxback/taxbackAdd");
	    String tableHeader = this.getTableHeader(httpSession,taxbackDetailTempSearchQueryHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
	    mv.addObject("queryId", taxbackDetailTempSearchQueryId);
	    return mv;
	}
	
	/**
	 * 获得报关录入明细临时数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getTaxbackItemTempList")
	@ResponseBody
	public Object getTaxbackItemTempList(@RequestBody Map postData,HttpSession httpSession){
		String taxback_guid=(String)httpSession.getAttribute("taxback_guid");
		postData.put("guid", taxback_guid);
		return this.getTableDataList(postData,taxbackDetailTempSearchQueryId);
	}
	
	/**
	* 新增报关录入明细页面
	* 
	* 
	*/
	@RequestMapping(value="/taxbackItemAdd",method=RequestMethod.GET)
	public ModelAndView taxbackItemAdd(HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("fc/declareTaxback/taxbackItemAdd");
		return mv;
	}
		
	/**
	* 新增报关录入明细时表
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/addTaxbackItemTemp")
	@ResponseBody
	public Object addTaxbackItemTemp(@RequestParam Map postData,HttpSession httpSession) {	
		//放入GUID
		String taxback_guid=(String)httpSession.getAttribute("taxback_guid");
		postData.put("guid", taxback_guid);
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
		        "product_code",
		        "product_name",
		        "product_unit",
		        "product_amount",
		        "currency_type",
		        "sales_money",
		        "input_code"};

		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_detail_temp_new");
			
		int code = baseService.doCallSp(postData, paramNames, null);
			
		if (code != 0) {
				return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
	}
	
	/**
	* 删除报关录入明细表明细
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/deleteTaxbackItem")
	@ResponseBody
	public Object deleteTaxbackItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		//放入GUID
		String taxback_guid=(String)httpSession.getAttribute("taxback_guid");
		postData.put("guid", taxback_guid);
				
		String[] inc_nos = request.getParameterValues("inc_nos");
		if(inc_nos != null && inc_nos.length > 0){
			for(int i=0;i<inc_nos.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"guid", "inc_no"};
				// 加入sp的名称
				postData.put("spName", "fc_declare_taxback_detail_temp_delete");					
				
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
	* 新增报关单
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/addTaxback")
	@ResponseBody
	public Object addTaxback(@RequestParam Map postData,HttpSession httpSession) {	
		//放入GUID
		String taxback_guid=(String)httpSession.getAttribute("taxback_guid");
		postData.put("guid", taxback_guid);
		
		// 出参, 有顺序
		String returnNames[] = {"dcl_id"};
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
		          "dcl_no",
		          "export_invoice_no",
		          "sales_money",
		          "input_code",
		          "input_name",
		          "memo",
		          "currency_type", 
		          "other_fee",
		          "usbg_money",
		          "export_date",
		          "export_place",
		          "total_packages",
				  "pre_exchange_rate",
				  "pre_rmb",
				  "org_code",
				  "unit_code"};
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());

		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_new");
			
		int code = baseService.doCallSp(postData, paramNames, returnNames);
			
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
	@RequestMapping(value="/toTaxbackEdit",method=RequestMethod.GET)
    public ModelAndView toTaxbackEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(taxbackOneQueryId, postData);		
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("is_detail", (String)postData.get("is_detail"));
        mv.setViewName("fc/declareTaxback/taxbackItemEdit");
        
        // 假如 是应收发票, 放结算单明细
        String tableHeader = this.getTableHeader(httpSession,taxbackDetailTempSearchQueryHeadConfig);
	    mv.addObject("tableHeader", tableHeader);
	    mv.addObject("queryId", taxbackDetailTempSearchQueryId);
        
 	    //单据修改准备
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"dcl_id","guid"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_toUpdate");
		
		String taxback_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("taxback_guid", taxback_guid);
		postData.put("guid", taxback_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	* 修改报关单
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/editTaxback")
	@ResponseBody
	public Object editTaxback(@RequestParam Map postData,HttpSession httpSession) {	
		//放入GUID
		String taxback_guid=(String)httpSession.getAttribute("taxback_guid");
		postData.put("guid", taxback_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
				          "dcl_no",
				          "export_invoice_no",
				          "sales_money",
				          "input_code",
				          "input_name",
				          "memo",
				          "currency_type", 
				          "other_fee",
				          "usbg_money",
				          "export_date",
				          "export_place",
				          "total_packages",
						  "pre_exchange_rate",
						  "pre_rmb",
						  "org_code",
						  "unit_code",
						  "dcl_id"};
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());

		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_update");
			
		int code = baseService.doCallSp(postData, paramNames, null);
			
		if (code != 0) {
				return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
	}
	
	/**
	* 删除退税单
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/deleteTaxback")
	@ResponseBody
	public Object deleteTaxback(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"dcl_id", "input_code"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_del");					
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());

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
	@RequestMapping(value="/sumbmitTaxback")
	@ResponseBody
	public Object sumbmitTaxback(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"dcl_id","submit_type","role","input_code","input_name"};
		// 加入sp的名称
		postData.put("spName", "fc_declare_taxback_submit");
		
		User user=(User)httpSession.getAttribute("user");
		Role role=(Role)httpSession.getAttribute("defaultRole");
		postData.put("input_code", user.getAccount());
		postData.put("input_name", user.getUserName());
		postData.put("role", role.getApprove_role());
		postData.put("submit_type","0");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}
	
	/**
	 * 获得动态列表数据-退税商品
	 * 
	 * @param keyword
	 * @param dep_org_code
	 * @return
	 */
	@RequestMapping(value="/getTaxdeclareProduct")
	@ResponseBody
	public Object getTaxdeclareProduct(String keyword){
		Map<String,Object> postData=new HashMap<>();
		postData.put("keyword", keyword);
		return this.getTableDataList(postData, taxbackProductSearchQueryId);
	}
	
	/**
	 * 附件页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toTaxbackPic",method=RequestMethod.GET)
    public ModelAndView toTaxbackPic(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
		mv.addObject("dcl_id", (String)postData.get("dcl_id"));
        mv.setViewName("fc/declareTaxback/taxbackPicAdd");
        String tableHeader = this.getTableHeader(httpSession, picQueryHeadConfig);
  	    mv.addObject("tableHeader", tableHeader);
  	    mv.addObject("queryId", picManageQueryId);
		
        return mv;
    }
	
	/**
	* 获得附件信息
	* 
	* @return
	*/
	@RequestMapping(value="/getTaxbackPic")
	@ResponseBody
	public Object getTaxbackPic(@RequestBody Map postData, HttpSession httpSession) {
		postData.put("order_no",(String)postData.get("dcl_id"));
		return this.getTableDataList(postData, picManageQueryId);
	}
	
	/**
	 * 上传附件图片文件
	 * 
	 * 
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/addTaxbackPic")
	@ResponseBody
	public Object addTaxbackPic(@RequestParam Map postData,HttpSession session,@RequestParam("pic")MultipartFile file) throws IOException {
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
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(imagePath + "tb_pic/" + newFileName));
				postData.put("pic_path",imagePath + "tb_pic/" + newFileName);
				postData.put("pic_name",newFileName);
			}	
		}else{
			return "{\"success\":false}";
		}
		
		User user = (User)session.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
		postData.put("pic_type","003");
		
		postData.put("order_no",(String)postData.get("dcl_id"));
        
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
	 * 删除图片
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/deleteTaxbackPic")
	@ResponseBody
	public Object deleteTaxbackPic(@RequestParam Map postData,HttpSession session) {
		// 加入sp的名称
		postData.put("spName", "fc_attachment_pic_delete");
		     		
		 String paramNames[] = {"pic_id"};
		     		
		 int code=baseService.doCallSp(postData, paramNames, null);
		        
		 if(code!=0){
		    return this.getAjaxResult(code);
		 }
		     	
		return "{\"success\":true}";
    }
	
//	/**
//	 * 下载文件
//	 * 
//	 * @return
//	 */
//	//下载上传文件模板数据
//	@RequestMapping(value="/downloadTaxbackPicFile")
//    public void downloadTaxbackPicFile(String filename,HttpServletResponse response) throws EncryptedDocumentException, InvalidFormatException, IOException {
//		if(filename != null && !"".equals(filename)){
//			ByteArrayOutputStream out = new ByteArrayOutputStream();  
//			// 首先获得图片存放的根路径
//			Properties props = initialBeanListener.getProps();
//			String webroot = (String) props.get("images.rootPath");
//			FileInputStream fis = new FileInputStream(webroot + "tb_pic/"+filename);
//			
//			byte[] arr = new byte[5];// 这里 如果没ByteArrayOutputStream 就有可能会产生乱码  
//	        int len = -1;  
//	        while ((len = fis.read(arr)) != -1) {  
//	        	out.write(arr, 0, len);// 写到内存数组中去  
//	        }  
//
//	        byte[] bytes = out.toByteArray();
//	        response.setContentType("application/x-msdownload");  
//	        response.setContentLength(bytes.length);  
//	        response.setHeader("Content-Disposition", "attachment;filename="  
//	                + new String(filename.getBytes("gb2312"), "ISO8859-1"));
//
//	        response.getOutputStream().write(bytes);
//		}	 
//    }

}
