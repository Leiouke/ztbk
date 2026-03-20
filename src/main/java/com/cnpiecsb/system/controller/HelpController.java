package com.cnpiecsb.system.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.util.JsonUtil;
import com.cnpiecsb.csu.controller.BaseServiceController;
import com.cnpiecsb.csu.controller.ZtbkServiceController;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 帮助信息管理
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/system")
public class HelpController extends ZtbkServiceController {
	// 系统帮助单查
	private int systemHelpOneQueryId = 1040001;	
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public HelpController(){
//		userRoleManageHeadConfig = new GridHeadConfig(userRoleManageQueryId,true,false,true,false);
	}
	
	@RequestMapping(value="/helpUpdate",method=RequestMethod.GET)
    public ModelAndView helpUpdate(@RequestParam Map postData) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        
        // 单记录查询
 		Map<String, Object> oneQuery = baseService.getOneQuery(systemHelpOneQueryId, postData);
 		mv.addObject("oneJson", JsonUtil.mapToString(oneQuery));
 		
        mv.setViewName("include/helpUpdate");
        return mv;
    }
	
	@RequestMapping(value="/updateHelp")
	@ResponseBody
    public Object updateHelp(@RequestParam Map postData) {
		// 入参, 注意按照顺序
		String paramNames[] = {"jsp_address","help_content"};
		// 加入sp的名称
		postData.put("spName", "u_system_help_content_update");
		
		int code = baseService.doCallSp(postData, paramNames, null);
		
		if (code != 0) {
			return this.getAjaxResult(code);
		}
		return "{\"success\":true}";
    }
}
