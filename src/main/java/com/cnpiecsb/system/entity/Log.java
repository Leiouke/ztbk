package com.cnpiecsb.system.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Log {
//	private int id;
	
	private String userAccount;
	
	private String context;
	
	private Date logTime;

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")  //转化为json字符串的日期格式
	public Date getLogTime() {
		return logTime;
	}

	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
	
//	public int getId() {
//		return id;
//	}
//	
//	public void setId(int id) {
//		this.id = id;
//	}
}
