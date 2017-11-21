package com.doing.admin.controller.order;

import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;

import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.common.utils.Utils;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class CollegeOrderController extends BaseController {

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
						"select t2.*,t1.username as khxm,t1.mobile as lxfs, DATE_FORMAT(t2.intime,'%Y-%m-%d %H:%i:%s') as intimes ,"
						+ "(case when paytype = 1 then '支付宝' when paytype = 2 then '微信' end) as paytypes ",
						" from t_order t2,t_member t1  where t1.id = t2.userid and  t2.rstate = 0 and t2.ordertype = 3 "
								+ subsql + " order by t2.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());
		
		setAttr("pageitem", PageSize_Default);

		setAttr("infolist", page.getList());

		setAttr("pageitem", PageSize_Default);

		setAttr("keyword", keyword);

		render("/html/order/college/list.jsp");
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
