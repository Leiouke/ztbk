package com.cnpiecsb.np.search.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.YhServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 报刊辅助查询之天猫订单配送查询
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/npSearch")
public class TMOrderSearchController extends YhServiceController {	
	// 天猫订单配送查询
	private int tMOrderSearchQueryId = 5890009;	
	private GridHeadConfig tMOrderSearchQueryHeadConfig;
	
	public TMOrderSearchController(){
		tMOrderSearchQueryHeadConfig = new GridHeadConfig(tMOrderSearchQueryId,true,false,true,false);
		tMOrderSearchQueryHeadConfig.setOperatorWidth(100);
	}
	
	/**
	 * 进入天猫订单配送查询界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/tMOrderSearchManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView tMOrderSearchManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/search/tMOrderSearchManage");
        String tableHeader = this.getTableHeader(httpSession, tMOrderSearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", tMOrderSearchQueryId);
        return mv;
    }
	
	/**
	 * 获得天猫订单配送内容
	 * 
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/getTMOrderSearchList")
	@ResponseBody
	public Object getTMOrderSearchList(@RequestBody Map postData){
		return this.getTableDataList(postData, tMOrderSearchQueryId);
	}
	
	/**
	 * 确认上传操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/uploadTMOrder")
	@ResponseBody
    public Object uploadTMOrder(@RequestParam Map postData,HttpSession httpSession) {
		// 入参, 注意按照顺序
		String paramNames[] = {"inc_no", "op_code", "op_name"};
		// 加入sp的名称
		postData.put("spName", "u_it_qk_tm_ps_upload");
		
		User user = (User)httpSession.getAttribute("user");
		postData.put("op_code", user.getAccount());
		postData.put("op_name", user.getUserName());
		
		int code = yhService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 手工刷新操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/tMOrderManualRefresh")
	@ResponseBody
    public Object tMOrderManualRefresh(@RequestParam Map postData) {
		// 加入sp的名称
		postData.put("spName", "u_it_qk_tm_ps");
		
		int code = yhService.doCallSp(postData, null, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
}
