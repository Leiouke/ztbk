package com.cnpiecsb.np.expandmanage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 杂志补刊处理控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/np/dxOrder")
public class DxOrderController extends ZtbkServiceController{
	
	//期刊商品实例查询
	//private int periodicalItemSearchManageQueryId = 5110057;	
	private int periodicalItemSearchManageQueryId = 5110072;	
	private GridHeadConfig periodicalItemSearchManageQueryHeadConfig;
	
	// 代销订单查询
	private int dxOrderSearchManageQueryId = 5110059;	
	private GridHeadConfig dxOrderSearchManageQueryHeadConfig;
	
	
	
	public DxOrderController(){
		periodicalItemSearchManageQueryHeadConfig = new GridHeadConfig(periodicalItemSearchManageQueryId,true,false,true,false);
		
		dxOrderSearchManageQueryHeadConfig = new GridHeadConfig(dxOrderSearchManageQueryId,true,false,true,false);
		dxOrderSearchManageQueryHeadConfig.setOperatorWidth(80);
	}
	
	/**
	 * 代销订单处理界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/dxOrderManage", method=RequestMethod.GET)
    public ModelAndView dxOrderManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/dxOrder/dxOrderManage");
        String tableHeader = this.getTableHeader(httpSession,dxOrderSearchManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", dxOrderSearchManageQueryId);
        return mv;
    }
	
	/**
	 * 获得代销订单处理数据
	 * 
	 * param postData
	 * return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/getDxOrderList")
	@ResponseBody
	public Object getDxOrderList(@RequestBody Map postData) throws ParseException{
		Object a = postData.get("input_time_start");
		Object b =postData.get("input_time_end");
		if(a.equals(b)&&!b.equals("")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date=sdf.parse((String)b);
			long time = date.getTime()+1000*3600*24;
			
			postData.put("input_time_end", sdf.format(time));
		}
		return this.getTableDataList(postData,dxOrderSearchManageQueryId);
	}
	
	
	
	/**
	 * 新增代销订单处理查询界面
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/toAddDxOrderManage", method=RequestMethod.GET)
    public ModelAndView toAddDxOrderManage(HttpSession httpSession) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/dxOrder/addDxOrderManage");
        String tableHeader = this.getTableHeader(httpSession,periodicalItemSearchManageQueryHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", periodicalItemSearchManageQueryId);
        return mv;
    }
	
	/**
	 * 获得杂期刊商品实例数据
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getDxOrderItemList")
	@ResponseBody
	public Object getDxOrderItemList(@RequestBody Map postData){
		if(postData == null||postData.isEmpty()){
			return null;
		}
		return this.getTableDataList(postData,periodicalItemSearchManageQueryId);
	}
	
	/**
	 * 进入代销订单填写页面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/toAddDxOrderDetailManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView toAddDxOrderDetailManage(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
		String mail_code = (String)postData.get("mail_code");
		String instance_tm = (String)postData.get("instance_tm");
		String qk_id = (String)postData.get("qk_id");
		String qk_name = (String)postData.get("qk_name");
		String period_name = (String)postData.get("period_name");
		String f_id = (String)postData.get("f_id");
		if(f_id.equals("undefined")){
			f_id = "";
		}
		String f_department = (String)postData.get("f_department");
		if(f_department.equals("undefined")){
			f_department = "";
		}
		mv.addObject("mail_code", mail_code);
		mv.addObject("instance_tm", instance_tm);
		mv.addObject("qk_id", qk_id);
		mv.addObject("qk_name", qk_name);
		mv.addObject("period_name", period_name);
		mv.addObject("f_id", f_id);
		mv.addObject("f_department", f_department);
        mv.setViewName("np/dxOrder/addDxOrderItemyManage");
        return mv;
    }
	
	/**
	 * 新增代销订单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/saveDxOrder")
	@ResponseBody
    public Object saveDxOrder(@RequestParam Map postData,HttpSession httpSession) {	
		
		// 入参, 注意按照顺序
		String paramNames[] = {"qk_id", "qk_name","mail_code","period_name","h_amount","customer","input_man","input_man_name","f_id","f_department"};

		// 出参, 有顺序
		String returnNames[] = {"order_id"};
				
		// 加入sp的名称
		postData.put("spName", "u_np_qk_dx_order_new");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_man", user.getAccount());
		postData.put("input_man_name", user.getUserName());
		
		int code = baseService.doCallSp(postData, paramNames, returnNames);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		// 以下获得出参值
		return "{\"success\":true}";
    }
	
	/**
	 * 删除代销订单
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/deleteDxOrder")
	@ResponseBody
    public Object deleteInstanceSupply(@RequestParam Map postData,HttpSession httpSession){
		
		// 入参, 注意按照顺序
		String paramNames[] = new String[]{"order_id", "input_man"};
		// 加入sp的名称
		postData.put("spName", "u_np_qk_dx_order_del");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("input_man", user.getAccount());
				
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
    }
	
	/**
	 * 处理代销订单页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toDealDxOrderManage",method=RequestMethod.GET)
    public ModelAndView toDealDxOrderManage(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        	
		mv.addObject("order_id", (String)postData.get("order_id"));
        mv.setViewName("np/dxOrder/dealDxOrderManage");
        return mv;
    }
	
	/**
	 * 处理代销订单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/dealDxOrder")
	@ResponseBody
    public Object dealDxOrder(@RequestParam Map postData,HttpSession httpSession) {	
		
		// 入参, 注意按照顺序
		String paramNames[] = {"order_id","p_result","p_man_name","p_man","p_time"};
		// 加入sp的名称
		postData.put("spName", "u_np_qk_dx_order_update");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("p_man", user.getAccount());
		postData.put("p_man_name", user.getUserName());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}

		return "{\"success\":true}";
    }
	
	/**
	 * 代销订单分发页面
	 * @throws JsonProcessingException 
	 * 
	 * 
	 */
	@RequestMapping(value="/toUpdateDStatusManage",method=RequestMethod.GET)
    public ModelAndView toUpdateDStatusManage(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{  // 注意这个postData里面已经包含了id的字段值
        ModelAndView mv = new ModelAndView();        	
		mv.addObject("order_id", (String)postData.get("order_id"));
        mv.setViewName("np/dxOrder/updateDStatusDxOrderManage");
        return mv;
    }
	
	/**
	 * 分发代销订单操作
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/updateDStatus")
	@ResponseBody
	public Object updateDStatus(@RequestParam Map postData,HttpSession httpSession) {	
		
		// 入参, 注意按照顺序
		String paramNames[] = {"order_id","d_status","d_man_name","d_man","d_time"};
		// 加入sp的名称
		postData.put("spName", "u_np_qk_dx_order_d_update");
		
		User user=(User)httpSession.getAttribute("user");
		postData.put("d_man", user.getAccount());
		postData.put("d_man_name", user.getUserName());
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}

}
