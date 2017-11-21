package com.doing.admin.controller;

import java.util.List;

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
public class CategoryController extends BaseController {
	
	public void index() {
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default,
				"select id,categoryname,rstate ","from t_category ");
		setAttr("pageitem", PageSize_Default);
		setAttr("pageSize", page.getTotalPage());// 总共展示页数
		setAttr("totalSize", page.getTotalRow());// 数据库中数据总共的条数
		setAttr("pageCurrent", page.getPageNumber());
		setAttr("categorylist", page.getList());
		
		render("/html/category/list.jsp");
	}
	
	
	public void add() {
		
		List<Record> categorylist = Db.find(
				"select id,categoryname,rstate from t_category ");

		setAttr("categorylist", categorylist);
		
		render("/html/category/add.jsp");
		
	}
	
	public void submit() {
		String name = StringUtils.defaultString(getPara("name"));
		String rstate = StringUtils.defaultString(getPara("rstate"));
		Record record = new Record();
		Db.save("t_category", record.set("categoryname", name).set("rstate", rstate));
		StatusBean statusBean = new StatusBean();
		statusBean.setTabid("tab_category");
		renderJson(GsonUtils.toJson(statusBean));
	}
	
	public void edit() {
		String id = getPara("id");
		Record record = Db.findFirst("select categoryname,rstate from t_category where id = ?", id);
		if (record != null) {
			setAttr("name", record.get("categoryname"));
			setAttr("rstate", record.get("rstate"));
			setAttr("categoryid", id);
			
			render("/html/category/edit.jsp");
		} else {
			renderJson(setStatusError(null, false));
		}
	}
	
	public void update() {

		String id = StringUtils.defaultString(getPara("id"));
		
		String name = StringUtils.defaultString(getPara("name"));
		String rstate = StringUtils.defaultString(getPara("rstate"));
		Db.update("update t_category set categoryname = ?,rstate=? where id = ?", name,rstate, id);
		
		StatusBean statusBean = new StatusBean();
		
		statusBean.setTabid("tab_category");

		renderJson(GsonUtils.toJson(statusBean));
	}
	
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));
		Db.deleteById("t_category", id);
		
		StatusBean statusBean = new StatusBean();
		
		statusBean.setTabid("tab_category");
		
		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
}
