package com.doing.admin.controller.good;

import java.util.Date;
import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;

import com.doing.admin.bean.StatusBean;
import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class ServiceTypeController extends BaseController {

	public void index() {

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select * " ,"from t_vip_service where rstate = 0 order by id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());
		
		setAttr("pageitem", PageSize_Default);

		setAttr("servicelist", page.getList());

		render("/html/good/service/list.jsp");
	}
	public void add() {

		render("/html/good/service/add.jsp");
	}

	public void submit() {
		String servicename = StringUtils.defaultString(getPara("servicename"));
		String imageurl = StringUtils.defaultString(getPara("imgpath"));
		String contentimage = StringUtils.defaultString(getPara("imgpath1"));
		Record record = new Record();

		boolean flag = Db.save("t_vip_service",
				record.set("servicename", servicename).set("contentimage", contentimage)
						.set("imageurl", imageurl).set("createtime", new Date()));
		for(int i = 1 ; i <=4 ; i ++){
			Record records = new Record();
			Db.save("t_service_title", records.set("serviceid",record.get("id")).set("titletype", i)
					.set("createtime", new Date()));
		}
		
		
		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_service_type");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = getPara("id");

		Record record = Db.findFirst("select *, id as serviceid from t_vip_service where id = ?", id);
		
		if (record != null) {
			
			setAttrs(record.getColumns());
		}

		render("/html/good/service/edit.jsp");
	}

	public void update() {

		String servicename = StringUtils.defaultString(getPara("servicename"));
		String imageurl = StringUtils.defaultString(getPara("imgpath"));
		String contentimage = StringUtils.defaultString(getPara("imgpath1"));

		String serviceid = StringUtils.defaultString(getPara("serviceid"));
		

		Db.update(
				"update t_vip_service set servicename = ?, imageurl = ?, contentimage = ? where id = ?",
				servicename, imageurl, contentimage, serviceid);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_service_type");

		renderJson(GsonUtils.toJson(statusBean));
	}
	public void del(){
		String id = getPara("id");
		
		Db.update(
				"delete from  t_vip_service  where id = ?",
				 id);
		Db.update(
				"delete from  t_service_title  where serviceid = ?",
				 id);
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		resultHm.put("rescode", 0);

		renderJson(Utils.toJson(resultHm));
	}
	public void titlelist(){
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		String id = getPara("id");
		
		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select *, (case when titletype = 1 then '伯爵' when titletype =2 then '侯爵' when titletype = 3 then '公爵' when titletype = 4 then '王爵' end)as titlename " ,"from t_service_title where rstate = 0  and serviceid = "+id+" order by id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("titlelist", page.getList());

		render("/html/good/service/title/list.jsp");
	}
	public void edittitle() {

		String id = getPara("id");

		Record record = Db.findFirst("select *, id as titleid,(case when titletype = 1 then '伯爵' when titletype =2 then '侯爵' when titletype = 3 then '公爵' when titletype = 4 then '王爵' end)as titlename  from t_service_title where id = ?", id);
		
		if (record != null) {
			
			setAttrs(record.getColumns());
		}

		render("/html/good/service/title/edit.jsp");
	}

	public void updatetitle() {

		double cost = Utils.getDoubleVal(getPara("cost"),
				Double.valueOf(0.0D)).doubleValue();
		String content = StringUtils.defaultString(getPara("content"));
		String caseurl = StringUtils.defaultString(getPara("caseurl"));
		String imageurl = StringUtils.defaultString(getPara("imgpath"));
		String titleid = StringUtils.defaultString(getPara("titleid"));
		

		Db.update(
				"update t_service_title set cost = ?, content = ?,caseurl = ?,imageurl = ? where id = ?",
				cost, content,caseurl,imageurl, titleid);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_service_type");

		renderJson(GsonUtils.toJson(statusBean));
	}
}
