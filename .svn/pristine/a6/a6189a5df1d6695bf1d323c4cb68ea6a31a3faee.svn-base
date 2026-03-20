package com.cnpiecsb.edi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cnpiecsb.csu.controller.EdiServiceController;

@Service
public class IsbnTaskDetailService extends EdiServiceController{
	
	private int zsBlackIsbnSearchQuery = 1120002; //查询B2B黑名单query
	
	private int zsB2BResultSearchQuery = 1120003;//查询B2B政审结果query

	public String IsbnTaskDetailEdi(String h_isbn){
		
		//是否在黑名单中
		Map searchMainMap = new HashMap();
		searchMainMap.put("queryId", zsBlackIsbnSearchQuery);
		searchMainMap.put("h_isbn",h_isbn);
		List<Map> dataList = this.getDataListByQueryId(searchMainMap);
		
		String zs_is_pass = "";
		
		if(dataList.size() >0){//在黑名单,给6的值，进入黑名单

			zs_is_pass = "6";
		}else{//不在黑名单
			//查询B2B的政审结果
			Map searchMap = new HashMap();
			searchMap.put("queryId", zsB2BResultSearchQuery);
			searchMap.put("h_isbn",h_isbn);
			List<Map> dataResultList = this.getDataListByQueryId(searchMap);
			if(dataResultList.size()>0){
				System.out.println(dataResultList.get(0).get("ZS_IS_PASS"));
				zs_is_pass= (String)dataResultList.get(0).get("ZS_IS_PASS");
			}else{
				zs_is_pass = "7";
			}
		}
		return zs_is_pass;
	}
}
