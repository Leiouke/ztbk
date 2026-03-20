package com.cnpiecsb.np.finance.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.common.viewobject.AjaxResult;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.onInterface.service.GetMemberTokenServivce;
import com.cnpiecsb.onInterface.service.PutNpPaymentChargeService;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 费用支付相关控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np")
public class PaymentChargeController extends ZtbkServiceController {
	// 支付申请
	private int paymentChargeManageQueryId = 6000001;	
	private GridHeadConfig paymentChargeManageGridHeadConfig;
	
	private int paymentChargeOneQueryId = 6000001;
	
	// 支付审核
	private int paymentChargeVerifyQueryId = 6000002;	
	private GridHeadConfig paymentChargeVerifyGridHeadConfig;
	
	// 支付付款
	private int paymentChargePayManageQueryId = 6000003;
	private GridHeadConfig paymentChargePayManageGridHeadConfig;
	
	private int getOaAccountQuery = 1400005;
	
	//oa接口
	@Autowired
	GetMemberTokenServivce getMemberTokenServivce; //获取token接口
	@Autowired
	PutNpPaymentChargeService putNpPaymentChargeService;//推送付款申请接口
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public PaymentChargeController(){
		paymentChargeManageGridHeadConfig = new GridHeadConfig(paymentChargeManageQueryId,true,false,true,false);
		paymentChargeManageGridHeadConfig.setOperatorWidth(80);
		
		paymentChargeVerifyGridHeadConfig = new GridHeadConfig(paymentChargeVerifyQueryId,true,false,true,false);
		
		paymentChargePayManageGridHeadConfig=new GridHeadConfig(paymentChargePayManageQueryId,true,false,true,false);
		paymentChargePayManageGridHeadConfig.setOperatorWidth(120);
	}
	
	/**
	 * 费用支付主页面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/paymentChargeManage",method=RequestMethod.GET)
    public ModelAndView paymentChargeManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/paymentCharge/paymentChargeManage");
        String tableHeader = this.getTableHeader(httpSession,paymentChargeManageGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", paymentChargeManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-费用支付管理
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getPaymentChargeManageList")
	@ResponseBody
	public Object getPaymentChargeManageList(@RequestBody Map postData){
		return this.getTableDataList(postData,paymentChargeManageQueryId);
	}
	
	/**
	 * 新增费用支付页面
	 * 
	 * 
	 */
	@RequestMapping(value="/paymentChargeAdd",method=RequestMethod.GET)
    public ModelAndView paymentChargeAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/paymentCharge/paymentChargeAdd");
        return mv;
    }

	/**
	 * 新增费用支付操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addPaymentCharge")
	@ResponseBody
    public Object addPaymentCharge(@RequestParam Map postData,HttpSession httpSession){
		
		// 入参, 注意按照顺序
		String paramNames[] = {"c_id","o_id_input","payment_type","payment_money","invoice_nos",
				"memo","bank_id"};
		// 出参, 有顺序
		String returnNames[] = {"pc_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_new");
		
		User user=(User)httpSession.getAttribute("user");
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
	@RequestMapping(value="/paymentChargeEdit",method=RequestMethod.GET)
    public ModelAndView paymentChargeEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(paymentChargeOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/paymentCharge/paymentChargeEdit");
        
        return mv;
    }
	
	/**
	 * 修改操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editPaymentCharge")
	@ResponseBody
    public Object editPaymentCharge(@RequestParam Map postData,HttpSession httpSession) {				
		int code = do_sp_payment_charge_update(postData);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
	
	// 费用支付修改
	private int do_sp_payment_charge_update(Map postData){
		String paramNames[] = {"pc_id","c_id","payment_type","payment_money","invoice_nos","memo","bank_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_update");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 删除操作 申汇单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deletePaymentCharge")
	@ResponseBody
    public Object deletePaymentCharge(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"pc_id","o_id_destroy"};
		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_delete");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_destroy", user.getAccount());
        
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}				
		return "{\"success\":true}";
    }
	
	/**
	 * 提交支付费用审核操作(不含保存)
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/commitPaymentCharge")
	@ResponseBody
    public Object commitPaymentCharge(@RequestParam Map postData,HttpSession httpSession){	
		int code = do_sp_payment_charge_commit(postData);
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		//执行接口推送
		User user=(User)httpSession.getAttribute("user");
		postData.put("bill_code", postData.get("pc_id"));
		
		int result_code = oaApiDeal(postData,user.getAccount());
		
		if(result_code ==1){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("接口报错");
			return result;
		}
			
		return "{\"success\":true}";
    }
	
	//提交审核支付费用
	private int do_sp_payment_charge_commit(Map postData){
		String paramNames[] = {"pc_id"};
		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_commit");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 费用支付待审核列表界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/paymentChargeVerifyManage",method=RequestMethod.GET)
    public ModelAndView paymentChargeVerifyManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/paymentCharge/paymentChargeVerifyManage");
        String tableHeader = this.getTableHeader(httpSession,paymentChargeVerifyGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", paymentChargeVerifyQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-费用支付审核列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getPaymentChargeVerifyManageList")
	@ResponseBody
	public Object getPaymentChargeVerifyManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, paymentChargeVerifyQueryId);
	}
	
	/**
	 * 费用支付审核页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/paymentChargeVerify",method=RequestMethod.GET)
    public ModelAndView paymentChargeVerify(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
		ModelAndView mv = new ModelAndView();
		// 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(paymentChargeOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/paymentCharge/paymentChargeVerify");
        return mv;
    }
	
	/**
	 * 审核通过、不通过操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/verifyPaymentCharge")
	@ResponseBody
    public Object verifyPaymentCharge(@RequestParam Map postData,HttpSession httpSession){
		String is_pass=postData.get("is_pass").toString();
		User user=(User)httpSession.getAttribute("user");
		if("0".equals(is_pass)){
			int code = do_sp_payment_charge_verify_renturn(postData);
			if (code != 0) {
				return this.getAjaxResult(code);
			}	
		}else if("1".equals(is_pass)){
			int code = do_sp_payment_charge_verify(postData,user.getAccount());
			if (code != 0) {
				return this.getAjaxResult(code);
			}
		}
		return "{\"success\":true}";
    }
	
	//费用支付审核退回SP
	private int do_sp_payment_charge_verify_renturn(Map postData){
		String paramNames[] = {"pc_id","audit_memo"};
		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_audit_return");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	//费用支付审核通过
	private int do_sp_payment_charge_verify(Map postData,String username){
		String paramNames[] = {"pc_id","o_id_auditor","audit_memo"};
		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_audit");
		postData.put("o_id_auditor", username);
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 支付费用待付款列表界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/paymentChargePayManage",method=RequestMethod.GET)
    public ModelAndView paymentChargePayManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/paymentCharge/paymentChargePayManage");
        String tableHeader = this.getTableHeader(httpSession,paymentChargePayManageGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", paymentChargePayManageQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-支付费用待付款列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getPaymentChargePayManageList")
	@ResponseBody
	public Object getPaymentChargePayManageList(@RequestBody Map postData){
		return this.getTableDataList(postData, paymentChargePayManageQueryId);
	}
	
	/**
	 * 付款确认编辑页面
	 * 
	 * 
	 */
	@RequestMapping(value="/paymentChargePay",method=RequestMethod.GET)
    public ModelAndView paymentChargePay(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException {
		ModelAndView mv = new ModelAndView();
		// 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(paymentChargeOneQueryId, postData);		
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/paymentCharge/paymentChargePay");
        return mv;
    }
	
	/**
	 * 付汇确认操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/paymentChargePayConfirm")
	@ResponseBody
    public Object paymentChargePayConfirm(@RequestParam Map postData,HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_input", user.getAccount());
		int code = do_sp_payment_charge_pay_confirm(postData);
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	//付款确认
	private int do_sp_payment_charge_pay_confirm(Map postData){
		String paramNames[] = {"pc_id","pay_date","o_id_input"};
		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_pay");
		
		return baseService.doCallSp(postData, paramNames, null);
	}
	
	/**
	 * 推送到OA
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/putPaymentChargeToOa")
	@ResponseBody
    public Object putPaymentChargeToOa(@RequestParam Map postData,HttpSession httpSession){	
		User user=(User)httpSession.getAttribute("user");
		
		//提交后调用oa接口
		int result_code= oaApiDeal(postData,user.getAccount());
				
		if(result_code ==1){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("接口报错");
			return result;
		}
				
		return "{\"success\":true}";
    }
	
	// 执行oa接口
	private int oaApiDeal(Map postData,String account){
			
		String loginName = "";
			
		postData.put("account", account);
			
		Map<String, Object> oneQuery = baseService.getOneQuery(getOaAccountQuery, postData);
			
		loginName = String.valueOf(oneQuery.get("oa_loginName"));
			
		String token = getMemberTokenServivce.getMemberToken(loginName,String.valueOf(postData.get("bill_code")));
			
		if(token.equals("0")){//为0表示接口有报错
			return 1;
		}
			
		postData.put("token",token);
			
		String return_code= putNpPaymentChargeService.putPaymentApplication(token,String.valueOf(postData.get("bill_code")));
			
		if(return_code.equals("0")){//0表示有报错
			return 1;
		}else{//成功修改请假单的字段
			updateSynOa(String.valueOf(postData.get("bill_code")));
		}
			
		return 0;
	}
	
	//修改单据标识
	public void updateSynOa(String pc_id){
		Map<String,Object> postData = new HashMap<String,Object>();
							
		postData.put("pc_id", pc_id);
							
		// 入参, 注意按照顺序
		String paramNames[] = {"pc_id"};

		// 加入sp的名称
		postData.put("spName", "u_finance_payment_charge_synoa_update");//sp名称 todo
								
		int return_code = baseService.doCallSp(postData, paramNames, null);
							
	}
}
