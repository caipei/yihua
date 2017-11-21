package com.doing.admin.interceptor;

import com.doing.admin.bean.StatusBean;
import com.doing.common.utils.Utils;
import com.doing.common.utils.base.GsonUtils;
import com.doing.common.variable.Common;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

public class LoginJsonInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {

		// TODO Auto-generated method stub
		String loginflag = Utils.getStrVal(inv.getController().getSessionAttr("loginflag"));

		String userid = Utils.getStrVal(inv.getController().getSessionAttr("userid"));

		String roleid = Utils.getStrVal(inv.getController().getSessionAttr("roleid"));

		if (Common.STOPFLAG) {

			StatusBean statusBean = new StatusBean();

			statusBean.setStatusCode(301);

			statusBean.setMessage("会话超时");

			statusBean.setCloseCurrent(false);

			inv.getController().renderJson(GsonUtils.toJson(statusBean));

		} else {
			if ("success".equals(loginflag) && !"".equals(userid)
					&& !"".equals(roleid)) {
				inv.invoke();
			} else {
				StatusBean statusBean = new StatusBean();

				statusBean.setStatusCode(301);

				statusBean.setMessage("会话超时");

				statusBean.setCloseCurrent(false);

				inv.getController().renderJson(GsonUtils.toJson(statusBean));
			}
		}
	}

}
