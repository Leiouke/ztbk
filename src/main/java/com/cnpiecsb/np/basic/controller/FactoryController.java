package com.cnpiecsb.np.basic.controller;

import java.util.HashMap;
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
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/basic")
public class FactoryController extends ZtbkServiceController {
	private int factorySearchQueryId = 5000002;  // 这个是自动完成框 唯一使用的queryid

	private int factoryQueryId = 5000006;
	private GridHeadConfig factoryGridHeadConfig;
	
	private int factoryOneQueryId = 5000007;
	
	private int bankQueryId = 5000008;	
	private GridHeadConfig bankGridHeadConfig;

	private int contactQueryId = 5000010;
	private GridHeadConfig contactGridHeadConfig;
	
	private int factoryAuditQueryId = 5000011;
	private GridHeadConfig factoryAuditGridHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public FactoryController(){
		factoryGridHeadConfig = new GridHeadConfig(factoryQueryId,true,false,true,false);
		factoryGridHeadConfig.setOperatorWidth(100);
		
		bankGridHeadConfig = new GridHeadConfig(bankQueryId,true,false,true,false);
		contactGridHeadConfig = new GridHeadConfig(contactQueryId,true,false,true,false);
		contactGridHeadConfig.setOperatorWidth(120);
		
		factoryAuditGridHeadConfig = new GridHeadConfig(factoryAuditQueryId,true,false,true,false);
		factoryAuditGridHeadConfig.setOperatorWidth(150);
	}
	
	/**
	 * 获得动态列表数据-货源-搜索自动补全 选取供应商和集货商
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getAllFactoryListSearch")
	@ResponseBody
	public Object getAllFactoryListSearch(String keyword,String f_type,String is_need_against){
		Map<String,Object> postData=new HashMap<>();
		postData.put("keyword", keyword);
		if(f_type!=null){
			postData.put("f_type", f_type);
		}
		if(is_need_against!=null){
			postData.put("is_need_against", is_need_against);
		}
		return this.getTableDataList(postData, factorySearchQueryId);
	}
	
	/**
	 * 获得动态列表数据-货源-搜索自动补全 只选取供应商
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryListSearch")
	@ResponseBody
	public Object getFactoryListSearch(String keyword,String f_type){
		Map<String,Object> postData=new HashMap<>();
		postData.put("keyword", keyword);
		postData.put("fc_id", "0001");
		if(f_type!=null){
			postData.put("f_type", f_type);
		}
		return this.getTableDataList(postData, factorySearchQueryId);
	}
	
	/**
	 * 获得动态列表数据-集货商-搜索自动补全
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getSFactoryListSearch")
	@ResponseBody
	public Object getSFactoryListSearch(String keyword){
		Map<String,Object> postData=new HashMap<>();
		postData.put("keyword", keyword);
		postData.put("fc_id", "0002");
		return this.getTableDataList(postData, factorySearchQueryId);
	}
	
	/**
	 * 进入货源管理界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/factoryManage",method=RequestMethod.GET)
    public ModelAndView factoryManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/basic/factoryManage");
        String tableHeader = this.getTableHeader(httpSession,factoryGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);		
		mv.addObject("queryId", factoryQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-货源
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryList")
	@ResponseBody
	public Object getFactoryList(@RequestBody Map postData){
		return this.getTableDataList(postData,factoryQueryId);
	}
	
	/**
	 * 新增页面
	 * 
	 * 
	 */
	@RequestMapping(value="/factoryAdd",method=RequestMethod.GET)
    public ModelAndView factoryAdd(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/basic/factoryAdd");
        return mv;
    }
	
	/**
	 * 新增操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/addFactory")
	@ResponseBody
    public Object addFactory(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"fc_id","f_country","f_department","f_department_simple",
				"f_account_id","limit_money","limit_day","f_discount","f_charge_man","back_limit_date",
				"o_id_input","o_id_lastmodify","f_level","f_website","f_mem","f_type",
				"f_id_belong","f_sxxe","f_myaccount","f_account","edi", "is_need_against"};
		// 出参, 有顺序
		String returnNames[] = {"f_id"};
		// 加入sp的名称
		postData.put("spName", "u_basic_factory_new");
		User user=(User)httpSession.getAttribute("user");		
		postData.put("o_id_input", user.getAccount());
		postData.put("o_id_lastmodify", user.getAccount());
		int code = baseService.doCallSp(postData, paramNames, returnNames);

		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
    }
	
	/**
	 * 修改页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/factoryEdit",method=RequestMethod.GET)
    public ModelAndView factoryEdit(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        
        // 单记录查询
		Map<String, Object> oneQuery = baseService.getOneQuery(factoryOneQueryId, postData);
		
		ObjectMapper mapper = new ObjectMapper();
		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
        mv.setViewName("np/basic/factoryEdit");
        
        //货源联系人
        String tableHeader_contact = this.getTableHeader(httpSession,contactGridHeadConfig);
  		mv.addObject("tableHeader_contact", tableHeader_contact);		
   		mv.addObject("queryId_contact", contactQueryId);        
        //银行账户
        String tableHeader_bank = this.getTableHeader(httpSession,bankGridHeadConfig);
  		mv.addObject("tableHeader_bank", tableHeader_bank);		
   		mv.addObject("queryId_bank", bankQueryId);
        return mv;
    }
	/**
	 * 修改操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/editFactory")
	@ResponseBody
    public Object editFactory(@RequestParam Map postData,HttpSession httpSession){
		// 入参
		String paramNames[] = {"f_id","fc_id","f_country","f_department","f_department_simple",
				"f_account_id","limit_money","limit_day","f_discount","f_charge_man","back_limit_date",
				"o_id_lastmodify","f_level","f_website","f_mem","f_type","f_id_belong","f_sxxe",
				"f_myaccount","f_account","edi", "is_need_against"};
		// 加入sp的名称
		postData.put("spName", "u_basic_factory_update");		
		User user=(User)httpSession.getAttribute("user");
		postData.put("o_id_lastmodify", user.getAccount());
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
	@RequestMapping(value="/deleteFactory")
	@ResponseBody
    public Object deleteFactory(@RequestParam Map postData,HttpSession httpSession,HttpServletRequest request){
		String[] f_ids=request.getParameterValues("f_ids");
		User user=(User)httpSession.getAttribute("user");	
		postData.put("delete_person", user.getAccount());
		if(f_ids!=null&&f_ids.length>0){
			for(int i=0;i<f_ids.length;i++){
				// 入参
				String paramNames[] = {"f_id","delete_person"};
				// 加入sp的名称
				postData.put("spName", "u_basic_factory_delete");				
				
				postData.put("f_id", f_ids[i]);

				int code = baseService.doCallSp(postData, paramNames, null);
						
				if (code != 0) {
					return this.getAjaxResult(code);
				}
			}
		}		
		return "{\"success\":true}";
    }
	
	/**
	 * 进入货源审核界面
	 * 
	 * @param httpSession
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/factoryAuditManage",method=RequestMethod.GET)
    public ModelAndView factoryAuditManage(HttpSession httpSession)throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/basic/factoryAuditManage");
        String tableHeader = this.getTableHeader(httpSession,factoryAuditGridHeadConfig);
		mv.addObject("tableHeader", tableHeader);		
		mv.addObject("queryId", factoryAuditQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-货源审核
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getFactoryAuditList")
	@ResponseBody
	public Object getFactoryAuditList(@RequestBody Map postData){
		return this.getTableDataList(postData, factoryAuditQueryId);
	}
	
	/**
	 * 一级审核操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/firstAuditFactory")
	@ResponseBody
    public Object firstAuditFactory(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"f_id","o_id_first_auditor","audit_memo"};

		// 加入sp的名称
		postData.put("spName", "u_basic_factory_first_audit");
		User user=(User)httpSession.getAttribute("user");		
		postData.put("o_id_first_auditor", user.getAccount());
		int code = baseService.doCallSp(postData, paramNames, null);

		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
    }
	
	/**
	 * 二级审核操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/secondAuditFactory")
	@ResponseBody
    public Object secondAuditFactory(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"f_id","o_id_second_auditor","audit_memo"};

		// 加入sp的名称
		postData.put("spName", "u_basic_factory_second_audit");
		User user=(User)httpSession.getAttribute("user");		
		postData.put("o_id_second_auditor", user.getAccount());
		int code = baseService.doCallSp(postData, paramNames, null);

		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
    }
	
	/**
	 * 审核退回操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/auditBackFactory")
	@ResponseBody
    public Object auditBackFactory(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"f_id","audit_memo"};

		// 加入sp的名称
		postData.put("spName", "u_basic_factory_audit_return");
		int code = baseService.doCallSp(postData, paramNames, null);

		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
    }
	
	/**
	 * 提交审核操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/commitFactory")
	@ResponseBody
    public Object commitFactory(@RequestParam Map postData,HttpSession httpSession){
		// 入参, 注意按照顺序
		String paramNames[] = {"f_id"};

		// 加入sp的名称
		postData.put("spName", "u_basic_factory_commit");
		int code = baseService.doCallSp(postData, paramNames, null);

		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
    }
}
