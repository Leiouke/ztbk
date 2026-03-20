package com.cnpiecsb.logistics.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/bk/logistics")
public class OutBoundController extends ZtbkServiceController{
	
	// 下架通知表头查询
	private int outBoundManageQueryId = 10000048;	
	private GridHeadConfig outBoundManageQueryHeadConfig;
				
	// 下架通知明细临时表查询
	private int outBoundItemManageQueryId = 10000039;	
	private GridHeadConfig outBoundItemManageQueryHeadConfig;
		
	// 客户可发库存查询
	private int canOutBoundQueryId = 10000045;	
	private GridHeadConfig canOutBoundQueryHeadConfig;
	
	// 下架通知明细临时表查询
	private int outBoundItemConfirmManageQueryId = 10000046;	
	private GridHeadConfig outBoundItemConfirmManageQueryHeadConfig;
		
	public OutBoundController(){
			
		outBoundManageQueryHeadConfig = new GridHeadConfig(outBoundManageQueryId,true,false,true,false);
		outBoundManageQueryHeadConfig.setOperatorWidth(100);
			
		outBoundItemManageQueryHeadConfig = new GridHeadConfig(outBoundItemManageQueryId,true,true,true,false);
		outBoundItemManageQueryHeadConfig.setOperatorWidth(100);
			
		canOutBoundQueryHeadConfig = new GridHeadConfig(canOutBoundQueryId,true,true,false,false);
		
		outBoundItemConfirmManageQueryHeadConfig = new GridHeadConfig(outBoundItemConfirmManageQueryId,true,false,false,false);
	}
	
	/**
	 * 进入下架通知界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/outBoundManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView outBoundManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("logistics/outBound/outBoundManage");
        String tableHeader = this.getTableHeader(httpSession,outBoundManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", outBoundManageQueryId);
        return mv;
    }
	
	/**
	 * 获得报刊收订数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getOutBoundList")
	@ResponseBody
	public Object getOutBoundList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, outBoundManageQueryId);
	}
	
	/**
	 * 新增出库单页面
	 * 
	 * 
	 */
	@RequestMapping(value="/outBoundAdd",method=RequestMethod.GET)
    public ModelAndView outBoundAdd(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        //获取guid
        String outBound_guid = GuidUtil.create32Guid();
        httpSession.setAttribute("outBound_guid", outBound_guid);
        
        String tableHeader = this.getTableHeader(httpSession, outBoundItemManageQueryHeadConfig);
		
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", outBoundItemManageQueryId);
        
        mv.setViewName("logistics/outBound/outBoundAdd");
        return mv;
    }
	
	/**
	 * 获得入库单新增明细临时表数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getOutBoundItemTempList")
	@ResponseBody
	public Object getOutBoundItemTempList(@RequestBody Map postData, HttpSession httpSession) {
		String outBound_guid = (String)httpSession.getAttribute("outBound_guid");
		postData.put("guid", outBound_guid);
		return this.getTableDataList(postData, outBoundItemManageQueryId);
	}
	
	/**
	 * 引入临时表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/addOutBound")
	@ResponseBody
    public Object addOutBound(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		
		
		String outBound_guid = (String)httpSession.getAttribute("outBound_guid");
		postData.put("guid", outBound_guid);
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("o_id_input", user.getAccount());
				
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","out_type","o_id_input"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_downshelf_new");
		
		String returnNames[] = {"downshelf_id"};
				
		int code = baseService.doCallSp(postData, paramNames, returnNames);
				
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 作废出库单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteOutBound")
	@ResponseBody
    public Object deleteOutBound(@RequestParam Map postData,HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("o_id_destroy", user.getAccount());
		
		// 入参, 注意按照顺序
		String paramNames[] = {"downshelf_id","o_id_destroy"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_downshelf_delete");
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 删除临时表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/deleteOutBoundItemTemp")
	@ResponseBody
    public Object deleteOutBoundItemTemp(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request)throws JsonProcessingException{
		
		String[] inc_nos = request.getParameterValues("inc_nos");
		if(inc_nos != null && inc_nos.length > 0){
			for(int i=0;i<inc_nos.length;i++){
		        String outBound_guid = (String)httpSession.getAttribute("outBound_guid");
				postData.put("guid", outBound_guid);
				
				// 入参, 注意按照顺序
				String paramNames[] = {"guid","inc_no"};
				// 加入sp的名称
				postData.put("spName", "n_bk_qk_downshelf_item_temp_delete");
				
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
	 * 新增临时表明细页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/outBoundItemTempAdd",method=RequestMethod.GET)
    public ModelAndView outBoundItemTempAdd(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("logistics/outBound/outBoundItemTempAdd");
		
		String tableHeader = this.getTableHeader(httpSession, canOutBoundQueryHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", canOutBoundQueryId);
		mv.addObject("downshelf_id", postData.get("downshelf_id"));
		
        return mv;
    }
	
	/**
	 * 获得引入客户可发库存
	 * 
	 * @return
	 */
	@RequestMapping(value="/getCanOutBoundItemTempList")
	@ResponseBody
	public Object getCanOutBoundItemTempList(@RequestBody Map postData, HttpSession httpSession) {
		String outBound_guid = (String)httpSession.getAttribute("outBound_guid");
		postData.put("guid", outBound_guid);
		return this.getTableDataList(postData, canOutBoundQueryId);
	}
	
	/**
	 * 引入临时表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/addOutBoundItemTemp")
	@ResponseBody
    public Object addOutBoundItemTemp(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request)throws JsonProcessingException{
		
		String[] stock_ids = request.getParameterValues("stock_ids");
		if(stock_ids != null && stock_ids.length > 0){
			for(int i=0;i<stock_ids.length;i++){
		        String outBound_guid = (String)httpSession.getAttribute("outBound_guid");
				postData.put("guid", outBound_guid);
				
				// 入参, 注意按照顺序
				String paramNames[] = {"guid","stock_id"};
				// 加入sp的名称
				postData.put("spName", "n_bk_qk_downshelf_item_temp_new");
				
				postData.put("stock_id", stock_ids[i]);
				
				int code = baseService.doCallSp(postData, paramNames, null);
				
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 修改页面
	 * 
	 * 
	 */
	@RequestMapping(value="/outBoundEdit",method=RequestMethod.GET)
    public ModelAndView outBoundEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();      
		
		//获取guid
		String outBound_guid = GuidUtil.create32Guid();
        httpSession.setAttribute("outBound_guid", outBound_guid);
		
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(outBoundManageQueryId, postData);
		
		ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		
		String tableHeader = this.getTableHeader(httpSession, outBoundItemManageQueryHeadConfig);
		
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", outBoundItemManageQueryId);
        
        mv.setViewName("logistics/outBound/outBoundEdit");
        
        // 入参, 注意按照顺序
     	String paramNames[] = new String[]{"guid", "downshelf_id"};
     	// 加入sp的名称
     	postData.put("spName", "n_bk_qk_downshelf_item_temp_getdata");
     				
     	httpSession.setAttribute("outBound_guid", outBound_guid);
     	postData.put("guid", outBound_guid);
     				
     	int code = baseService.doCallSp(postData, paramNames, null);
			        
        return mv;
    }
	
	/**
	 * 编辑出库单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editOutBound")
	@ResponseBody
    public Object editOutBound(@RequestParam Map postData,HttpSession httpSession){
		String outBound_guid = (String)httpSession.getAttribute("outBound_guid");
		
		postData.put("guid", outBound_guid);
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("o_id_input", user.getAccount());
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
				  "downshelf_id",
		          "out_type",
		          "o_id_input"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_downshelf_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }

	/**
	 * xia架确认页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/outBoundShelvesConfirm",method=RequestMethod.GET)
    public ModelAndView outBoundShelvesConfirm(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("logistics/outBound/outBoundToShelves");
		mv.addObject("downshelf_id", postData.get("downshelf_id"));
		
		String tableHeader = this.getTableHeader(httpSession, outBoundItemConfirmManageQueryHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", outBoundItemConfirmManageQueryId);
		
        return mv;
    }
	
	/**
	 * 获得下架确认页面明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getOutBoundShelvesConfirmList")
	@ResponseBody
	public Object getOutBoundShelvesConfirmList(@RequestBody Map postData){
		return this.getTableDataList(postData, outBoundItemConfirmManageQueryId);
	}
	
	/**
	 * 修改临时表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/editOutBoundItem")
	@ResponseBody
    public Object editOutBoundItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		
		// 入参, 注意按照顺序
		String paramNames[] = {"ItemExclusiveCode",  
		          "downshelf_id",     
		          "h_amount_real",
		          "o_id_onshelves"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_downshelf_item_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 确认出库操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/confirmOutBoundToShelves")
	@ResponseBody
    public Object confirmOutBoundToShelves(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("o_id_input", user.getAccount());
		
		
		// 入参, 注意按照顺序
		String paramNames[] = {"downshelf_id","o_id_input"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_downshelf_confirm");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
}
