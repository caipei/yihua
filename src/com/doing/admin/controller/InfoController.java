package com.doing.admin.controller;

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
public class InfoController extends BaseController {

	String objtype = "1";

	public void index() {

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		int categoryid = Utils.getIntVal(getPara("categoryid"), 0);

		String subsql = "";

		if (categoryid > 0) {

			subsql = " and categoryid = " + categoryid;
		}

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select t1.id, title, t2.name as categoryname, seq ",
				"from t_info t1, t_category t2 where t1.categoryid = t2.id and t1.rstate = 0 " + subsql
						+ " order by t1.seq desc, t1.id desc");

		List<Record> categorylist = Db.find("select id,name from t_category where rstate = 0 and type = ?", objtype);

		setAttr("categorylist", categorylist);

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("infolist", page.getList());

		setAttr("categoryid", categoryid);

		render("/html/info/list.jsp");
	}

	public void add() {

		List<Record> categorylist = Db.find("select id,name from t_category where rstate = 0 and type = ?", objtype);

		setAttr("categorylist", categorylist);

		render("/html/info/add.jsp");
	}

	public void submit() {

		String title = StringUtils.defaultString(getPara("title"));
		String category_sel = StringUtils.defaultString(getPara("category_sel"));
		String source = StringUtils.defaultString(getPara("source"));
		String author = StringUtils.defaultString(getPara("author"));
		String remark = StringUtils.defaultString(getPara("remark"));
		String content = StringUtils.defaultString(getPara("content"));
		String imgpath = StringUtils.defaultString(getPara("imgpath"));

		Db.save("t_info",
				new Record().set("title", title).set("categoryid", category_sel).set("source", source)
						.set("author", author).set("remark", remark).set("content", content).set("imgpath", imgpath)
						.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_info");

		renderJson(GsonUtils.toJson(statusBean));
	}

	public void edit() {

		String id = StringUtils.defaultString(getPara("id"));

		Record record = Db
				.findFirst("select title,categoryid,source,author,remark,content,imgpath from t_info where id = ?", id);

		if (record != null) {

			setAttr("title", record.get("title"));

			setAttr("categoryid", record.get("categoryid"));

			setAttr("source", record.get("source"));

			setAttr("author", record.get("author"));

			setAttr("remark", record.get("remark"));

			setAttr("content", record.get("content"));

			setAttr("imgpath", record.get("imgpath"));

			setAttr("id", id);

			List<Record> categorylist = Db.find("select id,name from t_category where rstate = 0 and type = ?",
					objtype);

			setAttr("categorylist", categorylist);

			render("/html/info/edit.jsp");

		} else {

			renderJson(GsonUtils.toJson(setStatusError(null, false)));
		}
		
	}

	public void update() {

		String id = StringUtils.defaultString(getPara("id"));

		String title = StringUtils.defaultString(getPara("title"));
		String category_sel = StringUtils.defaultString(getPara("category_sel"));
		String source = StringUtils.defaultString(getPara("source"));
		String author = StringUtils.defaultString(getPara("author"));
		String remark = StringUtils.defaultString(getPara("remark"));
		String content = StringUtils.defaultString(getPara("content"));
		String imgpath = StringUtils.defaultString(getPara("imgpath"));

		Db.update(
				"update t_info set title = ?, categoryid = ?, source = ?, author = ?, remark = ?, content = ?, imgpath = ? where id = ?",
				title, category_sel, source, author, remark, content, imgpath, id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_info");

		renderJson(GsonUtils.toJson(statusBean));
	}
	
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_info set rstate = 1 where id = ?", id);
		
		StatusBean statusBean = new StatusBean();
		
		statusBean.setTabid("tab_info");
		
		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
}
