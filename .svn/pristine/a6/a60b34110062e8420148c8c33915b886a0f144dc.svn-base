package com.cnpiecsb.np.search.controller;

import java.util.HashMap;
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

import com.cnpiecsb.csu.controller.YhServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 价格波动查询页面
 * @author zc 2020-04-03
 *
 */

@Controller
@RequestMapping("/npSearch")
public class PriceFluctuationController extends YhServiceController{
	
	// 主页面查询
	private int priceFluctuationManageQueryId = 5890005;	
	private GridHeadConfig priceFluctuationManageQueryHeadConfig;		
	
	// 详细查询
	private int priceFluctuationDetailManageQueryId = 5890006;	
	
	// 价格类型查询
	private int priceClassQueryId = 5890007;	
	
	// 币种查询
	private int currencyIdQueryId = 5890008;	
	
	public PriceFluctuationController(){
		priceFluctuationManageQueryHeadConfig = new GridHeadConfig(priceFluctuationManageQueryId,true,false,true,false);
	}
	
	/*
	 * 进入价格波动查询页面
	 */
	@RequestMapping(value="/priceFluctuationManage")
    public ModelAndView priceFluctuationManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/search/priceFluctuationManage");
        String tableHeader = this.getTableHeader(httpSession,priceFluctuationManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", priceFluctuationManageQueryId);
        return mv;
    }
	
	/*
	 * 获得价格波动查询页面
	 */
	@RequestMapping(value="/getPriceFluctuationManageList")
	@ResponseBody
	public Object getPriceFluctuationManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, priceFluctuationManageQueryId);
	}
	
	/*
	 * 进入价格波动页面
	 * 
	 */
	@RequestMapping(value="/priceFluctuationDetailManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView priceFluctuationDetailManage(HttpSession session,HttpServletRequest request) throws JsonProcessingException{
		String qk_id=request.getParameter("qk_id");
		ModelAndView mv = new ModelAndView();
        mv.setViewName("np/search/priceFluctuationDetailManage");
        mv.addObject("qk_id",qk_id);
        String tableHeader = this.getTableHeader(session,priceFluctuationManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", priceFluctuationDetailManageQueryId);
        return mv;
    }
	
	/**
	 * 获得折线图
	 * @return
	 */
	@RequestMapping(value="/getPriceFluctuationDetailChart")
	@ResponseBody
	public Object getPriceFluctuationDetailChart(@RequestParam Map postData) {
		System.out.println(postData.get("qk_id"));
		Map<String,Object>map =this.getTableDataList(postData,priceFluctuationDetailManageQueryId);
		return map;
	}
	
	/**
	 * 获得价格类型
	 * @return
	 */
	@RequestMapping(value="/getPriceClassList")
	@ResponseBody
	public Object getPriceClassList(@RequestParam String qk_id) {
		Map postData = new HashMap();
		postData.put("qk_id", qk_id);
		Map<String,Object>map =this.getTableDataList(postData,priceClassQueryId);
		return map;
	}
	
	/**
	 * 获得币种
	 * @return
	 */
	@RequestMapping(value="/getCurrencyIdList")
	@ResponseBody
	public Object getCurrencyIdList(@RequestParam String qk_id,String price_class) {
		Map postData = new HashMap();
		postData.put("qk_id", qk_id);
		postData.put("price_class",price_class);
		Map<String,Object>map =this.getTableDataList(postData,currencyIdQueryId);
		return map;
	}
}
