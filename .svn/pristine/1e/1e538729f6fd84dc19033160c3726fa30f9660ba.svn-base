package com.cnpiecsb.fc.basic.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 财务分类查询和维护的相关controller
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/fc/basic")
public class FinancialClassifyController extends BaseServiceController {
	private int financialClassifyQueryId = 8000006;
	
	// 财务分类管理
	private int financialClassifyManageQueryId = 8000011;	
	private GridHeadConfig financialClassifyManageGridHeadConfig;
	
	// 财务分类显示部门管理
	private int financialClassifyDepsManageQueryId = 8000012;	
	private GridHeadConfig financialClassifyDepsManageGridHeadConfig;
	
	// 财务分类科目映射管理
	private int financialClassifyMappingManageQueryId = 8000013;	
	private GridHeadConfig financialClassifyMappingManageGridHeadConfig;
	
	private int financialClassifyBaseQueryId = 8000014; //zc后加入
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public FinancialClassifyController(){
		financialClassifyManageGridHeadConfig = new GridHeadConfig(financialClassifyManageQueryId,true,false,true,false);
		financialClassifyManageGridHeadConfig.setOperatorWidth(180);
		
		financialClassifyDepsManageGridHeadConfig = new GridHeadConfig(financialClassifyDepsManageQueryId,true,false,true,false);
		
		financialClassifyMappingManageGridHeadConfig = new GridHeadConfig(financialClassifyMappingManageQueryId,true,false,true,false);
		financialClassifyMappingManageGridHeadConfig.setOperatorWidth(100);
	}
	
	/**
	 * 获得动态列表数据-可按部门查询的财务分类列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFinancialClassifyList")
	@ResponseBody
	public Object getFinancialClassifyList(String dep_org_code, boolean is_other){
		Map<String,Object> postData=new HashMap<>();
		postData.put("dep_org_code", dep_org_code);
		if (is_other) {
			postData.put("other_category", "other");  // 只取other类型
		} else {
			postData.put("not_other_category", "other"); // 排除other类型
		}
		return this.getTableDataList(postData, financialClassifyQueryId);
	}
	
	/**
	 * 财务分类管理界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/financialClassifyManage",method=RequestMethod.GET)
    public ModelAndView financialClassifyManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/financialClassify/financialClassifyManage");
        String tableHeader = this.getTableHeader(httpSession, financialClassifyManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", financialClassifyManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-财务分类
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFinancialClassifyManageList")
	@ResponseBody
	public Object getFinancialClassifyManageList(@RequestBody Map postData, HttpSession httpSession){
		return this.getTableDataList(postData, financialClassifyManageQueryId);
	}
	
	/**
	 * 新增财务分类界面
	 * 
	 * 
	 */
	@RequestMapping(value="/financialClassifyAdd",method=RequestMethod.GET)
    public ModelAndView financialClassifyAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/financialClassify/financialClassifyAdd");
        return mv;
    }
	
	/**
	 * 新增财务分类操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addFinancialClassify")
	@ResponseBody
    public Object addFinancialClassify(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "classify_name", "financial_classify_category", "sort_number"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_base_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 财务分类修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/financialClassifyEdit",method=RequestMethod.GET)
    public ModelAndView financialClassifyEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(financialClassifyManageQueryId, postData);
		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("fc/financialClassify/financialClassifyEdit");
        return mv;
    }
	
	/**
	 * 修改财务分类操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editFinancialClassify")
	@ResponseBody
    public Object editFinancialClassify(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "classify_name", "financial_classify_category", "sort_number"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_base_update");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 财务分类显示部门管理界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/financialClassifyDepsManage",method=RequestMethod.GET)
    public ModelAndView financialClassifyDepsManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/financialClassify/financialClassifyDepsManage");
        String tableHeader = this.getTableHeader(httpSession, financialClassifyDepsManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", financialClassifyDepsManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-财务分类显示部门
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFinancialClassifyDepsManageList")
	@ResponseBody
	public Object getFinancialClassifyDepsManageList(@RequestBody Map postData, HttpSession httpSession){
		return this.getTableDataList(postData, financialClassifyDepsManageQueryId);
	}
	
	/**
	 * 新增财务分类显示部门界面
	 * 
	 * 
	 */
	@RequestMapping(value="/financialClassifyDepAdd",method=RequestMethod.GET)
    public ModelAndView financialClassifyDepAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/financialClassify/financialClassifyDepAdd");
        return mv;
    }
	
	/**
	 * 新增财务分类显示部门操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addFinancialClassifyDep")
	@ResponseBody
    public Object addFinancialClassifyDep(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "dep_org_code"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改财务分类显示部门界面
	 * 
	 * 
	 */
	@RequestMapping(value="/financialClassifyDepEdit",method=RequestMethod.GET)
    public ModelAndView financialClassifyDepEdit(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/financialClassify/financialClassifyDepEdit");
        return mv;
    }
	
	/**
	 * 修改财务分类显示部门 排序
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editFinancialClassifyDep")
	@ResponseBody
    public Object editFinancialClassifyDep(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "dep_org_code", "sort_number"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_update");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除财务分类显示部门操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFinancialClassifyDep")
	@ResponseBody
    public Object deleteFinancialClassifyDep(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "dep_org_code"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 财务分类财务科目映射管理界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/financialClassifyMappingManage",method=RequestMethod.GET)
    public ModelAndView financialClassifyMappingManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/financialClassify/financialClassifyMappingManage");
        String tableHeader = this.getTableHeader(httpSession, financialClassifyMappingManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", financialClassifyMappingManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-财务分类财务科目映射
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFinancialClassifyMappingManageList")
	@ResponseBody
	public Object getFinancialClassifyMappingManageList(@RequestBody Map postData, HttpSession httpSession){
		return this.getTableDataList(postData, financialClassifyMappingManageQueryId);
	}
	
	/**
	 * 新增财务分类科目映射界面
	 * 
	 * 
	 */
	@RequestMapping(value="/financialClassifyMappingAdd",method=RequestMethod.GET)
    public ModelAndView financialClassifyMappingAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/financialClassify/financialClassifyMappingAdd");
        return mv;
    }
	
	/**
	 * 新增财务分类科目映射操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addFinancialClassifyMapping")
	@ResponseBody
    public Object addFinancialClassifyMapping(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "cw_direction", "pay_style", "cw_km1_code", "cw_km2_code", "cw_km3_code", "cw_km4_code", "cw_km5_code",
				"cw_km1_name", "cw_km2_name", "cw_km3_name", "cw_km4_name", "cw_km5_name"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_mapping_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改财务分类科目映射界面
	 * 
	 * 
	 */
	@RequestMapping(value="/financialClassifyMappingEdit",method=RequestMethod.GET)
    public ModelAndView financialClassifyMappingEdit(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        // 单记录查询
     	Map<String, Object> oneQuery = baseService.getOneQuery(financialClassifyMappingManageQueryId, postData);   		
     	mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
     	
        mv.setViewName("fc/financialClassify/financialClassifyMappingEdit");
        return mv;
    }
	
	/**
	 * 新增财务分类科目映射操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editFinancialClassifyMapping")
	@ResponseBody
    public Object editFinancialClassifyMapping(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "cw_direction", "pay_style", "cw_km1_code", "cw_km2_code", "cw_km3_code", "cw_km4_code", "cw_km5_code",
				"cw_km1_name", "cw_km2_name", "cw_km3_name", "cw_km4_name", "cw_km5_name"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_mapping_update");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 删除财务分类科目映射操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFinancialClassifyMapping")
	@ResponseBody
    public Object deleteFinancialClassifyMapping(@RequestParam Map postData,HttpSession httpSession) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input", "classfiy_code", "cw_direction", "pay_style"};
		// 出参, 有顺序
//		String returnNames[] = {"report_id"};
		// 加入sp的名称
		postData.put("spName", "fc_db_financial_classify_mapping_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 获得动态列表数据-可按部门查询的财务分类列表(获得本部门独有和所有部门)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFinancialClassifyBaseList")
	@ResponseBody
	public Object getFinancialClassifyBaseList(String org_code, String category){
		Map<String,Object> postData=new HashMap<>();
		postData.put("org_code", org_code);
		postData.put("category", category);
		return this.getTableDataList(postData, financialClassifyBaseQueryId);
	}
}
