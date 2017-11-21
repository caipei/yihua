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
public class VillageProFeeController extends BaseController {

	public void index() {

		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select t.*,s.villagename ",
						" from t_village_profee t  left join t_village s  on t.villageid = s.id  where t.rstate = 0 and t.propertyid='"
								+ propertyid + "'  order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("profeelist", page.getList());

		render("/html/profee/list.jsp");
	}

	public void add() {

		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));

		List<Record> list = Db
				.find("select * from t_village where rstate = 0  and propertyid = '"
						+ propertyid + "' order by id desc");

		setAttr("villagelist", list);

		render("/html/profee/add.jsp");
	}

	public void submit() {
		// 物业id
		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		// 小区物业费 单位 元/年 m²
		double profee = Utils.getDoubleVal(getPara("profee"), 0.0d);
		// 小区id
		int villageid = Utils.getIntVal(getPara("villageid"), 1);

		Page<Record> page = Db
				.paginate(
						1,
						PageSize_Default,
						"select t.* ",
						" from t_village_profee t  where t.rstate = 0 and t.propertyid='"
								+ propertyid + "' and t.villageid = '"+villageid+"' order by t.id desc");

		StatusBean statusBean = new StatusBean();

		if(page.getList().size() == 0){

			Db.save("t_village_profee",
					new Record().set("villageid", villageid)
							.set("propertyid", propertyid).set("profee", profee)
							.set("createtime", new Date()));
		}else{
			statusBean.setMessage("您选择的小区已经规定过物业费了,请重新选择小区!");
		}

		statusBean.setTabid("tab_village_profee");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = StringUtils.defaultString(getPara("id"));

		Record record = Db.findFirst(
				"select *  from t_village_profee   where id = ?", id);

		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));

		List<Record> list = Db
				.find("select * from t_village where rstate = 0  and propertyid = '"
						+ propertyid + "' order by id desc");

		if (record != null) {

			setAttr("villagelist", list);

			setAttrs(record.getColumns());

			render("/html/profee/edit.jsp");

		} else {

			renderJson(GsonUtils.toJson(setStatusError(null, false)));
		}

	}

	public void update() {

		String id = StringUtils.defaultString(getPara("id"));
		// 物业id
		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		// 小区物业费 单位 元/年 m²
		double profee = Utils.getDoubleVal(getPara("profee"), 0.0d);
		// 小区id
		int villageid = Utils.getIntVal(getPara("villageid"), 1);

		Page<Record> page = Db
				.paginate(
						1,
						PageSize_Default,
						"select t.* ",
						" from t_village_profee t  where t.rstate = 0 and t.propertyid='"
								+ propertyid + "' and t.villageid = '"+villageid+"' and t.id <> '"+id+"' order by t.id desc");

		StatusBean statusBean = new StatusBean();

		if(page.getList().size() == 0){
			Db.update(
					"update t_village_profee set profee = ?, villageid = ? where id = ?",
					profee, villageid, id);
		}else{
			statusBean.setMessage("您选择的小区已经规定过物业费了,请重新选择小区!");
		}

		statusBean.setTabid("tab_village_profee");

		renderJson(GsonUtils.toJson(statusBean));
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_village_profee set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_village_profee");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
}
