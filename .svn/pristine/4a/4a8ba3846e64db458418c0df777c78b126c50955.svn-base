package com.cnpiecsb.csu.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnpiecsb.common.listener.InitialBeanListener;
import com.cnpiecsb.csu.dao.CommonConfigDao;
import com.cnpiecsb.csu.entity.DynamicColumn;

/**
 * 基础通用配置服务, 主要是query表单和列的一些配置, 也包含了sql获得和sql处理的一些方法
 * 
 * @author user
 *
 */
@Service
public class CommonConfigService {
	// 单一实现类可以用Autowired
	@Autowired  
	private CommonConfigDao commonConfigDao;
	
	@Autowired
	private InitialBeanListener initialBeanListener;  //存放了system.property配置项
	
	// 正则表达式, 取{}内的内容
	private final String regex = "\\{([^\\}]+)\\}";
	
	/**
	 * 格式化原生sql, 替换掉Where参数内容
	 * 
	 * @param sql
	 * @param map
	 * @return
	 */
	public String formatWhereSql(String sql, Map map) {
		sql = sql.replaceAll("\r\n", " ").replaceAll("\t", " ");  // 先替换掉回车换行符、制表符 为 空格
		sql = sql.trim();   // 前后空格去掉
		Pattern pattern = Pattern.compile(regex); // 正则表达式匹配{}内的内容
        Matcher matcher = pattern.matcher(sql); 
        while(matcher.find()){ 
            String t = matcher.group(1); 
            
            Object mapValue = map.get(t);
            // 不为空或者非空字符串, 直接替换为具体值
            if (mapValue != null && !mapValue.toString().trim().equals("")) {
            	String strMapValue = mapValue.toString().trim();
            	if (mapValue.equals("null")){
            		strMapValue = "";  // 如果传过来为null,自动转为空字符
            	}
            	sql = sql.replace("{" + t + "}", strMapValue);
            	continue;
            }
            
            // 以下将查询条件替换为 1 = 1
            String param = "{" + t + "}"; 
            
            int endIndex = sql.indexOf(param);
            int lastIndex = sql.indexOf(" ", endIndex); // 继续往后找到空格, 作为后面完成的内容
            
            if (lastIndex > 0) {
            	endIndex = lastIndex;
            } else {
            	endIndex = sql.length();
            }
            String subSql = sql.substring(0, endIndex);
            
            // 查询条件只能跟在 where/and/having/or后面
            int whereEnd = subSql.lastIndexOf(" where ") + 7;
            int andEnd = subSql.lastIndexOf(" and ") + 5;
            int havingEnd = subSql.lastIndexOf(" having ") + 8;
            int orEnd = subSql.lastIndexOf(" or ") + 4;
            
            int maxEnd = NumberUtils.max(whereEnd, andEnd, havingEnd, orEnd);
            
            String queryParam = subSql.substring(maxEnd);
            
            // 如果queryParam有反括号, 但是没有正括号,  那么反括号不能被替换
            // 过滤类似这种情况 where item_code='{item_code}'))  and is_db = 'false' 产生的 item_code='{item_code}')) 这种情况
            if (queryParam.contains(")") && !queryParam.contains("(")) {
            	int khend = queryParam.indexOf(")");  // 找到从头开始的第一个)
            	queryParam = queryParam.substring(0,khend);
            } else if (queryParam.contains("(") && !queryParam.contains(")")) {
            	int khstart = queryParam.indexOf("(");  // 找到从头开始的第一个(
            	queryParam = queryParam.substring(khstart + 1,queryParam.length());
            }
            sql = sql.replace(queryParam, "1 = 1"); // 不能用replaceAll, 会遇到替换不了特殊字符问题
        }
        return sql;
	}
	
	/**
	 * 处理查询条件内容
	 * 
	 * 将查询条件里面所有带逗号(,)的文本(比如 aaa 换行符 bbb)拿出来使用形如 aaa','bbb 的格式替换
	 * 
	 * @param searchMap
	 * @return
	 */
	public void formatSearchMap(Map searchMap) {
		Iterator entries = searchMap.entrySet().iterator();
		while (entries.hasNext()) {
		    Map.Entry entry = (Map.Entry) entries.next();
		    String key = (String) entry.getKey();
		    Object value = entry.getValue();
		    if (value != null) {
		    	String valueString = value.toString();
		    	String newValue = valueString.replaceAll("\t|\r\n", "','");
		    	searchMap.put(key, newValue);
		    }
//		    System.out.println(key + ":" + value);
		}
	}
	
	/**
	 * 转化为 形如 charindex(RTRIM(CAST(hello as NCHAR)),'123'+'222'), 排序用
	 * --XC 修改为 as CHAR，目标字符串最大支持8000的长度
	 * @param inContent  排序用的in内部数据, 里面会带换行符 制表符等空格内容. 如果为空内容就不要调这个方法了
	 * @param field      排序的字段名
	 * @return
	 */
	public String getInContentOrderby(String inContent, String field) {  
		String result = null;
		inContent = inContent.trim().replaceAll("\t|\r\n", "'+'");
		result = "charindex(RTRIM(CAST(" + field +" as CHAR)),'" + inContent + "')";
		return result;
	}
	
	/**
	 * 获得超级用户账号
	 * 
	 * @return
	 */
	private String getSuperUser(){
		Properties props = initialBeanListener.getProps();
		return (String) props.get("superUser.account");
	}
	
	/**
	 * 获得Grid列配置信息, 用户最终配置列信息
	 * 
	 * @param map
	 * @return
	 */
	public List<DynamicColumn> getColumnAttribute(Map map){
		int count = commonConfigDao.getColumnAttributeCount(map);
		// 假如没有配置列, 就读超级管理员的配置列
		if (count == 0) {
			map.put("account", this.getSuperUser());
		}
		return commonConfigDao.getColumnAttribute(map);
	}
	
	/**
	 * 获得待配置用户列信息
	 * 
	 * @param map
	 * @return
	 */
	public List<DynamicColumn> getConfigurationColumn(Map map) {
		// 先获得当前用户配置列
		List<DynamicColumn> currentColumnAttribute = commonConfigDao.getColumnAttribute(map);
		
		map.put("account", this.getSuperUser());
		
		// 再获得超级用户配置列 
		List<DynamicColumn> allColumnAttribute = commonConfigDao.getColumnAttribute(map);
		
		for (DynamicColumn dynamicColumn : allColumnAttribute) {
			for (DynamicColumn currentDynamicColumn : currentColumnAttribute) {
				// 假如当前用户已经有该列了
				if (dynamicColumn.getField().equals(currentDynamicColumn.getField())) {
					BeanUtils.copyProperties(currentDynamicColumn, dynamicColumn);
				}
			}
		}
		
		return allColumnAttribute;
	}
	
	/**
	 * 获得超级管理员的对应某个field的列属性
	 * 
	 * @param map
	 * @return
	 */
	public DynamicColumn getOneColumnAttribute(Map map) {
		map.put("account", this.getSuperUser());  // 超级管理员用户
		// 先获得当前用户配置列
		DynamicColumn columnAttribute = commonConfigDao.getOneColumnAttribute(map);		
		return columnAttribute;
	}
	
	/**
	 * 提交用户配置列
	 * 
	 * @param map
	 * @param dynamicColumns
	 */
	public void doCommitUserColumns(Map map, List<DynamicColumn> dynamicColumns){
//		if (!this.getSuperUser().equals(map.get("account"))){
			commonConfigDao.deleteColumnAttribute(map);
			
			for (DynamicColumn dynamicColumn : dynamicColumns) {
				dynamicColumn.setNewLine(true); // 新增标记
				map.put("dynamicColumn", dynamicColumn);
				commonConfigDao.addColumnAttribute(map);
			}
//		}		
	}
	
	/**
	 * 根据id值获得sql脚本
	 * 
	 * @param id
	 * @return
	 */
	public String getSqlTextById(int id){
    	return commonConfigDao.getSqlTextById(id);
    }
	
	/**
	 * 根据sqlId获得所有的参数列表
	 * 
	 * @param sqlId
	 * @return
	 */
	public List<String> getParamName(int sqlId) {
		String sql = this.getSqlTextById(sqlId);
		
		List<String> paramNameList = new ArrayList<String>();
		Pattern pattern = Pattern.compile(regex); // 正则表达式匹配{}内的内容
        Matcher matcher = pattern.matcher(sql); 
        while(matcher.find()){ 
            String t = matcher.group(1); 
            paramNameList.add(t);
        }
        return paramNameList;
	}
	
	/**
	 * 根据错误code获得错误信息
	 * 
	 * @param code
	 * @return
	 */
	public String getErrorByCode(int code) {
		return commonConfigDao.getErrorByCode(code);
	}
	
//	public static void main(String[] args) throws JsonProcessingException {
//    	// 以下代码可以脱离web容器
//		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
//		context.setValidating(false);  
//		context.load("classpath*:spring-*.xml");  
//		context.refresh(); 
//		
//		CommonQueryService commonQueryService = (CommonQueryService) context.getBean("commonQueryService");		
//		Map searchMap = new HashMap();
//		
//		Map<String, Object> oneQuery = commonQueryService.getCollectData(searchMap, 1100001, "wkh");
//		
//		System.out.println("hello");
//	}
	
	public static void main(String[] args) {
		String inContent = "123\r\n222";  // 转化为 形如 charindex(RTRIM(CAST(hello as NCHAR)),'123'+'222')
		System.out.println(new CommonConfigService().getInContentOrderby(inContent, "hello"));
	}
}
