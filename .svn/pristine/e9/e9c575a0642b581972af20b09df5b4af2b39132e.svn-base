package com.cnpiecsb.csu.idao;

import java.util.List;
import java.util.Map;

/**
 * 业务库的dao接口
 * 
 * @author user
 *
 */
public interface IBusinessDao {
	/**
	 * 适用不同数据源, 获得查询数据结果集
	 * 
	 * @param map
	 * @return
	 */
    public List<Map<String, Object>> getQueryResult(Map map);
    
    /**
     * 适用不同数据源, 获得查询结果总数
     * 
     * @param sql
     * @return
     */
    public int getQueryCount(String sql);
    
    /**
     * 适用不同数据源, 获得一条记录查询结果
     * 
     * @param map
     * @return
     */
    public Map<String, Object> getOneResult(Map map);
    
    /**
     * 适用不同数据源, 目前仅对sqlserver有效, 获得分组数量
     * 
     * @return
     */
    public int getGroupCount();
    
    /**
     * 适用不同数据源, 调用sp
     * 
     * @param map
     * @return
     */
    public String callSp(Map map);
}
