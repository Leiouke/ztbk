package com.cnpiecsb.yh.controller.basic;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cnpiecsb.csu.controller.YhServiceController;

@Controller
@RequestMapping("/basic")
public class YHClientController extends YhServiceController {
	private int clientSearchQueryId = 7010002;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public YHClientController(){

	}
	
	/**
	 * 获得动态列表数据-客户-搜索自动补全
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getYHClientListSearch")
	@ResponseBody
	public Object getYHClientListSearch(String keyword){
		Map<String,Object> postData=new HashMap<>();
		postData.put("keyword", keyword);
		return this.getTableDataList(postData, clientSearchQueryId);
	}
}
