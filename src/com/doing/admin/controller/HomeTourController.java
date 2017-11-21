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
public class HomeTourController extends BaseController {

	public void index() { 
		
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		
		String type = getPara("type");
		
		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, 
				"select t.*,DATE_FORMAT(t.createtime,'%Y-%m-%d %H:%i:%s') as createtimes,"
				+ "(case when t.type = 1 then '跳转网页' when t.repairtype = 2 then '跳转商家' end) as types  "
				," from t_home_tour t where t.rstate = 0 and   t.type =  " +type+"  order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());
		
		setAttr("pageitem", PageSize_Default);

		setAttr("type", type);
		
		setAttr("tourlist", page.getList());

		render("/html/hometour/list.jsp");
	}
	public void add() {
		
		List<Record> list = Db
				.find("select * from t_seller where rstate = 0  order by id desc");

		setAttr("sellerlist", list);
		
		render("/html/hometour/add.jsp");
	}
	public void submit() {
		// 业主名称
		String ownername = StringUtils.defaultString(getPara("ownername"));
		// 业主联系方式
		String mobile = StringUtils.defaultString(getPara("mobile"));
		// 小区id
		String villageid = StringUtils.defaultString(getPara("villageid"));
		// 小区栋数
		String building = StringUtils.defaultString(getPara("building"));
		// 单元数
		String unit = StringUtils.defaultString(getPara("unit"));
		// 楼层数
		String floor = StringUtils.defaultString(getPara("floor"));
		// 门牌数
		String number = StringUtils.defaultString(getPara("number"));
		// 住房面积
		String housingarea = StringUtils.defaultString(getPara("housingarea"));
		// 装修情况
		String decoration = StringUtils.defaultString(getPara("decoration"));
		// 收楼情况
		String repossession = StringUtils.defaultString(getPara("repossession"));
		// 入住情况
		String checkstatus = StringUtils.defaultString(getPara("checkstatus"));
		
		
		List<Record> recordList = Db.find("select * from t_owner where ownername = ? and mobile = ? and building = ? and unit = ? and floor = ? and number = ? and villageid = ? and rstate = 0"
				,ownername,mobile,building,unit,floor,number,villageid);
		List<Record> recordList1 = Db.find("select * from t_owner where building = ? and unit = ? and floor = ? and number = ? and villageid = ? and rstate = 0"
				,building,unit,floor,number,villageid);
		if(recordList.size() == 0 && recordList1.size() == 0){
			Db.save("t_owner",
					new Record().set("ownername", ownername)
							.set("mobile", mobile)
							.set("villageid", villageid)
							.set("building", building)
							.set("unit", unit)
							.set("floor", floor)
							.set("number", number)
							.set("housingarea", housingarea)
							.set("decoration", decoration)
							.set("repossession", repossession)
							.set("checkstatus", checkstatus)
							.set("createtime", new Date()));
		}

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_tour");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = StringUtils.defaultString(getPara("id"));
		
		Record record = Db.findFirst("select * from t_owner where id = ?",
				id);

		List<Record> list = Db
				.find("select * from t_seller where rstate = 0  order by id desc");

		setAttr("sellerlist", list);
		
		
		if (record != null) {

			setAttrs(record.getColumns());

			render("/html/hometoru/edit.jsp");

		} else {

			renderJson(GsonUtils.toJson(setStatusError(null, false)));
		}

	}

	public void update() {

		String id = StringUtils.defaultString(getPara("id"));

		// 业主名称
		String ownername = StringUtils.defaultString(getPara("ownername"));
		// 业主联系方式
		String mobile = StringUtils.defaultString(getPara("mobile"));
		// 小区id
		String villageid = StringUtils.defaultString(getPara("villageid"));
		// 小区栋数
		String building = StringUtils.defaultString(getPara("building"));
		// 单元数
		String unit = StringUtils.defaultString(getPara("unit"));
		// 楼层数
		String floor = StringUtils.defaultString(getPara("floor"));
		// 门牌数
		String number = StringUtils.defaultString(getPara("number"));
		// 住房面积
		String housingarea = StringUtils.defaultString(getPara("housingarea"));
		// 装修情况
		String decoration = StringUtils.defaultString(getPara("decoration"));
		// 收楼情况
		String repossession = StringUtils.defaultString(getPara("repossession"));
		// 入住情况
		String checkstatus = StringUtils.defaultString(getPara("checkstatus"));
		
		Db.update(
				"update t_owner set ownername = ?, mobile = ?, villageid = ?, building = ?, unit = ?, floor = ? , number = ? , housingarea = ?,decoration = ? ,repossession = ?, checkstatus = ? where id = ?",
				ownername, mobile, villageid, building ,unit ,floor ,number ,housingarea ,decoration ,repossession ,checkstatus ,
				id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_tour");

		renderJson(GsonUtils.toJson(statusBean));
	}
	
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_home_tour set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_tour");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
	
}
