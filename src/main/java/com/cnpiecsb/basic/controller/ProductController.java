package com.cnpiecsb.basic.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.GuidUtil;
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/bk/basic")
public class ProductController extends ZtbkServiceController{
	
	// 商品信息查询
	private int productManageQueryId = 10000001;	
	private GridHeadConfig productManageQueryHeadConfig;
	
	//商品期刊查询
	private int productInstanceManageQueryId = 10000004;	
	private GridHeadConfig productInstanceManageQueryHeadConfig;
	
	//商品价格查询
	private int productPriceManageQueryId = 10000028;	
	private GridHeadConfig productPriceManageQueryHeadConfig;
	
	public ProductController() {
		productManageQueryHeadConfig = new GridHeadConfig(productManageQueryId,true,false,true,false);
		productManageQueryHeadConfig.setOperatorWidth(100);
		
		productInstanceManageQueryHeadConfig = new GridHeadConfig(productInstanceManageQueryId,true,false,true,false);
		productInstanceManageQueryHeadConfig.setOperatorWidth(100);
		
		productPriceManageQueryHeadConfig = new GridHeadConfig(productPriceManageQueryId,true,false,true,false);
		productPriceManageQueryHeadConfig.setOperatorWidth(100);
		
	}
	
	/**
	 * 进入商品信息界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/productManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView productManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("basic/product/productManage");
        String tableHeader = this.getTableHeader(httpSession,productManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", productManageQueryId);
        return mv;
    }
	
	/**
	 * 获得商品信息数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getProductList")
	@ResponseBody
	public Object getProductList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, productManageQueryId);
	}
	
	/**
	 * 刊期页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toProductInstance",method=RequestMethod.GET)
    public ModelAndView toProductInstance(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("basic/product/productInstanceManage");
        
        // 单记录查询
     	Map<String, Object> oneQuery = baseService.getOneQuery(productManageQueryId, postData);
        
        String tableHeader = this.getTableHeader(httpSession, productInstanceManageQueryHeadConfig);
        mv.addObject("qk_id", (String)postData.get("qk_id"));
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", productInstanceManageQueryId);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		
        return mv;
    }
	
	/**
	 * 获得商品期刊信息数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getProductInstance")
	@ResponseBody
	public Object getProductInstance(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, productInstanceManageQueryId);
	}
	
	/**
	 * 刊期新增页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/productInstanceAdd",method=RequestMethod.GET)
    public ModelAndView productInstanceAdd(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("basic/product/productInstanceAddManage");
        
        String tableHeader = this.getTableHeader(httpSession, productInstanceManageQueryHeadConfig);
        mv.addObject("qk_id", (String)postData.get("qk_id"));
		
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
	 * 刊期删除操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/productInstanceDelete")
	@ResponseBody
    public Object productInstanceDelete(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_id", "period_id","is_stop","o_id_input"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_product_instance_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		postData.put("is_stop", "1");//1是停用
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		return "{\"success\":true}";
    }
	
	/**
	 * 刊期自动新增页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/productInstanceAutoAdd",method=RequestMethod.GET)
    public ModelAndView productInstanceAutoAdd(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("basic/product/productInstanceAutoAddManage");
        
        String tableHeader = this.getTableHeader(httpSession, productInstanceManageQueryHeadConfig);
        mv.addObject("qk_id", (String)postData.get("qk_id"));
		
        return mv;
    }
	
	/**
	 * 刊期新增操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/addProductInstanceAuto")
	@ResponseBody
    public Object addProductInstanceAuto(@RequestParam Map postData,HttpSession httpSession){
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("input_code", user.getAccount());
		
		// 入参, 注意按照顺序
		String paramNames[] = {"NewspaperName",
			    "StartDate DATE",
			    "EndDate DATE",
			    "Type",
			    "Rule1",
			    "Rule2",
			    "IssuesPerYear"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_product_instance_auto_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 刊期修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/productInstanceEdit",method=RequestMethod.GET)
    public ModelAndView productInstanceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(productInstanceManageQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("qk_id", (String)postData.get("qk_id"));
		mv.addObject("period_id", (String)postData.get("period_id"));
		mv.setViewName("basic/product/productInstanceEditManage");
		
        return mv;
    }
	
	/**
	 * 刊期修改操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/editProductInstance")
	@ResponseBody
    public Object editProductInstance(@RequestParam Map postData,HttpSession httpSession){
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("input_code", user.getAccount());
		
		// 入参, 注意按照顺序
		String paramNames[] = {"qk_id",
		          "period_id",
		          "is_total",
		          "is_stop",
		          "yd_date",
		          "jh_date",
		          "mem",
		          "h_id",
		          "is_exchange",
		          "input_date",
		          "o_id_input",
		          "h_total_period_id",
		          "last_mod_date",
		          "last_trans_date",
		          "notrigger",
		          "period_name",
		          "instance_tm",
		          "instance_price",
		          "period_name_jh",
		          "start_sd_date",
		          "end_sd_date",
		          "end_bd_date",
		          "total_jh_amount",
		          "avg_rmb_jh_price",
		          "last_jh_date",
		          "pub_date"};
		
		postData.put("spName", "n_bk_qk_product_instance_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 商品新增页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/productAdd",method=RequestMethod.GET)
    public ModelAndView productAdd(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("basic/product/productAddManage");
		
        return mv;
    }
	
	/**
	 * 商品新增操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/addProduct")
	@ResponseBody
    public Object addProduct(@RequestParam Map postData,HttpSession httpSession){
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("input_code", user.getAccount());
		
		// 出参, 有顺序
		String returnNames[] = {"qk_id"};
		
		// 入参, 注意按照顺序
		String paramNames[] = {"mail_code","f_mail_code","qa_id","cn_code","abroad_code",
		          				"qk_name","pub_id", "kq_id","qk_tye","qk_price_ls","r_id",
		          				"grade_id","f_id","qk_issn","qk_mytm","is_mail","is_flag",
		          				"h_discount_qk","subclasses","sales_by_proxy","languages",
		          				"Arrival_batches","qk_name_Foreign","qkbd_style","qk_name_simple",
		          				"qk_attribute","h_amount","f_id_second","type","where_1", "where_2",
		          				"qk_zj_flag","stop_date","is_allow","pub_name_original","print_sort",
		          				"qk_id_zt51","min_zd_period",
		          				"isbn_class","gr_state_id","hg_id","is_cd","royalty","isbn_class2"};
		
		postData.put("spName", "n_bk_qk_product_new");
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 商品修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toProductEdit",method=RequestMethod.GET)
    public ModelAndView toProductEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(productManageQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.addObject("qk_id", (String)postData.get("qk_id"));
		mv.setViewName("basic/product/productEditManage");
		String tableHeader = this.getTableHeader(httpSession,productPriceManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", productPriceManageQueryId);
		
        return mv;
    }
	
	/**
	 * 商品新增操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/editProduct")
	@ResponseBody
    public Object editProduct(@RequestParam Map postData,HttpSession httpSession){
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("input_code", user.getAccount());
		
//		// 出参, 有顺序
//		String returnNames[] = {"qk_id"};
		
		// 入参, 注意按照顺序
		String paramNames[] = {"qk_id",
							   "mail_code",
							   "f_mail_code",
							   "qa_id",
							   "cn_code",
							   "abroad_code",
		          			   "qk_name",
		          			   "pub_id", 
		          			   "kq_id",
		          			   "qk_tye",
		          			   "qk_price_ls",
		          			   "r_id",
		          			   "grade_id",
		          			   "f_id",
		          			   "qk_issn",
		          			   "qk_mytm",
		          			   "is_mail",
		          			   "is_flag",
		          			   "h_discount_qk",
		          			   "subclasses",
		          			   "sales_by_proxy",
		          			   "languages",
		          			   "Arrival_batches",
		          			   "qk_name_Foreign",
		          			   "qkbd_style",
		          			   "qk_name_simple",
		          			   "qk_attribute",
		          			   "h_amount",
		          			   "f_id_second",
		          			   "type",
		          			   "where_1",
		          			   "where_2",
		          			   "qk_zj_flag",
		          			   "stop_date",
		          			   "is_allow",
		          			   "pub_name_original",
		          			   "print_sort",
		          			    "qk_id_zt51", 
		          			    "min_zd_period",
		          				"isbn_class",
		          				"gr_state_id",
		          				"hg_id",
		          				"is_cd",
		          				"royalty",
		          				"isbn_class2"};
		
		postData.put("spName", "n_bk_qk_product_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 获得商品价格数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getProductPrice")
	@ResponseBody
	public Object getProductPrice(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, productPriceManageQueryId);
	}
	
	/**
	 * 删除商品价格
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteProductPrice")
	@ResponseBody
    public Object deleteProductPrice(@RequestParam Map postData,HttpSession httpSession){
		
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"qk_id",
			      "price_class",
			      "start_date",
			      "end_date",
			      "delete_op_name"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_product_price_item_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("delete_op_name", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 新增商品价格页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/productPriceAdd",method=RequestMethod.GET)
    public ModelAndView productPriceAdd(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("basic/product/productPriceAddManage");
		mv.addObject("qk_id", postData.get("qk_id"));
		mv.addObject("qk_name", postData.get("qk_name"));
		
        return mv;
    }
	
	/**
	 * 商品价格新增操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/addProductPrice")
	@ResponseBody
    public Object addProductPrice(@RequestParam Map postData,HttpSession httpSession){
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("o_id_input", user.getAccount());
//		postData.put("cf_id", "ALL");
		postData.put("cf_type", "C");
		
		
		// 入参, 注意按照顺序
		String paramNames[] = {"qk_id",
		          "price_class",
		          "qk_price",
		          "currency_id",
		          "memo",
		          "cf_id",
		          "cf_type",
		          "h_discount",
		          "other_fee1",
		          "other_fee2",
		          "start_date",
		          "end_date",
		          "qk_price1",
		          "o_id_input"};
		
		postData.put("spName", "n_bk_qk_product_price_item_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 修改商品价格页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/productPriceEdit",method=RequestMethod.GET)
    public ModelAndView productPriceEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();      
        Map<String, Object> oneQuery = baseService.getOneQuery(productPriceManageQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("basic/product/productPriceEditManage");
		mv.addObject("qk_id", postData.get("qk_id"));
		
        return mv;
    }
	
	/**
	 * 商品价格新增操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/editProductPrice")
	@ResponseBody
    public Object editProductPrice(@RequestParam Map postData,HttpSession httpSession){
		
//		User user=(User)httpSession.getAttribute("user");
//		
//		postData.put("o_id_input", user.getAccount());
//		postData.put("cf_id", "ALL");
		postData.put("cf_type", "C");
		
		
		// 入参, 注意按照顺序
		String paramNames[] = {"qk_id",
		          "price_class",
		          "qk_price",
		          "currency_id",
		          "memo",
		          "cf_id",
		          "cf_type",
		          "h_discount",
		          "other_fee1",
		          "other_fee2",
		          "start_date",
		          "end_date",
		          "qk_price1"};
		
		postData.put("spName", "n_bk_qk_product_price_item_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }

}
