package com.struts.interceptors;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class LoggingInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String className = invocation.getAction().getClass().getName();
		Long startTime = System.currentTimeMillis();
		System.out.println("BEFORE: Calling action:" + className);
		
		String result = invocation.invoke();
		
		Long endTime = System.currentTimeMillis();
		System.out.println("AFTER: Calling action: " + className + " Time taken: " + (endTime - startTime) + "ms");
		
		return result;
		
	}

}
