package com.cnpiecsb.np.basic.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cnpiecsb.csu.controller.ZtbkServiceController;

/**
 * 代销财务分类映射关系相关控制器
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/npBasic")
public class AgencyCwtypeMappingController extends ZtbkServiceController {
	private int agencyCwtypeQueryId = 5110016;	
	
	/**
	 * 代销财务分类查询, 可按业务类型查询
	 * 
	 * @param postData
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/getAgencyCwtypeList")
	@ResponseBody
	public Object getAgencyCwtypeList(@RequestParam Map postData, HttpSession httpSession){
		return this.getTableDataList(postData, agencyCwtypeQueryId);
	}
}
