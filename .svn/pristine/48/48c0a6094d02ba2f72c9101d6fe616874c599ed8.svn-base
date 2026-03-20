package com.cnpiecsb.yh.controller.basic;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cnpiecsb.csu.controller.YhServiceController;

@Controller
@RequestMapping("/basic")
public class YHFactoryController extends YhServiceController {
	private int factorySearchQueryId = 7010001;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public YHFactoryController(){

	}
	
	/**
	 * 获得动态列表数据-益华货源-搜索自动补全
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getYHFactoryListSearch")
	@ResponseBody
	public Object getYHFactoryListSearch(String keyword){
		Map<String,Object> postData=new HashMap<>();
		postData.put("keyword", keyword);
		return this.getTableDataList(postData, factorySearchQueryId);
	}
}
