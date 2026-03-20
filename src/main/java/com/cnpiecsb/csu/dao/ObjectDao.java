package com.cnpiecsb.csu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.cnpiecsb.csu.idao.IBusinessDao;

/**
 * 根节点业务库 需要被继承
 * 
 * @author user
 *
 */
public class ObjectDao implements IBusinessDao {
	private SqlSessionTemplate sessionTemplate;
	
	//-----------  以下关于查询相关的方法      ---------------- //
	@Override
	public List<Map<String, Object>> getQueryResult(Map map) {
		return this.getSessionTemplate().selectList("com.cnpiecsb.csu.idao.IBusinessDao.getQueryResult", map);
	}

	@Override
	public int getQueryCount(String sql) {
		return this.getSessionTemplate().selectOne("com.cnpiecsb.csu.idao.IBusinessDao.getQueryCount", sql);
	}

	@Override
	public Map<String, Object> getOneResult(Map map) {
		return this.getSessionTemplate().selectOne("com.cnpiecsb.csu.idao.IBusinessDao.getOneResult", map);
	}

	@Override
	public int getGroupCount() {
		return this.getSessionTemplate().selectOne("com.cnpiecsb.csu.idao.IBusinessDao.getGroupCount");
	}

	//-----------  以下关于sp调用相关的方法      ---------------- //
	@Override
	public String callSp(Map map) {
    	return this.getSessionTemplate().selectOne("com.cnpiecsb.csu.idao.IBusinessDao.callSp", map);
    }

	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}
}
