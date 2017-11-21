package com.doing.dataservice.interceptor;

import java.io.InputStream;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;

import com.doing.base.EncryptByteRender;
import com.doing.common.utils.QueueOptUtils;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.common.utils.base.InputStreamUtils;
import com.doing.common.utils.base.RedisUtils;
import com.doing.dataservice.entity.DataEntity;
import com.doing.dataservice.entity.RespDataEntity;
import com.doing.dataservice.entity.RespDataEntity.RespDataHeader;
import com.doing.dataservice.entity.Status;
import com.jfinal.aop.Before;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

@Before(DataServiceInterceptor.class)
public class DataServiceInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		// TODO Auto-generated method stub

		boolean flag = true;

		DataEntity dataBean = new DataEntity();

		Status status = new Status();

		dataBean.setStatus(status);

		try (InputStream in = inv.getController().getRequest().getInputStream();) {

			String str = Utils.decryptResult(InputStreamUtils
					.InputStreamTOByte(in));

			flag = checkRequestNew(inv, str);

		} catch (Exception e) {
			// TODO: handle exception
			flag = false;

			e.printStackTrace();
		}

		if (!flag) {
			status.setSucceed(0);
			status.setErrdesc("数据错误");
			inv.getController().render(
					new EncryptByteRender(GsonUtils.toJson(dataBean)));
		} else {
			inv.invoke();
		}
	}

	private boolean checkRequestNew(Invocation inv, String str) {

		boolean flag = true;

		if (StringUtils.isNotBlank(str)) {

			JSONObject jsonObject = new JSONObject(str);

			if (!jsonObject.isNull("body")) {

				inv.getController().setAttr("body",
						jsonObject.get("body").toString());

			}
		}

		return flag;
	}

	private boolean checkRequest(Invocation inv, String str) {

		boolean flag = true;

		if (StringUtils.isNotBlank(str)) {

			RespDataEntity entity = GsonUtils.fromJson(str,
					RespDataEntity.class);

			if (entity == null) {

				flag = false;

			} else {

				RespDataHeader header = entity.getHeader();

				String sign = entity.getSign();

				if (RedisUtils.getInstance().incr(sign, 60) > 3 && false) {

					flag = false;

				} else {

					String deviceId = header.getDeviceid();

					if (QueueOptUtils.exist(deviceId)) {

						flag = false;

					} else {

						JSONObject jsonObject = new JSONObject(str);

						if (!jsonObject.isNull("body")) {

							inv.getController().setAttr("body",
									jsonObject.get("body").toString());

						}
						// QueueOptUtils.addToQueue(deviceId);
					}
				}
			}

		} else {

			flag = false;
		}

		return flag;
	}
}
