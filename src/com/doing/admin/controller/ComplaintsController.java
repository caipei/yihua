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
public class ComplaintsController extends BaseController {

	public void index() {
		
		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		
		String state = getPara("state");

		String subsql = "";

		if (StringUtils.isNotBlank(state)) {

			subsql = " and t.rstate = '"+state+"'" ;
		} else {
			subsql = " and t.rstate =  0 " ;
		}

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select t.*, s.username,s.mobile,DATE_FORMAT(t.createtime,'%Y-%m-%d %H:%i:%s') as createtimes"
				+ ",(case when t.complaintstype = 1 then '设备投诉' when t.complaintstype = 2 then '管理服务投诉' when t.complaintstype = 3 then '收费投诉' when t.complaintstype = 4 then '突发事件投诉' end) as complaintstypes  ",
				" from t_property_complaints t , t_member s  where  t.userid = s.id  and t.propertyid = "+propertyid+ subsql +" order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());
		
		setAttr("pageitem", PageSize_Default);

		setAttr("state", state);
		
		setAttr("complaintslist", page.getList());

		render("/html/complaint/list.jsp");
	}
	
	public void handle(){
		String id = getPara("id");

		Record record = Db.findFirst(
				"select t.*,  s.username,s.mobile  from t_property_complaints t left join t_member s  on  t.userid = s.id  and  t.id = ?",
				new Object[] { id });

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/complaint/handle.jsp");
	}
	
	public void submit(){
		String id = getPara("id");
		
		Db.update("update t_property_complaints set rstate = 1 where id = ? ", id );
		
		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_complaint");

		renderJson(GsonUtils.toJson(statusBean));
		
	}
	
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_property_complaints set rstate = 2 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_complaint");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
	
}
