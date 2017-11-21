package com.doing.common.config;

import javax.servlet.ServletContext;

import com.doing.common.config.routes.AdminRoutes;
import com.doing.common.config.routes.DataServiceRoutes;
import com.doing.common.variable.Common;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;

public class DefaultConfig extends JFinalConfig {
	
	private Logger logger = Logger.getLogger(DefaultConfig.class);
 
	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		PropKit.use("sys_config.txt");
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		me.add(new AdminRoutes());
		me.add(new DataServiceRoutes());
	}

	/**
	 * 插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"),
				PropKit.get("user"), PropKit.get("password").trim());
		c3p0Plugin.setMaxPoolSize(10);
		c3p0Plugin.setMinPoolSize(5);
		me.add(c3p0Plugin);
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);

		me.add(new EhCachePlugin(Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("ehcache.xml")));
		// me.add(new EhCachePlugin("src/ehcache.xml"));
	}

	@Override
	public void afterJFinalStart() {
		// TODO Auto-generated method stub
		ServletContext servletContext = JFinal.me().getServletContext();
		Common.PATH = servletContext.getRealPath("/");
//		RoleFuncUtils.rolefunc();
		
		// 开启黑名单管理线程
		logger.debug("开启黑名单管理线程");
//		QueueOptUtils.startThread();
	}

	/**
	 * 配置全局拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		
	}
}
