package com.cnpiecsb.common.interceptor;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.cnpiecsb.common.exception.SessionTimeoutException;

public class SessionTimeoutInterceptor extends HandlerInterceptorAdapter {
	private List<String> allowUrls;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws SessionTimeoutException, IOException {
		
		System.out.println(request.getRequestURI());
		if(request.getRequestURI().indexOf("/itoms/api")!=-1){//不拦截接口的地址
			return true;
		}
		
		// 只拦截动态资源
		if (handler instanceof HandlerMethod){
			String requestUrl = request.getServletPath();
			
			for(String url : allowUrls) {
				if(requestUrl.equals(url) ||
						requestUrl.startsWith(url)) {
					return true;
				}
			}
			
			Object userSession = WebUtils.getSessionAttribute(request,
					"user");  //session中是否存在user这个值
			if(userSession != null) {
				return true;
			}else {
				throw new SessionTimeoutException();
//				response.sendRedirect("../login.jsp");  //这里直接跳转有问题
			}
		}

		return true;
	}

	public List<String> getAllowUrls() {
		return allowUrls;
	}

	public void setAllowUrls(List<String> allowUrls) {
		this.allowUrls = allowUrls;
	}
	
}
