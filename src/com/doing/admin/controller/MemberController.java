package com.doing.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.ExportExcelUtil;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class MemberController extends BaseController {

	public void index() {

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select t.*,(case when t.sex = 1 then '男' when t.sex = 2 then '女' end) as sexs, s.villagename",
						" from t_member t left join t_village s  on  t.villageid = s.id  and  t.rstate = 0   order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("userlist", page.getList());

		render("/html/member/list.jsp");
	}

	public void detail() {
		String id = getPara("id");

		Record record = Db
				.findFirst(
						"select t.*, t.id as userid, s.villagename from t_member t left join t_village s  on t.villageid = s.id and t.rstate = 0    and t.id = ?",
						new Object[] { id });

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/member/detail.jsp");
	}

	public void billlist() {
		String id = getPara("id");

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						" select t1.*,(case when t1.paytype = 1 then '支付宝支付' when t1.paytype = 2 then '微信支付' end ) as paytypes ,(case when t1.rstate = 1 then '未支付' when t1.rstate = 2 then '已支付' end ) as rstates,"
								+ "(case when t1.billtype = 1 then '水费' when t1.billtype = 2 then '电费' when t1.billtype = 3 then '煤气费' when t1.billtype = 4 then '物业费' end ) as billtypes,s.username ",
						" from t_user_bill t1, t_member s where t1.userid = s.id and  t1.userid = ?"
								+ " order by t1.id desc", id);

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("memberid", id);

		setAttr("pageitem", PageSize_Default);

		setAttr("billlist", page.getList());

		render("/html/member/billlist.jsp");
	}

	public void exportExcel() {
		HttpServletResponse response = getResponse();

		String id = getPara("memberid");

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						" select t1.*,(case when t1.paytype = 1 then '支付宝支付' when t1.paytype = 2 then '微信支付' end ) as paytypes ,(case when t1.rstate = 1 then '未支付' when t1.rstate = 2 then '已支付' end ) as rstates,"
								+ "(case when t1.billtype = 1 then '水费' when t1.billtype = 2 then '电费' when t1.billtype = 3 then '煤气费' when t1.billtype = 4 then '物业费' end ) as billtypes,s.username ",
						" from t_user_bill t1, t_member s where t1.userid = s.id and  t1.userid = ?"
								+ " order by t1.id desc", id);

		String[] columns = new String[] { "业主姓名", "账单号", "账单说明", "账单类型",
				"支付方式", "账单状态", "支付金额" };

		String[] propertyNames = new String[] { "username", "billno",
				"billtypes", "paymentinstruction", "paytypes", "rstates",
				"cost" };
		// rstates:已支付, userid:1000005, propertyid:2, cost:14.0,
		// createtime:2016-12-29 17:46:53.0, id:42, username:褚柏宁, billtype:3,
		// paymentinstruction:煤气费清单, paytype:1, paymentno:1101, villageid:2,
		// billtypes:煤气费, paytypes:支付宝支付, rateid:null,
		// billno:20161229174652142808, rstate:2},
		// com.jfinal.plugin.activerecord.Record@b1ecb7e8 {rstates:已支付,
		// userid:1000005, propertyid:2, cost:13.0, createtime:2016-12-29
		// 17:46:39.0, id:41, username:褚柏宁, billtype:2, paymentinstruction:电费清单,
		// paytype:1, paymentno:1101, villageid:2, billtypes:电费, paytypes:支付宝支付,
		// rateid:null, billno:20161229174638302155, rstate:2},
		// com.jfinal.plugin.activerecord.Record@b699bb02 {rstates:已支付,
		// userid:1000005, propertyid:2, cost:12.0, createtime:2016-12-29
		// 17:46:09.0, id:40, username:褚柏宁, billtype:1, paymentinstruction:水费清单,
		// paytype:1, paymentno:1101, villageid:2, billtypes:水费, paytypes:支付宝支付,
		// rateid:null, billno:20161229174609515050, rstate:2},
		// com.jfinal.plugin.activerecord.Record@8228f962 {rstates:已支付,
		// userid:1000005, propertyid:2, cost:300.0, createtime:2016-12-29
		// 15:50:37.0, id:37, username:褚柏宁, billtype:4,
		// paymentinstruction:物业费清单, paytype:2, paymentno:, villageid:2,
		// billtypes:物业费, paytypes:微信支付, rateid:null,
		// billno:20161229155036927824, rstate:2},
		// com.jfinal.plugin.activerecord.Record@7a8eda22 {rstates:已支付,
		// userid:1000005, propertyid:2, cost:120.0, createtime:2016-12-29
		// 15:39:01.0, id:36, username:褚柏宁, billtype:1, paymentinstruction:水费清单,
		// paytype:1, paymentno:1101, villageid:2, billtypes:水费, paytypes:支付宝支付,
		// rateid:null, billno:20161229153900116289, rstate:2}]

		String fileName = "客户交易记录信息";
		List<Record> list = page.getList();
		System.out.println(list);
		try {
			ExportExcelUtil.exportView(response, list, columns, propertyNames,
					fileName);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("memberid", id);

		setAttr("pageitem", PageSize_Default);

		setAttr("billlist", page.getList());

		render("/html/member/billlist.jsp");
	}

	public void viewbill() {
		String id = getPara("id");

		Record record = Db
				.findFirst(
						"select t1.*,(case when t1.paytype = 1 then '支付宝支付' when t1.paytype = 2 then '微信支付' end) as paytypes ,(case when t1.rstate = 1 then '未支付' when t1.rstate = 2 then '已支付' end) as rstates,"
								+ "(case when t1.billtype = 1 then '水费' when t1.billtype = 2 then '电费' when t1.billtype = 3 then '煤气费' when t1.billtype = 4 then '物业费' end ) as billtypes,s.username "
								+ "from t_user_bill t1, t_member s where t1.userid = s.id and t1.id = ?",
						new Object[] { id });

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/member/viewbill.jsp");
	}
}
