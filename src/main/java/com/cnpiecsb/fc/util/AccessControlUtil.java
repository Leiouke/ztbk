package com.cnpiecsb.fc.util;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;

/**
 * 权限控制相关工具类, 目前用于存放权限相关字段
 * 
 * @author user
 *
 */
public class AccessControlUtil {
	
	/**
	 * 获取权限代码参数
	 * 
	 * @param postData
	 * @param httpSession
	 */
	public static void accessParams(Map postData, HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");		
		postData.put("account", user.getAccount());
		
		Role role = (Role)httpSession.getAttribute("defaultRole");	
		if (role != null) {
			postData.put("approve_role", role.getApprove_role());
			postData.put("org_code", role.getOrg_code());
		} else { // 没有角色信息的就使用0, 反正后续也不会使用
			postData.put("approve_role", 0);
			postData.put("org_code", 0);
		}
	}
}
