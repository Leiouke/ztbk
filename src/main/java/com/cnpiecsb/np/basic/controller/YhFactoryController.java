package com.cnpiecsb.np.basic.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cnpiecsb.csu.controller.YhServiceController;

/**
 *  益华货源查询控制器
 * @author user
 *
 */
@Controller
@RequestMapping("/basic")
public class YhFactoryController extends YhServiceController {
	/**
	 * 获得动态列表数据-货源-搜索自动补全
	 * 
	 * 需要传入站点id
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getYhFactoryListSearch")
	@ResponseBody
	public Object getYhFactoryListSearch(String keyword,String station_id){
		Map<String,Object> postData=new HashMap<>();
		postData.put("keyword", keyword);
		if(station_id != null){
			postData.put("station_id", station_id);
		}
		return this.getTableDataList(postData, 5110033);
	}
}
