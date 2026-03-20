package com.cnpiecsb.common.aop;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 
 * @author zc 2024-12-24
 * 操作aop注解
 */

@Retention(RetentionPolicy.RUNTIME)  
@Target({ElementType.METHOD}) 
public @interface OperationLogAnnotation {
	//操作内容
	String context();
}
