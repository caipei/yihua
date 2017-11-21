package com.doing.common.utils;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

import org.apache.commons.lang3.StringUtils;

import com.doing.common.utils.base.RedisUtils;

public class QueueOptUtils {

	private static BlockingQueue<String> deviceQueue = new LinkedBlockingQueue<String>(
			10000);

	// 单位时间内设备数阀值
	private static int deviceLevel = 1000;

	// 过期时间
	private static int expireTime = 60;

	// 黑名单过期时间
	private static int hmdExpireTime = 1 * 24 * 60 * 60;

	// 将设备放入队列中
	public static void addToQueue(String deviceid) {
		deviceQueue.offer(deviceid);
	}

	// 启动将设备号放入缓存线程
	public static void startThread() {
		ExecutorService service = Executors.newCachedThreadPool();
		service.execute(new QueueOptRunnable());
		service.execute(new QueueOptRunnable());
	}

	// 判断设备是否在黑名单中
	public static boolean exist(String deviceid) {
		return StringUtils.isNotBlank(RedisUtils.getInstance().getString(
				"hmd_deviceid_" + deviceid));
	}

	/**
	 * 设备队列处理线程，取出队列中设备号放入缓存中
	 *
	 * @author xuj
	 *
	 */
	static class QueueOptRunnable implements Runnable {

		@Override
		public void run() {
			// TODO Auto-generated method stub
			while (true) {
				try {
					if (!deviceQueue.isEmpty()) {
						String key = deviceQueue.poll();
						// 1A2B3C4D5E6F7G8H9I0 服务器探测使用到的特殊设备号,需要过滤掉 BY NZF
						if (StringUtils.isNotBlank(key)
								&& !StringUtils.equalsIgnoreCase(
										"1A2B3C4D5E6F7G8H9I0", key)) {
							key = "deviceid_" + key;
							long value;
							value = RedisUtils.getInstance().incr(key,
									expireTime);
							if (value > deviceLevel) {
								RedisUtils.getInstance().add("hmd_" + key,
										true, hmdExpireTime);
							}
						}
					}
				} catch (Exception e) {

				} finally {
					try {
						Thread.sleep(15);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}
}
