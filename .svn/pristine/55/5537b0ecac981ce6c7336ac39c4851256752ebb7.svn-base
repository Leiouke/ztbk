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
 * 报刊辅助查询之客户配送查询
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/npSearch")
public class ClientDeliverySearchController extends YhServiceController {	
	// 客户配送查询
	private int clientDeliverySearchQueryId = 5890003;	
	private GridHeadConfig clientDeliverySearchQueryHeadConfig;
	
	public ClientDeliverySearchController(){
		clientDeliverySearchQueryHeadConfig = new GridHeadConfig(clientDeliverySearchQueryId,true,false,false,false);
	}
	
	/**
	 * 进入客户配送查询界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/clientDeliverySearchManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView clientDeliverySearchManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/search/clientDeliverySearchManage");
        String tableHeader = this.getTableHeader(httpSession, clientDeliverySearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", clientDeliverySearchQueryId);
        return mv;
    }
	
	/**
	 * 获得客户配送内容
	 * 
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/getClientDeliverySearchList")
	@ResponseBody
	public Object getClientDeliverySearchList(@RequestBody Map postData){
		return this.getTableDataList(postData, clientDeliverySearchQueryId);
	}
}
