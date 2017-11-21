package com.doing.admin.controller;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
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
public class UserController extends BaseController {

	public void index() {

		List<Record> list = Db
				.find("select t1.id,username, nickname, rolename, t1.delflag from t_user t1, t_user_role t2, t_role t3 where t1.rstate = 0 and t1.id = t2.userid and t2.roleid = t3.id order by t1.id asc");

		setAttr("userlist", list);

		render("/html/user/list.jsp");
	}

	public void add() {

		List<Record> rolelist = Db
				.find("select id, rolename from t_role where rstate = 0");

		setAttr("rolelist", rolelist);

		List<Record> propertylist = Db
				.find("select id, propertyname from t_property where rstate = 0");

		setAttr("propertylist", propertylist);

		render("/html/user/add.jsp");
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void submit() {

		String username = StringUtils.defaultString(getPara("username"));
		String nickname = StringUtils.defaultString(getPara("nickname"));
		String password = StringUtils.defaultString(getPara("password"));
		password = DigestUtils.md5Hex( password);
		String roleid = StringUtils.defaultString(getPara("role_sel"));
		String propertyid = StringUtils.defaultString(getPara("pro_sel"));
		Record record = Db
				.findFirst(
						"select count(id) as num from t_user where username = ? and rstate = 0",
						username);

		StatusBean statusBean = new StatusBean();

		if (record != null && record.getLong("num") > 0) {
			statusBean.setStatusCode(300);
			statusBean.setMessage("用户名已存在");
			statusBean.setCloseCurrent(false);
		} else {
			Record userRecord = new Record();
			Db.save("t_user",
					userRecord.set("username", username)
							.set("nickname", nickname)
							.set("realname", nickname)
							.set("password", password)
							.set("propertyid", propertyid)
							.set("logintime", Utils.getNowStr("yyyyMMddHHmmss"))
							.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));
			long userid = userRecord.getLong("id");
			Db.save("t_user_role",
					new Record().set("userid", userid).set("roleid", roleid));
			statusBean.setTabid("tab_user");
		}
		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String userid = StringUtils.defaultString(getPara(0));

		List<Record> rolelist = Db
				.find("select id, rolename from t_role where rstate = 0");

		setAttr("rolelist", rolelist);

		Record record = Db
				.findFirst(
						"select username, password, nickname, roleid,propertyid, delflag from t_user t1, t_user_role t2 where t1.id = t2.userid and t1.id = ?",
						userid);

		List<Record> propertylist = Db
				.find("select id, propertyname from t_property where rstate = 0");

		setAttr("propertylist", propertylist);

		if (record != null && record.getInt("delflag") == 1) {

			setAttr("username", record.get("username"));

			setAttr("password", record.get("password"));

			setAttr("nickname", record.get("nickname"));

			setAttr("propertyid", record.get("propertyid"));

			setAttr("roleid", record.get("roleid"));

			setAttr("userid", userid);

			render("/html/user/edit.jsp");

		} else {
			redirect("/admin/user/");
		}
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void update() {

		String userid = StringUtils.defaultString(getPara("userid"));
		String nickname = StringUtils.defaultString(getPara("nickname"));
		String password = StringUtils.defaultString(getPara("password"));
		password = DigestUtils.md5Hex(password);
		String roleid = StringUtils.defaultString(getPara("role_sel"));
		String propertyid = StringUtils.defaultString(getPara("pro_sel"));

		Db.update("update t_user set nickname = ?, password = ?, propertyid = ? where id = ?",
				nickname, password,propertyid, userid);

		Db.deleteById("t_user_role", "userid", userid);

		Db.save("t_user_role",
				new Record().set("userid", userid).set("roleid", roleid));
		StatusBean statusBean = new StatusBean();
		statusBean.setTabid("tab_user");
		renderJson(GsonUtils.toJson(statusBean));
	}

	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {
		String userid = StringUtils.defaultString(getPara(0));

		Db.update("update t_user set rstate = 1 where id = ?", userid);

		Db.deleteById("t_user_role", "userid", userid);

		StatusBean statusBean = new StatusBean();
		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));

	}
}
