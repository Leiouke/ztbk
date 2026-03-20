package com.cnpiecsb.system.entity;

/**
 * 字典项
 * 
 * @author user
 *
 */
public class Dictionary {
	private int id;
	
	// 代码
	private String code;
	
	// 名称
	private String name;
	
	// 排序号
	private int sortNo;
	
	// 是否启用
	private boolean status;
	
	// 备注
	private String remark;
	
	// 所属目录
	private int directoryId;
	
	// 目录代码
	private String d_code;

	public String getD_code() {
		return d_code;
	}

	public void setD_code(String d_code) {
		this.d_code = d_code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getDirectoryId() {
		return directoryId;
	}

	public void setDirectoryId(int directoryId) {
		this.directoryId = directoryId;
	}
}
