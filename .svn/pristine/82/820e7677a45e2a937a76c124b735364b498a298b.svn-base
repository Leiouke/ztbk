package com.cnpiecsb.np.politicalCheck.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 专门给到货政审用的
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np/politicalCheck")
public class PoliticalCheckController extends ZtbkServiceController {
	// 到货单表头查询
	private int deliveryOrderManageQueryId = 5110051;	
	private GridHeadConfig deliveryOrderManageQueryHeadConfig;
	
	// 到货单期刊明细查询
	private int deliveryOrderItemsQueryId = 5110052;
	private GridHeadConfig deliveryOrderItemsQueryHeadConfig;
	
	// 到货商品明细查询
	private int productItemsQueryId = 5111001;
	private GridHeadConfig productItemsQueryHeadConfig;
	
	// 到货单引入查询
	private int deliveryOrderPullQueryId = 5110050;
	private GridHeadConfig deliveryOrderPullHeadConfig;
	
	// 明细政审记录查询
	private int itemPoliticalCheckQueryId = 5110053;
	private GridHeadConfig itemPoliticalCheckHeadConfig;
	
	// 明细政审图片查询
	private int itemPoliticalCheckPicQueryId = 5110056;
	private GridHeadConfig itemPoliticalCheckPicHeadConfig;
	
	// 到货单明细确认查询
	private int deliveryOrderItemConfirmQueryId = 5110054;
	private GridHeadConfig deliveryOrderItemConfirmQueryHeadConfig;
	
	// 政审上报查询
	private int politicalCheckReportQueryId = 5110055;	
	private GridHeadConfig politicalCheckReportQueryHeadConfig;
	
	// 政审参考查询
	private int politicalCheckItemConsultQueryId = 5110060;
	private GridHeadConfig politicalCheckItemConsultQueryHeadConfig;
	//历史一审记录查询
	private GridHeadConfig firstPoliticalCheckItemConsultQueryHeadConfig;	
	
	// 政审查询
	private int politicalCheckQueryId = 5111002;
	private GridHeadConfig politicalCheckQueryHeadConfig;
	
	// 政审不通过查询
	private int politicalCheckNoPassQueryId = 5110074;
	private GridHeadConfig politicalCheckNoPassQueryHeadConfig;
	
	// 需要跟益华数据库进行交互的, 主要是sp的交换 可以直接方式来写
//	@Autowired
//	private YhService yhService;
	
	@Resource
	private InitialBeanListener initialBeanListener;  //存放了system.property配置项
	
	public PoliticalCheckController(){
		deliveryOrderManageQueryHeadConfig = new GridHeadConfig(deliveryOrderManageQueryId,true,false,true,false);
		deliveryOrderManageQueryHeadConfig.setOperatorWidth(190);
		
		deliveryOrderItemsQueryHeadConfig = new GridHeadConfig(deliveryOrderItemsQueryId,true,true,true,false);
		deliveryOrderItemsQueryHeadConfig.setOperatorWidth(240);
		
		productItemsQueryHeadConfig = new GridHeadConfig(productItemsQueryId,true,true,true,false);
		productItemsQueryHeadConfig.setOperatorWidth(240);
		
		deliveryOrderPullHeadConfig = new GridHeadConfig(deliveryOrderPullQueryId,true,true,false,false);
		
		itemPoliticalCheckHeadConfig = new GridHeadConfig(itemPoliticalCheckQueryId,true,false,true,false);
		itemPoliticalCheckHeadConfig.setOperatorWidth(120);
		
		itemPoliticalCheckPicHeadConfig = new GridHeadConfig(itemPoliticalCheckPicQueryId,true,false,true,false);
		
		deliveryOrderItemConfirmQueryHeadConfig = new GridHeadConfig(deliveryOrderItemConfirmQueryId,true,false,false,false);
		deliveryOrderItemConfirmQueryHeadConfig.setOperatorWidth(120);
		
		politicalCheckReportQueryHeadConfig = new GridHeadConfig(politicalCheckReportQueryId,true,false,false,false);
		
		politicalCheckItemConsultQueryHeadConfig = new GridHeadConfig(politicalCheckItemConsultQueryId,false,false,false,false);
		
		firstPoliticalCheckItemConsultQueryHeadConfig = new GridHeadConfig(politicalCheckItemConsultQueryId,false,true,false,false);
		
		politicalCheckNoPassQueryHeadConfig = new GridHeadConfig(politicalCheckNoPassQueryId,false,false,false,false);
		
		politicalCheckQueryHeadConfig = new GridHeadConfig(politicalCheckQueryId,true,false,true,false);
//		politicalCheckQueryHeadConfig.setOperatorWidth(160);
	}
	
	/**
	 * 进入到货单管理界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/deliveryOrderManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView deliveryOrderManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/deliveryOrderManage");
        String tableHeader = this.getTableHeader(httpSession,deliveryOrderManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", deliveryOrderManageQueryId);
        return mv;
    }
	
	/**
	 * 获得到货单数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getDeliveryOrderList")
	@ResponseBody
	public Object getDeliveryOrderList(@RequestBody Map postData){
		return this.getTableDataList(postData, deliveryOrderManageQueryId);
	}
	
	/**
	 * 进入引入到货单界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/deliveryOrderPull")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView deliveryOrderPull(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/deliveryOrderPull");
        String tableHeader = this.getTableHeader(httpSession,deliveryOrderPullHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", deliveryOrderPullQueryId);
        return mv;
    }
	
	/**
	 * 获得引入到货单数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getDeliveryOrderPullList")
	@ResponseBody
	public Object getDeliveryOrderPullList(@RequestBody Map postData){
		return this.getTableDataList(postData, deliveryOrderPullQueryId);
	}
	
	/**
	 * 进入到货单明细界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/deliveryOrderItems")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView deliveryOrderItems(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/deliveryOrderItems");
        String tableHeader = this.getTableHeader(httpSession, deliveryOrderItemsQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", deliveryOrderItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得到货单明细数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getDeliveryOrderItemsList")
	@ResponseBody
	public Object getDeliveryOrderItemsList(@RequestBody Map postData){
		String first_complete = postData.get("first_complete").toString();
		String second_complete = postData.get("second_complete").toString();
		String third_complete = postData.get("third_complete").toString();
		
		// 审核完成率的判断
		if (first_complete.equals("1")) {
			postData.put("zs_pop", 1);
		} else if (first_complete.equals("0")) {
			postData.put("zs_pop_no", 0);
		}
		
		if (second_complete.equals("1")) {
			postData.put("zs_pop", 2);
		} else if (second_complete.equals("0")) {
			postData.put("zs_pop_no", 1);
		}
		
		if (third_complete.equals("1")) {
			postData.put("zs_pop", 3);
		} else if (third_complete.equals("0")) {
			postData.put("zs_pop_no", 2);
		}		
		
		return this.getTableDataList(postData, deliveryOrderItemsQueryId);
	}
	
	/**
	 * 进入到货商品明细界面, 用于审读
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/productItems")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView productItems(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/productItems");
        String tableHeader = this.getTableHeader(httpSession, productItemsQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", productItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得到货商品明细数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getProductItemsList")
	@ResponseBody
	public Object getProductItemsList(@RequestBody Map postData){
		String first_complete = postData.get("first_complete").toString();
		String second_complete = postData.get("second_complete").toString();
		String third_complete = postData.get("third_complete").toString();
		
		// 审核完成率的判断
		if (first_complete.equals("1")) {
			postData.put("zs_pop", 1);
		} else if (first_complete.equals("0")) {
			postData.put("zs_pop_no", 0);
		}
		
		if (second_complete.equals("1")) {
			postData.put("zs_pop", 2);
		} else if (second_complete.equals("0")) {
			postData.put("zs_pop_no", 1);
		}
		
		if (third_complete.equals("1")) {
			postData.put("zs_pop", 3);
		} else if (third_complete.equals("0")) {
			postData.put("zs_pop_no", 2);
		}
		
		return this.getTableDataList(postData, productItemsQueryId);
	}
	
	/**
	 * 商品政审查询界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/politicalCheckQuery")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView politicalCheckQuery(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/politicalCheckQuery");
        String tableHeader = this.getTableHeader(httpSession, politicalCheckQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", politicalCheckQueryId);
        return mv;
    }
	
	/**
	 * 获得商品政审数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getPoliticalCheckQueryList")
	@ResponseBody
	public Object getPoliticalCheckQueryList(@RequestBody Map postData){
		return this.getTableDataList(postData, politicalCheckQueryId);
	}
	
	/**
	 * 进入明细政审界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/itemPoliticalCheck")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView itemPoliticalCheck(@RequestParam Map postData, HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        Map<String, Object> oneQuery = baseService.getOneQuery(deliveryOrderItemsQueryId, postData);
        oneQuery.remove("zs1_opn");
        oneQuery.remove("zs2_opn");
        oneQuery.remove("zs3_opn");
        mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/politicalCheck/itemPoliticalCheck");   
        
        String tableHeader = this.getTableHeader(httpSession, itemPoliticalCheckHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", itemPoliticalCheckQueryId);
        return mv;
    }
	
	/**
	 * 获得明细政审记录数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getItemPoliticalCheckList")
	@ResponseBody
	public Object getItemPoliticalCheckList(@RequestBody Map postData){
		return this.getTableDataList(postData, itemPoliticalCheckQueryId);
	}
	
	/**
	 * 查询当前的明细政审信息
	 * 
	 * param postData
	 * return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/queryItemPoliticalCheck")
	@ResponseBody
    public Object queryItemPoliticalCheck(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException {
		Map<String, Object> oneQuery = baseService.getOneQuery(deliveryOrderItemsQueryId, postData);
		return oneQuery;
    }
	
	/**
	 * 引入到货单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/importDeliveryOrder")
	@ResponseBody
	public Object importDeliveryOrder(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		if(postData != null && postData.size()>0){
			for(Map<String,Object> item_map : postData){
				String paramNames[] = new String[]{"qk_dh_id", "station_id", "job_no"};
				// 加入sp的名称
				item_map.put("spName", "u_np_qk_instance_dh_new");
				item_map.put("job_no", user.getAccount());
						
				int code = baseService.doCallSp(item_map, paramNames, null);
				
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}		
		}				
		return "{\"success\":true}";
	}
	
	/**
	 * 批量政审通过(只针对未政审的明细)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/batchPoliticalCheckPass")
	@ResponseBody
	public Object batchPoliticalCheckPass(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		if(postData != null && postData.size()>0){
			for(Map<String,Object> item_map : postData){
				String paramNames[] = new String[]{"qk_dh_id", "ItemExclusiveCode", "zs1_man", "zs1_result", "zs2_man", "zs2_result",
						 "zs3_man", "zs3_result", "zs_pop", "zs1_opn", "zs2_opn", "zs3_opn", "operate_type"};
				// 加入sp的名称
				item_map.put("spName", "u_np_qk_instance_dh_item_zs_update");
				
				// 假如不是未政审状态, 直接跳过 不进行政审通过联审
				if (!item_map.get("zs_pop").equals("0")) {
					continue;
				}
				item_map.put("zs1_man", user.getAccount());
				item_map.put("operate_type", 1);  // 提交
						
				int code = baseService.doCallSp(item_map, paramNames, null);
				
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}		
		}				
		return "{\"success\":true}";
	}
	
	/**
	 * 单次政审操作
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/onePoliticalCheck")
	@ResponseBody
    public Object onePoliticalCheck(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_dh_id", "ItemExclusiveCode", "zs1_man", "zs1_result", "zs2_man", "zs2_result",
				 "zs3_man", "zs3_result", "zs_pop", "zs1_opn", "zs2_opn", "zs3_opn", "operate_type"};

		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_item_zs_update");
		
		postData.put("zs1_man", user.getAccount());
		postData.put("zs2_man", user.getAccount());
		postData.put("zs3_man", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 新增明细政审记录
	 * 
	 * 
	 */
	@RequestMapping(value="/politicalCheckItemAdd",method=RequestMethod.GET)
    public ModelAndView saleInvoiceContentItemAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/politicalCheckItemAdd");
        return mv;
    }
	
	/**
	 * 新增关联政审信息
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/addPoliticalCheckItem")
	@ResponseBody
    public Object addPoliticalCheckItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
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
		String paramNames[] = new String[]{"ItemExclusiveCode", "qk_dh_id", "h_id", "pages", "text_title", "text_chinese",
				 "text_describe", "text_type", "last_modify_man"};
		
		String returnNames[] = new String[]{"zs_id"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_zs_new");
		
		postData.put("last_modify_man", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改关联政审信息界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/toPoliticalCheckItemEdit", method=RequestMethod.GET)
    public ModelAndView toPoliticalCheckItemEdit(@RequestParam Map postData) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/politicalCheckItemEdit");
        
        // 单记录查询
     	Map<String, Object> oneQuery = baseService.getOneQuery(itemPoliticalCheckQueryId, postData);
     	oneQuery.remove("pages");
     	oneQuery.remove("text_title");
     	oneQuery.remove("text_chinese");
     	oneQuery.remove("text_describe");
     	mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        return mv;
    }
	
	/**
	 * 查询当前的明细政审信息
	 * 
	 * param postData
	 * return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/queryPoliticalCheckItem")
	@ResponseBody
    public Object queryPoliticalCheckItem(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException {
		Map<String, Object> oneQuery = baseService.getOneQuery(itemPoliticalCheckQueryId, postData);
		return oneQuery;
    }
	
	/**
	 * 修改关联政审信息
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/editPoliticalCheckItem")
	@ResponseBody
    public Object editPoliticalCheckItem(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
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
		String paramNames[] = new String[]{"zs_id", "zs_pop", "pages", "text_title", "text_chinese",
				 "text_describe", "text_type", "last_modify_man"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_zs_update");
		
		postData.put("last_modify_man", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除关联政审信息
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/deletePoliticalCheckItem")
	@ResponseBody
    public Object deletePoliticalCheckItem(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"zs_id", "zs_pop", "last_modify_man"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_zs_del");
		
		postData.put("last_modify_man", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入明细政审图片管理界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/itemPoliticalCheckPic")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView itemPoliticalCheckPic(@RequestParam Map postData, HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/itemPoliticalCheckPic");   
        
        String tableHeader = this.getTableHeader(httpSession, itemPoliticalCheckPicHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", itemPoliticalCheckPicQueryId);
        return mv;
    }
	
	/**
	 * 获得明细政审图片记录数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getItemPoliticalCheckPicList")
	@ResponseBody
	public Object getItemPoliticalCheckPicList(@RequestBody Map postData){
		return this.getTableDataList(postData, itemPoliticalCheckPicQueryId);
	}
	
	/**
	 * 上传图片文件
	 * 
	 * 
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/addItemPoliticalCheckPic")
	@ResponseBody
	public Object addItemPoliticalCheckPic(@RequestParam Map postData,HttpSession session,@RequestParam("pic")MultipartFile file) throws IOException {
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
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(imagePath + "np_political/" + newFileName));
				postData.put("pic_address",newFileName);
			}	
		}else{
			return "{\"success\":false}";
		}
		
		User user = (User)session.getAttribute("user");
		postData.put("pic_man", user.getAccount());
        
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_zs_pic");
     		
        String paramNames[] = {"zs_id", "pic_address","pic_man"};
     		
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
	@RequestMapping(value="/deleteItemPoliticalCheckPic")
	@ResponseBody
	public Object deleteItemPoliticalCheckPic(@RequestParam Map postData,HttpSession session) {
		User user = (User)session.getAttribute("user");
		postData.put("pic_man", user.getAccount());
        
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_zs_pic_del");
     		
        String paramNames[] = {"pic_id", "pic_man"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	 * 进入到货单明细确认界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/deliveryOrderItemConfirm")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView deliveryOrderItemConfirm(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/deliveryOrderItemConfirm");
        String tableHeader = this.getTableHeader(httpSession, deliveryOrderItemConfirmQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", deliveryOrderItemConfirmQueryId);
        return mv;
    }
	
	/**
	 * 获得到货单明细确认数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getDeliveryOrderItemConfirmList")
	@ResponseBody
	public Object getDeliveryOrderItemConfirmList(@RequestBody Map postData){
		return this.getTableDataList(postData, deliveryOrderItemConfirmQueryId);
	}
	
	/**
	 * 修改明细实到数
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/updateDeliveryOrderItemAmount")
	@ResponseBody
	public Object updateDeliveryOrderItemAmount(@RequestParam Map postData) {
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_item_update");
     		
        String paramNames[] = {"qk_dh_id", "ItemExclusiveCode", "h_amount_dh"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	 * 整单确认
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/deliveryOrderAmountConfirm")
	@ResponseBody
	public Object deliveryOrderAmountConfirm(@RequestParam Map postData,HttpSession session) {
		User user = (User)session.getAttribute("user");
		postData.put("confirm_man", user.getAccount());
		postData.put("confirm_man_name", user.getUserName());
        
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_confirm");
     		
        String paramNames[] = {"qk_dh_id", "confirm_man", "confirm_man_name"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	 * 进入政审上报管理界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/politicalCheckReport")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView politicalCheckReport(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/politicalCheckReport");
        String tableHeader = this.getTableHeader(httpSession,politicalCheckReportQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", politicalCheckReportQueryId);
        return mv;
    }
	
	/**
	 * 获得政审上报数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getPoliticalCheckReportList")
	@ResponseBody
	public Object getPoliticalCheckReportList(@RequestBody Map postData){
		return this.getTableDataList(postData, politicalCheckReportQueryId);
	}
	
	/**
	 * 进入政审明细参考查询界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/politicalCheckItemConsult")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView politicalCheckItemConsult(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/politicalCheckItemConsult");
        String tableHeader = this.getTableHeader(httpSession, politicalCheckItemConsultQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", politicalCheckItemConsultQueryId);
        return mv;
    }
	
	/**
	 * 获得政审明细参考数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getPoliticalCheckItemConsultList")
	@ResponseBody
	public Object getPoliticalCheckItemConsultList(@RequestBody Map postData){
		return this.getTableDataList(postData, politicalCheckItemConsultQueryId);
	}
	
	/**
	 * 下载文件
	 * 
	 * @return
	 */
	//下载上传文件模板数据
	@RequestMapping(value="/downloadPoliticalFile")
    public void downloadCatalogueFile(String filename,HttpServletResponse response) throws EncryptedDocumentException, InvalidFormatException, IOException {
		if(filename != null && !"".equals(filename)){
			ByteArrayOutputStream out = new ByteArrayOutputStream();  
			// 首先获得图片存放的根路径
			Properties props = initialBeanListener.getProps();
			String webroot = (String) props.get("images.rootPath");
			FileInputStream fis = new FileInputStream(webroot + "np_political/"+filename);
			
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
	 * 重新获取到货单数据
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/deliveryOrderSynchronize")
	@ResponseBody
	public Object deliveryOrderSynchronize(@RequestParam Map postData,HttpSession session) {
		User user = (User)session.getAttribute("user");
		postData.put("input_code", user.getAccount());
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_single_sys");
     		
        String paramNames[] = {"qk_dh_id", "input_code"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	 * 退回到待一审状态
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/gobackPoliticalCheckItem")
	@ResponseBody
	public Object gobackPoliticalCheckItem(@RequestParam Map postData,HttpSession session) {
		User user = (User)session.getAttribute("user");
		postData.put("operate_man", user.getAccount());
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_item_zs_goback");
     		
        String paramNames[] = {"ItemExclusiveCode", "operate_man"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	 * 到货确认
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/deliveryOrderFhConfirm")
	@ResponseBody
	public Object deliveryOrderFhConfirm(@RequestParam Map postData,HttpSession session) {
		User user = (User)session.getAttribute("user");
		postData.put("fh_man", user.getAccount());
		postData.put("fh_man_name", user.getUserName());
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_fh_confirm");
     		
        String paramNames[] = {"qk_dh_id", "fh_man","fh_man_name"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	 * 进入引入到货单界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/deliveryOrderNopassDeatil")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView deliveryOrderNopassDeatil(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/deliveryOrderNopassDeatil");
        String tableHeader = this.getTableHeader(httpSession,politicalCheckNoPassQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", politicalCheckNoPassQueryId);
        return mv;
    }
	
	/**
	 * 获得政审明细参考数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getDeliveryOrderNopassDeatil")
	@ResponseBody
	public Object getDeliveryOrderNopassDeatil(@RequestBody Map postData){
		return this.getTableDataList(postData, politicalCheckNoPassQueryId);
	}
	
	/**
	 * 进入审读派发界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/politicalZsAssignManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView politicalZsAssignManage(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/politicalZsAssignManage");

        return mv;
    }
	
	/**
	 * 进入批量审读派发界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/politicalZsAssignBatchManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView politicalZsAssignBatchManage(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/politicalZsAssignBatchManage");

        return mv;
    }
	
	/**
	 * 审读派发
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/politicalZsAssign")
	@ResponseBody
	public Object politicalZsAssign(@RequestParam Map postData,HttpSession session) {
		User user = (User)session.getAttribute("user");
		postData.put("zp_man", user.getAccount());
        // 加入sp的名称
		postData.put("spName", "u_np_qk_instance_dh_item_zp_update");
     		
        String paramNames[] = {"ItemExclusiveCode", "zpzs_man","hope_date","zp_man"};
     		
     	int code=baseService.doCallSp(postData, paramNames, null);
        
        if(code!=0){
        	return this.getAjaxResult(code);
        }
     	
        return "{\"success\":true}";
    }
	
	/**
	 * 批量审读派发
	 * 
	 * @param postData
	 * @param session
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/politicalZsBatchAssign")
	@ResponseBody
	public Object politicalZsBatchAssign(@RequestParam Map postData,HttpSession session,HttpServletRequest request) {
		String[] item_ids = request.getParameterValues("item_ids");
		for(String ItemExclusiveCode:item_ids){
			User user = (User)session.getAttribute("user");
			postData.put("zp_man", user.getAccount());
			postData.put("ItemExclusiveCode", ItemExclusiveCode);
	        // 加入sp的名称
			postData.put("spName", "u_np_qk_instance_dh_item_zp_update");
	     		
	        String paramNames[] = {"ItemExclusiveCode", "zpzs_man","hope_date","zp_man"};
	     		
	     	int code=baseService.doCallSp(postData, paramNames, null);
	        
	        if(code!=0){
	        	return this.getAjaxResult(code);
	        }
		}
		
        return "{\"success\":true}";
    }
	
	/**
	 * 进入一审明细参考查询界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/firstPoliticalCheckItemConsult")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView firstPoliticalCheckItemConsult(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/politicalCheck/firstPoliticalCheckItemConsult");
        String tableHeader = this.getTableHeader(httpSession, firstPoliticalCheckItemConsultQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", politicalCheckItemConsultQueryId);
        return mv;
    }
	
	/**
	 * 获得一审明细参考数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getFirstPoliticalCheckItemConsultList")
	@ResponseBody
	public Object getFirstPoliticalCheckItemConsultList(@RequestBody Map postData){
		return this.getTableDataList(postData, politicalCheckItemConsultQueryId);
	}
	
	public static void main(String[] args) {
		String a = "Smart Mathematicians  2022.7 代销大范围CD撤p45.txt";
		int b = a.lastIndexOf(".");
		System.out.println(a.substring(0,40));
	}
}
