package com.cnpiecsb.system.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.cnpiecsb.csu.controller.ZtbkServiceController;

@Service
public class OperationLogService extends ZtbkServiceController{
	
	public void operationLogAdd(Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"userAccount","userName","context","input_args","output_result"};
		// 加入sp的名称
		postData.put("spName", "n_bk_operateLog_new");
				
		int code = baseService.doCallSp(postData, paramNames, null);		
	}

}
