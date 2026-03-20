package com.cnpiecsb.onInterface.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cnpiecsb.onInterface.util.signUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class PutNpFhfhService extends signUtil{
	
	//付款表头
	private int getNpFhfhHeadQuery = 5600011; 
	
	//付款明细
	private int getNpFhfhDeatilQuery = 5600012;
	
	public String putPaymentApplication(String token ,String bill_code){
		ObjectMapper mapper = new ObjectMapper();
		
		//测试库地址
//		String url ="http://192.168.0.196/seeyon/rest/bpm/process/start";
		//正是库地址
		String url = "https://oa.cnpiecsb.com/seeyon/rest/bpm/process/start";//正式库
		
		Map<String,Object> searchMap = new HashMap<String,Object>();//请求数据
		
		Map<String,Object> searchMapData = new HashMap<String,Object>();//请求数据data
		
		Map<String,Object> searchMapDataSecond = new HashMap<String,Object>();//data中的data
		
		Map<String,Object> searchMainData = new HashMap<String,Object>();//data中data的主表
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();//data中data的明细表list
		
		List<Map<String,Object>> attend_list = new ArrayList<Map<String,Object>>();//data中data的附件list
		
		Map<String,Object> file_map = new HashMap<String,Object>();//附件map 
		
		try {
			//放入查询语句
			Map<String,Object> postData = new HashMap<String,Object>();//请求数据
			postData.put("bill_code", bill_code);
			postData.put("queryId", getNpFhfhHeadQuery);
			
			//查询主表
			List<Map<String,Object>> list_main = this.getDataListByQueryId(postData);
			
			//放入主表
			searchMainData.put("单据编号",list_main.get(0).get("oa_fh_id")); //单号
			searchMainData.put("管理系统唯一ID",list_main.get(0).get("oa_fh_id")); //单号
			searchMainData.put("发起人",list_main.get(0).get("oa_account")); //人员ID
			searchMainData.put("申请日期",list_main.get(0).get("input_time")); //申请日期
			searchMainData.put("考核单位",list_main.get(0).get("unit_name")); //考核单位
			searchMainData.put("公司抬头",list_main.get(0).get("pay_title")); //公司抬头
			searchMainData.put("开户行账号",list_main.get(0).get("bank_account")); //开户行账号
			searchMainData.put("申请付款金额",list_main.get(0).get("fh_money")); //申请付款金额
			searchMainData.put("备注",list_main.get(0).get("memo")); //备注
			searchMainData.put("货源名称",list_main.get(0).get("f_department")); //货源名称f_department
			searchMainData.put("货源编码",list_main.get(0).get("f_id")); //货源编码
			searchMainData.put("付款申请去向",list_main.get(0).get("application_target_1")); //付款申请去向 0 内部转账 1 国内付款 2 国外付款
			searchMainData.put("外币币种",list_main.get(0).get("currency_code_5")); //外币币种
			searchMainData.put("外销发票号",list_main.get(0).get("export_invoice_no")); //外销发票号
			searchMainData.put("开户行名称",list_main.get(0).get("f_bank")); //开户行名称
			searchMainData.put("收方户名",list_main.get(0).get("f_companyName")); //
			searchMainData.put("实际付款金额",""); //实际付款金额
			searchMainData.put("实际付款金额大写",""); //实际付款金额大写
			//searchMainData.put("折合人民币金额",list_main.get(0).get("fh_money")); //折合人民币金额
			searchMainData.put("折合人民币金额",""); //折合人民币金额
			searchMainData.put("支款方式",list_main.get(0).get("pay_way_2")); //支款方式
			searchMainData.put("付款类型",list_main.get(0).get("payment_type_6")); //付款类型
			searchMainData.put("是否境外付款",list_main.get(0).get("oversea_pay_3")); //是否境内付款 
			searchMainData.put("税金分类",list_main.get(0).get("tax_type_7")); //税金分类财务编码
			searchMainData.put("财务编码",list_main.get(0).get("f_account_id")); //财务编码
			
			postData.put("queryId", getNpFhfhDeatilQuery);
			
			//查询明细
			List<Map<String,Object>> list_detail = this.getDataListByQueryId(postData);
				
			for(Map<String,Object> map :list_detail){
				Map<String,Object> searchDetailData = new HashMap<String,Object>();//data中data的明细表
				//明细表list
				searchDetailData.put("费用日期", String.valueOf(list_main.get(0).get("input_time")));//费用日期(申请日期和申汇到一致)
				searchDetailData.put("发票类型-个人",String.valueOf(map.get("oa_invoice_type")));//发票类型 
				searchDetailData.put("发票内容", String.valueOf(map.get("memo")));//发票内容
				searchDetailData.put("销方单位抬头",String.valueOf(map.get("f_department")));//销方单位抬头
				searchDetailData.put("销方税号", String.valueOf(map.get("f_account_id")));//销方税号
				searchDetailData.put("发票号码", String.valueOf(map.get("inv_no")));//发票号码
				searchDetailData.put("发票金额", String.valueOf(map.get("real_money")));//发票金额
				searchDetailData.put("付款金额", String.valueOf(map.get("real_money")));//付款金额（加）
				searchDetailData.put("发票数", String.valueOf(map.get("inv_count")));//发票数
				//searchDetailData.put("税率", "1.00");//税率
				searchDetailData.put("可抵扣进项", "0.00");//可抵扣进项
				searchDetailData.put("费用科目", String.valueOf(map.get("subject_name")));//费用科目
				searchDetailData.put("付款类别", String.valueOf(map.get("classify_name")));//付款类别
				searchDetailData.put("报销金额", String.valueOf(map.get("c_real_money")));//报销金额
				searchDetailData.put("购买方抬头", "中国图书进出口上海有限公司");//购方抬头
				searchDetailData.put("公司抬头校验", "中国图书进出口上海有限公司");//公司抬头校验
				searchDetailData.put("摘要", String.valueOf(map.get("memo")));//摘要
				searchDetailData.put("科目号码", String.valueOf(map.get("subject_code")));//科目号码
				searchDetailData.put("付款内容",String.valueOf(map.get("memo")));//付款内容
				//拼接data
				list.add(searchDetailData);
			}
			
			//list.add(searchDetailData);
			//searchMapDataSecond.put("formmain_0274", searchMainData);//测试
			searchMapDataSecond.put("formmain_0225", searchMainData);//正式
			//searchMapDataSecond.put("formson_0307", list);//测试
			searchMapDataSecond.put("formson_0226", list);//正式
			searchMapDataSecond.put("thirdAttachments", attend_list);
			
			//拼接data的data
			searchMapData.put("data", searchMapDataSecond);
			searchMapData.put("templateCode", "KKpayment");
			searchMapData.put("draft", "1");
			//searchMapData.put("relateDoc", "");
			if(String.valueOf(list_main.get(0).get("fhsh_family")).equals("1")){//1为代理申汇单
				searchMapData.put("subject", "报刊代理申汇单:"+list_main.get(0).get("fh_id")+","+list_main.get(0).get("userName")+","+list_main.get(0).get("input_time")+"，金额："+list_main.get(0).get("fh_money"));
			}else{
				searchMapData.put("subject", "报刊申汇单:"+list_main.get(0).get("fh_id")+","+list_main.get(0).get("userName")+","+list_main.get(0).get("input_time")+"，金额："+list_main.get(0).get("fh_money"));
			}
			
			
			//拼接外面
			searchMap.put("appName", "collaboration");
			searchMap.put("data", searchMapData);
			
			
			
			String requestData = mapper.writeValueAsString(searchMap);
			
			System.out.println("map="+requestData);
			
			String result=sendPostToken(url, requestData,token);
			
			Map<String,Object> map = mapper.readValue(result, Map.class); //获得接口的结果
			
			if(map.containsKey("code")&&map.get("code").equals(0)){//0代表成功
				oaLogInsert("推送付报刊申汇付汇到OA",0,"推送成功",bill_code);
				return "1";
			}else{
				oaLogInsert("推送付报刊申汇付汇到OA",Integer.parseInt(String.valueOf(map.get("code"))),String.valueOf(map.get("message")),bill_code);
				return "0";
			}
			
		} catch (Exception e) {
			oaLogInsert("推送付款申请到OA",500,e.getMessage(),bill_code);
			return "0";
		}
		
		
	}
	
	//记录oa接口日志
	public void oaLogInsert(String method,int code,Object msg,String related_id){
		Map<String,Object> postData = new HashMap<String,Object>();
					
		postData.put("method", method);
		postData.put("code", code);
		postData.put("msg", msg);
		postData.put("related_id",related_id);
					
					
		// 入参, 注意按照顺序
		String paramNames[] = {"method",
					      "code",
					       "msg",
					       "related_id"};

		// 加入sp的名称
		postData.put("spName", "u_oa_log_insert");//sp名称 
						
		int return_code = baseService.doCallSp(postData, paramNames, null);			
	}
	
	//测试方法
	public static void main(String[] args) throws JsonProcessingException, InterruptedException, ParseException,IOException {
		// 以下代码可以脱离web容器
		GenericXmlApplicationContext context = new GenericXmlApplicationContext();
		context.setValidating(false);  
		context.load("classpath*:spring-*.xml");  
		context.refresh(); 
						
		PutNpFhfhService testService = (PutNpFhfhService) context.getBean("putNpFhfhService");		
						
		try {
					
			testService.putPaymentApplication("c92e5f1e-c166-44a5-baa3-8fddb1f2fba5","FH00000951");	
		} catch (Exception e) {
					// TODO Auto-generated catch block
			e.printStackTrace();
		}
						
		System.out.println("hello");
	}
}
