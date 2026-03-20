package com.cnpiecsb.np.finance.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("/np")
public class FhShAccountController extends ZtbkServiceController {
	private int fhShAccountQueryId = 5700001;	
	private GridHeadConfig fhShAccountGridHeadConfig;
	
	private int fhShAccountOneQueryId = 5700001;//申汇单明细
	
	private int fhShAccountDetailQueryId = 5700002;//申汇单明细	
	private GridHeadConfig fhShAccountDetailHeadConfig;
	
	private int fhShReportQueryId = 5900001; // 进货报表
	private GridHeadConfig fhShReportHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public FhShAccountController(){
		fhShAccountGridHeadConfig = new GridHeadConfig(fhShAccountQueryId,true,true,true,false);
		fhShAccountGridHeadConfig.setOperatorWidth(80);
		
		fhShAccountDetailHeadConfig=new GridHeadConfig(fhShAccountDetailQueryId,true,false,false,false);
		
		fhShReportHeadConfig=new GridHeadConfig(fhShReportQueryId,true,false,false,false);
	}
	
	/**
	 * 进货记账界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/fhShAccount",method=RequestMethod.GET)
    public ModelAndView fhShAccount(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/fhShAccount/fhShAccount");
        String tableHeader = this.getTableHeader(httpSession,fhShAccountGridHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", fhShAccountQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-进货记账列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFhShAccountList")
	@ResponseBody
	public Object getFhShAccountList(@RequestBody Map postData){
		return this.getTableDataList(postData,fhShAccountQueryId);
	}
	
	/**
	 * 进货记账——申汇单明细页面
	 * 
	 * 
	 */
	@RequestMapping(value="/fhShAccountDetail",method=RequestMethod.GET)
    public ModelAndView fhShAccountDetail(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("np/fhShAccount/fhShAccountDetail");
		Map<String, Object> oneQuery = baseService.getOneQuery(fhShAccountOneQueryId, postData);		
     	mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        String tableHeader = this.getTableHeader(httpSession,fhShAccountDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", fhShAccountDetailQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-进货记账——申汇单明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getfhShAccountDetailList")
	@ResponseBody
	public Object getfhShAccountDetailList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,fhShAccountDetailQueryId);
	}
	
	/**
	 * 记账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/accountFhSh")
	@ResponseBody
    public Object accountFhSh(@RequestParam Map postData,HttpServletRequest request,HttpSession httpSession){
		String[] fh_ids=request.getParameterValues("fh_ids");
		User user=(User)httpSession.getAttribute("user");
		postData.put("account_person", user.getAccount());
		if(fh_ids!=null&&fh_ids.length>0){
			for(int i=0;i<fh_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"fh_id","account_person","account_month"};
				// 加入sp的名称
				postData.put("spName", "u_finance_fhsh_account");
				
				postData.put("fh_id", fh_ids[i]);
						
				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}				
		return "{\"success\":true}";
    }
	
	/**
	 * 撤销操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteFhshAccount")
	@ResponseBody
    public Object deleteFhshAccount(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){		
		String[] fh_ids=request.getParameterValues("fh_ids");
		if(fh_ids!=null&&fh_ids.length>0){
			for(int i=0;i<fh_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"fh_id"};
				// 加入sp的名称
				postData.put("spName", "u_finance_fhsh_account_cancel");					
				
				postData.put("fh_id", fh_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
    }
	
	/**
	 * 申汇单-报表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/fhShReport",method=RequestMethod.GET)
    public ModelAndView fhShReport(HttpSession httpSession,String fh_id, String is_purchase_classify)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/fhShAccount/fhShReport");
        String tableHeader = this.getTableHeader(httpSession,fhShReportHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", fhShReportQueryId);
		mv.addObject("fh_id", fh_id);
		mv.addObject("is_purchase_classify", is_purchase_classify==null?0:is_purchase_classify);
        return mv;
    }
	/**
	 * 获得动态列表数据-申汇单-报表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFhShReportList")
	@ResponseBody
	public Object getFhShReportList(@RequestBody Map postData,HttpSession httpSession){
		return this.getTableDataList(postData,fhShReportQueryId);
	}
}
