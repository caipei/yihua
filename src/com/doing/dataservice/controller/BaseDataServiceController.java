package com.doing.dataservice.controller;

import java.io.InputStream;
import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;

import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.common.utils.base.InputStreamUtils;
import com.doing.common.variable.ResultCode;
import com.doing.dataservice.entity.Status;
import com.jfinal.kit.PropKit;

public class BaseDataServiceController extends BaseController {

	public HashMap getRequestParams(String str) {

		return GsonUtils.fromJson(str, HashMap.class);
	}

	public void setStatusError(Status status, String errdesc) {

		status.setErrcode(ResultCode.ERR_9999);

		status.setSucceed(0);

		status.setErrdesc(errdesc);
	}

	public Status getRegexStatus(String methodName,
			HashMap<String, String> paramsHm) {

		Status status = new Status();

		status.setSucceed(1);

		if (paramsHm != null) {

			String paramsStr = PropKit.get(methodName);

			if (StringUtils.isNotBlank(paramsStr)) {

				String[] paramsArr = StringUtils.split(paramsStr, "|");

				boolean flag = true;

				for (String key : paramsArr) {

					if (StringUtils.isNotBlank(key)) {

						if (StringUtils.isBlank(StringUtils.trim(paramsHm
								.get(key)))) {

							flag = false;

							break;
						}
					}
				}
				if (!flag) {

					status.setSucceed(0);

					status.setErrcode(ResultCode.ERR_9999);

					status.setErrdesc("参数提交失败");
				}
			}
		} else {

			status.setSucceed(0);

			status.setErrcode(ResultCode.ERR_9999);

			status.setErrdesc("参数提交失败");
		}

		return status;
	}

	public String decryptRequest(Status status) {

		String requestStr = "";

		try (InputStream in = getRequest().getInputStream();) {

			requestStr = Utils.decryptResult(InputStreamUtils
					.InputStreamTOByte(in));

		} catch (Exception e) {
			// TODO: handle exception

			status.setSucceed(0);
			status.setErrcode(ResultCode.ERR_9999);
			status.setErrdesc("");
		}

		return requestStr;
	}
}
