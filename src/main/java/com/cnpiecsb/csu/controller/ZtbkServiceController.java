package com.cnpiecsb.csu.controller;

import javax.annotation.Resource;

import com.cnpiecsb.csu.service.ObjectService;

/**
 * 基础库控制器, 后续要被业务类继承生效
 * 
 * @author user
 *
 */
public class ZtbkServiceController extends ObjectServiceController {
	@Resource(name="ztbkService")
	public ObjectService baseService;

	@Override
	public ObjectService getObjectService() {
		return baseService;
	}
}
