package com.cnpiecsb.csu.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * 益华对应的dao
 * 
 * @author user
 *
 */
@Repository  // 这个注释只能注释到dao的实现上
public class LdDao extends ObjectDao {
	@Resource(name="ldSessionTemplate")
	private SqlSessionTemplate sessionTemplate;

	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}
}
