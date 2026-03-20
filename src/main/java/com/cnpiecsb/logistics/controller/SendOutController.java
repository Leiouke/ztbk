package com.cnpiecsb.logistics.controller;

import java.util.HashMap;
import java.util.List;
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

@Controller
@RequestMapping("/bk/logistics")
public class SendOutController extends ZtbkServiceController{
	
	// 下架单表头查询
	private int outBoundManageQueryId = 10000048;	
	private GridHeadConfig outBoundManageQueryHeadConfig;
	
	// 发货单表头查询
	private int sendOutQueryId = 10000043;	
	private GridHeadConfig sendOutQueryHeadConfig;
	
	// 发货单明细查询
	private int sendOutItemQueryId = 10000044;	
	private GridHeadConfig sendOutItemQueryHeadConfig;
	
	// 发货单明细临时表查询
	private int sendOutItemTempQueryId = 10000047;	
	private GridHeadConfig sendOutItemTempQueryHeadConfig;
	
	
	public SendOutController(){
		
		outBoundManageQueryHeadConfig = new GridHeadConfig(outBoundManageQueryId,true,true,false,false);
			
		sendOutQueryHeadConfig = new GridHeadConfig(sendOutQueryId,true,true,true,false);
		sendOutQueryHeadConfig.setOperatorWidth(60);
		
		sendOutItemQueryHeadConfig = new GridHeadConfig(sendOutItemQueryId,true,false,false,false);
			
		sendOutItemTempQueryHeadConfig = new GridHeadConfig(sendOutItemTempQueryId,true,true,false,false);
	}
	
	/**
	 * 进入发货单管理界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/sendOutManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView sendOutManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("logistics/sentOut/sentOutManage");
        String tableHeader = this.getTableHeader(httpSession,sendOutQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sendOutQueryId);
        return mv;
    }
	
	/**
	 * 获得发货单页面数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getSendOutList")
	@ResponseBody
	public Object getSendOutList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, sendOutQueryId);
	}
	
	/**
	 * 新增发货单页面
	 * 
	 * 
	 */
	@RequestMapping(value="/sendOutAddManage",method=RequestMethod.GET)
    public ModelAndView sendOutAddManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        //获取guid
        String sendOut_guid = GuidUtil.create32Guid();
        httpSession.setAttribute("sendOut_guid", sendOut_guid);
        
        String tableHeader = this.getTableHeader(httpSession, sendOutItemTempQueryHeadConfig);
		
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sendOutItemTempQueryId);
        
        mv.setViewName("logistics/sentOut/sendOutAddManage");
        return mv;
    }
	
	/**
	 * 获得发货单明细临时表数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getSendOutItemTempList")
	@ResponseBody
	public Object getSendOutItemTempList(@RequestBody Map postData, HttpSession httpSession) {
		String sendOut_guid = (String)httpSession.getAttribute("sendOut_guid");
		postData.put("guid", sendOut_guid);
		return this.getTableDataList(postData, sendOutItemTempQueryId);
	}
	
	/**
	 * 新增临时表明细页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/sendOutItemTempAdd",method=RequestMethod.GET)
    public ModelAndView sendOutItemTempAdd(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();        
        mv.setViewName("logistics/sentOut/sendOutItemTempAdd");
		
		String tableHeader = this.getTableHeader(httpSession, outBoundManageQueryHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", outBoundManageQueryId);
		
        return mv;
    }
	
	/**
	 * 获得发货单明细临时表数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getSendOutItemPullInList")
	@ResponseBody
	public Object getSendOutItemPullInList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, outBoundManageQueryId);
	}
	
	/**
	 * 引入临时表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/addSendOutItemTemp")
	@ResponseBody
    public Object addSendOutItemTemp(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request)throws JsonProcessingException{
		
		String[] downshelf_ids = request.getParameterValues("downshelf_ids");
		if(downshelf_ids != null && downshelf_ids.length > 0){
			for(int i=0;i<downshelf_ids.length;i++){
		        String sendOut_guid = (String)httpSession.getAttribute("sendOut_guid");
				postData.put("guid", sendOut_guid);
				
				// 入参, 注意按照顺序
				String paramNames[] = {"guid","downshelf_id"};
				// 加入sp的名称
				postData.put("spName", "n_bk_qk_sendout_item_temp_getdata");
				
				postData.put("downshelf_id", downshelf_ids[i]);
				
				int code = baseService.doCallSp(postData, paramNames, null);
				
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 修改临时表明细
	 * 
	 * 
	 */
	@RequestMapping(value="/editSendOutItemTemp")
	@ResponseBody
    public Object editSendOutItemTemp(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		String sendOut_guid = (String)httpSession.getAttribute("sendOut_guid");
		
		postData.put("guid", sendOut_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
		          "inc_no",
		          "package_no",
		          "h_amount_real"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_sendout_item_temp_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		

		return "{\"success\":true}";
    }
	
	/**
	 * 新增入库单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addSendOut")
	@ResponseBody
    public Object addSendOut(@RequestParam Map postData,HttpSession httpSession){
		String sendOut_guid = (String)httpSession.getAttribute("sendOut_guid");
		
		postData.put("guid", sendOut_guid);
		
		User user=(User)httpSession.getAttribute("user");
		
		postData.put("o_id_input", user.getAccount());
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid",
		          "source_orderno",
		          "o_id_input"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_sendout_new");
		
		String returnNames[] = {"sendout_id"};
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 发货修改改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toSendOutEdit",method=RequestMethod.GET)
    public ModelAndView toSendOutEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(sendOutQueryId, postData);
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		mv.setViewName("logistics/sentOut/sendOutEditManage");
        
        String tableHeader = this.getTableHeader(httpSession, sendOutItemQueryHeadConfig);
		
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sendOutItemQueryId);
		mv.addObject("so_id", postData.get("so_id"));
		
        return mv;
    }
	
	/**
	 * 获得发货单明细数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getSendOutItemList")
	@ResponseBody
	public Object getSendOutItemList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, sendOutItemQueryId);
	}
	
	/**
	 * 修改明细
	 * 
	 * 
	 */
	@RequestMapping(value="/editSendOutItem")
	@ResponseBody
    public Object editSendOutItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		
		// 入参, 注意按照顺序
		String paramNames[] = {"so_id",          
		          "ItemExclusiveCode",
		          "h_amount_real",
		          "package_no",
		          "o_id_input"};
		// 加入sp的名称
		postData.put("spName", "n_bk_qk_sendout_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 组包合并
	 * 
	 * 
	 */
	@RequestMapping(value="/doSendOutItemsCombine")
	@ResponseBody
    public Object doSendOutItemsCombine(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession){
		
		String td_id_end = (String)postData.get(0).get("td_id");//第一个当做最终合并的包号
		
		User user=(User)httpSession.getAttribute("user");
		
		for(Map<String,Object> map:postData){
			Map<String,Object> sp_map = new HashMap<String,Object>();
			sp_map.put("td_id_start", postData.get(0).get("td_id"));
			sp_map.put("td_id_end", td_id_end);
			sp_map.put("o_id_input", user.getAccount());
			
			sp_map.put("spName","n_bk_qk_sendout_combine");
			
			// 入参, 注意按照顺序
			String paramNames[] = {"td_id_start","td_id_end","o_id_input"};
			
			int code = baseService.doCallSp(sp_map, paramNames, null);
			
			if (code != 0) {
				return this.getAjaxResult(code);
			}
		}
		return "{\"success\":true}";
    }
}
