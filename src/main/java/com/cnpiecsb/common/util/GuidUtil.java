package com.cnpiecsb.common.util;

import java.util.UUID;

/**
 * 产生Guid类
 * @author user
 *
 */
public class GuidUtil {
	
	/**
	 * 产生一个32位的GUID, 全大写无'-'符号
	 * 
	 * @return
	 */
	public static String create32Guid(){
		// 创建 GUID 对象
        UUID uuid = UUID.randomUUID();

        // 得到对象产生的ID
        String a = uuid.toString();

        // 转换为大写
        a = a.toUpperCase();

        // 替换 -
        a = a.replaceAll("-", "");
        return a;
	}
	
	public static void main(String[] args) {
		System.out.println(GuidUtil.create32Guid());
	}

}
