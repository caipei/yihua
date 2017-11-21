package com.doing.admin.controller;

import java.util.Date;

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
public class PropertyController extends BaseController {

	public void index() {

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default,
				"select * ",
				" from t_property  where rstate = 0 order by id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("propertylist", page.getList());

		render("/html/property/list.jsp");
	}

	public void add() {



		render("/html/property/add.jsp");
	}

	public void submit() {
		// 物业公司名称
		String propertyname = StringUtils
				.defaultString(getPara("propertyname"));
		// 负责人
		String leadingoffical = StringUtils
				.defaultString(getPara("leadingoffical"));
		// 负责人联系方式
		String leadingmobile = StringUtils
				.defaultString(getPara("leadingmobile"));
		// 物业公司地址
		String propertyaddress = StringUtils
				.defaultString(getPara("propertyaddress"));

		Db.save("t_property",
				new Record().set("propertyname", propertyname)
						.set("leadingoffical", leadingoffical)
						.set("leadingmobile", leadingmobile)
						.set("propertyaddress", propertyaddress)
						.set("createtime", new Date()));

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_property");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = StringUtils.defaultString(getPara("id"));

		Record record = Db.findFirst("select * from t_property where id = ?",
				id);

		if (record != null) {

			setAttr("propertyname", record.get("propertyname"));

			setAttr("leadingoffical", record.get("leadingoffical"));

			setAttr("leadingmobile", record.get("leadingmobile"));

			setAttr("propertyaddress", record.get("propertyaddress"));

			setAttr("id", id);

			render("/html/property/edit.jsp");

		} else {

			renderJson(GsonUtils.toJson(setStatusError(null, false)));
		}

	}

	public void update() {

		String id = StringUtils.defaultString(getPara("id"));

		// 物业公司名称
		String propertyname = StringUtils
				.defaultString(getPara("propertyname"));
		// 负责人
		String leadingoffical = StringUtils
				.defaultString(getPara("leadingoffical"));
		// 负责人联系方式
		String leadingmobile = StringUtils
				.defaultString(getPara("leadingmobile"));
		// 物业公司地址
		String propertyaddress = StringUtils
				.defaultString(getPara("propertyaddress"));

		Db.update(
				"update t_property set propertyname = ?, leadingoffical = ?, leadingmobile = ?, propertyaddress = ? where id = ?",
				propertyname, leadingoffical, leadingmobile, propertyaddress, id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_property");

		renderJson(GsonUtils.toJson(statusBean));
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_property set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_property");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
}
