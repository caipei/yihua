package com.doing.common.utils.base;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.jfinal.log.Logger;

public class SerializeUtils {

	private static Logger logger = Logger.getLogger(SerializeUtils.class);
	/**
	 * 序列化对象
	 * @param object 需要序列化的对象
	 * @return 字节数组
	 */
	public static byte[] serialize(Object object) {
		ObjectOutputStream oos = null;
		ByteArrayOutputStream baos = null;
		try {
			// 序列化
			baos = new ByteArrayOutputStream();
			oos = new ObjectOutputStream(baos);
			oos.writeObject(object);
			byte[] bytes = baos.toByteArray();
			return bytes;
		} catch (Exception e) {
			logger.error("序列化对象出现异常！");
		}
		return null;
	}

	/**
	 * 反序列化对象
	 * @param bytes 对象序列化后的字节数组
	 * @return Object
	 */
	public static Object unserialize(byte[] bytes) {
		ByteArrayInputStream bais = null;
		ObjectInputStream ois = null;
		try {
			// 反序列化
			bais = new ByteArrayInputStream(bytes);
			ois = new ObjectInputStream(bais);
			return ois.readObject();
		} catch (Exception e) {
			logger.error("反序列化对象出现异常！");
		}
		return null;
	}
}
