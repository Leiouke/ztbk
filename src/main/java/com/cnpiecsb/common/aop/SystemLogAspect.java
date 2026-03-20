package com.cnpiecsb.common.aop;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.cnpiecsb.system.entity.Log;
import com.cnpiecsb.system.entity.User;
import com.cnpiecsb.system.service.LogService;
import com.cnpiecsb.system.service.OperationLogService;

/**
 * 系统日志切面
 * 
 * @author wkh
 *
 */
@Component
public class SystemLogAspect {
	@Resource(name="logService")
	private LogService logService;
	
	@Autowired
	private OperationLogService operationLogService;
	
	public void createLog(JoinPoint jp, Object result) throws ClassNotFoundException{
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();    
		HttpSession session = request.getSession();   // 获得session
		
		User user = (User) session.getAttribute("user");
		
		// 得到目标方法名
		String methodName = jp.getSignature().getName();
		if (methodName.equals("doLogin")){  //登陆方法,这里写死了!!
			user = (User) result;
		}
		
		if (user == null){  //假如session中没有用户信息		
			return;
		}
		
		Log log = new Log();
		log.setContext(this.getContext(jp));
		log.setUserAccount(user.getAccount());
		log.setLogTime(new Date());
		
		logService.addLog(log);
	}
	
	public void createOperationLog(JoinPoint jp, Object result) throws ClassNotFoundException{
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();    
		HttpSession session = request.getSession();   // 获得session
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		User user = (User) session.getAttribute("user");
		map.put("userAccount", user.getAccount());
		map.put("userName", user.getUserName());
		map.put("context", this.getOperationContext(jp));
		
		//获得输入的参数
		Object[] args = jp.getArgs();
		
		if(args.length == 0){
			map.put("input_args","");
		}else{
			//System.out.println("args="+Arrays.toString(args));
			map.put("input_args",Arrays.toString(args));
		}
		
		//判断结果
		if(result == null||result.equals("")){
			map.put("output_result","");
		}else{
			//System.out.println("args="+Arrays.toString(args));
			map.put("output_result",String.valueOf(result));
		}
		
		operationLogService.operationLogAdd(map);
	}
	
	/**
	 * 得到操作日志内容
	 * @param jp
	 * @return
	 * @throws ClassNotFoundException
	 */
	private String getContext(JoinPoint jp) throws ClassNotFoundException{
		// 以下得到目标类的所有方法
		String targetName = jp.getTarget().getClass().getName();
		Class targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		
		// 得到目标方法参数数组
		Object[] arguments = jp.getArgs();
		// 得到目标方法名
		String methodName = jp.getSignature().getName();
		
		for (Method method : methods) {
			if (method.getName().equals(methodName)){
				// 不仅方法名要一样而且参数个数也要一样
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length){
					return method.getAnnotation(BussinessAnnotation.class).context();
				}
			}
		}
		return null;
	}
	
	/**
	 * 得到操作日志内容
	 * @param jp
	 * @return
	 * @throws ClassNotFoundException
	 */
	private String getOperationContext(JoinPoint jp) throws ClassNotFoundException{
		// 以下得到目标类的所有方法
		String targetName = jp.getTarget().getClass().getName();
		Class targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		
		// 得到目标方法参数数组
		Object[] arguments = jp.getArgs();
		// 得到目标方法名
		String methodName = jp.getSignature().getName();
		
		for (Method method : methods) {
			if (method.getName().equals(methodName)){
				// 不仅方法名要一样而且参数个数也要一样
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length){
					return method.getAnnotation(OperationLogAnnotation.class).context();
				}
			}
		}
		return null;
	}
}
