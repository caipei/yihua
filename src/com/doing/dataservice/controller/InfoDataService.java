package com.doing.dataservice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.doing.base.EncryptByteRender;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.dataservice.entity.BaseListEntity;
import com.doing.dataservice.entity.DataEntity;
import com.doing.dataservice.entity.Status;
import com.doing.dataservice.interceptor.DataServiceInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qiniu.util.Auth;

@Before(DataServiceInterceptor.class)
public class InfoDataService extends BaseDataServiceController {

	public void list() {

		DataEntity dataBean = new DataEntity();
		// 状态
		Status status = new Status();

		dataBean.setStatus(status);

		String requestStr = decryptRequest(status);

		if (StringUtils.isNotBlank(requestStr)) {

			int pageNumber = 1;

			int pagesize = 20;

			Page<Record> page = Db.paginate(pageNumber, pagesize,
					"select id,title,remark,videopath,imgpath,money",
					" from t_video order by id desc");

			BaseListEntity.BaseList<Map<String, Object>> entity = new BaseListEntity.BaseList<Map<String, Object>>();

			entity.setCurrentpage(page.getPageNumber());

			entity.setTotalnum(page.getTotalRow());

			entity.setTotalpage(page.getTotalPage());

			entity.setList(getColumnList(page.getList()));

			dataBean.setData(entity);

		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void uploadsource() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			int type = Utils.getIntVal(paramHm.get("type"), 1);

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String sourceurl = Utils.getStrVal(paramHm.get("sourceurl"));

			String description = Utils.getStrVal(paramHm.get("description"));

			boolean flag = Db.save(
					"t_blog",
					new Record().set("sourceurl", sourceurl)
							.set("memberid", memberid)
							.set("description", description).set("type", type)
							.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));

			if (flag) {

				status.setSucceed(1);
			} else {

				status.setSucceed(0);

				status.setErrdesc("上传失败");
			}
		}

		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	private void setSourceExts(List<Record> recordList, String memberid,
			String objtype) {

		for (Record record : recordList) {

			Record memberRecord = Db.findFirst(
					"select *, id as member from t_member where id = ?",
					record.get("memberid"));

			if (memberRecord != null) {

				record.set("userinfo", memberRecord.getColumns());
			}

			HashMap<String, Object> snsHm = new HashMap<>();

			Record likeRecord = Db
					.findFirst(
							"select count(id) as num from t_sns_like where objtype = ? and objid = ? and rstate = 0",
							objtype, record.get("id"));
			if (likeRecord != null) {
				snsHm.put("likenum", likeRecord.get("num"));
			}

			Record shareRecord = Db
					.findFirst(
							"select count(id) as num from t_sns_share where objtype = ? and objid = ? and rstate = 0",
							objtype, record.get("id"));
			if (shareRecord != null) {
				snsHm.put("sharenum", shareRecord.get("num"));
			}

			Record collectRecord = Db
					.findFirst(
							"select count(id) as num from t_collect where objtype = ? and objid = ? and rstate = 0",
							objtype, record.get("id"));
			if (collectRecord != null) {
				snsHm.put("collectnum", collectRecord.get("num"));
			}

			Record commentRecord = Db
					.findFirst(
							"select count(id) as num from t_comment where objtype = ? and objid = ? and rstate = 0",
							objtype, record.get("id"));
			if (commentRecord != null) {
				snsHm.put("commentnum", commentRecord.get("num"));
			}

			snsHm.put("iscomment", 0);
			snsHm.put("iscollect", 0);
			snsHm.put("islike", 0);
			snsHm.put("isshare", 0);

			if (StringUtils.isNotBlank(memberid)) {

				Record islikeRecord = Db
						.findFirst(
								"select count(id) as num from t_sns_like where objtype = ? and objid = ? and memberid = ? and rstate = 0",
								objtype, record.get("id"), memberid);
				if (islikeRecord != null && islikeRecord.getLong("num") > 0) {
					snsHm.put("islike", 1);
				}

				Record isshareRecord = Db
						.findFirst(
								"select count(id) as num from t_sns_share where objtype = ? and objid = ? and memberid = ? and rstate = 0",
								objtype, record.get("id"), memberid);
				if (isshareRecord != null && isshareRecord.getLong("num") > 0) {
					snsHm.put("isshare", 1);
				}

				Record iscollectRecord = Db
						.findFirst(
								"select count(id) as num from t_collect where objtype = ? and objid = ? and memberid = ? and rstate = 0",
								objtype, record.get("id"), memberid);
				if (iscollectRecord != null
						&& iscollectRecord.getLong("num") > 0) {
					snsHm.put("iscollect", 1);
				}
				Record iscommentRecord = Db
						.findFirst(
								"select count(id) as num from t_comment where objtype = ? and objid = ? and memberid = ? and rstate = 0",
								objtype, record.get("id"), memberid);
				if (iscommentRecord != null
						&& iscommentRecord.getLong("num") > 0) {
					snsHm.put("iscomment", 1);
				}
			}

			record.set("snsinfo", snsHm);

		}
	}

	public void giflist() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			int pageNumber = Utils.getIntVal(paramHm.get("currentpage"), 1);

			int pageSize = 20;

			// 1精华 2最新 3随机
			int searchtype = Utils.getIntVal(paramHm.get("searchtype"), 1);

			BaseListEntity.BaseList<Map<String, Object>> entity = new BaseListEntity.BaseList<Map<String, Object>>();

			List<Record> recordList = new ArrayList<>();

			if (searchtype == 1) {

				Page<Record> page = Db
						.paginate(
								pageNumber,
								pageSize,
								"select id,sourceurl,intime,description,memberid,rstate,type,elite",
								"from t_blog where type = 1 and elite = 1 and rstate = 0 and sourceurl is not null and sourceurl != '' order by id desc");

				entity.setCurrentpage(page.getPageNumber());

				entity.setTotalnum(page.getTotalRow());

				entity.setTotalpage(page.getTotalPage());

				recordList = page.getList();

			} else if (searchtype == 2) {

				Page<Record> page = Db
						.paginate(
								pageNumber,
								pageSize,
								"select id,sourceurl,intime,description,memberid,rstate,type,elite",
								"from t_blog where type = 1 and rstate = 0 and sourceurl is not null and sourceurl != '' order by id desc");

				entity.setCurrentpage(page.getPageNumber());

				entity.setTotalnum(page.getTotalRow());

				entity.setTotalpage(page.getTotalPage());

				recordList = page.getList();

			} else if (searchtype == 3) {

				List<Record> randList = Db
						.find("select id,sourceurl,intime,description,memberid,rstate,type,elite from t_blog where type = 1 and rstate = 0 and sourceurl is not null and sourceurl != '' order by rand() limit 20");

				entity.setCurrentpage(1);

				entity.setTotalnum(randList.size());

				entity.setTotalpage(1);

				recordList = randList;
			}

			setSourceExts(recordList, memberid, "1");

			entity.setList(getColumnList(recordList));

			dataBean.setData(entity);

		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	// 段子
	public void paragraphlist() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			int pageNumber = Utils.getIntVal(paramHm.get("currentpage"), 1);

			int pageSize = 20;

			// 1精华 2最新 3随机
			int searchtype = Utils.getIntVal(paramHm.get("searchtype"), 1);

			BaseListEntity.BaseList<Map<String, Object>> entity = new BaseListEntity.BaseList<Map<String, Object>>();

			List<Record> recordList = new ArrayList<>();

			if (searchtype == 1) {

				Page<Record> page = Db
						.paginate(
								pageNumber,
								pageSize,
								"select id,sourceurl,intime,description,memberid,rstate,type,elite",
								"from t_blog where type = 2 and elite = 1 and rstate = 0 order by id desc");

				entity.setCurrentpage(page.getPageNumber());

				entity.setTotalnum(page.getTotalRow());

				entity.setTotalpage(page.getTotalPage());

				recordList = page.getList();

			} else if (searchtype == 2) {

				Page<Record> page = Db
						.paginate(
								pageNumber,
								pageSize,
								"select id,sourceurl,intime,description,memberid,rstate,type,elite",
								"from t_blog where type = 2 and rstate = 0 order by id desc");

				entity.setCurrentpage(page.getPageNumber());

				entity.setTotalnum(page.getTotalRow());

				entity.setTotalpage(page.getTotalPage());

				recordList = page.getList();

			} else if (searchtype == 3) {

				List<Record> randList = Db
						.find("select id,sourceurl,intime,description,memberid,rstate,type,elite from t_blog where type = 2 and rstate = 0 order by rand() limit 20");

				entity.setCurrentpage(1);

				entity.setTotalnum(randList.size());

				entity.setTotalpage(1);

				recordList = randList;
			}

			setSourceExts(recordList, memberid, "1");

			entity.setList(getColumnList(recordList));

			dataBean.setData(entity);

		}

		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void videolist() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			int pageNumber = Utils.getIntVal(paramHm.get("currentpage"), 1);

			int pageSize = 20;

			// 1精华 2最新 3随机
			int searchtype = Utils.getIntVal(paramHm.get("searchtype"), 1);

			BaseListEntity.BaseList<Map<String, Object>> entity = new BaseListEntity.BaseList<Map<String, Object>>();

			List<Record> recordList = new ArrayList<>();

			if (searchtype == 1) {

				Page<Record> page = Db
						.paginate(
								pageNumber,
								pageSize,
								"select id,sourceurl,intime,description,memberid,rstate,type,elite",
								"from t_blog where type = 3 and elite = 1 and rstate = 0 and sourceurl is not null and sourceurl != '' order by id desc");

				entity.setCurrentpage(page.getPageNumber());

				entity.setTotalnum(page.getTotalRow());

				entity.setTotalpage(page.getTotalPage());

				recordList = page.getList();

			} else if (searchtype == 2) {

				Page<Record> page = Db
						.paginate(
								pageNumber,
								pageSize,
								"select id,sourceurl,intime,description,memberid,rstate,type,elite",
								"from t_blog where type = 3 and rstate = 0 and sourceurl is not null and sourceurl != '' order by id desc");

				entity.setCurrentpage(page.getPageNumber());

				entity.setTotalnum(page.getTotalRow());

				entity.setTotalpage(page.getTotalPage());

				recordList = page.getList();

			} else if (searchtype == 3) {

				List<Record> randList = Db
						.find("select id,sourceurl,intime,description,memberid,rstate,type,elite from t_blog where type = 3 and rstate = 0 and sourceurl is not null and sourceurl != '' order by rand() limit 20");

				entity.setCurrentpage(1);

				entity.setTotalnum(randList.size());

				entity.setTotalpage(1);

				recordList = randList;
			}

			setSourceExts(recordList, memberid, "1");

			entity.setList(getColumnList(recordList));

			dataBean.setData(entity);

		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void commentlist() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String objid = Utils.getStrVal(paramHm.get("objid"));

			String objtype = Utils.getStrVal(paramHm.get("objtype"));

			int pageNumber = Utils.getIntVal(paramHm.get("currentpage"), 1);

			int pageSize = 20;

			BaseListEntity.BaseList<Map<String, Object>> entity = new BaseListEntity.BaseList<Map<String, Object>>();

			List<Record> recordList = new ArrayList<>();

			Page<Record> page = Db
					.paginate(
							pageNumber,
							pageSize,
							"select id,objid,intime,objtype,content",
							"from t_comment where objid = ? and objtype = ? and rstate = 0 order by id desc",
							objid, objtype);

			entity.setCurrentpage(page.getPageNumber());

			entity.setTotalnum(page.getTotalRow());

			entity.setTotalpage(page.getTotalPage());

			recordList = page.getList();

			for (Record record : recordList) {

				Record memberRecord = Db.findFirst(
						"select *, id as member from t_member where id = ?",
						record.get("memberid"));

				if (memberRecord != null) {

					record.set("userinfo", memberRecord.getColumns());
				}

				HashMap<String, Object> snsHm = new HashMap<>();

				Record likeRecord = Db
						.findFirst(
								"select count(id) as num from t_sns_like where objtype = 2 and objid = ? and rstate = 0",
								record.get("id"));
				if (likeRecord != null) {
					snsHm.put("likenum", likeRecord.get("num"));
				}

				snsHm.put("islike", 0);

				if (StringUtils.isNotBlank(memberid)) {

					Record islikeRecord = Db
							.findFirst(
									"select count(id) as num from t_sns_like where objtype = 2 and objid = ? and memberid = ? and rstate = 0",
									record.get("id"), memberid);
					if (islikeRecord != null && islikeRecord.getLong("num") > 0) {
						snsHm.put("islike", 1);
					}
				}
			}

			entity.setList(getColumnList(recordList));

			dataBean.setData(entity);

		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void commentadd() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String objid = Utils.getStrVal(paramHm.get("objid"));

			String objtype = Utils.getStrVal(paramHm.get("objtype"));

			String content = Utils.getStrVal(paramHm.get("content"));

			boolean flag = Db.save("t_comment",
					new Record().set("objid", objid).set("objtype", objtype)
							.set("memberid", memberid).set("content", content)
							.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));

			if (flag) {

				status.setSucceed(1);

			} else {

				status.setSucceed(0);

				status.setErrdesc("提交评论失败");
			}
		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void collectadd() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String objid = Utils.getStrVal(paramHm.get("objid"));

			String objtype = Utils.getStrVal(paramHm.get("objtype"));

			boolean flag = Db.save(
					"t_collect",
					new Record().set("objid", objid).set("objtype", objtype)
							.set("memberid", memberid)
							.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));

			if (flag) {

				status.setSucceed(1);

			} else {

				status.setSucceed(0);

				status.setErrdesc("收藏失败");
			}
		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void collectdel() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String objid = Utils.getStrVal(paramHm.get("objid"));

			String objtype = Utils.getStrVal(paramHm.get("objtype"));

			Record record = Db
					.findFirst(
							"select id from t_collect where objid = ? and objtype = ? and memberid = ?",
							objid, objtype, memberid);

			if (record != null) {

				boolean flag = Db.delete("t_collect", record);

				if (flag) {

					status.setSucceed(1);

				} else {

					status.setSucceed(0);

					status.setErrdesc("取消收藏失败");
				}
			}

		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void likeadd() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String objid = Utils.getStrVal(paramHm.get("objid"));

			String objtype = Utils.getStrVal(paramHm.get("objtype"));

			boolean flag = Db.save(
					"t_sns_like",
					new Record().set("objid", objid).set("objtype", objtype)
							.set("memberid", memberid)
							.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));

			if (flag) {

				status.setSucceed(1);

			} else {

				status.setSucceed(0);

				status.setErrdesc("点赞失败");
			}
		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void likedel() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String objid = Utils.getStrVal(paramHm.get("objid"));

			String objtype = Utils.getStrVal(paramHm.get("objtype"));

			Record record = Db
					.findFirst(
							"select id from t_collect where objid = ? and objtype = ? and memberid = ?",
							objid, objtype, memberid);

			if (record != null) {

				boolean flag = Db.delete("t_sns_like", record);

				if (flag) {

					status.setSucceed(1);

				} else {

					status.setSucceed(0);

					status.setErrdesc("取消点赞失败");
				}
			}

		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void shareadd() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String objid = Utils.getStrVal(paramHm.get("objid"));

			String objtype = Utils.getStrVal(paramHm.get("objtype"));

			boolean flag = Db.save(
					"t_sns_share",
					new Record().set("objid", objid).set("objtype", objtype)
							.set("memberid", memberid)
							.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));

			if (flag) {

				status.setSucceed(1);

			} else {

				status.setSucceed(0);

				status.setErrdesc("点赞失败");
			}
		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void blogadd() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		System.out.println(bodyStr);

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String type = Utils.getStrVal(paramHm.get("type"));

			String sourceurl = Utils.getStrVal(paramHm.get("sourceurl"));

			String description = Utils.getStrVal(paramHm.get("description"));

			if (StringUtils.isNotBlank(sourceurl)) {

				sourceurl = PropKit.get("qiniu_prefix") + sourceurl;
			}

			boolean flag = Db.save("t_blog", new Record().set("type", type)
					.set("sourceurl", sourceurl)
					.set("description", description).set("memberid", memberid)
					.set("intime", Utils.getNowStr("yyyyMMddHHmmss")));

			if (flag) {

				status.setSucceed(1);

			} else {

				status.setSucceed(0);

				status.setErrdesc("提交失败");
			}
		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void blogupdate() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			String id = Utils.getStrVal(paramHm.get("id"));

			String memberid = Utils.getStrVal(paramHm.get("memberid"));

			String type = Utils.getStrVal(paramHm.get("type"));

			String sourceurl = Utils.getStrVal(paramHm.get("sourceurl"));

			String description = Utils.getStrVal(paramHm.get("description"));

			Record record = Db
					.findFirst(
							"select type, memberid, sourceurl, description from t_blog where id = ?",
							id);

			if (record != null) {

				if (StringUtils.isNotBlank(type)) {

					type = Utils.getStrVal(record.get("type"));
				}

				if (StringUtils.isNotBlank(sourceurl)) {

					sourceurl = Utils.getStrVal(record.get("sourceurl"));
				}

				if (StringUtils.isNotBlank(description)) {

					description = Utils.getStrVal(record.get("description"));
				}
			}

			Db.update(
					"update t_blog set sourceurl = ?, description = ? where id = ?",
					sourceurl, description, id);

			status.setSucceed(1);

		}
		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}

	public void uptoken() {

		Auth auth = Auth.create("315qIUxCvaDctADQsj-6ImyMIz33lAzP2xkIJWjj",
				"l3s-2LjQECfl-4RbaaDXlpWu-Lh4BME0zUwPVj3e");

		String tokenStr = auth.uploadToken("videodemo");

		HashMap<String, String> tokenHm = new HashMap<String, String>();

		tokenHm.put("uptoken", tokenStr);

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		dataBean.setData(tokenHm);

		render(new EncryptByteRender(GsonUtils.toJson(dataBean)));
	}
}
