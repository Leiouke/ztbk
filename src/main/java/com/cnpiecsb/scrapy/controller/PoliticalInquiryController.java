package com.cnpiecsb.scrapy.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 政审查询相关控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/scrapy")
public class PoliticalInquiryController extends ZtbkServiceController {
	// 政审查询任务查询
	private int politicalInquiryManageQueryId = 7100005;
	private GridHeadConfig politicalInquiryManageGridHeadConfig;
	
	// 政审查询明细详情
	private int politicalInquiryItemQueryId = 7100006;	
	private GridHeadConfig politicalInquiryItemGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public PoliticalInquiryController(){
		politicalInquiryManageGridHeadConfig = new GridHeadConfig(politicalInquiryManageQueryId,true,false,true,false);
	
		politicalInquiryItemGridHeadConfig = new GridHeadConfig(politicalInquiryItemQueryId,true,false,false,false);
	}
	
	/**
	 * 政审查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/politicalInquiryManage", method=RequestMethod.GET)
    public ModelAndView politicalInquiryManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("scrapy/politicalInquiry/politicalInquiryManage");
        String tableHeader = this.getTableHeader(httpSession,politicalInquiryManageGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", politicalInquiryManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-政审查询
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getPoliticalInquiryManageList")
	@ResponseBody
	public Object getPoliticalInquiryManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, politicalInquiryManageQueryId);
	}
	
	/**
	 * 新增政审查询任务
	 * 
	 * 
	 */
	@RequestMapping(value="/politicalInquiryAdd",method=RequestMethod.GET)
    public ModelAndView politicalInquiryAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("scrapy/politicalInquiry/politicalInquiryAdd");
        return mv;
    }
	
	/**
	 * 政审查询明细界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/politicalInquiryItem", method=RequestMethod.GET)
    public ModelAndView politicalInquiryItem(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("scrapy/politicalInquiry/politicalInquiryItem");
        String tableHeader = this.getTableHeader(httpSession,politicalInquiryItemGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", politicalInquiryItemQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-政审查询明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getPoliticalInquiryItemList")
	@ResponseBody
	public Object getPoliticalInquiryItemList(@RequestBody Map postData){
		return this.getTableDataList(postData, politicalInquiryItemQueryId);
	}
}
