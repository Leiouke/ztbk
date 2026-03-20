package com.cnpiecsb.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * excel处理公共类
 * 
 */
public class MyDateUtil {
	/* 
     * 将时间戳字符串转换为时间格式化字符串
     */
    public static String stampToDate(String s){
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }
}
