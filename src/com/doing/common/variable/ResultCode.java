package com.doing.common.variable;

/**
 * 
 * ERR_1001 session失效;
 * ERR_1002  数据提交失败;
 * ERR_1003  没有权限;
 * ERR_1004  用户名或密码错误;
 */

public class ResultCode {

	public static String SUCCESS = "0000"; // 成功

	public static String ERR_1001 = "1001"; // session失效

	public static String ERR_1001_STR = "session失效"; // session失效

	public static String ERR_1002 = "1002"; // 数据提交失败

	public static String ERR_1002_STR = "数据提交失败"; // 数据提交失败

	public static String ERR_1003 = "1003";

	public static String ERR_1003_STR = "没有权限";

	public static String ERR_1004 = "1004";

	public static String ERR_1004_STR = "用户名或密码错误";
	
	public static String ERR_1005_STR = "数据获取失败";
	
	public static String ERR_9999 = "9999";// 自定义错误提示
}
