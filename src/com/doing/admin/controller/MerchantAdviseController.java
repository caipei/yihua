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
public class MerchantAdviseController extends BaseController {
	public void index() {
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default,
				"select s.createtime,s.advise ,t.telephone, t.name, t.address ", " from t_merchant t , t_advise s where s.userid=t.id and s.type = 2");
		setAttr("pageitem", PageSize_Default);
		setAttr("pageSize", page.getTotalPage());// 总共展示页数
		setAttr("totalSize", page.getTotalRow());// 数据库中数据总共的条数
		setAttr("pageCurrent", page.getPageNumber());
		setAttr("adviselist", page.getList());
		render("/html/merchantAdvise/list.jsp");
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
