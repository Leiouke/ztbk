package com.cnpiecsb.csu.controller;

import javax.annotation.Resource;

import com.cnpiecsb.csu.service.ObjectService;

/**
 * 基础库控制器, 后续要被业务类继承生效
 * 
 * @author user
 *
 */
public class BaseServiceController extends ObjectServiceController {
	@Resource(name="baseService")
	public ObjectService baseService;

	@Override
	public ObjectService getObjectService() {
		return baseService;
	}
}
