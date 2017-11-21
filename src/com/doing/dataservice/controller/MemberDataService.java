package com.doing.dataservice.controller;

import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;

import com.doing.base.EncryptByteRender;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.dataservice.entity.DataEntity;
import com.doing.dataservice.entity.Status;
import com.doing.dataservice.interceptor.DataServiceInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

@Before(DataServiceInterceptor.class)
public class MemberDataService extends BaseDataServiceController {

	public void requestlist() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		HashMap<String, String> requestHm = new HashMap<>();

		String prefix = PropKit.get("dataservice_prefix");

		requestHm.put("login", prefix + "member/login");

		requestHm.put("register", prefix + "member/register");

		dataBean.setData(requestHm);

		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));

	}

	public void login() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramsHm = getRequestParams(bodyStr);

		if (paramsHm != null) {

			String username = Utils.getStrVal(paramsHm.get("username"));

			String password = Utils.getStrVal(paramsHm.get("password"));

			Record record = Db
					.findFirst(
							"select *, id as memberid from t_member where username = ? and password = ? and rstate = 0",
							username, password);

			if (record == null) {

				record = Db
						.findFirst(
								"select *, id as memberid from t_member where mobile = ? and password = ? and rstate = 0",
								username, password);
			}

			if (record != null) {

				dataBean.setData(record.getColumns());

			} else {

				status.setSucceed(0);

				status.setErrdesc("登录失败");
			}
		}

		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void register() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramsHm = getRequestParams(bodyStr);

		if (paramsHm != null) {

			String mobile = Utils.getStrVal(paramsHm.get("mobile"));

			String password = Utils.getStrVal(paramsHm.get("password"));

			String idkey = getIdkey();

			Db.save("t_member",
					new Record().set("mobile", mobile)
							.set("password", password)
							.set("intime", Utils.getNowStr("yyyyMMddHHmmss"))
							.set("idkey", idkey));

			Record record = Db
					.findFirst(
							"select *, id as memberid from t_member where mobile = ? and password = ? and rstate = 0",
							mobile, password);

			if (record != null) {

				dataBean.setData(record.getColumns());

			} else {

				status.setSucceed(0);

				status.setErrdesc("注册失败");
			}
		}

		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	private synchronized String getIdkey() {
		long idkey = 100001;
		Record record = Db
				.findFirst("select max(idkey) as maxnum from t_member");
		if (record != null) {
			idkey = Utils.getLongVal(record.get("maxnum"), 1000001);
			idkey = idkey + 1;
		}
		return String.valueOf(idkey);
	}

	public void checkmobile() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramsHm = getRequestParams(bodyStr);

		if (paramsHm != null) {

			String mobile = Utils.getStrVal(paramsHm.get("mobile"));

			Record record = Db
					.findFirst(
							"select count(id) as num from t_member where mobile = ? and rstate = 0",
							mobile);

			if (record != null && record.getLong("num") > 0) {

				dataBean.setData(0);

			} else {

				dataBean.setData(1);
			}
		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void changememinfo() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramsHm = getRequestParams(bodyStr);

		if (paramsHm != null) {

			String memberid = Utils.getStrVal(paramsHm.get("memberid"));

			String username = Utils.getStrVal(paramsHm.get("username"));

			String mobile = Utils.getStrVal(paramsHm.get("mobile"));

			String email = Utils.getStrVal(paramsHm.get("email"));

			String nickname = Utils.getStrVal(paramsHm.get("nickname"));

			String icon = Utils.getStrVal(paramsHm.get("icon"));

			String realname = Utils.getStrVal(paramsHm.get("realname"));

			String sex = Utils.getStrVal(paramsHm.get("sex"));

			String job = Utils.getStrVal(paramsHm.get("job"));

			String birthday = Utils.getStrVal(paramsHm.get("birthday"));

			String idcard = Utils.getStrVal(paramsHm.get("idcard"));

			String qq = Utils.getStrVal(paramsHm.get("qq"));

			String cancollect = Utils.getStrVal(paramsHm.get("cancollect"));

			String canlike = Utils.getStrVal(paramsHm.get("canlike"));

			String cancomment = Utils.getStrVal(paramsHm.get("cancomment"));

			Record record = Db.findFirst(
					"select *,id as memberid from t_member where id = ?",
					memberid);

			// 判断username和mobile
			if (StringUtils.isNotBlank(username)) {

				Record numRecord = Db
						.findFirst(
								"select count(id) as num from t_member where username = ? and id != ?",
								username, memberid);

				if (numRecord != null && numRecord.getLong("num") > 0) {

					status.setSucceed(0);

					status.setErrdesc("用户名重复");
				}
			}

			if (StringUtils.isNotBlank(mobile)) {

				Record numRecord = Db
						.findFirst(
								"select count(id) as num from t_member where mobile = ? and memberid != ?",
								mobile, memberid);

				if (numRecord != null && numRecord.getLong("num") > 0) {

					status.setSucceed(0);

					status.setErrdesc("手机号码重复");
				}
			}

			if (status.getSucceed() == 1) {

				if (StringUtils.isBlank(email)) {
					email = record.getStr("email");
				}
				if (StringUtils.isBlank(mobile)) {
					mobile = record.getStr("mobile");
				}
				if (StringUtils.isBlank(nickname)) {
					nickname = record.getStr("nickname");
				}
				if (StringUtils.isBlank(icon)) {
					icon = record.getStr("icon");
				}
				if (StringUtils.isBlank(realname)) {
					realname = record.getStr("realname");
				}
				if (StringUtils.isBlank(realname)) {
					email = record.getStr("realname");
				}

				if (StringUtils.isBlank(sex)) {
					sex = Utils.getStrVal(record.get("sex"));
				}

				if (StringUtils.isBlank(job)) {
					job = Utils.getStrVal(record.get("job"));
				}

				if (StringUtils.isBlank(birthday)) {
					birthday = Utils.getStrVal(record.get("birthday"));
				}

				if (StringUtils.isBlank(idcard)) {
					idcard = Utils.getStrVal(record.get("idcard"));
				}

				if (StringUtils.isBlank(qq)) {
					qq = Utils.getStrVal(record.get("qq"));
				}

				if (StringUtils.isBlank(cancollect)) {
					cancollect = Utils.getStrVal(record.get("cancollect"));
				}

				if (StringUtils.isBlank(cancomment)) {
					cancomment = Utils.getStrVal(record.get("cancomment"));
				}

				if (StringUtils.isBlank(canlike)) {
					canlike = Utils.getStrVal(record.get("canlike"));
				}

				Db.update(
						"update t_member set username = ?, email = ?, mobile = ?, nickname = ?, icon = ?, realname = ?, sex = ?, job = ?, birthday = ?, idcard = ?, qq = ?, cancollect = ?, cancomment = ?, canlike = ? where id = ?",
						username, email, mobile, nickname, icon, realname, sex,
						job, birthday, idcard, qq, cancollect, cancomment,
						canlike, memberid);

				record = Db
						.findFirst(
								"select *,id as memberid from t_member where id = ? and rstate = 0",
								memberid);
				dataBean.setData(record.getColumns());
			}
		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}
}
