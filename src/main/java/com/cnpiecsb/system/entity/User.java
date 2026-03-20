package com.cnpiecsb.system.entity;

import java.util.Date;

public class User {
	private int id;
	
	private String account;
	
	private String password;
	
	private String password_modify_time;
	
	private String userName;
	
	private String mobile;
	
	private String email;
	
	private Date registerDate;
	
	private Date modifyDate;
	
	private boolean status; // 0--有效  1--无效
	
	private String remark;
	
	private Date loginDate;
	
	private Date logoutDate;
	
	private boolean isManager;
	
	// 头像url
	private String portrait;
	
	private int roleId;  // 角色id
	
	private String roleName;  // 角色名称
	
	// 工号
	private String job_no;
	
	// 岗位名称
	private String postName;
	
	// 部门编号
	private String dep_org_code;
	
	// 科室编号
	private String office_org_code;
	
	// 班组编号
	private String group_org_code;
	
	// 部门名称
	private String dep_org_code_name;
	
	// 科室名称
	private String office_org_code_name;
	
	// 班组名称
	private String group_org_code_name;
	
	// 是否默认
	private boolean is_default;
	
	// 益华账号
	private String yhUserId;
	
	// 审批角色名称
	private String approve_role_name;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public Date getLogoutDate() {
		return logoutDate;
	}

	public void setLogoutDate(Date logoutDate) {
		this.logoutDate = logoutDate;
	}

	public boolean isManager() {
		return isManager;
	}

	public void setManager(boolean isManager) {
		this.isManager = isManager;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getPortrait() {
		return portrait;
	}

	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJob_no() {
		return job_no;
	}

	public void setJob_no(String job_no) {
		this.job_no = job_no;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getDep_org_code() {
		return dep_org_code;
	}

	public void setDep_org_code(String dep_org_code) {
		this.dep_org_code = dep_org_code;
	}

	public String getOffice_org_code() {
		return office_org_code;
	}

	public void setOffice_org_code(String office_org_code) {
		this.office_org_code = office_org_code;
	}

	public String getGroup_org_code() {
		return group_org_code;
	}

	public void setGroup_org_code(String group_org_code) {
		this.group_org_code = group_org_code;
	}

	public String getDep_org_code_name() {
		return dep_org_code_name;
	}

	public void setDep_org_code_name(String dep_org_code_name) {
		this.dep_org_code_name = dep_org_code_name;
	}

	public String getOffice_org_code_name() {
		return office_org_code_name;
	}

	public void setOffice_org_code_name(String office_org_code_name) {
		this.office_org_code_name = office_org_code_name;
	}

	public boolean isIs_default() {
		return is_default;
	}

	public void setIs_default(boolean is_default) {
		this.is_default = is_default;
	}

	public String getPassword_modify_time() {
		return password_modify_time;
	}

	public void setPassword_modify_time(String password_modify_time) {
		this.password_modify_time = password_modify_time;
	}

	public String getYhUserId() {
		return yhUserId;
	}

	public void setYhUserId(String yhUserId) {
		this.yhUserId = yhUserId;
	}

	public String getGroup_org_code_name() {
		return group_org_code_name;
	}

	public void setGroup_org_code_name(String group_org_code_name) {
		this.group_org_code_name = group_org_code_name;
	}

	public String getApprove_role_name() {
		return approve_role_name;
	}

	public void setApprove_role_name(String approve_role_name) {
		this.approve_role_name = approve_role_name;
	}
}
