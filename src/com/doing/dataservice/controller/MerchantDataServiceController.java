package com.doing.dataservice.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;

import com.doing.common.utils.MessageSendUtil;
import com.doing.common.utils.Utils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class MerchantDataServiceController extends Controller {

	// 1发送验证码
	public void sendVerificationCode() {
		String telephone = Utils.getStrVal(getPara("telephone"));
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String code = Utils.getValidateCode(true, 4);
		String sendInfo = "@1@=" + code;
		boolean msg = true;
		try {
			MessageSendUtil messageSendUtil = new MessageSendUtil();
			msg = messageSendUtil.handleMsg(telephone, sendInfo,
					"JSM41349-0003");
		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (msg) {
			resultHm.put("isSuccessful", 0);
			resultHm.put("code", code);
			resultHm.put("rescnt", "验证码发送成功");
		} else {
			resultHm.put("isSuccessful", 1);
			resultHm.put("rescnt", "验证码发送失败");
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 2登陆
	public void login() {

		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String telephone = Utils.getStrVal(getPara("telephone"));
		String password = Utils.getStrVal(getPara("password"));
		password = DigestUtils.md5Hex(password);
		String sql = "";
		String sqlStr = "select id from t_merchant where telephone = ? ";
		Record record = Db.findFirst(sqlStr, telephone);
		if (record == null) {
			resultHm.put("isSuccessful", 2);
			resultHm.put("rescnt", "用户名不存在");
		} else {
			sql = "select *"
					+ " from t_merchant t where t.telephone = ? and t.password = ?  ";
			Record findFirst = Db.findFirst(sql, telephone, password);
			if (findFirst != null) {
				resultHm.put("userId", findFirst.get("id"));
				resultHm.put("isSuccessful", 0);
			} else {
				resultHm.put("isSuccessful", 2);
				resultHm.put("rescnt", "密码错误");
			}
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 3注册
	public void register() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String telephone = Utils.getStrVal(getPara("telephone"));
		String password = Utils.getStrVal(getPara("password"));
		String category = Utils.getStrVal(getPara("category"));
		String type = Utils.getStrVal(getPara("type"));
		String address = Utils.getStrVal(getPara("address"));
		String actionTime = Utils.getStrVal(getPara("actionTime"));
		String endTime = Utils.getStrVal(getPara("endTime"));
		String license = Utils.getStrVal(getPara("license"));
		String restaurant = Utils.getStrVal(getPara("restaurant"));
		try {
			if (isMessyCode(telephone)) {
				telephone = new String(Utils.getStrVal(getPara("telephone"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(password)) {
				password = new String(Utils.getStrVal(getPara("password"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(category)) {
				category = new String(Utils.getStrVal(getPara("category"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(type)) {
				type = new String(Utils.getStrVal(getPara("type")).getBytes(
						"iso-8859-1"), "utf-8");
			}
			if (isMessyCode(address)) {
				address = new String(Utils.getStrVal(getPara("address"))
						.getBytes("iso-8859-1"), "utf-8");
			}

			if (isMessyCode(actionTime)) {
				actionTime = new String(Utils.getStrVal(getPara("actiontime"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(endTime)) {
				endTime = new String(Utils.getStrVal(getPara("endtime"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(license)) {
				license = new String(Utils.getStrVal(getPara("license"))
						.getBytes("iso-8859-1"), "utf-8");
			}
			if (isMessyCode(restaurant)) {
				restaurant = new String(Utils.getStrVal(getPara("restaurant"))
						.getBytes("iso-8859-1"), "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Record record = Db.findFirst(
				"select count(id) as num from t_merchant where telephone = ? ",
				telephone);
		if (record != null && record.getLong("num") > 0) {
			resultHm.put("isSuccessful", 1);
			resultHm.put("rescnt", "手机号码已注册");
		} else {
			password = DigestUtils.md5Hex(password);
			Record set = new Record().set("telephone", telephone)
					.set("password", password).set("createtime", new Date())
					.set("category", category).set("type", type)
					.set("address", address).set("actiontime", actionTime)
					.set("endtime", endTime).set("license", license)
					.set("restaurant", restaurant)
					.set("id", getIdkey("t_merchant"));
			Db.save("t_merchant", set);
			resultHm.put("id", set.get("id"));
		}
		renderJson(Utils.toJson(resultHm));

	}

	// 4修改密码
	public void updatePassword() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String telephone = Utils.getStrVal(getPara("telephone"));
		String password = Utils.getStrVal(getPara("password"));
		password = DigestUtils.md5Hex(password);
		Db.update("update t_merchant set password = ? where telephone = ? ",
				password, telephone);
		renderJson(Utils.toJson(resultHm));
	}

	// 5完善商家信息
	public void perfectMerchant() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String category = Utils.getStrVal(getPara("category"));
		String type = Utils.getStrVal(getPara("type"));
		String address = Utils.getStrVal(getPara("address"));
		String actionTime = Utils.getStrVal(getPara("actionTime"));
		String endTime = Utils.getStrVal(getPara("endTime"));
		String license = Utils.getStrVal(getPara("license"));
		String restaurant = Utils.getStrVal(getPara("restaurant"));
		String send = Utils.getStrVal(getPara("send"));
		String cost = Utils.getStrVal(getPara("cost"));
		String time = Utils.getStrVal(getPara("time"));
		String business = Utils.getStrVal(getPara("business"));
		try {
			if (StringUtils.isNotBlank(category)) {
				Db.update("update t_merchant set category = ? where id = ?",
						category, merId);
			}
			if (StringUtils.isNotBlank(type)) {
				Db.update("update t_merchant set type = ? where id = ?", type,
						merId);
			}
			if (StringUtils.isNotBlank(address)) {
				Db.update("update t_merchant set address = ? where id = ?",
						address, merId);
			}
			if (StringUtils.isNotBlank(actionTime)) {
				Db.update("update t_merchant set actionTime = ? where id = ?",
						actionTime, merId);
			}
			if (StringUtils.isNotBlank(endTime)) {
				Db.update("update t_merchant set endTime = ? where id = ?",
						endTime, merId);
			}
			if (StringUtils.isNotBlank(license)) {
				Db.update("update t_merchant set license = ? where id = ?",
						license, merId);
			}
			if (StringUtils.isNotBlank(restaurant)) {
				Db.update("update t_merchant set restaurant = ? where id = ?",
						restaurant, merId);
			}
			if (StringUtils.isNotBlank(send)) {
				Db.update("update t_merchant set send = ? where id = ?", send,
						merId);
			}
			if (StringUtils.isNotBlank(time)) {
				Db.update("update t_merchant set time = ? where id = ?", time,
						merId);
			}
			if (StringUtils.isNotBlank(business)) {
				Db.update("update t_merchant set business = ? where id = ?",
						business, merId);
			}
			if (StringUtils.isNotBlank(cost)) {
				Db.update("update t_merchant set cost = ? where id = ?", cost,
						merId);
			}
			resultHm.put("isSuccessful", 0);
		} catch (Exception e) {
			resultHm.put("isSuccessful", 1);
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 6查看我的店铺
	public void myMerchant() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		Record record = Db.findFirst("select * from t_merchant where id = ? ",
				merId);
		if (record != null) {
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DATE, 1);
			String sql = "select count(paymoney) as income from t_order where merid = ? and createtime between ? and ? ";
			resultHm.put("name", record.get("name"));
			resultHm.put("logo", record.get("logo"));
			record = Db.findFirst(sql, merId, format.format(date),
					format.format(cal.getTime()));
			resultHm.put("income", record.get("incom"));
			resultHm.put("isSuccessful", 0);
		} else {
			resultHm.put("isSuccessful", 1);
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 7查看钱包
	public void checkPurse() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		Record record = Db.findById("t_merchant", merId);
		resultHm.put("remainMoney", record.get("remainmoney"));
		resultHm.put("bankName", record.get("bankname"));
		resultHm.put("cardNum", record.get("cardnum"));
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 8提现列表
	public void tiXianList() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		List<Record> find = Db
				.find("select applymoney,createtime,ishandle from t_merchant_record where merchantId = ? ",
						merId);
		HashMap<String, Object> tiXianList = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record record : find) {
			tiXianList = new HashMap<String, Object>();
			tiXianList.put("applyMoney", record.get("applymoney"));
			tiXianList.put("time", record.get("createtime"));
			tiXianList.put("isHandle", record.get("ishandle"));
			list.add(tiXianList);
		}
		resultHm.put("tiXianList", list);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 9绑定银行卡
	public void addBank() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String accountName = Utils.getStrVal(getPara("accountName"));
		String bankName = Utils.getStrVal(getPara("bankName"));
		String cardNum = Utils.getStrVal(getPara("merId"));
		Db.update(
				" update t_merchant set accountname = ? ,bankname = ? ,cardnum = ? where id = ? ",
				accountName, bankName, cardNum, merId);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 10订单列表
	public void orderList() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		List<Record> find = Db
				.find("select orderno , paymoney , createtime , id from t_order where merid = ? ",
						merId);
		HashMap<String, Object> orderList = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record record : find) {
			orderList = new HashMap<String, Object>();
			orderList.put("orderId", record.get("id"));
			orderList.put("orderNum", record.get("orderno"));
			orderList.put("payMoney", record.get("paymoney"));
			orderList.put("createTime", record.get("createtime"));
			list.add(orderList);
		}
		resultHm.put("orderList", list);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 11订单详情
	public void orderDetail() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String orderId = Utils.getStrVal(getPara("orderId"));
		StringBuffer buffer = new StringBuffer()
				.append(" select t.send,t.orderno,t.paymoney,t.createtime, ")
				.append(" t.paytype,t.address,t.delivertime,t.leavemessage, ")
				.append(" t.telephone,t.username,t.paymoney,t.yhqprice ")
				.append(" from t_order where t.id = ? ");
		Record record = Db.findFirst(buffer.toString(), orderId);
		List<Record> find = Db.find(
				"select count,goodname, from t_order_good where orderid = ? ",
				orderId);
		HashMap<String, Object> proList = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record record1 : find) {
			proList = new HashMap<String, Object>();
			proList.put("productName", record1.get("goodname"));
			proList.put("num", record1.get("count"));
			proList.put("price", record1.get("price"));
			list.add(proList);
		}
		resultHm.put("productList", list);
		resultHm.put("privilege", record.get("price"));
		resultHm.put("payMoney", record.get("paymoney"));
		resultHm.put("orderNum", record.get("ordernum"));
		resultHm.put("createTime", record.get("createtime"));
		resultHm.put("payType", record.get("paytype"));
		resultHm.put("address", record.get("address"));
		resultHm.put("leaveMessage", record.get("leavemessage"));
		resultHm.put("deliverTime", record.get("delivertime"));
		resultHm.put("telephone", record.get("telephone"));
		resultHm.put("userName", record.get("username"));
		resultHm.put("payModel", record.get("paymoney"));
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));

	}

	// 12发布商品
	public void addProduct() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String imgpath = Utils.getStrVal(getPara("imageUrl"));
		String kindId = Utils.getStrVal(getPara("kindId"));
		String price = Utils.getStrVal(getPara("price"));
		String content = Utils.getStrVal(getPara("content"));
		String status = Utils.getStrVal(getPara("status"));
		String name = Utils.getStrVal(getPara("name"));
		Record record = new Record().set("id", getIdkey("t_goods"))
				.set("merid", merId).set("kindid", kindId).set("price", price)
				.set("status", status).set("createtime", new Date())
				.set("imgpath", imgpath).set("name", name)
				.set("remark", content);
		boolean save = Db.save("t_goods", record);
		if (save) {
			resultHm.put("isSuccessful", 0);
		} else {
			resultHm.put("isSuccessful", 1);
		}
		renderJson(Utils.toJson(resultHm));
	}

	// 13店铺公告
	public void addNotice() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String content = Utils.getStrVal(getPara("content"));
		Db.update("update t_merchant set notice = ? where id = ? ", content,
				merId);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 14查看公告
	public void checkNotice() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		Record record = Db.findFirst(
				"select notice,id from t_merchant where id = ? ", merId);
		resultHm.put("content",
				record.get("notice") != null ? record.get("notice") : "");
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 15添加优惠信息
	public void addPrivilege() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String status = Utils.getStrVal(getPara("status"));
		String price = Utils.getStrVal(getPara("price"));
		String vaild = Utils.getStrVal(getPara("vaild"));
		String condition = Utils.getStrVal(getPara("condition"));
		Db.update(
				"update t_merchant set yhqprice = ? , yhqstatus = ? , condition = ? , vaild = ? where id = ? ",
				price, status, condition, vaild, merId);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 16查看优惠信息
	public void checkPrivilege() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		Record record = Db
				.findFirst(
						" select yhqprice,yhqstatus,vaild,condition from t_merchant where id = ? ",
						merId);
		resultHm.put("status", record.get("yhqstatus"));
		resultHm.put("price", record.get("yhqprice"));
		resultHm.put("vaild", record.get("vaild"));
		resultHm.put("condition", record.get("condition"));
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 17.修改优惠信息
	public void updatePrivilege() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merid"));
		String type = Utils.getStrVal(getPara("type"));
		Db.update("update t_merchant set yhqstatus = ? where id = ? ", type,
				merId);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 18.意见反馈
	public void addfeedback() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String content = Utils.getStrVal(getPara("content"));
		Record record = new Record().set("id", getIdkey("t_advise"))
				.set("createtime", new Date()).set("content", content)
				.set("otherid", merId).set("type", 2);
		Db.save("t_advise", record);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 19.待处理订单列表
	public void waitOrderList() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String type = Utils.getStrVal(getPara("type"));// 1.待处理 2.待配送 3.待送达
														// 4.待退款 5.已完成 6.已关闭
		List<Record> find = Db
				.find(" select t.orderno,t.createtime,t.yhqprice,t.paymoney,t.orderstatus from t_order t  where merid = ? , orderStatus = ? ",
						merId, type);
		HashMap<String, Object> ordList = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record record : find) {
			ordList = new HashMap<String, Object>();
			ordList.put("orderNum", record.get("ordernum"));
			ordList.put("createTime", record.get("createtime"));
			ordList.put("couple", record.get("yhqprice"));
			ordList.put("payMoney", record.get("paymoney"));
			ordList.put("orderStatus", record.get("orderstatus"));
			List<Record> find2 = Db
					.find(" select count,goodname,price from t_order_good  where orderid = ? ",
							record.get("id"));
			HashMap<String, Object> proList = new HashMap<String, Object>();
			List<HashMap<String, Object>> list1 = new ArrayList<HashMap<String, Object>>();
			for (Record record2 : find2) {
				proList = new HashMap<String, Object>();
				proList.put("productName", record2.get("goodname"));
				proList.put("num", record2.get("count"));
				proList.put("price", record2.get("price"));
				list1.add(proList);
			}
			ordList.put("productList", list1);
			list.add(ordList);
		}
		resultHm.put("orderList", list);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 20.添加商品分类
	public void addKind() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String name = Utils.getStrVal(getPara("name"));
		Record record = new Record().set("id", getIdkey("t_kind"))
				.set("createtime", new Date()).set("kindname", name)
				.set("merid", merId);
		boolean save = Db.save("t_kind", record);
		resultHm.put("isSuccessful", save ? 0 : 1);
		renderJson(Utils.toJson(resultHm));
	}

	// 21.查看分类列表
	public void kindList() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		List<Record> find = Db.find(
				"select t.id, t.kindname,count(1) as kindnum "
						+ " from t_kind t left join t_goods s "
						+ " on t.id=s.kindid " + " where t.merid = ? ", merId);
		HashMap<String, Object> kindList = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record record : find) {
			kindList = new HashMap<String, Object>();
			kindList.put("kindName", record.get("kindname"));
			kindList.put("kindId", record.get("id"));
			kindList.put("kindNum", record.get("kindnum"));
			list.add(kindList);
		}
		resultHm.put("kindList", list);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 22.商品列表
	public void productList() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String type = Utils.getStrVal(getPara("type"));
		List<Record> find = Db
				.find("select t.kindid,t.imgpath,t.name,t.price,count(s.id) as salenum "
						+ "from t_goods t left join t_order_good s on s.goodid=t.id  "
						+ "where t.status = ? and t.merid = ? ", type, merId);
		HashMap<String, Object> proList = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record record : find) {
			if (record.get("name") != null) {
				proList = new HashMap<String, Object>();
				proList.put("imageUrl", record.get("imagepath"));
				proList.put("proName", record.get("name"));
				proList.put("price", record.get("price"));
				proList.put("saleNum", record.get("salenum"));
				String str = record.get("kindid");
				String[] split = str.split(",");
				HashMap<String, Object> kindList = new HashMap<String, Object>();
				List<HashMap<String, Object>> list1 = new ArrayList<HashMap<String, Object>>();
				for (String string : split) {
					Record first = Db.findFirst(
							" select kindname from t_kind where id = ? ",
							string);
					kindList = new HashMap<String, Object>();
					kindList.put("kindName", first.get("kindname"));
					list1.add(kindList);
				}
				proList.put("kindList", list1);
				list.add(proList);
			}
		}
		resultHm.put("productList", list);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 23.分类下商品列表
	public void productKindList() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String kindId = Utils.getStrVal(getPara("kindId"));
		List<Record> find = Db
				.find(" select t.kindid,t.imgpath,t.name,t.price,count(s.id) as salenum "
						+ "from t_goods t left join t_order_good s on s.goodid=t.id  "
						+ "where t.kindid like ? and t.merid = ? ", "%"
						+ kindId + "%", merId);
		HashMap<String, Object> proList = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (Record record : find) {
			if (record.get("name") != null) {
				proList = new HashMap<String, Object>();
				proList.put("imageUrl", record.get("imagepath"));
				proList.put("proName", record.get("name"));
				proList.put("price", record.get("price"));
				proList.put("saleNum", record.get("salenum"));
				String str = record.get("kindid");
				String[] split = str.split(",");
				HashMap<String, Object> kindList = new HashMap<String, Object>();
				List<HashMap<String, Object>> list1 = new ArrayList<HashMap<String, Object>>();
				for (String string : split) {
					Record first = Db.findFirst(
							" select kindname from t_kind where id = ? ",
							string);
					kindList = new HashMap<String, Object>();
					kindList.put("kindName", first.get("kindname"));
					list1.add(kindList);
				}
				proList.put("kindList", list1);
			}
			list.add(proList);
		}
		resultHm.put("productList", list);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 24.商品上/下架
	public void updateProductStatus() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String proId = Utils.getStrVal(getPara("proId"));
		String type = Utils.getStrVal(getPara("type"));
		Db.update(" update t_goods set status = ? where id = ? ", type, proId);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 25.删除商品
	public void deleteProduct() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String proId = Utils.getStrVal(getPara("proId"));
		Db.deleteById("t_goods", proId);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 26.提现
	public void tixian() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		Record record = Db
				.findFirst(
						" select canapplymoney,cardnum,bankname,accountname from t_merchant where id = ? ",
						merId);
		resultHm.put("accountname", record.get("accountname"));
		resultHm.put("bankName", record.get("bankname"));
		resultHm.put("cardnum", record.get("cardnum"));
		resultHm.put("canapplymoney", record.get("canapplymoney"));
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));
	}

	// 27.确认提现
	public void affirmtixian() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		String merId = Utils.getStrVal(getPara("merId"));
		String money = Utils.getStrVal(getPara("money"));
		String accountname = Utils.getStrVal(getPara("accountname"));
		String cardnum = Utils.getStrVal(getPara("cardnum"));
		double parseDouble = Double.parseDouble(money);
		Record record = Db.findFirst(
				" select canapplymoney from t_merchant where id = ? ", merId);
		Double canapplymoney = record.get("canapplymoney");
		if (canapplymoney - parseDouble > 0) {
			Db.update(
					" update t_merchant set canapplymoney = canapplymoney - ? where id = ? ",
					money, merId);
			Record record1 = new Record().set("applymoney", parseDouble)
					.set("createtime", new Date()).set("merchantid", merId)
					.set("accountname", accountname).set("cardnum", cardnum)
					.set("id", getIdkey("t_merchant_record"));
			Db.save("t_merchant_record", record1);
			resultHm.put("isSuccessful", 0);
		} else {
			resultHm.put("isSuccessful", 1);
		}

		renderJson(Utils.toJson(resultHm));
	}

	// 加载注册页面
	public void loadRegist() {
		HashMap<String, Object> resultHm = new HashMap<String, Object>();
		List<Record> find = Db
				.find("select id ,categoryname from t_category where status = 1 ");
		HashMap<String, Object> catMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> catlist = new ArrayList<HashMap<String, Object>>();
		for (Record record : find) {
			catMap = new HashMap<String, Object>();
			catMap.put("categoryname", record.get("categoryname"));
			catMap.put("id", record.get("id"));
			catlist.add(catMap);
		}
		resultHm.put("catlist", catlist);
		resultHm.put("isSuccessful", 0);
		renderJson(Utils.toJson(resultHm));

	}

	private synchronized String getIdkey(String table) {
		long idkey = 100001;
		String sql = "select max(id) as maxnum from " + table;
		Record record = Db.findFirst(sql);
		if (record != null) {
			idkey = Utils.getLongVal(record.get("maxnum"), 1000001);
			idkey = idkey + 1;
		}
		return String.valueOf(idkey);
	}

	public static boolean isChinese(char c) {
		Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
		if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
				|| ub == Character.UnicodeBlock.GENERAL_PUNCTUATION
				|| ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
				|| ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
			return true;
		}
		return false;
	}

	public static boolean isMessyCode(String strName) {
		Pattern p = Pattern.compile("\\s*|\t*|\r*|\n*");
		Matcher m = p.matcher(strName);
		String after = m.replaceAll("");
		String temp = after.replaceAll("\\p{P}", "");
		char[] ch = temp.trim().toCharArray();
		float chLength = ch.length;
		float count = 0;
		for (int i = 0; i < ch.length; i++) {
			char c = ch[i];
			if (!Character.isLetterOrDigit(c)) {

				if (!isChinese(c)) {
					count = count + 1;
					System.out.print(c);
				}
			}
		}
		float result = count / chLength;
		if (result > 0.4) {
			return true;
		} else {
			return false;
		}

	}

}
