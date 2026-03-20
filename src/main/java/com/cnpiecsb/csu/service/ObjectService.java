package com.cnpiecsb.csu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.exceptions.TooManyResultsException;
import org.mybatis.spring.MyBatisSystemException;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.csu.entity.DynamicColumn;
import com.cnpiecsb.csu.entity.viewobject.FooterFormat;
import com.cnpiecsb.csu.idao.IBusinessDao;

/**
 * 根服务类,含有数据库查询和操作的函数  后续需要被通用类继承 不允许被业务类继承
 * 
 * @author user
 *
 */
public class ObjectService {
	// 多实现类必须用Resource注入,并需要指定对象名  Qualifier也可以按类注入
//	@Resource(name="baseDao")
	private IBusinessDao iBusinessDao;  // 方法中不好直接调用这个属性, 必须用get方法来调
	
	// 需要用到通用配置服务
	@Resource(name="commonConfigService")
	protected CommonConfigService commonConfigService;
	
	/**
	 * 获得分页的Grid数据
	 * 
	 * @param sqlId sql脚本代号
	 * @param map 存放基本的脚本查询数据
	 * @return
	 */
	public Page<Map<String, Object>> getQueryPage(int sqlId, Map map){
		// 处理传入的map数据
		commonConfigService.formatSearchMap(map);
		
		String sql = commonConfigService.getSqlTextById(sqlId);
		sql = commonConfigService.formatWhereSql(sql, map);
		
		// 以下解析传入的sql脚本
		// 查询脚本
		String resultSql = null;
		// order by 子句
		String orderSql = null;
		
		int lastOrder = sql.lastIndexOf(" order by ");
		if (lastOrder > 0){  // 含有order by子句
			resultSql = sql.substring(6, lastOrder);  // 去掉select后, 截止最后order by子句前的脚本
			orderSql = sql.substring(lastOrder);  // 截取后面的 order by子句
		} else {
			resultSql = sql.substring(6);  // 去掉select后的脚本
			orderSql = " order by id desc";  // 自动构建一个order by 子句
			lastOrder = sql.length();
		}
		
		int begin = sql.indexOf(" from ");
		// 用于查找总数的脚本
		String countSql = sql.substring(begin, lastOrder); // 去掉select * 之后, 截止最后order by子句前的脚本
		
		map.put("sql", resultSql);  // 去掉select后, 截止最后order by子句前的脚本
		map.put("countSql", countSql);
		
		// 加入界面的orderBy插件
		if (map.get("sortName") != null &&
				map.get("sortOrder") != null){
			orderSql = " order by " + map.get("sortName") + " " + map.get("sortOrder");
		}
		map.put("orderSql", orderSql);
		
		Page<Map<String, Object>> page = new Page<Map<String, Object>>();
		
		// 总数
		int count = 0;
		try {
			count = this.getiBusinessDao().getQueryCount(countSql);
		} catch(MyBatisSystemException e){
			if (e.getCause() instanceof TooManyResultsException)  // 说明有group by子句
				count = this.getiBusinessDao().getGroupCount();  // 获得分组数
		} catch(Exception e){
			// 如果查出来为空, 为总数0
		}
		// 假如传了参数 getGroupCount 代表总数我选择分组数
		if (map.get("getGroupCount") != null)
			count = this.getiBusinessDao().getGroupCount();  // 获得分组数
		
		page.setTotalCount(count);
		page.setDataList(this.getiBusinessDao().getQueryResult(map));
        return page;
	}
	
	/**
	 * 获得一条记录
	 * 
	 * @param sqlId
	 * @param map
	 * @return
	 */
	public Map<String, Object> getOneQuery(int sqlId, Map map){
		String sql = commonConfigService.getSqlTextById(sqlId);
		sql = commonConfigService.formatWhereSql(sql, map);
		
		map.put("sql", sql);
		
		Map<String, Object> oneResult = this.getiBusinessDao().getOneResult(map);
        return oneResult;
	}
	
	/**
	 * 获得Grid列的汇总数据, 一次查询
	 * 
	 * @param map
	 * @param sqlId 查询id
	 * @param account 用户账号
	 * @return
	 */
	public Map<String, Object> getCollectData(Map map, int sqlId, String account){
        Map searchMap = new HashMap();
		searchMap.put("id", sqlId);
		searchMap.put("account", account);
		List<DynamicColumn> columnAttribute = commonConfigService.getColumnAttribute(searchMap);
		
		List<String> collectSqlList = new ArrayList<String>();
		for (DynamicColumn dynamicColumn : columnAttribute) {
			switch (dynamicColumn.getFooterFormatter()) {
	        case FooterFormat.formatSum:
	        	collectSqlList.add("isnull(sum(" + dynamicColumn.getField() + "),0) " + dynamicColumn.getField());
	            break;
	        case FooterFormat.formatAvg :
	        	collectSqlList.add("isnull(avg(" + dynamicColumn.getField() + "),0) " + dynamicColumn.getField());
	            break;
	        default:
	            break;
	        }		
		}
		
		if (collectSqlList.size() == 0) {
			return new HashMap<String, Object>();
		}
		
		// 获得汇总的核心语法
		String collectSql = StringUtils.join(collectSqlList, ',');
		
		// 处理传入的map数据
		commonConfigService.formatSearchMap(map);
		
		String sql = commonConfigService.getSqlTextById(sqlId);
		sql = commonConfigService.formatWhereSql(sql, map);
		
		String coreSql = null;   // 获得核心脚本, 即去掉order by子句后的脚本
		
		int lastOrder = sql.lastIndexOf(" order by ");
		if (lastOrder > 0){  // 含有order by子句
			coreSql = sql.substring(0, lastOrder);  // 获得 截止最后order by子句前的脚本
		} else {
			coreSql = sql;
		}
		
        map.put("sql", "select " + collectSql + " from (" + coreSql + ") w");
		Map<String, Object> collectResult = this.getiBusinessDao().getOneResult(map);
        return collectResult;
	}
	
	/**
	 * 调用存储过程
	 * 
	 * @param map
	 * @param paramNames  如果无参传null或者空数组
	 * @param returnNames  如果无参传null或者空数组
	 * @return
	 */
	public int doCallSp(Map<String, Object> map, String[] paramNames, String[] returnNames){
		// 先处理map数据的所有空字符串内容变为null
		for (Map.Entry<String, Object> entry : map.entrySet()) { 
			if (entry.getValue()!=null&&entry.getValue().toString().length() == 0){
				entry.setValue(null);
			}
		}
		
		List<String> mybatisParamNames = new ArrayList<String>();
		if (paramNames != null) {
			for (String param : paramNames) {
				mybatisParamNames.add("#{" + param + ", jdbcType=VARCHAR}");  // jdbcType不写的话不能传空值, 无语
			}
		}
		if (returnNames != null) {
			for (String returnParam : returnNames) {
				mybatisParamNames.add("#{" + returnParam + ", mode=OUT, jdbcType=VARCHAR}");
			}
		}
		map.put("paramNames", mybatisParamNames);
		try{
			this.getiBusinessDao().callSp(map);
		}catch(Exception e){
			System.out.println(e);
		}
		
		if (map.get("resultCode") == null)
			return 0;  // 没有返回值的话直接返回0
		// 得到返回code值
		return (int) map.get("resultCode");
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
	 * 需要被子类覆盖
	 * 
	 * @return
	 */
	public IBusinessDao getiBusinessDao() {
		return iBusinessDao;
	}
}
