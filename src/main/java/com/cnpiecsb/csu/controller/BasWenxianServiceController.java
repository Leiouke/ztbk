package com.cnpiecsb.csu.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.cnpiecsb.csu.service.ObjectService;

/**
 * 益华控制器, 后续要被业务类继承生效
 * 
 * @author user
 *
 */
public class BasWenxianServiceController extends ObjectServiceController {
	@Autowired
	public ObjectService basWenxianService;

	@Override
	public ObjectService getObjectService() {
		return basWenxianService;
	}
}
