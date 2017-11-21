package com.doing.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class RoleController extends BaseController {

	public void index() {

		List<Record> list = Db
				.find("select id,rolename,delflag from t_role where rstate = 0");

		setAttr("rolelist", list);

		render("/html/role/list.jsp");
	}

	public void add() {

		render("/html/role/add.jsp");
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void submit() {

		String rolename = StringUtils.defaultString(getPara("rolename"));

		boolean flag = Db
				.save("t_role", new Record().set("rolename", rolename));

		StatusBean statusBean = new StatusBean();

		if (flag) {

			statusBean.setTabid("tab_role");
		} else {

			statusBean.setStatusCode(300);
			statusBean.setMessage("操作失败");
			statusBean.setCloseCurrent(false);
		}

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String roleid = StringUtils.defaultString(getPara(0));

		Record record = Db.findFirst(
				"select rolename, delflag from t_role where id = ?", roleid);

		if (record != null && record.getInt("delflag") == 0) {

			setAttr("rolename", record.get("rolename"));

			setAttr("roleid", roleid);

			render("/html/role/edit.jsp");
		} else {
			StatusBean statusBean = new StatusBean();
			statusBean.setStatusCode(300);
			statusBean.setMessage("操作失败");
			statusBean.setCloseCurrent(false);
			renderJson(GsonUtils.toJson(statusBean));
		}
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void update() {


		String rolename = StringUtils.defaultString(getPara("rolename"));

		String roleid = StringUtils.defaultString(getPara("roleid"));

		int flag = Db.update("update t_role set rolename = ? where id = ?",
				rolename, roleid);

		StatusBean statusBean = new StatusBean();

		if (flag > 0) {

			statusBean.setTabid("tab_role");
		} else {

			statusBean.setStatusCode(300);
			statusBean.setMessage("操作失败");
			statusBean.setCloseCurrent(false);
		}

		renderJson(GsonUtils.toJson(statusBean));
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		HashMap<String, Object> resultHm = new HashMap<String, Object>();

		String roleid = StringUtils.defaultString(getPara(0));

		Db.update("update t_role set rstate = 1 where id = ?",
				roleid);

		Db.deleteById("t_user_role", "roleid", roleid);

		StatusBean statusBean = new StatusBean();
		statusBean.setTabid("tab_role");
		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(resultHm));
	}

	public void auth() {

		String roleid = StringUtils.defaultString(getPara(0));

		setAttr("roleid", roleid);

		render("/html/role/auth.jsp");
	}

	public void authtree() {

		String roleid = StringUtils.defaultString(getPara("roleid"));

		List<Record> rolefunclist = Db.find("select funcid from t_role_func where roleid = ?", roleid);

		List<String> funcStrs = new ArrayList<String>();

		if (rolefunclist.size() > 0) {

			for (Record tmpRecord : rolefunclist) {

				funcStrs.add(Utils.getStrVal(tmpRecord.get("funcid")));
			}
		}
		List<HashMap<String, Object>> treeList = new ArrayList<HashMap<String, Object>>();

		HashMap<String, Object> tmpHm = new HashMap<String, Object>();
		tmpHm.put("id", 0);
		tmpHm.put("name", "全部");
		tmpHm.put("pId", 0);
		tmpHm.put("open", true);
		treeList.add(tmpHm);
		treeList.addAll(getFuncs(funcStrs, "0"));
		renderJson(GsonUtils.toJson(treeList));
	}

	public List<HashMap<String, Object>> getFuncs(List<String> funcStrs,  String pid) {
		List<HashMap<String, Object>> tmpTreeList = new ArrayList<HashMap<String, Object>>();
		String sql = "select id, funcname, funcurl, pfuncid, (select count(t2.id) from t_func t2 where t1.id = t2.pfuncid) as subnum from t_func t1 where pfuncid = ? and rstate = 0 order by seq desc, id asc";
		List<Record> list = Db.find(sql, pid);
		if (list != null && list.size() > 0) {
			for (Record record : list) {
				HashMap<String, Object> hm = new HashMap<String, Object>();
				String id = Utils.getStrVal(record.get("id"));
				hm.put("id", id);
				hm.put("name", record.get("funcname"));
				hm.put("pId", record.get("pfuncid"));
				hm.put("open", true);
				if (funcStrs.contains(id)) {
					hm.put("checked", true);
				}
				tmpTreeList.add(hm);
				long subnum = record.get("subnum");
				if (subnum > 0) {
					tmpTreeList.addAll(getFuncs(funcStrs, id));
				}
			}
		}
		return tmpTreeList;
	}

	public void authsubmit() {

		String roleid = StringUtils.defaultString(getPara("roleid"));

		Db.deleteById("t_role_func", "roleid", roleid);

		String funcids = StringUtils.defaultString(getPara("funcids"));
		String[] funcidArr = StringUtils.split(funcids, "|");
		if (funcidArr != null) {
			for (String funcid : funcidArr) {

				if (StringUtils.isNotBlank(funcid) && !StringUtils.equals("0", funcid)) {

					Db.save("t_role_func", new Record().set("roleid", roleid).set("funcid", funcid));
				}
			}
		}
		StatusBean statusBean = new StatusBean();
		statusBean.setTabid("tab_role");
		renderJson(GsonUtils.toJson(statusBean));

	}
}
