package com.doing.admin.controller;

import org.apache.commons.lang3.StringUtils;

import com.doing.admin.bean.StatusBean;
import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.admin.interceptor.LoginJsonInterceptor;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class AdviseController extends BaseController {

	public void index() {
		
		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select t.*, s.username,s.mobile,DATE_FORMAT(t.createtime,'%Y-%m-%d %H:%i:%s') as createtimes, ss.villagename ",
				" from t_advise t , t_member s,t_village ss  where t.type = 1 and t.userid = s.id and t.villageid = ss.id and t.rstate = 0 and t.propertyid = "+ propertyid +" order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());
		
		setAttr("pageitem", PageSize_Default);

		setAttr("adviselist", page.getList());

		render("/html/advise/list.jsp");
	}
	
	
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_advise set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_advise");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
	
}
