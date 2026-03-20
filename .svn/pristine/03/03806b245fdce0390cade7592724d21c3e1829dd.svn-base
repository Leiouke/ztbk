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
 * 报刊辅助查询之代销转配送
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/npSearch")
public class AgencyToDeliveryController extends YhServiceController{
	
	// 代销转配送查询
	private int agencyToDeliverySearchQueryId = 5110073;	
	private GridHeadConfig agencyToDeliverySearchQueryHeadConfig;
	
	public AgencyToDeliveryController(){
		agencyToDeliverySearchQueryHeadConfig = new GridHeadConfig(agencyToDeliverySearchQueryId,true,false,false,false);
	}
	
	/**
	 * 进入代销转配送查询界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/agencyToDeliveryManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView agencyToDeliveryManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/agencyToDelivery/agencyToDeliveryManage");
        String tableHeader = this.getTableHeader(httpSession, agencyToDeliverySearchQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", agencyToDeliverySearchQueryId);
        return mv;
    }
	
	/**
	 * 获得代销转配送查询数据
	 * 
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/getAgencyToDeliverySearchList")
	@ResponseBody
	public Object getAgencyToDeliverySearchList(@RequestBody Map postData){
		return this.getTableDataList(postData, agencyToDeliverySearchQueryId);
	}

}
