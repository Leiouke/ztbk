package com.cnpiecsb.fc.receivable.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.aop.OperationLogAnnotation;
import com.cnpiecsb.common.util.GuidUtil;
import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.fc.util.AccessControlUtil;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/fc/receivable")
@Configuration
@EnableAspectJAutoProxy(proxyTargetClass = true)  // 强制使用 CGLIB 代理
public class ReceivableStatementController extends BaseServiceController {
	// 结算单表头查询(销售结算单)
	private int statementManageQueryId = 8100001;	
	private GridHeadConfig statementManageQueryHeadConfig;
	
	// 结算单表头查询(其他收入单)
	private int statementOtherManageQueryId = 8100005;	
	private GridHeadConfig statementOtherManageQueryHeadConfig;
	
	// 结算单明细临时信息查询
	private int statementAddDetailQueryId = 8100002;	
	private GridHeadConfig statementAddDetailHeadConfig;
	
	// 结算单修改时候信息查询(修改就使用新增的那套了, 是一致的)
//	private int statementEditDetailQueryId = 8100002;	
//	private GridHeadConfig statementEditDetailHeadConfig;
	
	// 结算单引入查询(从益华引入出口部的)
	private int statementEdPullQueryId = 8100004;
	private GridHeadConfig statementEdPullHeadConfig;
	
	// 结算单单记录查询
	private int statementOneQueryId = 8100003;
	
	public ReceivableStatementController() {
		statementManageQueryHeadConfig = new GridHeadConfig(statementManageQueryId,true,true,true,false);
		statementManageQueryHeadConfig.setOperatorWidth(140);
		
		statementOtherManageQueryHeadConfig = new GridHeadConfig(statementOtherManageQueryId,true,true,true,false);
		statementOtherManageQueryHeadConfig.setOperatorWidth(140);
		
		statementAddDetailHeadConfig = new GridHeadConfig(statementAddDetailQueryId,true,false,true,false);
		
//		statementEditDetailHeadConfig = new GridHeadConfig(statementEditDetailQueryId,true,false,true,false);
		
		statementEdPullHeadConfig = new GridHeadConfig(statementEdPullQueryId, true, true, false, false);
	}
	
	/**
	 * 进入应收结算单管理界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/statementManage")  // 这里不写method, 说明既可以post也可以get
	@OperationLogAnnotation(context="进入应收结算单管理界面")
    public ModelAndView statementManage(@RequestParam Map postData, HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/receivableStatement/statementManage");
        String rs_type = postData.get("rs_type").toString();
        
        if (rs_type.equals("0")) {
	        String tableHeader = this.getTableHeader(httpSession, statementManageQueryHeadConfig);
	        mv.addObject("tableHeader", tableHeader);
			mv.addObject("queryId", statementManageQueryId);
        } else if (rs_type.equals("1")) {
        	String tableHeader = this.getTableHeader(httpSession, statementOtherManageQueryHeadConfig);
	        mv.addObject("tableHeader", tableHeader);
			mv.addObject("queryId", statementOtherManageQueryId);
        }
		
        return mv;
    }
	
	/**
	 * 获得应收结算单数据
	 * 
	 * @return
	 */
	@RequestMapping(value="/getStatementList")
	@ResponseBody
	public Object getStatementList(@RequestBody Map postData, HttpSession httpSession) {
		// 获得权限代码参数
		AccessControlUtil.accessParams(postData, httpSession);
		
		String rs_type = postData.get("rs_type").toString();
		int queryId = statementManageQueryId;
		if (rs_type.equals("0")) {
			queryId = statementManageQueryId;
        } else if (rs_type.equals("1")) {
	        queryId = statementOtherManageQueryId;
        }
		
		return this.getTableDataList(postData, queryId);
	}
	
	/**
	 * 新增和修改返回操作
	 * 
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/returnStatement")
	@ResponseBody
    public Object returnStatement(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"guid"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_return");
		
		String statement_guid=(String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);	
		
		int code = baseService.doCallSp(postData, paramNames, null);		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		httpSession.setAttribute("statement_guid", "");
		return "{\"success\":true}";
    }
	
	/**
	 * 新增收款结算单页面
	 * 
	 * 
	 */
	@RequestMapping(value="/statementAdd",method=RequestMethod.GET)
    public ModelAndView statementAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/receivableStatement/statementAdd");
        
        String statement_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("statement_guid", statement_guid);
        
        String tableHeader = this.getTableHeader(httpSession,statementAddDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", statementAddDetailQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-新增结算单明细
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getStatmentAddItemList")
	@ResponseBody
	public Object getInvoiceAddItemList(@RequestBody Map postData,HttpSession httpSession){
		String statement_guid=(String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);
		return this.getTableDataList(postData,statementAddDetailQueryId);
	}
	
	/**
	 * 新增结算单财务分类页面
	 * 
	 * 
	 */
	@RequestMapping(value="/statementCwItemAdd",method=RequestMethod.GET)
    public ModelAndView statementCwItemAdd(HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/receivableStatement/statementCwItemAdd");
        return mv;
    }
	
	/**
	 * 新增明细分类
	 * 
	 * 
	 */
	@RequestMapping(value="/addStatementCwItem")
	@ResponseBody
    public Object addStatementCwItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        String statement_guid = (String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","rs_cw_type","c_real_money","total_money", "real_money"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_item_temp_new");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 修改结算单财务分类页面
	 * 
	 * 
	 */
	@RequestMapping(value="/statementCwItemEdit",method=RequestMethod.GET)
    public ModelAndView statementCwItemEdit(@RequestParam Map postData, HttpSession httpSession)throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        
        String statement_guid = (String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);
		
        Map<String, Object> oneQuery = baseService.getOneQuery(statementAddDetailQueryId, postData);		
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
		
        mv.setViewName("fc/receivableStatement/statementCwItemEdit");
        return mv;
    }
	
	/**
	 * 修改明细分类
	 * 
	 * 
	 */
	@RequestMapping(value="/editStatementCwItem")
	@ResponseBody
    public Object editStatementCwItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        String statement_guid = (String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid", "inc_no", "rs_cw_type","c_real_money","total_money", "real_money"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_item_temp_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 删除明细分类
	 * 
	 * 
	 */
	@RequestMapping(value="/deleteStatementCwItem")
	@ResponseBody
    public Object deleteStatementCwItem(@RequestParam Map postData,HttpSession httpSession)throws JsonProcessingException{
        String statement_guid = (String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);
		
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","inc_no"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_item_temp_delete");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 新增结算单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addStatement")
	@ResponseBody
    public Object addStatement(@RequestParam Map postData,HttpSession httpSession) {	
		String statement_guid = (String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","custom_f_id","custom_s_id","rs_type","currency","c_real_money","total_money","real_money","input_code","memo","org_code","unit_code"};
		// 出参, 有顺序
		String returnNames[] = {"rs_id"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_code", user.getAccount());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 删除结算单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteStatement")
	@ResponseBody
    public Object deleteStatement(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"rs_id"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_delete");
				
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
	@RequestMapping(value="/statementEdit",method=RequestMethod.GET)
    public ModelAndView statementEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(statementOneQueryId, postData);		
		//ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("fc/receivableStatement/statementEdit");
        
        String tableHeader = this.getTableHeader(httpSession,statementAddDetailHeadConfig);
		mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", statementAddDetailQueryId);
		
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"rs_id","guid"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_toUpdate");
		
		String statement_guid=GuidUtil.create32Guid();
        httpSession.setAttribute("statement_guid", statement_guid);
		postData.put("guid", statement_guid);
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
        return mv;
    }
	
	/**
	 * 修改结算单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editStatement")
	@ResponseBody
    public Object editStatement(@RequestParam Map postData,HttpSession httpSession) {	
		String statement_guid = (String)httpSession.getAttribute("statement_guid");
		postData.put("guid", statement_guid);
		// 入参, 注意按照顺序
		String paramNames[] = {"guid","rs_id","custom_f_id","custom_s_id","currency","c_real_money","total_money","real_money","memo", "unit_code"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 修改外销发票号操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editExportInvoiceNo")
	@ResponseBody
    public Object editExportInvoiceNo(@RequestParam Map postData,HttpSession httpSession) {	
		// 入参, 注意按照顺序
		String paramNames[] = {"rs_id","export_invoice_no"};
		// 加入sp的名称
		postData.put("spName", "fc_receivable_statement_export_invoice_no_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 记账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/accountStatement")
	@ResponseBody
    public Object accountStatement(@RequestParam Map postData,HttpServletRequest request,HttpSession httpSession){
		String[] rs_ids=request.getParameterValues("rs_ids");
		User user=(User)httpSession.getAttribute("user");
		postData.put("account_person", user.getAccount());
		
		if(rs_ids !=null && rs_ids.length>0){
			for(int i=0;i < rs_ids.length;i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"rs_id","account_person","account_month"};
				// 加入sp的名称
				postData.put("spName", "fc_receivable_statement_account");
				
				postData.put("rs_id", rs_ids[i]);
						
				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}
		return "{\"success\":true}";
    }
	
	/**
	 * 撤销记账操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteStatementAccount")
	@ResponseBody
    public Object deleteStatementAccount(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){		
		String[] rs_ids=request.getParameterValues("rs_ids");
		if(rs_ids !=null && rs_ids.length>0){
			for(int i=0; i < rs_ids.length; i++){
				// 入参, 注意按照顺序
				String paramNames[] = {"rs_id"};
				// 加入sp的名称
				postData.put("spName", "fc_receivable_statement_account_cancel");					
				
				postData.put("rs_id", rs_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入引入结算单界面-出口部的结算单引入
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/statementEdPull")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView statementEdPull(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fc/receivableStatement/statementEdPull");
        String tableHeader = this.getTableHeader(httpSession,statementEdPullHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", statementEdPullQueryId);
        return mv;
    }
	
	/**
	 * 获得明细处理数据-出口部的结算单
	 * 
	 * @return
	 */
	@RequestMapping(value="/getStatementEdPullList")
	@ResponseBody
	public Object getStatementEdPullList(@RequestBody Map postData){
		return this.getTableDataList(postData, statementEdPullQueryId);
	}
	
	/**
	 * 引入结算单--出口部的
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/importEdStatement")
	@ResponseBody
	public Object importEdStatement(@RequestBody List<Map<String,Object>> postData,HttpSession httpSession){
		//List<Map<String, Object>> item_list=(List<Map<String, Object>>) postData.get("item_ids_codes");
		User user = (User)httpSession.getAttribute("user");
//		Map<String,Object> bd_map = new HashMap<String, Object>();
		if(postData != null && postData.size()>0){
			for(Map<String,Object> item_map : postData){
				String paramNames[] = new String[]{"c_id", "source_no", "real_money", "total_money", "input_code", "sales_code", "op_code", "op_date", "memo"};
				// 出参, 有顺序
				String returnNames[] = {"rs_id"};
				// 加入sp的名称
				item_map.put("spName", "fc_receivable_ed_statement_pull");
				item_map.put("input_code", user.getAccount());  // 录入人为实际引入人
						
				int code = baseService.doCallSp(item_map, paramNames, returnNames);
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}		
		}				
		return "{\"success\":true}";
	}
	
	/**
	* 复制单据
	* 
	* param postData
	* return
	*/
	@RequestMapping(value="/copyReceivableStatement")
	@ResponseBody
	public Object copyReceivableStatement(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		String[] rs_ids = request.getParameterValues("rs_ids");
		if(rs_ids != null && rs_ids.length > 0){
			for(int i=0;i<rs_ids.length;i++){
//				System.out.println(rs_ids[i]);
				// 入参, 注意按照顺序
				String paramNames[] = new String[]{"input_code","rs_id"};
				// 加入sp的名称
				postData.put("spName", "fc_receivable_statement_copy");						
				
				postData.put("rs_id", rs_ids[i]);
				
				User user=(User)httpSession.getAttribute("user");
				postData.put("input_code", user.getAccount());

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}	
		
		return "{\"success\":true}";
	 }
}
