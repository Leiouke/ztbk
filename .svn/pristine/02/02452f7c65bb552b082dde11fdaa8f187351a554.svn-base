package com.cnpiecsb.np.other.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.controller.YhServiceController;
import com.cnpiecsb.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 代销结存相关界面和操作-- 对益华功能的补充
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/npOther")
public class AgencyBalanceController extends YhServiceController {
	/**
	 * 进入代销结存操作界面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/agencyBalanceOperate")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView agencyBalanceOperate() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("np/other/agencyBalanceOperate");
        return mv;
    }
	
	/**
	 * 代销结存生成
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/createAgencyBalanceOperate")
	@ResponseBody
	public Object createAgencyBalanceOperate(@RequestParam Map postData,HttpSession httpSession){
		User user = (User)httpSession.getAttribute("user");
		String paramNames[] = new String[]{"start_date", "end_date", "c_id", "cur_station", "o_id_input", 
				"months"};
		// 加入sp的名称
		postData.put("spName", "Up_CreateMonthArrear_assist");
		postData.put("cur_station", "ZT51");
		postData.put("o_id_input", user.getYhUserId());
		postData.put("end_date", postData.get("end_date").toString() + " 23:59:59");
		postData.put("months", postData.get("account_month_all").toString().replaceAll("\\.", "-"));
				
		int code = yhService.doCallSp(postData, paramNames, null);
		if (code != 0) {
			return this.getAjaxResult(code);
		}					
		return "{\"success\":true}";
	}
}
