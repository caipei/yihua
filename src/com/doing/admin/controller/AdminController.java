package com.doing.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

import com.doing.admin.bean.StatusBean;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.common.variable.ResultCode;
import com.doing.dataservice.controller.BaseController;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class AdminController extends BaseController {

	public void index() { 

		String loginflag = Utils.getStrVal(getSessionAttr("loginflag"));

		String userid = Utils.getStrVal(getSessionAttr("userid"));

		String roleid = Utils.getStrVal(getSessionAttr("roleid"));

		if ("success".equals(loginflag) && !"".equals(userid) && !"".equals(roleid)) {
			
			setAttr("funclisthtml", funcListHtml(roleid));
			
			setAttr("nickname", getSessionAttr("nickname"));
			
			render("/html/index.jsp");
		} else {
			render("/html/login.jsp");
		}
	}

	public void login() {

		String loginflag = Utils.getStrVal(getSessionAttr("loginflag"));

		String userid = Utils.getStrVal(getSessionAttr("userid"));

		String roleid = Utils.getStrVal(getSessionAttr("roleid"));
		if ("success".equals(loginflag) && !"".equals(userid) && !"".equals(roleid)) {
			setAttr("funclisthtml", funcListHtml(roleid));
			
			setAttr("nickname", getSessionAttr("nickname"));
			render("/html/index.jsp");
		} else {
			render("/html/login.jsp");
		}
	}

	public void logout() {

		HashMap<String, Object> jsonHm = new HashMap<String, Object>();

		removeSessionAttr("userid");
		removeSessionAttr("username");
		removeSessionAttr("nickname");
		removeSessionAttr("propertyid");
		removeSessionAttr("loginflag");

		jsonHm.put("rescode", ResultCode.SUCCESS);

		renderJson(GsonUtils.toJson(jsonHm));
	}
	
	public void timeout() {
		
		render("/html/login_timeout.jsp");
	}
	
	public void changepwd(){
		render("/html/changepwd.jsp");
		
	}
	
	public void updatepwd(){
		int userid = getSessionAttr("userid");
		String password = StringUtils.defaultString(getPara("password"));
		password = DigestUtils.md5Hex(password);
		
		Db.update("update t_user set  password = ? where id = ?",
				 password, userid);
		StatusBean statusBean = new StatusBean();
		statusBean.setTabid("tab_user");
		renderJson(GsonUtils.toJson(statusBean));
	}
	
	public void verify() {

		HashMap<String, Object> jsonHm = new HashMap<String, Object>();

		String username = getPara("username");

		String password = getPara("password");
		
		password = DigestUtils.md5Hex(password);
		
		Record record = Db.findFirst(
				"select id, username, nickname, realname,propertyid from t_user where username = ? and password = ? and rstate = 0",
				username, password);

		if (record != null) {

			Db.update(
					"update t_user set logintime = ? where username = ? ",
					DateTime.now().toString(DateTimeFormat.forPattern("yyyyMMddHHmmss")), username);

			Record rolerecord = Db.findFirst("select roleid from t_user_role where userid = ?",
					record.get("id"));

			if (rolerecord != null) {

				jsonHm.put("rescode", ResultCode.SUCCESS);

				setSessionAttr("userid", record.get("id"));
				setSessionAttr("username", record.get("username"));
				setSessionAttr("nickname", record.get("nickname"));
				setSessionAttr("realname", record.get("realname"));
				setSessionAttr("propertyid", record.get("propertyid"));
				setSessionAttr("roleid", rolerecord.get("roleid"));
				setSessionAttr("loginflag", "success");
			} else {

				jsonHm.put("rescnt", ResultCode.ERR_1003_STR);
				jsonHm.put("rescode", ResultCode.ERR_1003);
			}
		} else {

			jsonHm.put("rescnt", ResultCode.ERR_1004_STR);
			jsonHm.put("rescode", ResultCode.ERR_1004);
		}
		
		
		renderJson(GsonUtils.toJson(jsonHm));
	}
	
	public String funcListHtml(String roleid) {
		
		List<Record> funcList  = Db.find("select t1.* from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and pfuncid = 0 order by seq desc, id asc", roleid);
		
		StringBuilder htmlSb = new StringBuilder();
		
		for (int i = 0; i < funcList.size(); i ++) {
			
			Record record = funcList.get(i);
			
			if (i == 0) {
				
				htmlSb.append("<li class=\"active\"><a href=\"javascript:;\" data-toggle=\"slidebar\">"+record.getStr("funcname")+"</a>").append("\n");
				
			} else {
				
				htmlSb.append("<li><a href=\"javascript:;\" data-toggle=\"slidebar\">"+record.getStr("funcname")+"</a>").append("\n");
			}
			
			htmlSb.append("<div class=\"items hide\" data-noinit=\"true\">").append("\n").append("\n");
			
			List<Record> tmpList  = Db.find("select t1.* from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and t1.pfuncid = ? order by t1.seq asc, t1.id asc", roleid, record.get("id"));
			
			for (Record tmpRecord : tmpList) {
				
				htmlSb.append("<ul id=\"bjui-tree-base"+tmpRecord.get("id")+"\" class=\"ztree ztree_main\" data-toggle=\"ztree\" data-on-click=\"MainMenuClick\" data-expand-all=\"true\" data-tit=\""+tmpRecord.get("funcname")+"\">").append("\n");
			
				List<Record> ttmpList  = Db.find("select t1.* from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and t1.pfuncid = ? order by t1.seq asc, t1.id asc", roleid, tmpRecord.get("id"));
				
				for (Record ttmpRecord : ttmpList) {
					
//					htmlSb.append("<li data-id=\""+ttmpRecord.get("id")+"\" data-pid=\""+tmpRecord.get("id")+"\" data-faicon=\"folder-open-o\" data-faicon-close=\"folder-o\">"+ttmpRecord.getStr("funcname")+"</li>").append("\n");
//					
//					List<Record> tttmpList  = Db.find("select t1.* from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and t1.pfuncid = ? order by t1.seq asc, t1.id asc", roleid, ttmpRecord.get("id"));
//				
//					for (Record tttmpRecord : tttmpList) {
						
						htmlSb.append("<li data-id=\""+ttmpRecord.get("id")+"\" data-pid=\""+ttmpRecord.get("id")+"\" data-tabid=\""+ttmpRecord.get("tabkey")+"\" data-url=\"/"+ PropKit.get("project_name") + ttmpRecord.getStr("funcurl")+"\">"+ttmpRecord.getStr("funcname")+"</li>").append("\n");
//					}
				}
				htmlSb.append("</ul>").append("\n");
			}
			
			htmlSb.append("</div>").append("\n");
			htmlSb.append("</li>").append("\n");
		}
		return htmlSb.toString();
	}
	
	public String funcListHtmlNew(String roleid) {
		
		List<Record> funcList  = Db.find("select t1.* from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and pfuncid = 0", roleid);
		
		StringBuilder htmlSb = new StringBuilder();
		
		htmlSb.append("<li class=\"active\"><a href=\"javascript:;\" data-toggle=\"slidebar\"><i class=\"fa fa-file-word-o\"></i> 在线文档</a>").append("\n");
		
		htmlSb.append("<div class=\"items hide\" data-noinit=\"true\">").append("\n").append("\n");
		
		for (int i = 0; i < funcList.size(); i ++) {
			
			Record record = funcList.get(i);
			
			htmlSb.append("<ul id=\"bjui-hnav-tree"+record.get("id")+"\" class=\"ztree ztree_main\" data-toggle=\"ztree\" data-on-click=\"MainMenuClick\" data-tit=\""+record.getStr("funcname")+"\" >").append("\n");
			
			List<Record> tmpList  = Db.find("select t1.* from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and t1.pfuncid = ? order by t1.seq desc, t1.id asc", roleid, record.get("id"));
		
			for (Record tmpRecord : tmpList) {
				
				htmlSb.append("<li data-id=\""+tmpRecord.get("id")+"\" data-pid=\"0\" data-tabid=\""+tmpRecord.get("tabkey")+"\" data-url=\""+tmpRecord.getStr("funcurl")+"\">"+tmpRecord.getStr("funcname")+"</li>").append("\n");
			}
			
			htmlSb.append("</ul>").append("\n");
		}
		
		htmlSb.append("</div>").append("\n");
		htmlSb.append("</li>").append("\n");
		return htmlSb.toString();
	}
	
	public void functree() {
		
		String roleid = Utils.getStrVal(getSessionAttr("roleid"));
		
		List<Record> funclist  = Db.find("select t1.id as id, funcname, funcurl from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and pfuncid = 0", roleid);
		
//		setAttr("funclist", funclist);
		
		List<HashMap<String, Object>> list = new ArrayList<>();
		
		for (Record record : funclist) {
			
			HashMap<String, Object> tmpHm = new HashMap<String, Object>();
			
			List<HashMap<String, Object>> tmpList = new ArrayList<HashMap<String, Object>>();
			
			HashMap<String, Object> ttmpHm = new HashMap<String, Object>();
			
			List<Record> ttmpList  = Db.find("select t1.id as id, funcname, funcurl from t_func t1, t_role_func t2 where t1.id = t2.funcid and t2.roleid = ? and t1.pfuncid = ? order by t1.seq desc, t1.id asc", roleid, record.get("id"));
			
			List<HashMap<String, String>> tttmplist = new ArrayList<HashMap<String, String>>();
			if (ttmpList != null && ttmpList.size() > 0) {
				for (Record tmprecord : ttmpList) {
					HashMap<String, String> tttmpMap = new HashMap<String, String>();
					tttmpMap.put("id", Utils.getStrVal(tmprecord.get("id")));
					tttmpMap.put("text", Utils.getStrVal(tmprecord.get("funcname")));
					tttmpMap.put("href", Utils.getStrVal(tmprecord.get("funcurl")));
					tttmplist.add(tttmpMap);
				}
			}
			ttmpHm.put("items", tttmplist);
			
			ttmpHm.put("text", record.get("funcname"));
			
			tmpList.add(ttmpHm);
			
			tmpHm.put("menu", tmpList);
			
			tmpHm.put("id", Utils.getStrVal(record.get("id")));
			
//			if (ttmpList != null && ttmpList.size() > 0) {
//				
//				tmpHm.put("homePage", Utils.getStrVal(ttmpList.get(0).get("id")));
//			}
			list.add(tmpHm);
		}
		renderJson(GsonUtils.toJson(list));
	}
}
