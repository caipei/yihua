package com.doing.admin.controller;

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
public class MemberBlogController extends BaseController {

	public void index() {
		
		int type = Utils.getIntVal(getPara("type"), 0);

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);

		String subsql = "";
	
		if (type != 0) {
			
			subsql += " and t1.type = " + type;
		}

		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default,
				"select t2.nickname, t2.mobile, t1.id as id, description, t1.memberid, t1.sourceurl, t1.type as type, elite, date_format(t1.intime, '%Y-%m-%d %H:%i') as intime_format",
				"from t_blog t1, t_member t2 where t1.rstate = 0 and t1.memberid = t2.id " + subsql + " order by id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("bloglist", page.getList());
		
		setAttr("type", type);

		render("/html/member/blog/list.jsp");
	}

	public void showvideo() {
		
		String sourceurl = getPara("sourceurl");
		
		setAttr("sourceurl", sourceurl);

		render("/html/member/blog/showvideo.jsp");
	}
	
	public void showimg() {
		
		String sourceurl = getPara("sourceurl");
		
		setAttr("sourceurl", sourceurl);

		render("/html/member/blog/showimg.jsp");
	}
	
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_blog set rstate = 1 where id = ?", id);
		
		StatusBean statusBean = new StatusBean();
		
		statusBean.setTabid("tab_member_blog");
		
		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
}
