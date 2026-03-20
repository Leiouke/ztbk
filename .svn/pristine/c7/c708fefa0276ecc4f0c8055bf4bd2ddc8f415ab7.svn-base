package com.cnpiecsb.np.search.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.YhServiceController;
import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.cnpiecsb.csu.service.YhService;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 取消锁定界面
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/npSearch")
public class CancelLockController extends YhServiceController{
	
	private int cancelLockQueryId = 5890010;	
	private GridHeadConfig cancelLockHeadConfig;
	
	public CancelLockController(){
		cancelLockHeadConfig = new GridHeadConfig(cancelLockQueryId,true,false,false,false);
		//cancelLockHeadConfig.setOperatorWidth(80);
	}

	/**
	 * 进入取消锁定界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/cancelLockManage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView cancelLockSearchManage(HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        String tableHeader = this.getTableHeader(httpSession, cancelLockHeadConfig);
        mv.setViewName("np/search/cancelBdSearchManage");
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", cancelLockQueryId);
        return mv;
    }
	
	/**
	 * 获得取消锁定界面数据
	 * @return
	 */
	@RequestMapping(value="/getCancelLockQueryList")
	@ResponseBody
	public Object getCancelLockQueryList(@RequestBody Map postData) {
		if(postData.get("zd_id")!=null&&postData.get("zd_id")!=""){
			return this.getTableDataList(postData,cancelLockQueryId);
		}
		return null;
	}
	
	
	
	/**
	 * 取消锁定
	 * 
	 * @return
	 */
	@RequestMapping(value="/getLockCancel")
	@ResponseBody
	public Object getLockCancel(@RequestParam Map postData){
		
		// 加入sp的名称
		postData.put("spName", "UP_qk_flag_update");
						
		String paramNames[] = {"zd_id"};
						
		int code=yhService.doCallSp(postData, paramNames,null);
				
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		
		return "{\"success\":true}";
	}

}
