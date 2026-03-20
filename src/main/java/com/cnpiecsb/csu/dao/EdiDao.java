package com.cnpiecsb.csu.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * ws对应的dao
 * 
 * @author user
 *
 */
@Repository  // 这个注释只能注释到dao的实现上
public class EdiDao extends ObjectDao {
	@Resource(name="ediSessionTemplate")
	private SqlSessionTemplate sessionTemplate;

	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}
	
	/**
	 * 默认查询模式使用的是sqlserver的, 用oracle的查询语句覆盖
	 * 
	 */
	@Override
	public List<Map<String, Object>> getQueryResult(Map map) {
		return this.getSessionTemplate().selectList("com.cnpiecsb.csu.idao.IBusinessDao.getOracleQueryResult", map);
	}

	/**
	 * 默认调用sp模式使用的是sqlserver的, 用oracle的调sp语句覆盖
	 * 
	 */
	@Override
	public String callSp(Map map) {
		return this.getSessionTemplate().selectOne("com.cnpiecsb.csu.idao.IBusinessDao.callOracleSp", map);
	}
}
