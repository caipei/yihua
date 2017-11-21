package com.doing.common.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * 文件名称：sendSMS_demo.java
 *
 * 文件作用：美联软通 http接口使用实例
 *
 * 创建时间：2012-05-18
 *
 *
 * 返回值 说明 success:msgid 提交成功，发送状态请见4.1 error:msgid 提交失败 error:Missing username
 * 用户名为空 error:Missing password 密码为空 error:Missing apikey APIKEY为空 error:Missing
 * recipient 手机号码为空 error:Missing message content 短信内容为空 error:Account is
 * blocked 帐号被禁用 error:Unrecognized encoding 编码未能识别 error:APIKEY or password
 * error APIKEY 或密码错误 error:Unauthorized IP address 未授权 IP 地址 error:Account
 * balance is insufficient 余额不足 error:Black keywords is:党中央 屏蔽词
 */

public class MessageSendUtil {

	/**
	 * @param args
	 * @throws IOException
	 */
	public static boolean handleMsg(String phoneNo, String sendInfo,
			String tempid) throws Exception {
		boolean sendFlag = true;
		// 发送内容
		String content = sendInfo;
		// 发送内容
		// 创建StringBuffer对象用来操作字符串
		// &username=JSM40001&password=123456&veryCode=&mobile=15951977097&content=您好！您本次验证码为：174687，请勿告知他人&msgtype=1&code=gbk
		StringBuffer sb = new StringBuffer(
				"http://112.74.76.186:8030/service/httpService/httpInterface.do?method=sendMsg");

		// 用户名
		sb.append("&username=JSM41349");

		// password
		sb.append("&password=gc26ukk1");

		// 通信认证密码
		sb.append("&veryCode=hrpvhntaibec");

		// 向StringBuffer追加手机号码
		sb.append("&mobile=" + phoneNo + "");

		// 向StringBuffer追加消息内容转URL标准码
		sb.append("&content=" + content);

		//
		sb.append("&msgtype=2&code=utf-8");
		sb.append("&tempid=" + tempid);

		// 创建url对象
		URL url = new URL(sb.toString());

		// 打开url连接
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();

		// 设置url请求方式 ‘get’ 或者 ‘post’
		connection.setRequestMethod("POST");

		// 发送
		BufferedReader in = new BufferedReader(new InputStreamReader(
				url.openStream()));

		// 返回发送结果
		String inputline = in.readLine();
		if (inputline.indexOf("status") != -1) {
			// <returnstatus>Success</returnstatus>
			if (inputline.indexOf("0") == -1) {
				// 發送失敗
				sendFlag = false;
			}
		}
		// 输出结果
		System.out.println(inputline);

		return sendFlag;

	}

}
