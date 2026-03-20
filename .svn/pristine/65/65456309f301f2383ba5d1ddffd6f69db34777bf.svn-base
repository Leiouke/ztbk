package com.cnpiecsb.np.finance.controller;

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

/**
 * 代销预付相关控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np")
public class AdvancePaymentController extends ZtbkServiceController {
	// 代销预付
	private int advancePaymentManageQueryId = 6100001;	
	private GridHeadConfig advancePaymentManageGridHeadConfig;
	
	private int advancePaymentOneQueryId = 6100001;
	
	// 代销预付确认
	private int advancePaymentConfirmManageQueryId = 6100002;	
	private GridHeadConfig advancePaymentConfirmManageGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public AdvancePaymentController(){
		advancePaymentManageGridHeadConfig = new GridHeadConfig(advancePaymentManageQueryId,true,false,true,false);
		advancePaymentManageGridHeadConfig.setOperatorWidth(80);
		
		advancePaymentConfirmManageGridHeadConfig = new GridHeadConfig(advancePaymentConfirmManageQueryId,true,false,true,false);
	}
	
	/**
	 * 代销预付主页面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/advancePaymentManage",method=RequestMethod.GET)
    public ModelAndView advancePaymentManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/advancePayment/advancePaymentManage");
        String tableHeader = this.getTableHeader(httpSession,advancePaymentManageGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", advancePaymentManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-代销预付管理
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getAdvancePaymentManageList")
	@ResponseBody
	public Object getAdvancePaymentManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,advancePaymentManageQueryId);
	}
	
	/**
	 * 新增代销预付页面
	 * 
	 * 
	 */
	@RequestMapping(value="/advancePaymentAdd",method=RequestMethod.GET)
    public ModelAndView advancePaymentAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/advancePayment/advancePaymentAdd");
        return mv;
    }

	/**
	 * 新增代销预付操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addAdvancePayment")
	@ResponseBody
    public Object addAdvancePayment(@RequestParam Map postData,HttpSession httpSession){
		
		// 入参, 注意按照顺序
		String paramNames[] = {"account_month","f_id","currency","advance_money","exchange_rate",
				"rmb_advance_money","o_id_input", "memo"};
		// 出参, 有顺序
		String returnNames[] = {"ap_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_advance_payment_new");
		
		User user = (User) httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		// 以下获得出参值
		return "{\"success\":true}";
    }
	
	/**
	 * 进入修改页面
	 * 
	 * @throws JsonProcessingException
	 * 
	 */
	@RequestMapping(value="/advancePaymentEdit",method=RequestMethod.GET)
    public ModelAndView advancePaymentEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(advancePaymentOneQueryId, postData);	
		oneQuery.put("account_month", oneQuery.get("month_code"));
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/advancePayment/advancePaymentEdit");
        
        return mv;
    }
	
	/**
	 * 修改操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editAdvancePayment")
	@ResponseBody
    public Object editAdvancePayment(@RequestParam Map postData,HttpSession httpSession) {				
		int code = do_sp_advance_payment_update(postData);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	// 代销预付修改
	private int do_sp_advance_payment_update(Map postData){
		String paramNames[] = {"ap_id","account_month","f_id","currency","advance_money","exchange_rate","rmb_advance_money","memo"};
		// 加入sp的名称
		postData.put("spName", "u_finance_advance_payment_update");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 删除操作 代销预付单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteAdvancePayment")
	@ResponseBody
    public Object deleteAdvancePayment(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"ap_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_advance_payment_delete");
		
//		User user=(User)httpSession.getAttribute("user");
//		postData.put("o_id_destroy", user.getAccount());
        
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}				
		return "{\"success\":true}";
    }
	
	/**
	 * 代销预付单确认列表界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/advancePaymentConfirmManage",method=RequestMethod.GET)
    public ModelAndView advancePaymentConfirmManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/advancePayment/advancePaymentConfirmManage");
        String tableHeader = this.getTableHeader(httpSession, advancePaymentConfirmManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", advancePaymentConfirmManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-代销预付单确认列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getAdvancePaymentConfirmManageList")
	@ResponseBody
	public Object getAdvancePaymentConfirmManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, advancePaymentConfirmManageQueryId);
	}
	
	/**
	 * 确认操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/advancePaymentConfirm")
	@ResponseBody
    public Object advancePaymentConfirm(@RequestParam Map postData,HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_confirm", user.getAccount());
		int code = do_sp_advance_payment_confirm(postData);
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	//确认
	private int do_sp_advance_payment_confirm(Map postData){
		String paramNames[] = {"ap_id","o_id_confirm"};
		// 加入sp的名称
		postData.put("spName", "u_finance_advance_payment_confirm");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
}
