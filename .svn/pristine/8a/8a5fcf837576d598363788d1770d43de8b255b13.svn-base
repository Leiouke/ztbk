package com.cnpiecsb.fc.petty.controller;

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
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 备用金申请页面
 * @author by zc 2021/12/17
 *
 */
@Controller
@RequestMapping("/fc/petty")
public class PettyCashController extends BaseServiceController{
	
	// 备用金查询
	private int pettyCashManageQueryId = 8600001;	
	private GridHeadConfig pettyCashManageQueryHeadConfig;
		
	// 备用金单记录查询
	private int pettyCashOneQueryId = 8600002;
		
	public PettyCashController() {
		pettyCashManageQueryHeadConfig = new GridHeadConfig(pettyCashManageQueryId,true,false,true,false);
		pettyCashManageQueryHeadConfig.setOperatorWidth(180);
			
	}
	
	/**
	 * 进入备用金申请页面界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/pettyCashManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView pettyCashManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/pettyCash/pettyCashManage");
        String tableHeader = this.getTableHeader(httpSession,pettyCashManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", pettyCashManageQueryId);
        return mv;
    }
	
	/**
	 * 获得备用金申请页面数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getPettyCashList")
	@ResponseBody
	public Object getPettyCashList(@RequestBody Map postData, HttpSession httpSession) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		return this.getTableDataList(postData, pettyCashManageQueryId);
	}
	
	/**
	 * 新增备用金页面
	 * 
	 * 
	 */
	@RequestMapping(value="/pettyCashAdd",method=RequestMethod.GET)
    public ModelAndView pettyCashAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/pettyCash/pettyCashAdd");
        return mv;
    }
	
	/**
	 * 新增备用金操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addPettyCash")
	@ResponseBody
    public Object addPettyCash(@RequestParam Map postData,HttpSession httpSession) {	
		
		// 入参, 注意按照顺序
		String paramNames[] = {"o_id_input","apply_money","memo","org_code"};
		// 出参, 有顺序
		String returnNames[] = {"pc_id"};
		// 加入sp的名称
		postData.put("spName", "fc_petty_cash_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 删除备用金申请
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deletePettyCash")
	@ResponseBody
    public Object deletePettyCash(@RequestParam Map postData,HttpSession httpSession){
		
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"pc_id", "o_id_destroy"};
		// 加入sp的名称
		postData.put("spName", "fc_petty_cash_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_destroy", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/pettyCashEdit",method=RequestMethod.GET)
    public ModelAndView pettyCashEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(pettyCashOneQueryId, postData);		
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("fc/pettyCash/pettyCashEdit");
		
        return mv;
    }
	
	/**
	 * 修改预收单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editPaymentAdvance")
	@ResponseBody
    public Object editPaymentAdvance(@RequestParam Map postData,HttpSession httpSession) {	
		
		// 入参, 注意按照顺序
		String paramNames[] = {"pc_id","apply_money","memo"};
		// 加入sp的名称
		postData.put("spName", "fc_petty_cash_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 提交操作 
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/pettyCashSubmit")
	@ResponseBody
	public Object pettyCashSubmit(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"account","bill_code","flow_id","audit_status","audit_memo"};
		// 加入sp的名称
		postData.put("spName", "fc_process_approval_operate");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("account", user.getAccount());
		postData.put("audit_status", "0"); //初次提交传0
		postData.put("audit_memo", ""); 
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}

}
