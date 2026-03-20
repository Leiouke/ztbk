package com.cnpiecsb.np.backIssue.viewobject;

import com.cnpiecsb.common.viewobject.AjaxResult;

/**
 * 过刊验货返回结果
 * 
 * @author user
 *
 */
public class BackIssueVerifyResult extends AjaxResult {
	private String result;  // 返回结果
	
	private String qk_id;  // 内码
	
	private String period_name; // 期次
	
	private String rack_no;  // 架号

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getQk_id() {
		return qk_id;
	}

	public void setQk_id(String qk_id) {
		this.qk_id = qk_id;
	}

	public String getPeriod_name() {
		return period_name;
	}

	public void setPeriod_name(String period_name) {
		this.period_name = period_name;
	}

	public String getRack_no() {
		return rack_no;
	}

	public void setRack_no(String rack_no) {
		this.rack_no = rack_no;
	}
}
