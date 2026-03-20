package com.cnpiecsb.backup.controller;

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
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/it")
public class BackupController extends ZtbkServiceController {
	// 备份项目
	private int backupProjectManageQueryId = 4000001;	
	private GridHeadConfig backupProjectManageGridHeadConfig;
	
	private int backupProjectOneQueryId = 4000001;	
	
	// 备份项目日志
	private int backupProjectLogsQueryId = 4000002;	
	private GridHeadConfig backupProjectLogsGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public BackupController(){
		backupProjectManageGridHeadConfig = new GridHeadConfig(backupProjectManageQueryId,true,false,true,false);
		backupProjectManageGridHeadConfig.setOperatorWidth(180);
		
		backupProjectLogsGridHeadConfig = new GridHeadConfig(backupProjectLogsQueryId,true,false,false,false);
	}
	
	/**
	 * 备份项目查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/backupProjectManage", method=RequestMethod.GET)
    public ModelAndView backupProjectManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("it/backup/backupProjectManage");
        String tableHeader = this.getTableHeader(httpSession, backupProjectManageGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", backupProjectManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-备份项目查询管理
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getBackupProjectManageList")
	@ResponseBody
	public Object getBackupProjectManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,backupProjectManageQueryId);
	}
	
	/**
	 * 新增备份项目界面
	 * 
	 * 
	 */
	@RequestMapping(value="/backupProjectAdd",method=RequestMethod.GET)
    public ModelAndView backupProjectAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("it/backup/backupProjectAdd");
        return mv;
    }
	
	/**
	 * 新增备份项目操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addBackupProject")
	@ResponseBody
    public Object addBackupProject(@RequestParam Map postData) {		
		// 入参, 注意按照顺序
		String paramNames[] = {"project_name", "project_type","location"};
		// 出参, 有顺序
		String returnNames[] = {"p_id"};
		// 加入sp的名称
		postData.put("spName", "u_it_backup_project_new");
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入修改备份项目界面
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/backupProjectEdit",method=RequestMethod.GET)
    public ModelAndView backupProjectEdit(@RequestParam Map postData) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(backupProjectOneQueryId, postData);	
		String one = JsonUtil.mapToString(oneQuery);
//		String oneResult = StringEscapeUtils.unescapeJavaScript(one);
		mv.addObject("oneJson", one);
        mv.setViewName("it/backup/backupProjectEdit");		
        return mv;
    }
	
	/**
	 * 修改备份项目
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editBackupProject")
	@ResponseBody
    public Object editBackupProject(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"p_id","project_name","project_type","location"};
		// 加入sp的名称
		postData.put("spName", "u_it_backup_project_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 删除操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteBackupProject")
	@ResponseBody
    public Object deleteBackupProject(@RequestParam Map postData){
		// 入参, 注意按照顺序
		String paramNames[] = {"p_id"};
		// 加入sp的名称
		postData.put("spName", "u_it_backup_project_delete");

		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 一级备份
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/backupOneLevel")
	@ResponseBody
    public Object backupOneLevel(@RequestParam Map postData, HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"p_id", "f_operate_id", "operate_date"};
		// 加入sp的名称
		postData.put("spName", "u_it_backup_one_level");
		
		User user = (User)httpSession.getAttribute("user");
		postData.put("f_operate_id", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 备份校验
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/backupVerify")
	@ResponseBody
    public Object backupVerify(@RequestParam Map postData, HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"p_id", "verify_id", "operate_date"};
		// 加入sp的名称
		postData.put("spName", "u_it_backup_verify");
		
		User user = (User)httpSession.getAttribute("user");
		postData.put("verify_id", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 最终备份
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/backupFinal")
	@ResponseBody
    public Object backupFinal(@RequestParam Map postData, HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"p_id", "final_operate_id", "operate_date"};
		// 加入sp的名称
		postData.put("spName", "u_it_backup_final");
		
		User user = (User)httpSession.getAttribute("user");
		postData.put("final_operate_id", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 备份项目日志界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/backupProjectLogs", method=RequestMethod.GET)
    public ModelAndView backupProjectLogs(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("it/backup/backupProjectLogs");
        String tableHeader = this.getTableHeader(httpSession,backupProjectLogsGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", backupProjectLogsQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-备份项目日志
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getBackupProjectLogsList")
	@ResponseBody
	public Object getBackupProjectLogsList(@RequestBody Map postData){
		return this.getTableDataList(postData, backupProjectLogsQueryId);
	}
}
