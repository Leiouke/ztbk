package com.cnpiecsb.np.politicalCheck.controller;

import java.io.IOException;
import java.util.HashMap;
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

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 专门给代理审读用的
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np/politicalCheck")
public class ProxyPoliticalCheckController extends ZtbkServiceController {	
	// 代理到货记录查询
	private int proxyDeliveryOrderManageQueryId = 5110064;
	private GridHeadConfig proxyDeliveryOrderManageHeadConfig;
	
	// 代理到货单明细查询
	private int proxyDeliveryOrderItemsQueryId = 5110066;
	private GridHeadConfig proxyDeliveryOrderItemsQueryHeadConfig;
	
	// 明细政审记录查询
	private int proxyItemPoliticalCheckQueryId = 5110053;
	private GridHeadConfig proxyItemPoliticalCheckHeadConfig;
	
	public ProxyPoliticalCheckController(){
		proxyDeliveryOrderManageHeadConfig = new GridHeadConfig(proxyDeliveryOrderManageQueryId,true,false,true,false);
		proxyDeliveryOrderManageHeadConfig.setOperatorWidth(170);
		
		proxyDeliveryOrderItemsQueryHeadConfig = new GridHeadConfig(proxyDeliveryOrderItemsQueryId,true,true,true,false);
		proxyDeliveryOrderItemsQueryHeadConfig.setOperatorWidth(100);
		
		proxyItemPoliticalCheckHeadConfig = new GridHeadConfig(proxyItemPoliticalCheckQueryId,true,false,true,false);
		proxyItemPoliticalCheckHeadConfig.setOperatorWidth(100);
	}
	

	/**
	 * 进入代理审读管理界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/proxyDeliveryOrderManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView proxyDeliveryOrderManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/proxyDeliveryOrderManage");
        String tableHeader = this.getTableHeader(httpSession, proxyDeliveryOrderManageHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", proxyDeliveryOrderManageQueryId);
        return mv;
    }
	
	/**
	 * 获得代理审读数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getProxyDeliveryOrderManageList")
	@ResponseBody
	public Object getProxyPoliticalCheckManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, proxyDeliveryOrderManageQueryId);
	}
	
	/**
	 * 进入新增代理到货记录界面
	 * 
	 * 
	 */
	@RequestMapping(value="/proxyDeliveryOrderAdd",method=RequestMethod.GET)
    public ModelAndView proxyDeliveryOrderAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/proxyDeliveryOrderAdd");
        return mv;
    }
	
	/**
	 * 新增代理到货
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/addProxyDeliveryOrder")
	@ResponseBody
    public Object addProxyDeliveryOrder(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"o_id_input", "o_id_name", "ps_date", "dh_memo", "f_name", "c_name", "yd_no", "invoice_no"};
		
		String returnNames[] = new String[]{"qk_dh_id"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_new");
		
		postData.put("o_id_input", user.getAccount());
		postData.put("o_id_name", user.getUserName());
				
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改代理到货信息界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/toProxyDeliveryOrderEdit", method=RequestMethod.GET)
    public ModelAndView toProxyDeliveryOrderEdit(@RequestParam Map postData) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/proxyDeliveryOrderEdit");
        
        // 单记录查询
     	Map<String, Object> oneQuery = baseService.getOneQuery(proxyDeliveryOrderManageQueryId, postData);
     	mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        return mv;
    }
	
	/**
	 * 修改代理到货
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/editProxyDeliveryOrder")
	@ResponseBody
    public Object editProxyDeliveryOrder(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id", "o_id_input", "ps_date", "dh_memo", "f_name", "c_name", "yd_no", "invoice_no"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_update");
		
		postData.put("o_id_input", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除代理到货
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/deleteProxyDeliveryOrder")
	@ResponseBody
    public Object deleteProxyDeliveryOrder(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id", "o_id_input"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_del");
		
		postData.put("o_id_input", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入代理到货单明细界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/proxyDeliveryOrderItems")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView proxyDeliveryOrderItems(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/proxyDeliveryOrderItems");
        String tableHeader = this.getTableHeader(httpSession, proxyDeliveryOrderItemsQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", proxyDeliveryOrderItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得代理到货单明细数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getProxyDeliveryOrderItemsList")
	@ResponseBody
	public Object getProxyDeliveryOrderItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, proxyDeliveryOrderItemsQueryId);
	}
	
	/**
	 * 进入新增代理到货记录界面
	 * 
	 * 
	 */
	@RequestMapping(value="/proxyDeliveryOrderItemAdd",method=RequestMethod.GET)
    public ModelAndView proxyDeliveryOrderItemAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/proxyDeliveryOrderItemAdd");
        return mv;
    }
	
	/**
	 * 新增代理到货明细
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/addProxyDeliveryOrderItem")
	@ResponseBody
    public Object addProxyDeliveryOrderItem(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id", "o_id_input", "qk_name", "mail_code","period_name", "memo"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_item_new");
		
		postData.put("o_id_input", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除代理到货明细
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/deleteProxyDeliveryOrderItem")
	@ResponseBody
    public Object deleteProxyDeliveryOrderItem(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id", "ItemExclusiveCode", "o_id_input"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_item_del");
		
		postData.put("o_id_input", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入代理明细政审界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/proxyItemPoliticalCheck")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView proxItemPoliticalCheck(@RequestParam Map postData, HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        Map<String, Object> oneQuery = baseService.getOneQuery(proxyDeliveryOrderItemsQueryId, postData);
        mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/proxyPoliticalCheck/proxyItemPoliticalCheck");   
        
        String tableHeader = this.getTableHeader(httpSession, proxyItemPoliticalCheckHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", proxyItemPoliticalCheckQueryId);
        return mv;
    }
	
	/**
	 * 获得代理明细政审记录数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getProxyItemPoliticalCheckList")
	@ResponseBody
	public Object getProxItemPoliticalCheckList(@RequestBody Map postData){
		return this.getTableDataList(postData, proxyItemPoliticalCheckQueryId);
	}
	
	/**
	 * 新增明细政审记录
	 * 
	 * 
	 */
	@RequestMapping(value="/proxyPoliticalCheckItemAdd",method=RequestMethod.GET)
    public ModelAndView proxPoliticalCheckItemAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/proxPoliticalCheckItemAdd");
        return mv;
    }
	
	/**
	 * 新增关联政审信息
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/addProxyPoliticalCheckItem")
	@ResponseBody
    public Object addProxyPoliticalCheckItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		// 以下需要收集复选框的所有信息
		String[] text_type_arry = request.getParameterValues("text_type");
		
		String text_types="";
		for(String types:text_type_arry){
			text_types += types+",";
		}
		text_types=text_types.substring(0, text_types.length()-1);
		
		postData.put("text_type", text_types);
		
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id","ItemExclusiveCode", "mail_code", "qk_name", "pages", "text_title", "text_chinese",
				 "text_describe", "text_type", "last_modify_man"};
		
		String returnNames[] = new String[]{"zs_id"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_proxy_zs_new");
		
		postData.put("last_modify_man", user.getAccount());
		
		Map<String, Object> oneQuery = baseService.getOneQuery(proxyDeliveryOrderItemsQueryId, postData);
		postData.put("mail_code", oneQuery.get("mail_code"));
		postData.put("qk_name", oneQuery.get("qk_name"));     
				
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入代理到货结算界面
	 * 
	 * 
	 */
	@RequestMapping(value="/toProxyDeliveryOrderSettle",method=RequestMethod.GET)
    public ModelAndView toProxyDeliveryOrderSettle(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/toProxyDeliveryOrderSettle");
        return mv;
    }
	
	/**
	 * 结算代理到货
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/settleProxyDeliveryOrder")
	@ResponseBody
    public Object settleProxyDeliveryOrder(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id", "confirm_man", "confirm_man_name", "confirm_date"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_confirm");
		
//		postData.put("confirm_man", user.getAccount());
//		postData.put("confirm_man_name", user.getUserName());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入上传书展入库明细
	 * 
	 * @return
	 */
	@RequestMapping(value="/proxyDeliveryOrderItemUploadAdd") 
    public ModelAndView libraryDuplicateItemUpload(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
        mv.setViewName("np/proxyPoliticalCheck/proxyPoliticalCheckItemsUpload");
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
	@RequestMapping(value="/uploadproxyDeliveryOrderItem",method=RequestMethod.POST)
	@ResponseBody
    public Object uploadproxyDeliveryOrderItem(MultipartFile excel,HttpSession httpSession, HttpServletRequest request) throws EncryptedDocumentException, InvalidFormatException, IOException {
		if(!excel.isEmpty()) {
			Workbook workbook = WorkbookFactory.create(excel.getInputStream());
			Sheet sheet = workbook.getSheetAt(0);  // 指代sheet1, 索引从0开始
			int rowNum = 0;
			int success=0;  // 成功的记录数
			String qk_dh_id = request.getParameter("qk_dh_id");
			Map<String, Object> map = new HashMap();
			map.put("qk_dh_id", qk_dh_id);
			// 先清空该批次所有的临时表明细数据
			clearProxyDeliveryOrderItemTemp(map);
			for (rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++){  // 行数，真实数据索引也从1开始
				Row row = sheet.getRow(rowNum);	
				Map<String, Object> itemMap = new HashMap();
				itemMap.put("qk_dh_id", qk_dh_id);
				for (int i = 0; i < 4; i++) {
					System.out.println("i="+i);
					if (row == null) {
						break;
					}
					Cell cell = row.getCell(i);
					if (cell != null){
						switch(i){
							case 0:{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("qk_name", cell.getStringCellValue().trim());
								break;
							}
							case 1:{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("mail_code", cell.getStringCellValue().trim());break;}
							case 2:{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("period_name", cell.getStringCellValue().trim());
								break;
							}	
							case 3:{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								itemMap.put("memo", cell.getStringCellValue().trim());
								break;
							}	
						}						
					}
				}
				int code = addProxyDeliveryOrderItemtemp(itemMap,httpSession);
				if(code == 0) {
					success++;
				} else {
					return this.getAjaxResult(code);
				}
			}

			// 最后正式表明细插入汇总
			addProxyDeliveryOrderItemUploadBatch(map);

			return "{\"success\":true}";
		}else{
			return "{\"success\":false}";
		}
	}
	
	public int addProxyDeliveryOrderItemtemp(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id", "o_id_input", "qk_name", "mail_code","period_name", "memo"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_item_temp_new");
		
		postData.put("o_id_input", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		return code;
    }
	
	/**
	 * 清空临时表数据
	 * 
	 * param postData
	 * return
	 */
    private int clearProxyDeliveryOrderItemTemp(Map postData){
    	// 入参, 注意按照顺序
		String paramNames[] = {"qk_dh_id"};
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_item_temp_clear");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		return code;
    }
    
    /**
	 * 批量上传导入
	 * 
	 * param postData
	 * return
	 */
    private int addProxyDeliveryOrderItemUploadBatch(Map postData){
    	// 入参, 注意按照顺序
		String paramNames[] = {"qk_dh_id"};
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dldh_item_upload_new");
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		return code;
    }
}
