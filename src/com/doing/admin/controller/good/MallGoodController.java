package com.doing.admin.controller.good;

import java.util.Date;
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
public class MallGoodController extends BaseController {

	public void index() {

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select * " ,"from t_mall_good where rstate = 0 order by id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("pageitem", PageSize_Default);
		
		setAttr("goodlist", page.getList());

		render("/html/good/mall/list.jsp");
	}

	public void add() {

		render("/html/good/mall/add.jsp");
	}

	public void submit() {
		String goodname = StringUtils.defaultString(getPara("goodname"));
		String goodcontent = StringUtils.defaultString(getPara("goodcontent"));
		double cost = Utils.getDoubleVal(getPara("cost"),
				Double.valueOf(0.0D)).doubleValue();
		String imageurl = StringUtils.defaultString(getPara("imgpath"));
		String goodimageurl = StringUtils.defaultString(getPara("imgpath1"));
		String caseurl = StringUtils.defaultString(getPara("caseurl"));
		Record record = new Record();

		boolean flag = Db.save("t_mall_good",
				record.set("goodname", goodname).set("goodcontent", goodcontent).set("caseurl", caseurl)
						.set("cost", cost).set("imageurl", imageurl).set("createtime", new Date())
						.set("goodimage", goodimageurl));

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_good_mall");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = getPara("id");

		Record record = Db.findFirst("select *, id as goodid from t_mall_good where id = ?", id);
		
		if (record != null) {
			
			setAttrs(record.getColumns());
		}

		render("/html/good/mall/edit.jsp");
	}

	public void update() {

		String goodname = StringUtils.defaultString(getPara("goodname"));
		String goodcontent = StringUtils.defaultString(getPara("goodcontent"));
		double cost = Utils.getDoubleVal(getPara("cost"),
				Double.valueOf(0.0D)).doubleValue();
		String imageurl = StringUtils.defaultString(getPara("imgpath"));
		String goodimageurl = StringUtils.defaultString(getPara("imgpath1"));
		String caseurl = StringUtils.defaultString(getPara("caseurl"));

		String goodid = StringUtils.defaultString(getPara("goodid"));
		

		Db.update(
				"update t_mall_good set goodname = ?, goodcontent = ?, cost = ?, imageurl = ?, caseurl = ?, goodimage = ? where id = ?",
				goodname, goodcontent, cost, imageurl,caseurl,goodimageurl, goodid);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_good_mall");

		renderJson(GsonUtils.toJson(statusBean));
	}
	public void del(){
		String id = getPara("id");
		
		Db.update(
				"delete from  t_mall_good  where id = ?",
				 id);
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		resultHm.put("rescode", 0);

		renderJson(Utils.toJson(resultHm));
	}
}
