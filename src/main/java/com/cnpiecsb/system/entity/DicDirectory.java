package com.cnpiecsb.system.entity;

/**
 * 字典目录
 * 
 * @author user
 *
 */
public class DicDirectory {
	private int id;
	
	// 类目编码
	private String code;
	
	// 类目名称
	private String name;

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
}
