package com.cnpiecsb.csu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.cnpiecsb.common.viewobject.AjaxResult;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.csu.entity.DynamicColumn;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.csu.service.CommonConfigService;
import com.cnpiecsb.csu.service.ObjectService;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 跟控制器, 后续要被通用类继承才能生效, 不能直接被业务类继承
 * 
 * @author user
 *
 */
public class ObjectServiceController {
	// 需要用到通用配置服务
	@Resource(name="commonConfigService")
	protected CommonConfigService commonConfigService;
	
//	@Resource(name="baseService")
	private ObjectService objectService;
	
	// 查询脚本id
	private int queryId;
	
	/**
	 * 获得table列属性信息
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
    public String getTableHeader(HttpSession httpSession, GridHeadConfig config) throws JsonProcessingException{
        // 获得当前用户ID
     	User user = (User) httpSession.getAttribute("user");
        
        ObjectMapper mapper = new ObjectMapper();
        Map searchMap = new HashMap();
		searchMap.put("id", config.getQueryId());
		searchMap.put("account", user.getAccount());
		List<DynamicColumn> columnAttribute = commonConfigService.getColumnAttribute(searchMap);
		
		if (config.isLineNo()) {
			// 开头加入行号
			DynamicColumn column = new DynamicColumn();
			column.setField("rnum");
			column.setTitle("行号");
			column.setAlign("0");  // 0为居中
			//column.setWidth(10);
			column.setWidth(config.getLineNoWidth());
			column.setVisible(true);
			column.setFormatter(""); // 如果为null, 前端会显示不了
			columnAttribute.add(0, column);
		}
		
		if (config.isOperator()) {
			// 最后加入操作列
			DynamicColumn column2 = new DynamicColumn();
			column2.setVisible(true);
			column2.setTitle("操作");
			column2.setAlign("0");
			column2.setWidth(config.getOperatorWidth());
			column2.setFormatter("renderOperator");
			
			if (config.isOperatorRight())
				columnAttribute.add(column2);
			else
				columnAttribute.add(0, column2);
		}	
		
		if (config.isCheckbox()) {
			// 开头加入checkbox
			DynamicColumn column1 = new DynamicColumn();
			column1.setField("checkStatus");
			column1.setCheckbox(true);
			column1.setAlign("0");
			column1.setVisible(true);
			column1.setWidth(config.getCheckboxWidth());
			column1.setFooterFormatter("renderCheckBoxFooter");
			columnAttribute.add(0, column1);
		}
		
		String tableHeader = mapper.writeValueAsString(columnAttribute);
		tableHeader=tableHeader.replaceAll("myClassStyle", "class");
        return tableHeader;
    }
    
    /**
     * 获得table数据信息,queryId指定, 带分页
     * 
     * xc
     * @param postData
     * @return
     */
    public Map<String, Object> getTableDataList(Map postData,int queryId){
    	Map searchMap = new HashMap();  //封装查询条件
    	
    	// 扔进来1个界面排序字段
    	searchMap.put("sortName", postData.get("sortName"));
    	searchMap.put("sortOrder", postData.get("sortOrder"));
    	// 是否获取group分组的数量
    	searchMap.put("getGroupCount", postData.get("getGroupCount"));
    	
    	if (postData.get("sortName") != null) {
	    	// 重构sortName, 加入可能的表别名
	    	Map columnMap = new HashMap();
	    	columnMap.put("id", queryId);
	    	columnMap.put("field", postData.get("sortName"));
			DynamicColumn columnAttribute = commonConfigService.getOneColumnAttribute(columnMap);
			if (columnAttribute != null &&
					columnAttribute.getTableAlias() != null && 
					StringUtils.isNotEmpty(columnAttribute.getTableAlias().trim())) {
				searchMap.put("sortName", columnAttribute.getTableAlias().trim() + "." + postData.get("sortName"));
			}
    	}
    	
    	// 获得queryId的所有参数
    	List<String> paramNameList = commonConfigService.getParamName(queryId);
    	for (String paramName : paramNameList) {
    		if (postData.get(paramName) != null && StringUtils.isNotEmpty(postData.get(paramName).toString())){
    			searchMap.put(paramName, postData.get(paramName).toString().trim());
    		}
		}
		
    	int limit = Integer.MAX_VALUE;
    	if (postData.get("limit") != null) {
    		limit = Integer.parseInt(postData.get("limit").toString());  //所取记录数
    	}
    	int offset = 0;
    	if (postData.get("offset") != null) {
    		offset = Integer.parseInt(postData.get("offset").toString());  //记录偏离值 	
    	}
		
		searchMap.put("limit", limit);
		searchMap.put("offset", offset);
		
		Page<Map<String, Object>> page = this.getObjectService().getQueryPage(queryId, searchMap);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("rows", page.getDataList());
		result.put("total", page.getTotalCount());
		
		return result;
    }
    
    /**
     * 获得某个queryId的对应List数据, 不分页
     * 
     * @param postData, queryId 参数前端传过来
     * @return
     */
    public List getDataListByQueryId(Map postData){
    	// 获得查询id
    	int queryId = Integer.parseInt(postData.get("queryId").toString());
    	Map searchMap = new HashMap();  //封装查询条件
    	
    	// 扔进来1个界面排序字段
    	searchMap.put("sortName", postData.get("sortName"));
    	searchMap.put("sortOrder", postData.get("sortOrder"));
    	// 是否获取group分组的数量
    	searchMap.put("getGroupCount", postData.get("getGroupCount"));
    	
    	// 重构sortName, 加入可能的表别名
    	if (postData.get("sortName") != null) {
	    	Map columnMap = new HashMap();
	    	columnMap.put("id", queryId);
	    	columnMap.put("field", postData.get("sortName"));
			DynamicColumn columnAttribute = commonConfigService.getOneColumnAttribute(columnMap);
			if (columnAttribute != null &&
					columnAttribute.getTableAlias() != null && 
					StringUtils.isNotEmpty(columnAttribute.getTableAlias().trim())) {
				searchMap.put("sortName", columnAttribute.getTableAlias().trim() + "." + postData.get("sortName"));
			}
    	}
    	
    	List<String> paramNameList = commonConfigService.getParamName(queryId);
    	for (String paramName : paramNameList) {
    		if (postData.get(paramName) != null && StringUtils.isNotEmpty(postData.get(paramName).toString())){
    			searchMap.put(paramName, postData.get(paramName).toString().trim());
    		}
		}

		searchMap.put("limit", Integer.MAX_VALUE);
		searchMap.put("offset", 0);
		
		Page<Map<String, Object>> page = this.getObjectService().getQueryPage(queryId, searchMap);

		return page.getDataList();
    }
    
    /**
     * 根据错误code返回AjaxResult
     * 
     * @param code
     * @return
     */
    protected AjaxResult getAjaxResult(int code) {
    	String errorMsg = commonConfigService.getErrorByCode(code);
		
		AjaxResult result = new AjaxResult();
		result.setSuccess(false);
		result.setErrorMsg(errorMsg);
		return result;
    }

	public int getQueryId() {
		return queryId;
	}

	public void setQueryId(int queryId) {
		this.queryId = queryId;
	}

	public ObjectService getObjectService() {
		return objectService;
	}
}
