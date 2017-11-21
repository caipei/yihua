package com.doing.admin.controller;

import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.common.utils.Utils;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class MerchantController extends BaseController {
	/**
	 * 商家列表
	 */
	public void index() {
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default,
				"select * ", " from t_merchant ");
		setAttr("pageitem", PageSize_Default);
		setAttr("pageSize", page.getTotalPage());// 总共展示页数
		setAttr("totalSize", page.getTotalRow());// 数据库中数据总共的条数
		setAttr("pageCurrent", page.getPageNumber());
		setAttr("merchantList", page.getList());
		render("/html/merchant/list.jsp");
	}

	/**
	 * 商家详情
	 */
	public void detail() {
		String id = getPara("id");

		Record record = Db.findFirst(
				"select t.* from t_merchant as t where t.id = ?",
				new Object[] { id });

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/merchant/detail.jsp");
	}

	/**
	 * 商品列表
	 */
	public void productList() {
		String id = getPara("id");
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select t.* , s.kindname as kind",
						" from t_goods t left join t_kind as s on t.kindid = s.id where t.merid = ?",
						id);
		setAttr("pageitem", PageSize_Default);
		setAttr("pageSize", page.getTotalPage());// 总共展示页数
		setAttr("totalSize", page.getTotalRow());// 数据库中数据总共的条数
		setAttr("pageCurrent", page.getPageNumber());
		setAttr("productList", page.getList());
		setAttr("merchantId", id);

		render("/html/merchant/product/productList.jsp");
	}

	/**
	 * 订单详情
	 */
	public void orderDetail() {
		String id = getPara("id");
		Record record = Db
				.findFirst(
						"select t.*,m.username as memname , s.name as mername from t_order as t,t_merchant as s,t_member as m  where t.id = ? and t.merid = s.id and t.userid = m.id",
						new Object[] { id });
		if (record != null) {

			setAttrs(record.getColumns());
		}
		render("/html/merchant/order/orderDetail.jsp");

	}

	/**
	 * 订单列表
	 */
	public void orderList() {
		String id = getPara("id");
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select id,orderno,address,orderstatus,paytype,paymoney,createtime,send ",
						" from t_order where merid = ? and orderstatus in (5,6,8) ",
						id);
		setAttr("pageitem", PageSize_Default);
		setAttr("pageSize", page.getTotalPage());// 总共展示页数
		setAttr("totalSize", page.getTotalRow());// 数据库中数据总共的条数
		setAttr("pageCurrent", page.getPageNumber());
		setAttr("orderList", page.getList());
		setAttr("merchantId", id);
		render("/html/merchant/order/orderList.jsp");
	}
}
