package com.cnpiecsb.basic.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.fc.util.AccessControlUtil;

@Controller
@RequestMapping("/bk/basic")
public class BkAutoSearchController extends ZtbkServiceController{
	
	// 供应商信息查询
	private int factoryAutoSearchQueryId = 10000003;
	
	// 供应商信息查询
	private int clientAutoSearchQueryId = 10000002;
	
	/**
	 * 获得动态列表数据-可按部门查询的财务分类列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryAutoSearch")
	@ResponseBody
	public Object getFactoryAutoSearch(String keyword){
		Map<String,Object> postData=new HashMap<>();
			
		postData.put("keyword", keyword);
		return this.getTableDataList(postData, factoryAutoSearchQueryId);
	}
	
	/**
	 * 获得动态列表数据-客户-搜索自动补全
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getClientAutoSearch")
	@ResponseBody
	public Object getClientAutoSearch(String keyword, HttpSession httpSession){
		Map<String,Object> postData=new HashMap<>();
		
		postData.put("keyword", keyword);
		return this.getTableDataList(postData, clientAutoSearchQueryId);
	}

}
