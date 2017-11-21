package com.doing.common.utils;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

import com.doing.common.utils.base.AESUtils;
import com.doing.common.variable.Common;
import com.google.gson.Gson;

/**
 * 通用工具类
 * 
 * @author xuj 2013.5.7
 * 
 */
public class Utils {
	/**获取取随意长度的（数字）或（数字+字符）的验证码*/
	public static String getValidateCode(boolean isNumber,int leng){
		String validateCode="";
		String  validateString=isNumber?"1234567890":"1234567890ABCDEFGHIJKLMNPQRSTUVWXWZ";
		boolean isTure=true;
		while(isTure){
			int count=0;
			for(int i=0;i<leng;i++){
				double dbR=Math.random()*validateString.length();
				int intR=(int)Math.floor(dbR);
				char c=validateString.charAt(intR);
				if(('0'<=c) && (c<='9')){
					count++;
				}
				validateCode+=validateString.charAt(intR);
			}
			if(count>=2){
				isTure=false;
			}
		}
		return validateCode;
	}
	public static String getStrVal(Object o) {
		String result = (o != null) ? o.toString() : "";
		return result;
	}

	public static String getStrDefaultVal(Object o, String defaultVal) {
		String result = (o != null) ? o.toString() : defaultVal;
		return result;
	}

	public static int getIntVal(Object o, int defaultVal) {
		String resultStr = (o != null) ? o.toString() : "";
		int result = isNum(resultStr) ? Integer.parseInt(resultStr)
				: defaultVal;
		return result;
	}

	public static long getLongVal(Object o, long defaultVal) {
		String resultStr = (o != null) ? o.toString() : "";
		long result = isNum(resultStr) ? Long.parseLong(resultStr) : defaultVal;
		return result;
	}

	public static Float getFloatVal(Object o, Float defaultVal) {
		String resultStr = (o != null) ? o.toString() : "";
		Float result = isDecimal(resultStr) ? Float.parseFloat(resultStr)
				: defaultVal;
		return result;
	}

	public static Double getDoubleVal(Object o, Double defaultVal) {
		String resultStr = (o != null) ? o.toString() : "";
		Double result = isDecimal(resultStr) ? Double.parseDouble(resultStr)
				: defaultVal;
		return result;
	}
	
	public static Boolean getBooleanVal(Object o, Boolean defaultVal) {
		String resultStr = (o != null) ? o.toString() : "";
		if (StringUtils.equals(resultStr, "true")) {
			return true;
		} else if (StringUtils.equals(resultStr, "false")) {
			return false;
		} else {
			return defaultVal;
		}
	}
	
	public static boolean isNum(String str) {
		if (str == null || "".equals(str.trim())) {
			return false;
		}
		Pattern pattern = Pattern.compile("^\\-?[0-9]+$");
		return pattern.matcher(str).matches();
	}

	public static boolean isDecimal(String str) {
		if (str == null || "".equals(str))
			return false;
		Pattern pattern = Pattern.compile("\\-?[0-9]+(\\.\\d+)?");
		return pattern.matcher(str).matches();
	}

	public static synchronized String getNowStr(String pattern) {

		String str = DateTime.now()
				.toString(DateTimeFormat.forPattern(pattern));
		return str;
	}

	/**
	 * 验证邮箱地址是否正确
	 * 
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}

		return flag;
	}

	/**
	 * 验证手机号码
	 * 
	 * @param mobiles
	 * @return
	 */
	public static boolean isMobileNO(String mobiles) {
		boolean flag = false;
		try {
			Pattern p = Pattern
					.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
			Matcher m = p.matcher(mobiles);
			flag = m.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	public static String numFormat(int len, int num) {
		NumberFormat formatter = NumberFormat.getNumberInstance();
		formatter.setMinimumIntegerDigits(len);
		formatter.setGroupingUsed(false);
		String numStr = formatter.format(num);
		return numStr;
	}

	public static String toJson(Object obj) {
		String jsonStr = "{}";
		if (obj != null) {
			Gson gson = new Gson();
			jsonStr = gson.toJson(obj);
			jsonStr = jsonStr.replace("\\u003d", "=").replace("\\u0026", "&")
					.replace("\\u0027", "'");
		}
		return jsonStr;
	}

	// 解密
	public static String decryptResult(byte[] req) {
		String decryptStr = "";
		try {
//			decryptStr = RSAUtils.decryptByPrivateKey(requestStr,
//					Common.PRIVATE_KEY);
			decryptStr = AESUtils.decryptByte(Common.AES_KEY, req);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return decryptStr;
	}

	// 加密
	public static byte[] encryptResult(String responseStr) {
		byte[] encryptedData = null;
		try {
			encryptedData = AESUtils.encryptByte(Common.AES_KEY, responseStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return encryptedData;
	}

	// 获取解密参数
	@SuppressWarnings("unchecked")
	public static HashMap<String, String> judgeParams(String jsonStr) {
		HashMap<String, String> paramsHm = null;
//		String decryptStr = Utils.decryptResult(jsonStr);
//		if (!"".equals(decryptStr)) {
//			paramsHm = GsonUtils.fromJson(decryptStr, HashMap.class);
//		}
		return paramsHm;
	}

	public static int getRandom() {
		Random random = new Random();
		int x = random.nextInt(899999) + 100000;
		return x;
	}

	public static String clearHtml(String content) {
		content = content.replaceAll(".*?<body.*?>(.*?)<\\/body>", "$1"); // 读出body内里所有内容
		content = content.replaceAll("</?[^/?(br)|(p)|(img)][^><]*>", "");// 保留br、p、img标签
		content = content.replaceAll("style=\".*?\"", "");
		return content;
	}

	public static String removeHtmlTag(String inputString) {
		if (inputString == null)
			return null;
		String htmlStr = inputString; // 含html标签的字符串
		String textStr = "";
		java.util.regex.Pattern p_script;
		java.util.regex.Matcher m_script;
		java.util.regex.Pattern p_style;
		java.util.regex.Matcher m_style;
		java.util.regex.Pattern p_html;
		java.util.regex.Matcher m_html;
		java.util.regex.Pattern p_special;
		java.util.regex.Matcher m_special;
		try {
			// 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";
			// 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
			// 定义HTML标签的正则表达式
			String regEx_html = "<[^>]+>";
			// 定义一些特殊字符的正则表达式 如：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			String regEx_special = "\\&[a-zA-Z]{1,10};";
			p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
			m_script = p_script.matcher(htmlStr);
			htmlStr = m_script.replaceAll(""); // 过滤script标签
			p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
			m_style = p_style.matcher(htmlStr);
			htmlStr = m_style.replaceAll(""); // 过滤style标签
			p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(htmlStr);
			htmlStr = m_html.replaceAll(""); // 过滤html标签
			p_special = Pattern
					.compile(regEx_special, Pattern.CASE_INSENSITIVE);
			m_special = p_special.matcher(htmlStr);
			htmlStr = m_special.replaceAll(""); // 过滤特殊标签
			textStr = htmlStr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return textStr;// 返回文本字符串
	}
	
	public static void main(String[] args) {
		
		System.out.println(isNum("1"));
		System.out.println(isNum("111111"));
		System.out.println(isNum("0"));
		System.out.println(isNum("-111111"));
	}

}
