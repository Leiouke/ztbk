package com.cnpiecsb.np.finance.controller;

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

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 申汇单代销冲销相关控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np")
public class FhshAgentAgaintController extends ZtbkServiceController {
	private int financeFhshOneQueryId = 5600001;
	
	private int fhshAgentAgaintItemQueryId = 6300001;	
	private GridHeadConfig fhshAgentAgaintItemGridHeadConfig;
	
	private int fhshAgentAgaintItemPullQueryId = 6300002;
	private GridHeadConfig fhshAgentAgaintItemPullHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public FhshAgentAgaintController(){
		fhshAgentAgaintItemGridHeadConfig = new GridHeadConfig(fhshAgentAgaintItemQueryId,true,false,true,false);
		
		fhshAgentAgaintItemPullHeadConfig=new GridHeadConfig(fhshAgentAgaintItemPullQueryId,true,true,false,false);
	}
	
	/**
	 * 代销冲销页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/fhshAgentAgaintItem",method=RequestMethod.GET)
    public ModelAndView fhshAgentAgaintItem(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(financeFhshOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		
        mv.setViewName("np/fhshAgentAgaint/fhshAgentAgaintItem");
        String tableHeader = this.getTableHeader(httpSession,fhshAgentAgaintItemGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", fhshAgentAgaintItemQueryId);
		
        return mv;
    }
	
	/**
	 * 获得动态列表数据-代销冲销明细列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFhshAgentAgaintItemList")
	@ResponseBody
	public Object getFhshAgentAgaintItemList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,fhshAgentAgaintItemQueryId);
	}
	
	/**
	 * 引入代销预付页面
	 * 
	 * 
	 */
	@RequestMapping(value="/fhshAgentAgaintItemPull",method=RequestMethod.GET)
    public ModelAndView fhshAgentAgaintItemPull(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/fhshAgentAgaint/fhshAgentAgaintItemPull");
        String tableHeader = this.getTableHeader(httpSession,fhshAgentAgaintItemPullHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", fhshAgentAgaintItemPullQueryId);
        return mv;
    }
	
    /**
   	 * 获得动态列表数据-引入代销预付
   	 * 
   	 * param postData
   	 * return
   	 */
   	@RequestMapping(value="/getFhshAgentAgaintItemPullList")
   	@ResponseBody
   	public Object getFhshAgentAgaintItemPullList(@RequestBody Map postData,HttpSession httpSession){
   		return this.getTableDataList(postData, fhshAgentAgaintItemPullQueryId);
   	}
   	
   	/**
	 * 引入代销预付明细操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/pullFhshAgentAgaintItem")
	@ResponseBody
    public Object pullFhshAgentAgaintItem(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession,HttpServletRequest request){
		if(postData!=null&&postData.size()>0){
			for(Map<String,Object> inv_map:postData){
				// 入参, 注意按照顺序
				String paramNames[] = {"fh_id","ap_id","against_money", "rmb_against_money"};
				// 加入sp的名称
				inv_map.put("spName", "u_finance_fhsh_advance_payment_pullin");
				
				int code = baseService.doCallSp(inv_map, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除代销预付明细操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFhshAgentAgaintItem")
	@ResponseBody
	public Object deleteFhshAgentAgaintItem(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"fh_id", "ap_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_fhsh_advance_payment_delete");
		
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
}
