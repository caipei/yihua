package com.doing.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.doing.admin.bean.StatusBean;
import com.doing.admin.interceptor.LoginInterceptor;
import com.doing.admin.interceptor.LoginJsonInterceptor;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.ExportExcelUtil;
import com.doing.common.utils.base.GsonUtils;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(LoginInterceptor.class)
public class PropertyRepairController extends BaseController {

	public void exportExcel(){
		HttpServletResponse response = getResponse();
		
		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		
		String state = getPara("state");
		
		String repairtype = getPara("repairtype");
		//栋
		String building = getPara("building");
		// 单元
		String unit = getPara("unit");
		// 楼层数
		String floor = getPara("floor");
		// 门牌号
		String number = getPara("number");
		
		String subsql = "";
		
		if (StringUtils.isNotBlank(state)) {

			subsql += " and t.rstate = '"+ state +"'" ;
		} else {
			subsql += " and t.rstate = 1 ";
		}
		
		if(StringUtils.isNoneBlank(repairtype)){
			subsql += " and t.repairtype = '"+ repairtype +"'";
		}
		
		if(StringUtils.isNotBlank(building)){
			subsql += " and a.building = "+building;
		}
		if(StringUtils.isNotBlank(unit)){
			subsql += " and a.unit = "+unit;
		}
		if(StringUtils.isNotBlank(floor)){
			subsql += " and a.floor = "+floor;
		}
		if(StringUtils.isNotBlank(number)){
			subsql += " and a.number = "+number;
		}
		
		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select t.*,DATE_FORMAT(t.createtime,'%Y-%m-%d %H:%i:%s') as createtimes, ss.villagename,(case when t.repairtype = 1 then '公共部位报修' when t.repairtype = 2 then '自用部位报修' end) as repairtypes, "
				+ "(case when t.rstate = 1 then '待处理' when t.rstate = 2 then '处理中' when t.rstate = 3 then '已解决' when t.rstate = 4 then '已删除' end) as rstates, a.address as address",
				" from t_property_repair t , t_village ss, t_member a  where  t.villageid = ss.id and a.id = t.userid  "+subsql+" and t.propertyid = "+ propertyid +" order by t.id desc");

		String[] columns = new String[]{"报修联系人","报修人住址","报修人联系方式","报修小区","报修类型","报修状态","报修时间"};
		
		String[] propertyNames = new String[]{"repairname","address","repairtelephone","villagename","repairtypes","rstates","createtimes"};
		
		String fileName = "客户报修信息";
		List<Record> list = page.getList();
		
		try {
			ExportExcelUtil.exportView(response, list, columns, propertyNames, fileName);
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
		
		setAttr("pageitem", PageSize_Default);

		setAttr("state", state);
		
		setAttr("repairtype", repairtype);
		
		setAttr("building", building);
		
		setAttr("unit", unit);
		
		setAttr("floor", floor);
		
		setAttr("number", number);
		
		setAttr("repairlist", page.getList());
		
		render("/html/repair/list.jsp");
	}
	
	
	public void index() {
		
		String propertyid = Utils.getStrVal(getSessionAttr("propertyid"));
		
		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		
		String state = getPara("state");
		
		String repairtype = getPara("repairtype");
		//栋
		String building = getPara("building");
		// 单元
		String unit = getPara("unit");
		// 楼层数
		String floor = getPara("floor");
		// 门牌号
		String number = getPara("number");
		
		String subsql = "";
		
		if (StringUtils.isNotBlank(state)) {

			subsql += " and t.rstate = '"+ state +"'" ;
		} else {
			subsql += " and t.rstate = 1 ";
		}
		
		if(StringUtils.isNoneBlank(repairtype)){
			subsql += " and t.repairtype = '"+ repairtype +"'";
		}
		
		if(StringUtils.isNotBlank(building)){
			subsql += " and a.building = "+building;
		}
		if(StringUtils.isNotBlank(unit)){
			subsql += " and a.unit = "+unit;
		}
		if(StringUtils.isNotBlank(floor)){
			subsql += " and a.floor = "+floor;
		}
		if(StringUtils.isNotBlank(number)){
			subsql += " and a.number = "+number;
		}
		
		Page<Record> page = Db.paginate(pageCurrent, PageSize_Default, "select t.*,DATE_FORMAT(t.createtime,'%Y-%m-%d %H:%i:%s') as createtimes, ss.villagename,(case when t.repairtype = 1 then '公共部位报修' when t.repairtype = 2 then '自用部位报修' end) as repairtypes, "
				+ "(case when t.rstate = 1 then '待处理' when t.rstate = 2 then '处理中' when t.rstate = 3 then '已解决' when t.rstate = 4 then '已删除' end) as rstates",
				" from t_property_repair t , t_village ss, t_member a  where  t.villageid = ss.id and a.id = t.userid  "+subsql+" and t.propertyid = "+ propertyid +" order by t.id desc");

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());
		
		setAttr("pageitem", PageSize_Default);

		setAttr("state", state);
		
		setAttr("repairtype", repairtype);
		
		setAttr("building", building);
		
		setAttr("unit", unit);
		
		setAttr("floor", floor);
		
		setAttr("number", number);
		
		setAttr("repairlist", page.getList());

		render("/html/repair/list.jsp");
	}
	
	public void handle(){
		String id = getPara("id");

		Record record = Db.findFirst(
				"select t.*,s.villagename  from t_property_repair t left join t_village s  on  t.villageid = s.id  and  t.id = ?",
				new Object[] { id });

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/repair/handle.jsp");
	}
	public void view(){
		String id = getPara("id");

		Record record = Db.findFirst(
				"select t.*,s.villagename  from t_property_repair t left join t_village s  on  t.villageid = s.id  and  t.id = ?",
				new Object[] { id });

		if (record != null) {

			setAttrs(record.getColumns());
		}

		render("/html/repair/view.jsp");
	}
	public void submit(){
		String id = getPara("id");
		
		Db.update("update t_property_repair set rstate = 2 where id = ? ", id );
		
		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_repair");

		renderJson(GsonUtils.toJson(statusBean));
		
	}
	public void imagelist() {

		String id = getPara("id");

		int pageCurrent = Utils.getIntVal(getPara("pageCurrent"), 1);
		Page<Record> page = Db
				.paginate(
						pageCurrent,
						PageSize_Default,
						" select t1.* ",
						" from t_repair_image t1 where t1.repairid = ?"
								+ " order by t1.id desc", id);

		setAttr("pageSize", page.getTotalPage());

		setAttr("totalSize", page.getTotalRow());

		setAttr("pageCurrent", page.getPageNumber());

		setAttr("repairid", id);
		
		setAttr("pageitem", PageSize_Default);

		setAttr("imagelist", page.getList());

		render("/html/repair/image/list.jsp");
	}
	
	@Clear(LoginInterceptor.class)
	@Before(LoginJsonInterceptor.class)
	public void del() {

		String id = StringUtils.defaultString(getPara("id"));

		Db.update("update t_property_repair set rstate = 1 where id = ?", id);

		StatusBean statusBean = new StatusBean();

		statusBean.setTabid("tab_repair");

		statusBean.setCloseCurrent(false);

		renderJson(GsonUtils.toJson(statusBean));
	}
	
}
