package com.cnpiecsb.bd.controller;

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
@RequestMapping("/bk/bd")
public class qkBdMangeController extends ZtbkServiceController{
	
	// 报订表头查询
	private int qkBdManageQueryId = 10000013;	
	private GridHeadConfig qkBdManageQueryHeadConfig;
		
	// 报订单刊期明细查询(切片)
	private int qkBdItemManageQueryId = 10000014;	
	private GridHeadConfig qkBdItemManageQueryHeadConfig;
	
	// 报订单刊期明细查询（增量）
	private int qkBdItemOtherManageQueryId = 10000023;	
	private GridHeadConfig qkBdItemOtherManageQueryHeadConfig;
	
	// 报订单刊期明细查询（单期）
	private int qkBdItemPeriodManageQueryId = 10000025;	
	private GridHeadConfig qkBdItemPeriodManageQueryHeadConfig;
	
	// 报订单刊期明细查询（变量）
	private int qkBdItemBlManageQueryId = 10000026;	
	private GridHeadConfig qkBdItemBlManageQueryHeadConfig;
	
	public qkBdMangeController() {
		qkBdManageQueryHeadConfig = new GridHeadConfig(qkBdManageQueryId,true,false,true,false);
		qkBdManageQueryHeadConfig.setOperatorWidth(100);
		
		qkBdItemManageQueryHeadConfig = new GridHeadConfig(qkBdItemManageQueryId,true,false,false,false);
		
		qkBdItemOtherManageQueryHeadConfig = new GridHeadConfig(qkBdItemOtherManageQueryId,true,false,false,false);
		
		qkBdItemPeriodManageQueryHeadConfig = new GridHeadConfig(qkBdItemPeriodManageQueryId,true,false,false,false);
		//qkBdItemPeriodManageQueryHeadConfig.setOperatorWidth(100);
		
		qkBdItemBlManageQueryHeadConfig = new GridHeadConfig(qkBdItemBlManageQueryId,true,false,false,false);
		
	}
	
	/**
	 * 进入报刊收订界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/qkBdManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView qkBdManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("bd/bdManage/qkBdManage");
        String tableHeader = this.getTableHeader(httpSession,qkBdManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", qkBdManageQueryId);
        return mv;
    }
	
	/**
	 * 获得报刊收订数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getQkBdList")
	@ResponseBody
	public Object getQkBdList(@RequestBody Map postData, HttpSession httpSession) {
		return this.getTableDataList(postData, qkBdManageQueryId);
	}
	
	//----------------------------------------------------切片------------------------------------
	
	/**
	 * 报订明细页面（切片）
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/qkBdDetail",method=RequestMethod.GET)
    public ModelAndView qkBdDetail(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
        Map<String, Object> oneQuery = baseService.getOneQuery(qkBdManageQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		String tableHeader = this.getTableHeader(httpSession, qkBdItemManageQueryHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", qkBdItemManageQueryId);
		mv.setViewName("bd/bdManage/qkBdEdit");
		mv.addObject("bd_id", (String)postData.get("bd_id"));
		
        return mv;
    }
	
	/**
	 * 获得报订明细临时表数据(切片)
	 * 
	 * @return
	 */
	@RequestMapping(value="/getBdDetailList")
	@ResponseBody
	public Object getBdDetailList(@RequestBody Map postData, HttpSession httpSession) {
		
		return this.getTableDataList(postData, qkBdItemManageQueryId);
	}
	
	//----------------------------------------------------增量------------------------------------
	
		/**
		 * 报订明细页面（增量）
		 * @throws JsonProcessingException 
		 * 
		 * 
		 */
		@RequestMapping(value="/qkOtherBdDetail",method=RequestMethod.GET)
	    public ModelAndView qkOtherBdDetail(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
	        ModelAndView mv = new ModelAndView();        
	        // 单记录查询
	        Map<String, Object> oneQuery = baseService.getOneQuery(qkBdManageQueryId, postData);		
			mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
			String tableHeader = this.getTableHeader(httpSession, qkBdItemOtherManageQueryHeadConfig);
			mv.addObject("tableHeader", tableHeader);
			mv.addObject("queryId", qkBdItemOtherManageQueryId);
			mv.setViewName("bd/bdManage/qkBdOtherEdit");
			mv.addObject("bd_id", (String)postData.get("bd_id"));
			
	        return mv;
	    }
		
		/**
		 * 获得报订明细临时表数据(增量)
		 * 
		 * @return
		 */
		@RequestMapping(value="/getOtherDetailList")
		@ResponseBody
		public Object getQkDetailList(@RequestBody Map postData, HttpSession httpSession) {
			
			return this.getTableDataList(postData, qkBdItemOtherManageQueryId);
		}
		
		//----------------------------------------------------单期------------------------------------
		
		/**
		 * 报订明细页面（单期）
		 * @throws JsonProcessingException 
		 * 
		 * 
		 */
		@RequestMapping(value="/qkBdPeriodDetail",method=RequestMethod.GET)
	    public ModelAndView qkBdPeriodDetail(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
	        ModelAndView mv = new ModelAndView();        
	        // 单记录查询
	        Map<String, Object> oneQuery = baseService.getOneQuery(qkBdManageQueryId, postData);		
			mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
			String tableHeader = this.getTableHeader(httpSession, qkBdItemPeriodManageQueryHeadConfig);
			mv.addObject("tableHeader", tableHeader);
			mv.addObject("queryId", qkBdItemPeriodManageQueryId);
			mv.setViewName("bd/bdManage/qkBdPeriodEdit");
			mv.addObject("bd_id", (String)postData.get("bd_id"));
			
			// 入参, 注意按照顺序
			String paramNames[] = new String[]{"guid", "bd_id"};
						
			// 加入sp的名称
			postData.put("spName", "n_bk_qk_bd_item_period_temp_getbddata");
								
			String qkBdOut_guid=GuidUtil.create32Guid();
			httpSession.setAttribute("qkBdOut_guid", qkBdOut_guid);
			postData.put("guid", qkBdOut_guid);
								
			int code = baseService.doCallSp(postData, paramNames, null);
			
	        return mv;
	    }
		
		/**
		 * 获得报订明细临时表数据(单期)
		 * 
		 * @return
		 */
		@RequestMapping(value="/getPeriodDetailList")
		@ResponseBody
		public Object getPeriodDetailList(@RequestBody Map postData, HttpSession httpSession) {
			
			String qkBdOut_guid = (String)httpSession.getAttribute("qkBdOut_guid");
			postData.put("guid", qkBdOut_guid);
			
			return this.getTableDataList(postData, qkBdItemPeriodManageQueryId);
		}
		
		/**
		 * 删除报刊报订单（单期）
		 * 
		 * param postData
		 * return
		 */
		@RequestMapping(value="/deleteQkBd")
		@ResponseBody
	    public Object deleteQkBd(@RequestParam Map postData,HttpSession httpSession){
			
			// 入参, 注意按照顺序
			String paramNames[] = new String[]{"bd_id", "o_id_destroy"};
			// 加入sp的名称
			postData.put("spName", "n_bk_qk_bd_delete");
			
			User user=(User)httpSession.getAttribute("user");
			postData.put("o_id_destroy", user.getAccount());
					
			int code = baseService.doCallSp(postData, paramNames, null);
			
			if (code != 0) {
				return this.getAjaxResult(code);
			}
			
			return "{\"success\":true}";
	    }
		
		//----------------------------------------------------变量------------------------------------
		
		/**
		 * 报订明细页面（变量）
		 * @throws JsonProcessingException 
		 * 
		 * 
		 */
		@RequestMapping(value="/qkBdBlDetail",method=RequestMethod.GET)
	    public ModelAndView qkBdBlDetail(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
	        ModelAndView mv = new ModelAndView();        
	        // 单记录查询
	        Map<String, Object> oneQuery = baseService.getOneQuery(qkBdManageQueryId, postData);		
			mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
			String tableHeader = this.getTableHeader(httpSession, qkBdItemBlManageQueryHeadConfig);
			mv.addObject("tableHeader", tableHeader);
			mv.addObject("queryId", qkBdItemBlManageQueryId);
			mv.setViewName("bd/bdManage/qkBdBlEdit");
			mv.addObject("bd_id", (String)postData.get("bd_id"));
			
	        return mv;
	    }
		
		/**
		 * 获得报订明细临时表数据(变量)
		 * 
		 * @return
		 */
		@RequestMapping(value="/getBdBlDetailList")
		@ResponseBody
		public Object getBdBlDetailList(@RequestBody Map postData, HttpSession httpSession) {
			
			return this.getTableDataList(postData, qkBdItemBlManageQueryId);
		}
		
		/**
		 * 删除报刊报订单（变量）
		 * 
		 * param postData
		 * return
		 */
		@RequestMapping(value="/deleteQkBlBd")
		@ResponseBody
	    public Object deleteQkBlBd(@RequestParam Map postData,HttpSession httpSession){
			
			// 入参, 注意按照顺序
			String paramNames[] = new String[]{"bd_id", "o_id_destroy"};
			// 加入sp的名称
			postData.put("spName", "n_bk_qk_bd_bl_delete");
			
			User user=(User)httpSession.getAttribute("user");
			postData.put("o_id_destroy", user.getAccount());
					
			int code = baseService.doCallSp(postData, paramNames, null);
			
			if (code != 0) {
				return this.getAjaxResult(code);
			}
			
			return "{\"success\":true}";
	    }

}
