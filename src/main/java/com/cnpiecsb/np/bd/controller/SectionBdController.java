package com.cnpiecsb.np.bd.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/np")
public class SectionBdController extends ZtbkServiceController {
	// 切片报订管理查询
	private int sectionBdManageQueryId = 5110011;	
	private GridHeadConfig sectionBdManageQueryHeadConfig;
	
	// 切片报订单记录查询
	private int sectionBdOneQueryId = 5110011;
	
	// 切片报订引入
	private int sectionBdPullQueryId = 5110010;
	private GridHeadConfig sectionBdPullQueryHeadConfig;
	
	// 切片报订明细查询
	private int sectionBdItemQueryId = 5110012;	
	private GridHeadConfig sectionBdItemQueryHeadConfig;
	
	// 切片报订明细99信息查询
	private int sectionBdItem99QueryId = 5110013;	
	private GridHeadConfig sectionBdItem99QueryHeadConfig;
	
	public SectionBdController(){
		sectionBdManageQueryHeadConfig = new GridHeadConfig(sectionBdManageQueryId,true,false,true,false);
		sectionBdManageQueryHeadConfig.setOperatorWidth(150);
		
		sectionBdPullQueryHeadConfig = new GridHeadConfig(sectionBdPullQueryId,true,true,false,false);
		
		sectionBdItemQueryHeadConfig = new GridHeadConfig(sectionBdItemQueryId,true,false,true,false);
		sectionBdItemQueryHeadConfig.setOperatorWidth(100);
		
		sectionBdItem99QueryHeadConfig = new GridHeadConfig(sectionBdItem99QueryId,true,false,false,false);
	}
	
	/**
	 * 切片报订查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/sectionBdManage", method=RequestMethod.GET)
    public ModelAndView sectionBdManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/sectionBd/sectionBdManage");
        String tableHeader = this.getTableHeader(httpSession,sectionBdManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sectionBdManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-切片报订
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSectionBdManageList")
	@ResponseBody
	public Object getSectionBdManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,sectionBdManageQueryId);
	}
	
	/**
	 * 进入引入切片报订界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/sectionBdPull")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView sectionBdPull(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/sectionBd/sectionBdPull");
        String tableHeader = this.getTableHeader(httpSession,sectionBdPullQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sectionBdPullQueryId);
        return mv;
    }
	
	/**
	 * 获得明细处理数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getSectionBdPullList")
	@ResponseBody
	public Object getSectionBdPullList(@RequestBody Map postData){
		return this.getTableDataList(postData,sectionBdPullQueryId);
	}
	
	/**
	 * 引入切片报订
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/importSectionBd")
	@ResponseBody
	public Object importSectionBd(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession){
		//List<Map<String, Object>> item_list=(List<Map<String, Object>>) postData.get("item_ids_codes");
		User user = (User)httpSession.getAttribute("user");
//		Map<String,Object> bd_map = new HashMap<String, Object>();
		if(postData != null && postData.size()>0){
			for(Map<String,Object> item_map : postData){
				String paramNames[] = new String[]{"bd_id", "o_id_input"};
				// 加入sp的名称
				item_map.put("spName", "u_np_bd_qp_new");
				item_map.put("o_id_input", user.getAccount());
				
//				System.out.println(item_map.get("bd_id"));
						
				int code = baseService.doCallSp(item_map, paramNames, null);
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}		
		}				
		return "{\"success\":true}";
	}
	
	/**
	 * 切片报订明细查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/sectionBdItem", method=RequestMethod.GET)
    public ModelAndView sectionBdItem(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/sectionBd/sectionBdItem");
        String tableHeader = this.getTableHeader(httpSession,sectionBdItemQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sectionBdItemQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-切片报订明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSectionBdItemList")
	@ResponseBody
	public Object getSectionBdItemList(@RequestBody Map postData){
		return this.getTableDataList(postData,sectionBdItemQueryId);
	}
	
	/**
	 * 修改报订明细操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editSectionBdItem")
	@ResponseBody
    public Object editSectionBdItem(@RequestParam Map postData,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input","bd_id", "qk_id", "sell_sd", "sell_jx", "sell_99", "sell_bf"};
		// 加入sp的名称
		postData.put("spName", "u_np_bd_qp_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 切片报订明细99查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/sectionBdItem99", method=RequestMethod.GET)
    public ModelAndView sectionBdItem99(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/sectionBd/sectionBdItem99");
        String tableHeader = this.getTableHeader(httpSession,sectionBdItem99QueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", sectionBdItem99QueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-切片报订明细99
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSectionBdItem99List")
	@ResponseBody
	public Object getSectionBdItem99List(@RequestBody Map postData){
		// 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(sectionBdOneQueryId, postData);
		postData.put("start_date", oneQuery.get("start_date"));
		postData.put("end_date", oneQuery.get("end_date"));
		
		return this.getTableDataList(postData,sectionBdItem99QueryId);
	}
	
	/**
	 * 退回报订
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/gobackSectionBd")
	@ResponseBody
    public Object gobackSectionBd(@RequestParam Map postData,HttpSession httpSession) {
		// 入参, 注意按照顺序
		String paramNames[] = {"bd_id"};
		// 加入sp的名称
		postData.put("spName", "u_np_bd_qp_del");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 已报订操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/updateSectionBd")
	@ResponseBody
    public Object updateSectionBd(@RequestParam Map postData) {
		// 入参, 注意按照顺序
		String paramNames[] = {"bd_id"};
		// 加入sp的名称
		postData.put("spName", "u_np_bd_qp_update_bd");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
}
