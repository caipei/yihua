package com.doing.admin.controller;

import java.util.Date;
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
public class VillageController extends BaseController {

	public void index() {

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select t.*,s.propertyname ",
						" from t_village t  left join t_property s  on t.propertyid = s.id  where t.rstate = 0   order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("villagelist", page.getList());

		render("/html/village/list.jsp");
	}
	public void propertylist(){
String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db
				.paginate(pageCurrent, PageSize_Default, "select t.*,s.propertyname ",
						" from t_village t left join t_property s  on t.propertyid = s.id  where t.rstate = 0   and t.propertyid = '"+propertyid+"'  order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("villagelist", page.getList());

		render("/html/propertyvillage/list.jsp");
	}
	public void add() {

		List<Record> list = Db
				.find("select * from t_property where rstate = 0 order by id desc");

		setAttr("propertylist", list);

		render("/html/village/add.jsp");
	}

	public void submit() {
		// 小区名称
		String villagename = StringUtils.defaultString(getPara("villagename"));
		// 小区地址
		String villageaddress = StringUtils
				.defaultString(getPara("villageaddress"));
		// 小区对应物业公司id
		int propertyid = Utils.getIntVal(getPara("proid"), 1);

		Db.save("t_village",
				new Record().set("villagename", villagename)
						.set("villageaddress", villageaddress)
						.set("propertyid", propertyid)
						.set("createtime", new Date()));

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_village");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = StringUtils.defaultString(getPara("id"));

		Record record = Db.findFirst("select *  from t_village   where id = ?",
				id);
		List<Record> list = Db
				.find("select * from t_property where rstate = 0 order by id desc");

		if (record != null) {

			setAttr("propertylist", list);

			setAttrs(record.getColumns());

			render("/html/village/edit.jsp");

		} else {

			renderJson(GsonUtils.toJson(setStatusError(null, false)));
		}

	}

	public void update() {

		String id = StringUtils.defaultString(getPara("id"));

		// 小区名称
		String villagename = StringUtils.defaultString(getPara("villagename"));
		// 小区地址
		String villageaddress = StringUtils
				.defaultString(getPara("villageaddress"));
		// 小区对应物业公司id
		int propertyid = Utils.getIntVal(getPara("proid"), 1);

		Db.update(
				"update t_village set villagename = ?, villageaddress = ?, propertyid = ? where id = ?",
				villagename, villageaddress, propertyid, id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_village");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void noticelist() {
		String id = StringUtils.defaultString(getPara("id"));

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select t.* ",
						" from t_notice t  where t.rstate = 0 and t.villageid = ?   order by t.id desc",
						id);

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("villageid", id);

		setAttr("noticelist", page.getList());

		render("/html/propertyvillage/notice/list.jsp");

	}

	public void addnotice() {

		String id = StringUtils.defaultString(getPara("id"));

		setAttr("villageid", id);

		render("/html/propertyvillage/notice/add.jsp");
	}

	public void submitnotice() {
		// 小区id
		String id = StringUtils.defaultString(getPara("id"));
		// 公告详情
		String noticedetail = StringUtils
				.defaultString(getPara("noticedetail"));

		Record record = Db.findById("t_village", id);

		Db.save("t_notice",
				new Record().set("villageid", id)
						.set("noticedetail", noticedetail)
						.set("propertyid", record.getInt("propertyid"))
						.set("createtime", new Date()));

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_pro_village");

		renderJson(GsonUtils.toJson(statusBean));
	}
	public void updatenotice() {

		String id = StringUtils.defaultString(getPara("id"));

		// 公告详情
		String noticedetail = StringUtils.defaultString(getPara("noticedetail"));

		Db.update(
				"update t_notice set noticedetail = ? where id = ?",
				noticedetail, id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_pro_village");

		renderJson(GsonUtils.toJson(statusBean));
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void delnotice() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_notice set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_village");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_village set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_village");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
}
