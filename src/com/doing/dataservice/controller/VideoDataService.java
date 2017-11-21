package com.doing.dataservice.controller;

import java.util.HashMap;
import java.util.Map;

import com.doing.base.EncryptByteRender;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.dataservice.entity.BaseListEntity;
import com.doing.dataservice.entity.DataEntity;
import com.doing.dataservice.entity.Status;
import com.doing.dataservice.interceptor.DataServiceInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@Before(DataServiceInterceptor.class)
public class VideoDataService extends BaseDataServiceController {

	public void list() {

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		String bodyStr = getAttr("body");

		HashMap paramHm = getRequestParams(bodyStr);

		if (paramHm != null) {

			int pageNumber = Utils.getIntVal(paramHm.get("currentpage"), 1);

			int pageSize = 20;

			Page<Record> page = Db.paginate(pageNumber, pageSize,
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
}
