package com.doing.dataservice.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.doing.admin.bean.StatusBean;
import com.doing.common.utils.Utils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;

public class BaseController extends Controller {

	public int PageSize_Default = 15;

	// record list 转化为 Map list
	public List<Map<String, Object>> getColumnList(List<Record> recordList) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if (recordList != null && recordList.size() > 0) {
			for (Record record : recordList) {
				list.add(record.getColumns());
			}
		}
		return list;
	}

	public StatusBean setStatusError(StatusBean statusBean, boolean closeFlag) {

		if (statusBean == null) {

			statusBean = new StatusBean();
		}

		statusBean.setCloseCurrent(closeFlag);

		statusBean.setStatusCode(300);

		statusBean.setMessage("操作失败");

		return statusBean;
	}

	public synchronized String getOrderNo() {

		int randomi = (int) (Math.random() * 900) + 100;

		String orderno = Utils.getNowStr("yyyyMMddHHmmssSSS") + randomi;

		return orderno;
	}
}
