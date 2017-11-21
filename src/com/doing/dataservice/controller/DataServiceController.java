package com.doing.dataservice.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;

import com.doing.common.utils.MessageSendUtil;
import com.doing.common.utils.Utils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class DataServiceController extends Controller {
	// 验证手机号是否存在
	public void checkmobile() {
		String mobile = Utils.getStrVal(getPara("mobile"));
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		Record record = Db.findFirst(
				"select count(id) as num from t_member where mobile = ? ",
				mobile);
		if (record != null && record.getLong("num") > 0) {
			resultHm.put("rescode", 1);
			resultHm.put("rescnt", "手机号码已注册");
		} else {
			resultHm.put("rescode", 0);
			resultHm.put("rescnt", "手机号码未注册");
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 发送验证码
	public void sendVerificationCode() {
		String mobile = Utils.getStrVal(getPara("mobile"));
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String code = Utils.getValidateCode(true, 4);
		String sendInfo = "@1@=" + code;
		boolean msg = true;
		try {
			MessageSendUtil messageSendUtil = new MessageSendUtil();
			msg = messageSendUtil.handleMsg(mobile, sendInfo, "JSM41349-0003");
		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (msg) {
			resultHm.put("rescode", 0);
			resultHm.put("code", code);
			resultHm.put("rescnt", "验证码发送成功");
		} else {
			resultHm.put("rescode", 1);
			resultHm.put("rescnt", "验证码发送失败");
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 登陆
	public void login() {

		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String username = Utils.getStrVal(getPara("username"));
		String password = Utils.getStrVal(getPara("password"));
		password = DigestUtils.md5Hex(password);
		String sql = "";
		if (Utils.isMobileNO(username)) {
			String sqlStr = "select id from t_member where mobile = ? ";
			Record record = Db.findFirst(sqlStr, username);
			if (record == null) {
				resultHm.put("rescode", 2);
				resultHm.put("rescnt", "用户名不存在");
			} else {
				sql = "select *"
						+ " from t_member t where t.mobile = ? and t.password = ?  ";
			}
		} else {
			String sqlStr = "select id from t_member where mobile = ? ";
			Record record = Db.findFirst(sqlStr, username);
			if (record == null) {
				resultHm.put("rescode", 2);
				resultHm.put("rescnt", "用户名不存在");
			} else {
				sql = "select *"
						+ " from t_member t where t.mobile = ? and t.password = ? ";
			}
		}

		if (!"".equals(sql)) {
			Record record = Db.findFirst(sql, username, password);
			if (record != null) {
				// 通知
				Record noticere = Db
						.findFirst(
								"select noticedetail from t_notice where villageid = ?",
								record.getInt("villageid"));
				if (noticere == null) {
					resultHm.put("noticedetail", "");
				} else {
					resultHm.put("noticedetail",
							noticere.getStr("noticedetail"));
				}
				// 未读缴费通知条数
				List<Record> list = Db
						.find("select * from t_rate_message where userid = ? and readtype = 1 ",
								record.getInt("id"));
				resultHm.put("ratenum", list.size());
				resultHm.put("rescode", 0);
				HashMap<String, Object> rescntHm = new HashMap<String, Object>();
				rescntHm.put("memberid", record.getInt("id"));
				rescntHm.put("username", record.getStr("username"));
				rescntHm.put("mobile", record.getStr("mobile"));
				rescntHm.put("villagename", record.getStr("villagename"));
				rescntHm.put("icon", record.getStr("icon"));
				rescntHm.put("sex", record.getInt("sex"));
				rescntHm.put("building", record.getStr("building"));
				rescntHm.put("unit", record.getStr("unit"));
				rescntHm.put("floor", record.getStr("floor"));
				rescntHm.put("number", record.getStr("number"));
				rescntHm.put("address", record.getStr("address"));
				rescntHm.put("housearea", record.getDouble("housearea"));
				resultHm.put("rescnt", rescntHm);
			} else {
				resultHm.put("rescode", 1);
				resultHm.put("rescnt", "密码错误");
			}
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 注册
	public void register() {

		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String mobile = Utils.getStrVal(getPara("mobile"));
		String password = Utils.getStrVal(getPara("password"));
		String villageid = Utils.getStrVal(getPara("villageid"));
		String username = Utils.getStrVal(getPara("username"));
		String building = Utils.getStrVal(getPara("building"));
		String unit = Utils.getStrVal(getPara("unit"));
		String floor = Utils.getStrVal(getPara("floor"));
		String number = Utils.getStrVal(getPara("number"));
		try {
			if (isMessyCode(username)) {
				username = new String(Utils.getStrVal(getPara("username"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(building)) {
				building = new String(Utils.getStrVal(getPara("building"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(unit)) {
				unit = new String(Utils.getStrVal(getPara("unit")).getBytes(
						"iso-8859-1"), "utf-8");
			}
			if (isMessyCode(floor)) {
				unit = new String(Utils.getStrVal(getPara("floor")).getBytes(
						"iso-8859-1"), "utf-8");
			}
			if (isMessyCode(number)) {
				unit = new String(Utils.getStrVal(getPara("number")).getBytes(
						"iso-8859-1"), "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		password = DigestUtils.md5Hex(password);

		List<Record> list = Db
				.find("select * from t_owner where ownername = ? and mobile = ? and villageid = ? and building = ? and unit = ? and floor = ? and number = ? and rstate = 0 ",
						username, mobile, villageid, building, unit, floor,
						number);

		if (list.size() > 0) {
			// 是小区内业主
			Record recordt = list.get(0);
			String idkey = getIdkey("t_member");
			Record records = Db.findById("t_village", villageid);
			String address = records.getStr("villagename") + " " + building
					+ "栋  " + unit + "单元 " + floor + "层 " + number + "室";
			Db.save("t_member",
					new Record().set("mobile", mobile)
							.set("password", password)
							.set("username", username)
							.set("housearea", recordt.get("housingarea"))
							.set("address", address)
							.set("villageid", villageid)
							.set("building", building).set("unit", unit)
							.set("floor", floor).set("number", number)
							.set("createtime", new Date()).set("id", idkey));
			Db.update("update t_owner set rstate = 2 where id = ?",
					recordt.getInt("id"));
			Record record = Db
					.findFirst(
							"select *, id as memberid from t_member where mobile = ? and password = ? ",
							mobile, password);
			// 通知
			Record noticere = Db.findFirst(
					"select noticedetail from t_notice where villageid = ?",
					record.getInt("villageid"));
			if (noticere == null) {
				resultHm.put("noticedetail", "");
			} else {
				resultHm.put("noticedetail", noticere.getStr("noticedetail"));
			}

			// 未读缴费通知条数
			List<Record> listrate = Db
					.find("select * from t_rate_message where userid = ? and readtype = 1 ",
							record.getInt("id"));
			resultHm.put("ratenum", listrate.size());
			resultHm.put("rescode", 0);
			HashMap<String, Object> rescntHm = new HashMap<String, Object>();
			rescntHm.put("memberid", record.getInt("id"));
			rescntHm.put("username", record.getStr("username"));
			rescntHm.put("mobile", record.getStr("mobile"));
			rescntHm.put("villagename", record.getStr("villagename"));
			rescntHm.put("icon", record.getStr("icon"));
			rescntHm.put("sex", record.getInt("sex"));
			rescntHm.put("building", record.getStr("building"));
			rescntHm.put("unit", record.getStr("unit"));
			rescntHm.put("floor", record.getStr("floor"));
			rescntHm.put("number", record.getStr("number"));
			rescntHm.put("address", record.getStr("address"));
			rescntHm.put("housearea", record.getDouble("housearea"));
			resultHm.put("rescnt", rescntHm);
			renderJson(Utils.toJson(resultHm));
		} else {
			resultHm.put("rescode", 1);
			resultHm.put("rescnt", "您的注册信息与物业等级信息不符，请核对后重新输入!");
			renderJson(Utils.toJson(resultHm));
		}

	}

	private synchronized String getIdkey(String table) {
		long idkey = 100001;
		String sql = "select max(id) as maxnum from " + table;
		Record record = Db.findFirst(sql);
		if (record != null) {
			idkey = Utils.getLongVal(record.get("maxnum"), 1000001);
			idkey = idkey + 1;
		}
		return String.valueOf(idkey);
	}

	// 更新用户信息
	public void changememinfo() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String icon = Utils.getStrVal(getPara("icon"));
		String sex = Utils.getStrVal(getPara("sex"));
		if (StringUtils.isNotBlank(icon)) {
			Db.update("update t_member set icon = ? where id = ?", icon,
					memberid);
		}
		if (StringUtils.isNotBlank(sex)) {
			Db.update("update t_member set sex = ? where id = ?", sex, memberid);
		}
		if (StringUtils.isNotBlank(icon)) {
			Db.update("update t_member set icon = ? where id = ?", icon,
					memberid);
		}
		Record record = Db
				.findFirst(
						"select *,id as memberid from t_member where id = ? ",
						memberid);
		// 通知
		Record noticere = Db.findFirst(
				"select noticedetail from t_notice where villageid = ?",
				record.getInt("villageid"));
		if (noticere == null) {
			resultHm.put("noticedetail", "");
		} else {
			resultHm.put("noticedetail", noticere.getStr("noticedetail"));
		}
		// 未读缴费通知条数
		List<Record> listrate = Db
				.find("select * from t_rate_message where userid = ? and readtype = 1 ",
						record.getInt("id"));
		resultHm.put("ratenum", listrate.size());
		resultHm.put("rescode", 0);
		HashMap<String, Object> rescntHm = new HashMap<String, Object>();
		rescntHm.put("memberid", record.getInt("id"));
		rescntHm.put("username", record.getStr("username"));
		rescntHm.put("mobile", record.getStr("mobile"));
		rescntHm.put("villagename", record.getStr("villagename"));
		rescntHm.put("icon", record.getStr("icon"));
		rescntHm.put("sex", record.getInt("sex"));
		rescntHm.put("building", record.getStr("building"));
		rescntHm.put("unit", record.getStr("unit"));
		rescntHm.put("floor", record.getStr("floor"));
		rescntHm.put("number", record.getStr("number"));
		rescntHm.put("address", record.getStr("address"));
		rescntHm.put("housearea", record.getDouble("housearea"));
		resultHm.put("rescnt", rescntHm);
		renderJson(Utils.toJson(resultHm));
	}

	// 重置密码
	public void updatePassword() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String username = Utils.getStrVal(getPara("username"));
		String password = Utils.getStrVal(getPara("password"));
		password = DigestUtils.md5Hex(password);
		Db.update("update t_member set password = ? where mobile = ? ",
				password, username);
		Record record = Db
				.findFirst(
						"select *,id as memberid from t_member where mobile = ? and password = ? ",
						username, password);

		// 通知
		Record noticere = Db.findFirst(
				"select noticedetail from t_notice where villageid = ?",
				record.getInt("villageid"));
		if (noticere == null) {
			resultHm.put("noticedetail", "");
		} else {
			resultHm.put("noticedetail", noticere.getStr("noticedetail"));
		}
		// 未读缴费通知条数
		List<Record> listrate = Db
				.find("select * from t_rate_message where userid = ? and readtype = 1 ",
						record.getInt("id"));
		resultHm.put("ratenum", listrate.size());
		resultHm.put("rescode", 0);
		HashMap<String, Object> rescntHm = new HashMap<String, Object>();
		rescntHm.put("memberid", record.getInt("id"));
		rescntHm.put("username", record.getStr("username"));
		rescntHm.put("mobile", record.getStr("mobile"));
		rescntHm.put("villagename", record.getStr("villagename"));
		rescntHm.put("icon", record.getStr("icon"));
		rescntHm.put("sex", record.getInt("sex"));
		rescntHm.put("building", record.getStr("building"));
		rescntHm.put("unit", record.getStr("unit"));
		rescntHm.put("floor", record.getStr("floor"));
		rescntHm.put("number", record.getStr("number"));
		rescntHm.put("address", record.getStr("address"));
		rescntHm.put("housearea", record.getDouble("housearea"));
		resultHm.put("rescnt", rescntHm);
		renderJson(Utils.toJson(resultHm));

	}

	// 刷新个人中心数据
	public void refreshData() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String userid = Utils.getStrVal(getPara("memberid"));

		Record record = Db
				.findFirst(
						"select *,id as memberid from t_member where id = ?  and rstate = 0",
						userid);

		// 通知
		Record noticere = Db.findFirst(
				"select noticedetail from t_notice where villageid = ?",
				record.getInt("villageid"));
		if (noticere == null) {
			resultHm.put("noticedetail", "");
		} else {
			resultHm.put("noticedetail", noticere.getStr("noticedetail"));
		}
		// 未读缴费通知条数
		List<Record> listrate = Db
				.find("select * from t_rate_message where userid = ? and readtype = 1 ",
						record.getInt("id"));
		resultHm.put("ratenum", listrate.size());
		resultHm.put("rescode", 0);
		HashMap<String, Object> rescntHm = new HashMap<String, Object>();
		rescntHm.put("memberid", record.getInt("id"));
		rescntHm.put("username", record.getStr("username"));
		rescntHm.put("mobile", record.getStr("mobile"));
		rescntHm.put("villagename", record.getStr("villagename"));
		rescntHm.put("icon", record.getStr("icon"));
		rescntHm.put("sex", record.getInt("sex"));
		rescntHm.put("building", record.getStr("building"));
		rescntHm.put("unit", record.getStr("unit"));
		rescntHm.put("floor", record.getStr("floor"));
		rescntHm.put("number", record.getStr("number"));
		rescntHm.put("address", record.getStr("address"));
		rescntHm.put("housearea", record.getDouble("housearea"));
		resultHm.put("rescnt", rescntHm);
		renderJson(Utils.toJson(resultHm));
	}

	// 意见反馈
	public void addfeedback() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String feedback = Utils.getStrVal(getPara("feedback"));
		try {
			if (isMessyCode(feedback)) {
				feedback = new String(Utils.getStrVal(getPara("feedback"))
						.getBytes("iso-8859-1"), "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String idkey = getIdkey("t_feedback");
		Db.save("t_feedback",
				new Record().set("userid", memberid).set("feedback", feedback)
						.set("createtime", new Date()).set("id", idkey));

		resultHm.put("rescode", 0);
		resultHm.put("rescnt", "意见提交成功");
		renderJson(Utils.toJson(resultHm));
	}

	// 添加投诉/建议接口
	public void addadvise() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		// 添加类别 1 投诉 2 建议
		String advisetype = Utils.getStrVal(getPara("advisetype"));
		// 投诉类别 1设备类别 2 管理服务类别 3 收费类别 4 突发事件 如果是建议 则投诉类别为-1
		String complaintstype = Utils.getStrVal(getPara("complaintstype"));
		// 内容
		String content = Utils.getStrVal(getPara("content"));
		try {
			if (isMessyCode(content)) {
				content = new String(Utils.getStrVal(getPara("content"))
						.getBytes("iso-8859-1"), "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Record record = Db.findById("t_member", memberid);
		Record villagere = Db.findById("t_village", record.getInt("villageid"));
		if (advisetype.equals("1")) {
			// 添加投诉
			String idkey = getIdkey("t_property_complaints");
			Db.save("t_property_complaints",
					new Record().set("userid", memberid)
							.set("complaintstype", complaintstype)
							.set("complaintscontent", content)
							.set("createtime", new Date())
							.set("villageid", record.getInt("villageid"))
							.set("propertyid", villagere.getInt("propertyid"))
							.set("id", idkey));
			resultHm.put("rescnt", "添加投诉成功");
		} else if (advisetype.equals("2")) {
			// 添加建议
			String idkey = getIdkey("t_advise");
			Db.save("t_advise",
					new Record().set("userid", memberid).set("advise", content)
							.set("createtime", new Date())
							.set("villageid", record.getInt("villageid"))
							.set("propertyid", villagere.getInt("propertyid"))
							.set("id", idkey));
			resultHm.put("rescnt", "添加建议成功");
		}
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 报修列表
	public void repairlist() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));

		List<Record> recordlist = Db
				.find("select * from t_property_repair where userid = ? and rstate <> 4 ",
						memberid);
		HashMap<String, Object> listHm = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> hm = new HashMap<String, Object>();
		for (int i = 0; i < recordlist.size(); i++) {
			Record record = recordlist.get(i);
			hm = new HashMap<String, Object>();
			hm.put("repairid", record.getInt("id"));
			hm.put("repairtype", record.getInt("repairtype"));
			// 状态 1 待处理 2 处理中3 已解决4 删除
			hm.put("repairstatus", record.getInt("rstate"));
			hm.put("content", record.getStr("content"));
			hm.put("createtime ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(record.getDate("createtime")));
			list.add(hm);
		}
		listHm.put("list", list);
		resultHm.put("rescnt", listHm);
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 报修详情
	public void repairdetail() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String repairid = Utils.getStrVal(getPara("repairid"));
		// 报修信息
		Record record = Db.findById("t_property_repair", repairid);
		// 用户信息
		Record memrecord = Db.findById("t_member", memberid);

		// 维修图片列表
		List<Record> imagelist = Db.find(
				"select * from t_repair_image where repairid = ?", repairid);

		HashMap<String, Object> listHm = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> hm = new HashMap<String, Object>();
		for (int i = 0; i < imagelist.size(); i++) {
			Record records = imagelist.get(i);
			hm = new HashMap<String, Object>();
			hm.put("imageid", records.getInt("id"));
			hm.put("imageurl", records.getStr("imageurl"));
			list.add(hm);
		}
		listHm.put("list", list);
		resultHm.put("rescnt", listHm);
		resultHm.put("rescode", 0);
		resultHm.put("repairid", record.getInt("id"));
		resultHm.put("repairtype", record.getInt("repairtype"));
		// 状态 1 待处理 2 处理中3 已解决4 删除
		resultHm.put("repairstatus", record.getInt("rstate"));
		resultHm.put("content", record.getStr("content"));
		resultHm.put("repairname", record.getStr("repairname"));
		resultHm.put("repairmobile", record.getStr("repairtelephone"));
		resultHm.put("address", memrecord.getStr("address"));
		resultHm.put("createtime ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(record.getDate("createtime")));
		renderJson(Utils.toJson(resultHm));
	}

	// 添加报修信息
	public void addrepair() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String repairname = Utils.getStrVal(getPara("repairname"));
		String repairmobile = Utils.getStrVal(getPara("repairmobile"));
		String repairtype = Utils.getStrVal(getPara("repairtype"));
		String content = Utils.getStrVal(getPara("content"));
		String image1 = Utils.getStrVal(getPara("image1"));
		String image2 = Utils.getStrVal(getPara("image2"));
		String image3 = Utils.getStrVal(getPara("image3"));
		String image4 = Utils.getStrVal(getPara("image4"));

		try {
			if (isMessyCode(repairname)) {
				repairname = new String(Utils.getStrVal(getPara("repairname"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(content)) {
				content = new String(Utils.getStrVal(getPara("content"))
						.getBytes("iso-8859-1"), "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 用户信息
		Record record = Db.findById("t_member", memberid);
		// 小区信息
		Record recordt = Db.findById("t_village", record.getInt("villageid"));

		String idkey = getIdkey("t_property_repair");

		Db.save("t_property_repair",
				new Record().set("userid", memberid)
						.set("repairtelephone", repairmobile)
						.set("repairtype", repairtype).set("content", content)
						.set("createtime", new Date())
						.set("villageid", record.getInt("villageid"))
						.set("propertyid", recordt.getInt("propertyid"))
						.set("repairname", repairname).set("id", idkey));
		if (!image1.equals("-1")) {
			String idkeyimage = getIdkey("t_repair_image");
			Db.save("t_repair_image",
					new Record().set("repairid", idkey).set("imageurl", image1)
							.set("id", idkeyimage)
							.set("createtime", new Date()));
		}
		if (!image2.equals("-1")) {
			String idkeyimage = getIdkey("t_repair_image");
			Db.save("t_repair_image",
					new Record().set("repairid", idkey).set("imageurl", image2)
							.set("id", idkeyimage)
							.set("createtime", new Date()));
		}
		if (!image3.equals("-1")) {
			String idkeyimage = getIdkey("t_repair_image");
			Db.save("t_repair_image",
					new Record().set("repairid", idkey).set("imageurl", image3)
							.set("id", idkeyimage)
							.set("createtime", new Date()));
		}
		if (!image4.equals("-1")) {
			String idkeyimage = getIdkey("t_repair_image");
			Db.save("t_repair_image",
					new Record().set("repairid", idkey).set("imageurl", image4)
							.set("id", idkeyimage)
							.set("createtime", new Date()));
		}
		resultHm.put("rescode", 0);
		resultHm.put("rescnt", "报修信息提交成功");
		renderJson(Utils.toJson(resultHm));
	}

	// 删除报修信息
	public void delrepair() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String repairid = Utils.getStrVal(getPara("repairid"));
		Db.update(
				"update t_property_repair set rstate = 4 where id = ? and userid = ?",
				repairid, memberid);
		Db.update("delete from  t_repair_image where repairid = ?", repairid);
		resultHm.put("rescode", 0);
		resultHm.put("rescnt", "删除报修信息成功");
		renderJson(Utils.toJson(resultHm));

	}

	// 处理报修问题
	public void handlerepair() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String repairid = Utils.getStrVal(getPara("repairid"));
		// 1已解决 2未解决
		String handletype = Utils.getStrVal(getPara("handletype"));
		String rstate = "";
		if (handletype.equals("1")) {
			// 已解决
			rstate = "3";
		} else if (handletype.equals("2")) {
			// 未解决
			rstate = "1";
		}

		Db.update(
				"update t_property_repair set rstate = ? where id =? and userid = ?",
				rstate, repairid, memberid);

		resultHm.put("rescode", 0);
		resultHm.put("rescnt", "处理报修信息成功");
		renderJson(Utils.toJson(resultHm));

	}

	// 缴费提醒列表
	public void ratemessagelist() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));

		List<Record> recordlist = Db.find(
				"select * from t_rate_message where userid = ?", memberid);

		HashMap<String, Object> listHm = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> hm = new HashMap<String, Object>();
		for (int i = 0; i < recordlist.size(); i++) {
			Record record = recordlist.get(i);
			hm = new HashMap<String, Object>();
			hm.put("rateid", record.getInt("id"));
			hm.put("messagetitle", record.getStr("messagetitle"));
			hm.put("ratecost", record.getDouble("ratecost"));
			hm.put("username", record.getStr("username"));
			hm.put("address", record.getStr("address"));
			// 消息类别 1水费 2电费 3 煤气费 4 物业费
			hm.put("type", record.getInt("type"));
			hm.put("companyname", record.getStr("companyname"));
			hm.put("rateno", record.getStr("rateno"));
			// 阅读状态 1未读 2已读
			hm.put("readtype", record.getInt("readtype"));
			hm.put("createtime ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(record.getDate("createtime")));
			list.add(hm);
		}
		listHm.put("list", list);
		resultHm.put("rescnt", listHm);
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 阅读缴费提醒接口 此接口是点击缴费提醒所进入的页面
	public void readratemessage() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String rateid = Utils.getStrVal(getPara("rateid"));

		Record memberrecord = Db.findById("t_member", memberid);

		Record record = Db.findById("t_rate_message", rateid);

		Db.update(
				"update t_rate_message set readtype = 2 where id =? and readtype = 1",
				rateid);
		Double cost = 0.0;
		// 消息类别 1水费 2电费 3 煤气费 4 物业费
		if (record.getInt("type") == 1) {
			// 水费 查看用户水费欠费多少
			cost = memberrecord.getDouble("waterrate");
		} else if (record.getInt("type") == 2) {
			// 电费 查看用户电费欠费多少
			cost = memberrecord.getDouble("powerrate");
		} else if (record.getInt("type") == 3) {
			// 煤气费 查看用户煤气费欠费多少
			cost = memberrecord.getDouble("gasrates");
		} else if (record.getInt("type") == 4) {
			// 物业费 查看用户物业费是否欠费
			if (memberrecord.getInt("profeeneed") == 1) {
				cost = record.getDouble("ratecost");
			}
		}

		resultHm.put("rateid", record.getInt("id"));
		resultHm.put("housearea", memberrecord.getDouble("housearea"));
		resultHm.put("profeetime", memberrecord.getStr("profeetime"));
		resultHm.put("username", record.getStr("username"));
		resultHm.put("address", record.getStr("address"));
		resultHm.put("ratecost", cost);
		resultHm.put("companyname", record.getStr("companyname"));
		resultHm.put("rateno", record.getStr("rateno"));
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 立即缴费接口 从缴费提醒处进入的接口
	public void addbillbymessage() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String rateid = Utils.getStrVal(getPara("rateid"));
		String paytype = Utils.getStrVal(getPara("paytype"));
		// 缴费提醒信息
		Record record = Db.findById("t_rate_message", rateid);
		// 生成订单号
		String result = "";
		Random random = new Random();
		for (int i = 0; i < 6; i++) {
			result += random.nextInt(10);
		}
		String orderno = new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()) + result;

		// 小区信息
		Record villrecord = Db
				.findById("t_village", record.getInt("villageid"));

		String idkey = getIdkey("t_user_bill");

		String paymentinstruction = "";

		if (record.getInt("type") == 1) {
			paymentinstruction = "水费清单";
		} else if (record.getInt("type") == 2) {
			paymentinstruction = "电费清单";
		} else if (record.getInt("type") == 3) {
			paymentinstruction = "煤气费清单";
		} else if (record.getInt("type") == 4) {
			paymentinstruction = "物业费清单";
		}

		Db.save("t_user_bill",
				new Record().set("userid", memberid)
						.set("propertyid", villrecord.getInt("propertyid"))
						.set("villageid", record.getInt("villageid"))
						.set("paytype", paytype)
						.set("paymentinstruction", paymentinstruction)
						.set("paymentno", record.getStr("rateno"))
						.set("billno", orderno)
						.set("cost", record.getDouble("ratecost"))
						.set("billtype", record.getInt("type"))
						.set("createtime", new Date()).set("rateid", rateid)
						.set("id", idkey));
		resultHm.put("orderno", orderno);
		resultHm.put("rescnt", "已生成账单");
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));

	}

	// 判定用户是否需要完善水费信息。煤气费信息，电费信息接口
	public void checkmemberrate() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		// 1水费 2电费 3 燃气费
		String ratetype = Utils.getStrVal(getPara("ratetype"));

		Record record = Db.findById("t_member", memberid);

		String companyname = "";

		String rateno = "";

		Double ratecost = 0.0;

		if (ratetype.equals("1")) {
			// 水费判定是否有水费公司和水费缴费号
			companyname = record.getStr("watercompany");
			rateno = record.getStr("waterno");
			if (StringUtils.isBlank(companyname) || StringUtils.isBlank(rateno)) {
				// 公司名和缴费号有一个为空
				resultHm.put("rescode", 1);
				resultHm.put("rescnt", "用户需要完善水费缴纳信息");
			} else {
				ratecost = record.getDouble("waterrate");
				resultHm.put("username", record.getStr("username"));
				resultHm.put("address", record.getStr("address"));
				resultHm.put("ratecost", ratecost);
				resultHm.put("companyname", companyname);
				resultHm.put("rateno", rateno);
				resultHm.put("rescode", 0);
			}
		} else if (ratetype.equals("2")) {
			companyname = record.getStr("powercompany");
			rateno = record.getStr("powerno");
			if (StringUtils.isBlank(companyname) || StringUtils.isBlank(rateno)) {
				// 公司名和缴费号有一个为空
				resultHm.put("rescode", 1);
				resultHm.put("rescnt", "用户需要完善电费缴纳信息");
			} else {
				ratecost = record.getDouble("powerrate");
				resultHm.put("username", record.getStr("username"));
				resultHm.put("address", record.getStr("address"));
				resultHm.put("ratecost", ratecost);
				resultHm.put("companyname", companyname);
				resultHm.put("rateno", rateno);
				resultHm.put("rescode", 0);
			}
		} else if (ratetype.equals("3")) {
			companyname = record.getStr("gascompany");
			rateno = record.getStr("gasno");
			if (StringUtils.isBlank(companyname) || StringUtils.isBlank(rateno)) {
				// 公司名和缴费号有一个为空
				resultHm.put("rescode", 1);
				resultHm.put("rescnt", "用户需要完善煤气费缴纳信息");
			} else {
				ratecost = record.getDouble("gasrates");
				resultHm.put("username", record.getStr("username"));
				resultHm.put("address", record.getStr("address"));
				resultHm.put("ratecost", ratecost);
				resultHm.put("companyname", companyname);
				resultHm.put("rateno", rateno);
				resultHm.put("rescode", 0);
			}
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 完善缴费信息接口
	public void perfectmemberrate() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String companyname = Utils.getStrVal(getPara("companyname"));
		String rateno = Utils.getStrVal(getPara("rateno"));
		// 1水费 2电费 3 燃气费
		String ratetype = Utils.getStrVal(getPara("ratetype"));

		try {
			if (isMessyCode(companyname)) {
				companyname = new String(Utils
						.getStrVal(getPara("companyname")).getBytes(
								"iso-8859-1"), "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Double ratecost = 0.0;

		Record record = Db.findById("t_member", memberid);
		if (ratetype.equals("1")) {
			// 保存用户水费缴纳公司和缴纳号码信息
			Db.update(
					"update t_member set watercompany = ?,waterno = ? where id = ?",
					companyname, rateno, memberid);
			ratecost = record.getDouble("waterrate");
		} else if (ratetype.equals("2")) {
			// 保存用户电费缴纳公司和缴纳号码信息
			Db.update(
					"update t_member set powercompany = ?,powerno = ? where id = ?",
					companyname, rateno, memberid);
			ratecost = record.getDouble("powerrate");
		} else if (ratetype.equals("3")) {
			// 保存用户燃气费缴纳公司和缴纳号码信息
			Db.update(
					"update t_member set gascompany = ?,gasno = ? where id = ?",
					companyname, rateno, memberid);
			ratecost = record.getDouble("gasrates");
		}

		resultHm.put("username", record.getStr("username"));
		resultHm.put("address", record.getStr("address"));
		resultHm.put("ratecost", ratecost);
		resultHm.put("companyname", companyname);
		resultHm.put("rateno", rateno);
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 立即缴纳支付 从缴费信息进入 无rateid传递
	public void addbillbymember() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String ratecost = Utils.getStrVal(getPara("ratecost"));
		String paytype = Utils.getStrVal(getPara("paytype"));
		String ratetype = Utils.getStrVal(getPara("ratetype"));

		// 缴费提醒信息
		Record record = Db.findById("t_member", memberid);
		// 生成订单号
		String result = "";
		Random random = new Random();
		for (int i = 0; i < 6; i++) {
			result += random.nextInt(10);
		}
		String orderno = new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()) + result;

		// 小区信息
		Record villrecord = Db
				.findById("t_village", record.getInt("villageid"));

		String idkey = getIdkey("t_user_bill");

		String paymentinstruction = "";
		String paymentno = "";

		if (ratetype.equals("1")) {
			paymentinstruction = "水费清单";
			paymentno = record.getStr("waterno");
		} else if (ratetype.equals("2")) {
			paymentinstruction = "电费清单";
			paymentno = record.getStr("powerno");
		} else if (ratetype.equals("3")) {
			paymentinstruction = "煤气费清单";
			paymentno = record.getStr("gasno");
		} else if (ratetype.equals("4")) {
			paymentinstruction = "物业费清单";
		}

		Db.save("t_user_bill",
				new Record().set("userid", memberid)
						.set("propertyid", villrecord.getInt("propertyid"))
						.set("villageid", record.getInt("villageid"))
						.set("paytype", paytype)
						.set("paymentinstruction", paymentinstruction)
						.set("paymentno", paymentno).set("billno", orderno)
						.set("cost", Double.valueOf(ratecost))
						.set("billtype", ratetype)
						.set("createtime", new Date()).set("id", idkey));
		resultHm.put("orderno", orderno);
		resultHm.put("rescnt", "已生成账单");
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 支付成功接口
	public void paysuccess() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String orderno = Utils.getStrVal(getPara("orderno"));

		Record record = Db.findById("t_user_bill", "billno", orderno);
		// 账单类别 1水费 2电费 3燃气费 4物业费
		Integer type = record.getInt("billtype");

		if (type == 1) {
			// 水费缴纳成功 需要更新用户表内的欠费金额为0且用户不需要缴纳水费。
			Db.update(
					"update t_member set waterrate = 0 ,waterneed = 2 where id = ?",
					memberid);
		} else if (type == 2) {
			// 电费缴纳成功 需要更新用户表内的欠费金额为0且用户不需要缴纳电费。
			Db.update(
					"update t_member set powerrate = 0 ,powerneed = 2 where id = ?",
					memberid);
		} else if (type == 3) {
			// 煤气费缴纳成功 需要更新用户表内的欠费金额为0且用户不需要缴纳煤气费。
			Db.update(
					"update t_member set gasrates = 0 ,gasneed = 2 where id = ?",
					memberid);
		} else if (type == 4) {
			// 物业费缴纳成功 需要更新用户表不需要缴纳物业费
			Db.update(
					"update t_member set profeeneed = 2, profeetime = null where id = ?",
					memberid);
		}
		// 更新账单表的状态为支付成功。
		Db.update("update t_user_bill set rstate = 2 where billno = ?", orderno);
		resultHm.put("rescnt", "支付成功");
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 物业费菜单点击
	public void propertyrate() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		// 用户信息
		Record record = Db.findById("t_member", memberid);
		// 小区物业费信息
		List<Record> list = Db
				.find("select * from t_village_profee where villageid = ? and rstate = 0",
						record.getInt("villageid"));
		// 物业公司信息
		Record prorecord = Db.findById("t_property",
				list.get(0).getInt("propertyid"));

		Double profee = 0.0;

		if (list.size() > 0 && record.getInt("profeeneed") == 1) {
			Record recordfee = list.get(0);
			// 物业费计算
			profee = record.getDouble("housearea")
					* recordfee.getDouble("profee");
		}
		resultHm.put("username", record.getStr("username"));
		resultHm.put("address", record.getStr("address"));
		resultHm.put("ratecost", profee);
		resultHm.put("housearea", record.getDouble("housearea"));
		resultHm.put("companyname", prorecord.getStr("propertyname"));
		resultHm.put("profeetime", record.getStr("profeetime"));
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));

	}

	// 个人中心我的账单
	public void mybilllist() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String type = Utils.getStrVal(getPara("type"));

		String sql = "select * from t_user_bill where userid = '" + memberid
				+ "' and  rstate <> 3 ";

		if (!type.equals("-1")) {
			sql += " and billtype = '" + type + "'";
		}

		List<Record> recordList = Db.find(sql);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		resultHm.put("rescode", 0);
		HashMap<String, Object> listHm = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record trecord : recordList) {
			hm = new HashMap<String, Object>();
			hm.put("billid", trecord.getInt("id"));
			hm.put("billstatus", trecord.getInt("rstate"));
			hm.put("billcost", trecord.getDouble("cost"));
			hm.put("billtype", trecord.getInt("billtype"));
			hm.put("rateno", trecord.getStr("paymentno"));
			String createtime = new SimpleDateFormat("MM-dd").format(trecord
					.getDate("createtime"));
			hm.put("createtime", createtime);
			list.add(hm);

		}
		listHm.put("list", list);
		resultHm.put("rescnt", listHm);
		renderJson(Utils.toJson(resultHm));

	}

	// 账单详情
	public void billdetail() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String billid = Utils.getStrVal(getPara("billid"));

		// 账单信息
		Record billrecord = Db.findById("t_user_bill", billid);

		resultHm.put("paytype", billrecord.getInt("paytype"));
		resultHm.put("paymentinstruction",
				billrecord.getStr("paymentinstruction"));
		resultHm.put("paymentno", billrecord.getStr("paymentno"));
		resultHm.put("orderno", billrecord.getStr("billno"));
		resultHm.put("createtime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(billrecord.getDate("createtime")));
		resultHm.put("cost", billrecord.getDouble("cost"));
		resultHm.put("billstatus", billrecord.getInt("rstate"));
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 删除账单
	public void deletebill() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String memberid = Utils.getStrVal(getPara("memberid"));
		String billid = Utils.getStrVal(getPara("billid"));

		Db.update("update t_user_bill set rstate = 3 where id = ?", billid);

		resultHm.put("rescnt", "删除成功");
		resultHm.put("rescode", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 小区列表
	public void villagelist() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();

		String sql = "select * from t_village where rstate = 0  ";

		List<Record> recordList = Db.find(sql);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		resultHm.put("rescode", 0);
		HashMap<String, Object> listHm = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record trecord : recordList) {
			hm = new HashMap<String, Object>();
			hm.put("villageid", trecord.getInt("id"));
			hm.put("villagename", trecord.getStr("villagename"));
			list.add(hm);

		}
		listHm.put("list", list);
		resultHm.put("rescnt", listHm);
		renderJson(Utils.toJson(resultHm));

	}

	public static boolean isChinese(char c) {
		Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
		if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
				|| ub == Character.UnicodeBlock.GENERAL_PUNCTUATION
				|| ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
				|| ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
			return true;
		}
		return false;
	}

	public static boolean isMessyCode(String strName) {
		Pattern p = Pattern.compile("\\s*|\t*|\r*|\n*");
		Matcher m = p.matcher(strName);
		String after = m.replaceAll("");
		String temp = after.replaceAll("\\p{P}", "");
		char[] ch = temp.trim().toCharArray();
		float chLength = ch.length;
		float count = 0;
		for (int i = 0; i < ch.length; i++) {
			char c = ch[i];
			if (!Character.isLetterOrDigit(c)) {

				if (!isChinese(c)) {
					count = count + 1;
					System.out.print(c);
				}
			}
		}
		float result = count / chLength;
		if (result > 0.4) {
			return true;
		} else {
			return false;
		}

	}

}
