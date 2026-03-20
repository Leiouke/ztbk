package com.cnpiecsb.csu.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.cnpiecsb.csu.service.ObjectService;

/**
 * webshop控制器, 后续要被业务类继承生效
 * 
 * @author user
 *
 */
public class WebshopServiceController extends ObjectServiceController {
	@Autowired
	public ObjectService webshopService;

	@Override
	public ObjectService getObjectService() {
		return webshopService;
	}
}
