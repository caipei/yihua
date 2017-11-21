package com.doing.admin.controller.order;

import java.util.HashMap;

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
public class MallOrderController extends BaseController {

	public void index() {
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		String keyword = getPara("keyword");

		String subsql = "";

		if (StringUtils.isNotBlank(keyword)) {

			subsql = " and (t1.username like '%" + keyword + "%' or orderno like '%"
					+ keyword + "%' )";
		}

		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						"select t2.*,t1.consignee as khxm,t1.consigneephone as lxfs, DATE_FORMAT(t2.intime,'%Y-%m-%d %H:%i:%s') as intimes,"
						+ "(case when paytype = 1 then '支付宝' when paytype = 2 then '微信' end) as paytypes ",
						" from t_order t2,t_order_good t1  where t2.id = t1.orderid and  t2.rstate = 0 and t2.ordertype = 2 "
								+ subsql + " order by t2.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);

		setAttr("infolist", page.getList());

		setAttr("pageitem", PageSize_Default);

		setAttr("keyword", keyword);

		render("/html/order/mall/list.jsp");
	}
	public void edit() {

		String id = getPara("id");

		Record record = Db.findFirst("select t1.*,t3.*, t3.id as orderid,t3.consignee as khxm,t3.consigneephone as lxfs from t_order t1,t_order_good t3 where t1.id = ? and t1.id = t3.orderid ", id);

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/order/mall/edit.jsp");
	}

	public void update() {

		String expresscompany = StringUtils.defaultString(getPara("expresscompany"));
		String expressno = StringUtils.defaultString(getPara("expressno"));
		String orderid = StringUtils.defaultString(getPara("orderid"));


		Db.update(
				"update t_order_good set expresscompany = ?, expressno = ?  where id = ?",
				expresscompany, expressno,  orderid);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_order_mall");

		renderJson(GsonUtils.toJson(statusBean));
	}
	public void del(){
		String id = getPara("id");

		Db.update(
				"delete from  t_order  where id = ?",
				 id);
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		resultHm.put("rescode", 0);

		renderJson(Utils.toJson(resultHm));
	}
}
