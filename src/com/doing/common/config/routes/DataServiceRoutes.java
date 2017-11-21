package com.doing.common.config.routes;

import com.doing.dataservice.controller.DataServiceController;
import com.doing.dataservice.controller.InfoDataService;
import com.doing.dataservice.controller.MemberDataService;
import com.doing.dataservice.controller.MerchantDataServiceController;
import com.doing.dataservice.controller.VideoDataService;
import com.jfinal.config.Routes;

public class DataServiceRoutes extends Routes {

	@Override
	public void config() {
		// TODO Auto-generated method stub
		add("/data/member", MemberDataService.class);
		add("/data/video", VideoDataService.class);
		add("/data/info", InfoDataService.class);
		add("/data", DataServiceController.class);
		add("/data/merchant", MerchantDataServiceController.class);
	}

}
