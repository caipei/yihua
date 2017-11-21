package com.doing.common.config.routes;

import com.doing.admin.controller.AdminController;
import com.doing.admin.controller.AdviseController;
import com.doing.admin.controller.CategoryController;
import com.doing.admin.controller.ComplaintsController;
import com.doing.admin.controller.FuncController;
import com.doing.admin.controller.HomeTourController;
import com.doing.admin.controller.InfoController;
import com.doing.admin.controller.MemberBlogController;
import com.doing.admin.controller.MemberController;
import com.doing.admin.controller.MemberProController;
import com.doing.admin.controller.MerchantAdviseController;
import com.doing.admin.controller.MerchantController;
import com.doing.admin.controller.OwnerController;
import com.doing.admin.controller.PropertyController;
import com.doing.admin.controller.PropertyRepairController;
import com.doing.admin.controller.RoleController;
import com.doing.admin.controller.UploadController;
import com.doing.admin.controller.UserController;
import com.doing.admin.controller.VillageController;
import com.doing.admin.controller.VillageProFeeController;
import com.doing.admin.controller.good.CollegeGoodController;
import com.doing.admin.controller.good.MallGoodController;
import com.doing.admin.controller.good.ServiceTypeController;
import com.doing.admin.controller.order.CollegeOrderController;
import com.doing.admin.controller.order.MallOrderController;
import com.doing.admin.controller.order.ServiceOrderController;
import com.jfinal.config.Routes;

public class AdminRoutes extends Routes {

	@Override
	public void config() {
		// TODO Auto-generated method stub
		add("/admin", AdminController.class);
		add("/admin/user", UserController.class);
		add("/admin/role", RoleController.class);
		add("/admin/func", FuncController.class);
		add("/admin/info", InfoController.class);
		add("/admin/upload", UploadController.class);
		add("/admin/category", CategoryController.class);
		add("/admin/member", MemberController.class);
		add("/admin/property", PropertyController.class);
		add("/admin/member/blog", MemberBlogController.class);
		add("/admin/village", VillageController.class);
		add("/admin/owner", OwnerController.class);
		add("/admin/memberpro", MemberProController.class);
		add("/admin/villageprofee", VillageProFeeController.class);
		add("/admin/complaint", ComplaintsController.class);
		add("/admin/advise", AdviseController.class);
		add("/admin/repair", PropertyRepairController.class);
		add("/admin/hometour", HomeTourController.class);
		add("/admin/good/collegegood", CollegeGoodController.class);
		add("/admin/good/mallgood", MallGoodController.class);
		add("/admin/good/vipservice", ServiceTypeController.class);
		add("/admin/order/serviceorder", ServiceOrderController.class);
		add("/admin/order/collegeorder", CollegeOrderController.class);
		add("/admin/order/mallorder", MallOrderController.class);
		add("/admin/merchant", MerchantController.class);
		add("/admin/merchantAdvise",MerchantAdviseController.class);
	}

}
