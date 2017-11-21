package com.doing.common.config;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * 全局拦截器
 * 
 * @author xujin
 *
 */
public class GlobalInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		// TODO Auto-generated method stub
		// 获取controller
		Controller controller = inv.getController();
	}
}
