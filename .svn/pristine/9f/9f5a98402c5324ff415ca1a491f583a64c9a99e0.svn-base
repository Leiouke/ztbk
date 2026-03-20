package com.cnpiecsb.csu.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cnpiecsb.csu.idao.IBusinessDao;

/**
 * 益华库服务
 * 
 * @author user
 *
 */
@Service
public class YhService extends ObjectService {
	// 多实现类必须用Resource注入,并需要指定对象名  Qualifier也可以按类注入
	@Resource(name="yhDao")
	private IBusinessDao iBusinessDao;

	/**
	 * 将当前的具体实现类覆盖到父类中, 保证父类的iBusinessDao用的是子类的对象
	 */
	@Override
	public IBusinessDao getiBusinessDao() {
		return iBusinessDao;
	}
}
