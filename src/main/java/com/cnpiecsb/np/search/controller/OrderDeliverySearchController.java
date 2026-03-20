package com.cnpiecsb.np.search.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.YhServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 报刊辅助查询之订单配送查询
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/npSearch")
public class OrderDeliverySearchController extends YhServiceController {	
	// 订单配送查询
	private int orderDeliverySearchQueryId = 5890001;	
	private GridHeadConfig orderDeliverySearchQueryHeadConfig;
	
	// 关联配送明细
	private int relateDeliveryItemsQueryId = 5890002;	
	private GridHeadConfig relateDeliveryItemsQueryHeadConfig;
	
	// 无关联配送明细
	private int nonRelateDeliveryItemsQueryId = 5890004;	
	private GridHeadConfig nonRelateDeliveryItemsQueryHeadConfig;
	
	public OrderDeliverySearchController(){
		orderDeliverySearchQueryHeadConfig = new GridHeadConfig(orderDeliverySearchQueryId,true,false,true,false);
//		orderDeliverySearchQueryHeadConfig.setOperatorWidth(100);
		
		relateDeliveryItemsQueryHeadConfig = new GridHeadConfig(relateDeliveryItemsQueryId,true,false,false,false);
		
		nonRelateDeliveryItemsQueryHeadConfig = new GridHeadConfig(nonRelateDeliveryItemsQueryId,true,false,false,false);
	}
	
	/**
	 * 进入订单配送查询界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/orderDeliverySearchManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView orderDeliverySearchManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/search/orderDeliverySearchManage");
        String tableHeader = this.getTableHeader(httpSession, orderDeliverySearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", orderDeliverySearchQueryId);
        return mv;
    }
	
	/**
	 * 获得订单配送内容
	 * 
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/getOrderDeliverySearchList")
	@ResponseBody
	public Object getOrderDeliverySearchList(@RequestBody Map postData){
		return this.getTableDataList(postData, orderDeliverySearchQueryId);
	}
	
	/**
	 * 进入关联配送明细界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/relateDeliveryItems")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView relateDeliveryItems(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/search/relateDeliveryItems");
        String tableHeader = this.getTableHeader(httpSession,relateDeliveryItemsQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", relateDeliveryItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得关联配送明细
	 * 
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/getRelateDeliveryItemsList")
	@ResponseBody
	public Object getRelateDeliveryItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, relateDeliveryItemsQueryId);
	}
	
	/**
	 * 进入无关联配送明细界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/nonRelateDeliveryItems")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView nonRelateDeliveryItems(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/search/nonRelateDeliveryItems");
        String tableHeader = this.getTableHeader(httpSession,nonRelateDeliveryItemsQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", nonRelateDeliveryItemsQueryId);
        return mv;
    }
	
	/**
	 * 获得进出详情
	 * 
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/getNonRelateDeliveryItemsList")
	@ResponseBody
	public Object getNonRelateDeliveryItemsList(@RequestBody Map postData){
		return this.getTableDataList(postData, nonRelateDeliveryItemsQueryId);
	}
}
