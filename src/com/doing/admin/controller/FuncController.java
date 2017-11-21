package com.doing.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.admin.interceptor.LoginJsonInterceptor;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class FuncController extends BaseController {

	public void index() {

		int pid = Utils.getIntVal(getPara(0), 0);

		List<Record> list = Db
				.find("select id, funcname, funcurl, seq, (select count(t2.id) from t_function t2 where t1.id = t2.pid) as subnum from t_function t1 where pid = ? and rstate = 0 order by seq desc, id asc",
						pid);

		setAttr("pid", pid);

		setAttr("funclist", list);

		render("/html/func/list.jsp");
	}

	public void add() {

		int pid = Utils.getIntVal(getPara(0), 0);

		setAttr("pid", pid);

		render("/html/func/add.jsp");
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void submit() {

		int pid = Utils.getIntVal(getPara("pid"), 0);

		String funcname = StringUtils.defaultString(getPara("funcname"));

		String funcurl = StringUtils.defaultString(getPara("funcurl"));

		String funckey = "001";

		Record record = Db
				.findFirst(
						"select funckey from t_function where pid = ? and rstate = 0 order by funckey desc",
						pid);

		if (record != null && !StringUtils.isBlank(record.getStr("funckey"))) {

			String maxfunckey = record.getStr("funckey");

			long maxkey = Utils.getLongVal(maxfunckey, 0);

			maxkey += 1;

			funckey = String.format("%0" + maxfunckey.length() + "d", maxkey);

		} else {

			record = Db.findFirst(
					"select funckey from t_function where id = ?", pid);

			if (record != null
					&& !StringUtils.isBlank(record.getStr("funckey"))) {

				String pfunckey = record.getStr("funckey");

				funckey = pfunckey + "001";
			}
		}

		Db.save("t_function",
				new Record().set("funcname", funcname).set("funckey", funckey)
						.set("funcurl", funcurl).set("pid", pid));

		HashMap<String, Object> resultHm = new HashMap<String, Object>();

		resultHm.put("rescode", 0);

		renderJson(GsonUtils.toJson(resultHm));

	}

	public void edit() {

		int id = Utils.getIntVal(getPara(0), 0);

		Record record = Db
				.findFirst(
						"select id,pid,funcname,funckey,funcurl from t_function where id = ?",
						id);

		if (record != null) {

			setAttr("pid", record.get("pid"));

			setAttr("id", record.get("id"));

			setAttr("funcname", record.get("funcname"));

			setAttr("funckey", record.get("funckey"));

			setAttr("funcurl", record.get("funcurl"));
		}

		render("/html/func/edit.jsp");
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void update() {

		String id = getPara("id");

		String funcname = StringUtils.defaultString(getPara("funcname"));

		String funcurl = StringUtils.defaultString(getPara("funcurl"));

		Db.update(
				"update t_function set funcname = ?, funcurl = ? where id = ?",
				funcname, funcurl, id);

		HashMap<String, Object> resultHm = new HashMap<String, Object>();

		resultHm.put("rescode", 0);

		renderJson(GsonUtils.toJson(resultHm));
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = getPara("id");

		Db.update("update t_function set rstate = 1 where id = ?", id);
		
		Db.deleteById("t_role_function", "funcid", id);

		HashMap<String, Object> resultHm = new HashMap<String, Object>();

		resultHm.put("rescode", 0);

		renderJson(GsonUtils.toJson(resultHm));
	}
	
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void updateseq() {

		String id = getPara("id");
		
		int seq = Utils.getIntVal(getPara("seq"), 0);

		Db.update("update t_function set seq = ? where id = ?", seq, id);

		HashMap<String, Object> resultHm = new HashMap<String, Object>();

		resultHm.put("rescode", 0);

		renderJson(GsonUtils.toJson(resultHm));
	}
}
