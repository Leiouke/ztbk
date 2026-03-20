package com.cnpiecsb.csu.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.csu.entity.viewobject.GridHeadConfig;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 业务controller的sample类
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/csu")
public class SampleBaseController extends BaseServiceController{
	
	private int userListQueryId = 1000006;
	
	private GridHeadConfig userListHeadConfig;
	
	/**
	 * 初始化工作, 修改内容后需要重新启动服务生效
	 * 
	 */
	public SampleBaseController(){
		userListHeadConfig = new GridHeadConfig(userListQueryId,true,true,false,false);
	}
	
	/**
	 * 进入人员列表界面
	 * 
	 * @return
	 */
	@RequestMapping(value="/userList") 
    public ModelAndView userList(HttpSession httpSession)throws JsonProcessingException{
		ModelAndView mv = new ModelAndView();
        mv.setViewName("csu/userList");
        String tableHeader = this.getTableHeader(httpSession,userListHeadConfig);
        mv.addObject("tableHeader", tableHeader);
		mv.addObject("queryId", userListQueryId);
        return mv;
    }
	
	/**
	 * 获得动态列表数据-考勤方案列表
	 * 
	 * param postData
	 * return
	 */
	@RequestMapping(value="/getUserList")
	@ResponseBody
	public Object getUserList(@RequestBody Map postData){
		return this.getTableDataList(postData,userListQueryId);
	}
}
