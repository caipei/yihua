package com.doing.admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
public class MemberProController extends BaseController {

	public void index() {

		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select t.*,(case when t.sex = 1 then '男' when t.sex = 2 then '女' end) as sexs, s.villagename ",
						" from t_member t, t_property a, t_village s  where t.villageid = s.id and a.id = s.propertyid and a.id = '"
								+ propertyid
								+ "' and  t.rstate = 0   order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("userlist", page.getList());

		render("/html/memberpro/list.jsp");
	}

	public void memberrate() {
		String id = getPara("id");

		Record record = Db
				.findFirst(
						"select t.*, t.id as userid, s.villagename from t_member t left join t_village s  on t.villageid = s.id  and t.id = ?",
						new Object[] { id });

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/memberpro/rate.jsp");
	}

	public void submit() {
		String id = StringUtils.defaultString(getPara("id"));
		// 水费欠费
		double waterrate = Utils.getDoubleVal(getPara("waterrate"), 0.0d);
		// 电费钱飞
		double powerrate = Utils.getDoubleVal(getPara("powerrate"), 0.0d);
		// 煤气费欠费
		double gasrates = Utils.getDoubleVal(getPara("gasrates"), 0.0d);
		// 缴纳水费
		int waterneed = Utils.getIntVal(getPara("waterneed_sel"), 2);
		// 缴纳电费
		int powerneed = Utils.getIntVal(getPara("powerneed_sel"), 2);
		// 缴纳煤气费
		int gasneed = Utils.getIntVal(getPara("gasneed_sel"), 2);
		// 缴纳物业费
		int profeeneed = Utils.getIntVal(getPara("profeeneed_sel"), 2);
		// 物业费缴纳开始时间
		String profeestarttime = StringUtils.defaultString(getPara("profeestarttime"));


		Record record = Db.findById("t_member", id);

		// 缴纳水费 则要保存一条message消息记录
		if (waterneed == 1) {
			// 需要缴纳水费
			List<Record> relist = Db.find("select * from t_rate_message where userid = ? and type = 1 ",id);
			if(relist.size() > 0){
				Db.update("update t_rate_message set ratecost = ?, readtype = 1, createtime = ? where id = ?",waterrate,new Date(),relist.get(0).get("id"));
			}else{
				Db.save("t_rate_message",
						new Record().set("userid", id)
								.set("messagetitle", "水费缴纳提醒")
								.set("villageid", record.get("villageid"))
								.set("companyname", record.get("watercompany"))
								.set("rateno", record.get("waterno"))
								.set("ratecost", waterrate)
								.set("username", record.get("username"))
								.set("address", record.get("address"))
								.set("type", 1).set("createtime", new Date()));
			}
			Db.update(
					"update t_member set waterrate = ?, waterneed = ? where id = ?",
					waterrate,waterneed, id);

		}
		// 缴纳电费则要保存一条message消息记录
		if (powerneed == 1) {
			// 需要缴纳电费
			List<Record> relist = Db.find("select * from t_rate_message where userid = ? and type = 2",id);
			if(relist.size() > 0){
				Db.update("update t_rate_message set ratecost = ?, readtype = 1, createtime = ? where id = ?",powerrate,new Date(),relist.get(0).get("id"));
			}else{
				Db.save("t_rate_message",
						new Record().set("userid", id)
								.set("messagetitle", "电费缴纳提醒")
								.set("villageid", record.get("villageid"))
								.set("companyname", record.get("powercompany"))
								.set("rateno", record.get("powerno"))
								.set("ratecost", powerrate)
								.set("username", record.get("username"))
								.set("address", record.get("address"))
								.set("type", 2).set("createtime", new Date()));
			}
			Db.update(
					"update t_member set  powerrate = ?, powerneed = ? where id = ?",
				    powerrate, powerneed, id);
		}
		// 缴纳煤气费则要保存一条message消息记录
		if (gasneed == 1) {
			// 需要缴纳煤气费
			List<Record> relist = Db.find("select * from t_rate_message where userid = ? and type = 3",id);
			if(relist.size() > 0){
				Db.update("update t_rate_message set ratecost = ?, readtype = 1, createtime = ? where id = ?",gasrates,new Date(),relist.get(0).get("id"));
			}else{
				Db.save("t_rate_message",
						new Record().set("userid", id)
								.set("messagetitle", "煤气费缴纳提醒")
								.set("villageid", record.get("villageid"))
								.set("companyname", record.get("gascompany"))
								.set("rateno", record.get("gasno"))
								.set("ratecost", gasrates)
								.set("username", record.get("username"))
								.set("address", record.get("address"))
								.set("type", 3).set("createtime", new Date()));
			}
			Db.update(
					"update t_member set  gasrates = ?, gasneed = ? where id = ?",
					 gasrates, gasneed,
					 id);
		}
		// 缴纳物业费则要保存一条message消息记录
		if (profeeneed == 1) {
			List<Record> records = Db.find("select profee from t_village_profee where villageid = ?",record.get("villageid"));
			double profee = 0.0;
			if(records.size() > 0){
				profee = records.get(0).getDouble("profee");
			}
			Record recordt = Db.findById("t_village", record.getInt("villageid"));
			Record prorecord = Db.findById("t_property", recordt.getInt("propertyid"));
			// 物业费缴纳结束时间
			Date starttime = new Date();
			try {
				starttime = new SimpleDateFormat("yyyy-MM-dd").parse(profeestarttime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Calendar c = Calendar.getInstance();
			c.setTime(starttime);
			c.add(c.YEAR, 1);
			c.add(c.DAY_OF_YEAR, -1);
			String profeeendtime = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());

			// 需要缴纳物业费
			List<Record> relist = Db.find("select * from t_rate_message where userid = ? and type = 4",id);
			if(relist.size() > 0){
				Db.update("update t_rate_message set ratecost = ?, readtype = 1, createtime = ? where id = ?",record.getDouble("housearea") * profee,new Date(),relist.get(0).get("id"));
			}else{
				Db.save("t_rate_message",
						new Record().set("userid", id)
								.set("messagetitle", "物业费缴纳提醒")
								.set("villageid", record.get("villageid"))
								.set("companyname", prorecord.get("propertyname"))
								.set("ratecost", record.getDouble("housearea") * profee)
								.set("username", record.get("username"))
								.set("address", record.get("address"))
								.set("type", 4).set("createtime", new Date()));
			}
			Db.update(
					"update t_member set  profeeneed = ?,profeetime = ? where id = ?",
					profeeneed, profeestarttime+"至"+profeeendtime,id);
		}


		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_member_pro");

		renderJson(GsonUtils.toJson(statusBean));
	}

}
