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
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 结算单比对界面(与益华对接部分)
 * 
 * @author zc 2022/02/25
 *
 */
@Controller
@RequestMapping("/npSearch")
public class StatementComparisonController2 extends YhServiceController{
	
	private int yhStatementDetailQueryId = 8900002;	
	private GridHeadConfig yhStatementDetailHeadConfig;
	
	public StatementComparisonController2(){
		yhStatementDetailHeadConfig = new GridHeadConfig(yhStatementDetailQueryId,true,false,false,false);
	}
	
	/**
	 * 益华结算单明细数据页面
	 * 
	 * @return
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value="/toSourceDeatilPage")  // 这里不写method, 说明既可以post也可以get
    public ModelAndView toSourceDeatilPage(@RequestParam Map postData,HttpSession httpSession) throws JsonProcessingException{
        ModelAndView mv = new ModelAndView();
        String tableHeader = this.getTableHeader(httpSession, yhStatementDetailHeadConfig);
        mv.setViewName("np/search/sourceDeatilManage");
        mv.addObject("tableHeader", tableHeader);
        mv.addObject("queryId", yhStatementDetailQueryId);
        mv.addObject("source_no", postData.get("source_no"));
        return mv;
    }
	
	/**
	 * 获得益华结算单明细数据页面数据
	 * @return
	 */
	@RequestMapping(value="/getSourceDeatilPageList")
	@ResponseBody
	public Object getSourceDeatilPageList(@RequestBody Map postData) {
		return this.getTableDataList(postData,yhStatementDetailQueryId);
	}

}
