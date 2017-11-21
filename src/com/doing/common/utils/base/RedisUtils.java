package com.doing.common.utils.base;

import org.apache.commons.lang3.StringUtils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Redis 工具类
 * 
 * @author caspar http://blog.csdn.net/tuposky
 *
 *         ###redis##config######## #redis服务器ip # redis.ip=172.30.5.117
 *         #redis服务器端口号# redis.port=6379
 *
 *         ###jedis##pool##config### #jedis的最大分配对象# jedis.pool.maxActive=1024
 *         #jedis最大保存idel状态对象数 # jedis.pool.maxIdle=200 #jedis池没有对象返回时，最大等待时间 #
 *         jedis.pool.maxWait=1000 #jedis调用borrowObject方法时，是否进行有效检查#
 *         jedis.pool.testOnBorrow=true #jedis调用returnObject方法时，是否进行有效检查 #
 *         jedis.pool.testOnReturn=true
 *
 */
public class RedisUtils {
	// Redis服务器IP
	private static String ADDR = "121.41.24.198";

	// Redis的端口号
	private static int PORT = 6379;

	// 可用连接实例的最大数目，默认值为8；
	// 如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
	private static int MAX_ACTIVE = 1024;

	// 控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8。
	private static int MAX_IDLE = 200;

	// 等待可用连接的最大时间，单位毫秒，默认值为-1，表示永不超时。如果超过等待时间，则直接抛出JedisConnectionException；
	private static int MAX_WAIT = 10000;

	private static int TIMEOUT = 10000;

	// 在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
	private static boolean TEST_ON_BORROW = true;

	private static JedisPool jedisPool = null;

	/**
	 * 初始化Redis连接池
	 */
	static {
		try {
			JedisPoolConfig config = new JedisPoolConfig();
			config.setMaxTotal(MAX_ACTIVE);
			config.setMaxIdle(MAX_IDLE);
			config.setMaxWaitMillis(MAX_WAIT);
			config.setTestOnBorrow(TEST_ON_BORROW);
			jedisPool = new JedisPool(config, ADDR, PORT, TIMEOUT);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取Jedis实例
	 * 
	 * @return
	 */
	public synchronized static Jedis getJedis() {
		try {
			if (jedisPool != null) {
				Jedis resource = jedisPool.getResource();
				return resource;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 释放jedis资源
	 * 
	 * @param jedis
	 */
	@SuppressWarnings("deprecation")
	public static void returnResource(final Jedis jedis) {
		if (jedis != null) {
			jedisPool.returnResource(jedis);
		}
	}

	private static RedisUtils mInstance = new RedisUtils();

	private RedisUtils() {

	}

	public static RedisUtils getInstance() {
		return mInstance;
	}

	public boolean add(String key, Object value) {

		if (StringUtils.isNotBlank(key) && value != null) {

			String s = getJedis().set(SerializeUtils.serialize(key),
					SerializeUtils.serialize(key));

			return "OK".equals(s) ? true : false;
		} else {

			return false;
		}
	}

	public boolean add(String key, Object value, int expireInSeconds) {

		if (StringUtils.isNotBlank(key) && value != null) {

			String s = getJedis().set(SerializeUtils.serialize(key),
					SerializeUtils.serialize(key));

			getJedis().expire(SerializeUtils.serialize(key), expireInSeconds);

			return "OK".equals(s) ? true : false;

		} else {

			return false;
		}

	}

	public boolean add(String key, String value) {

		if (StringUtils.isNotBlank(key) && StringUtils.isNotEmpty(value)) {

			String s = getJedis().set(key, value);

			return "OK".equals(s) ? true : false;
		} else {

			return false;
		}

	}

	public boolean add(String key, String value, int expireInSeconds) {

		if (StringUtils.isNotBlank(key) && StringUtils.isNotEmpty(value)) {

			String s = getJedis().set(SerializeUtils.serialize(key),
					SerializeUtils.serialize(key));

			getJedis().expire(SerializeUtils.serialize(key), expireInSeconds);

			return "OK".equals(s) ? true : false;
		} else {

			return false;
		}
	}

	public boolean delete(String key) {

		long s = getJedis().del(SerializeUtils.serialize(key));

		return s > 0 ? true : false;
	}

	public Object get(String key) {

		if (StringUtils.isNotBlank(key)) {

			return getJedis().get(SerializeUtils.serialize(key));

		} else {

			return null;
		}
	}

	public String getString(String key) {

		if (StringUtils.isNotBlank(key)) {

			return getJedis().get(key);

		} else {

			return null;
		}
	}

	/**
	 * 将该key值对应的值+1保存
	 *
	 * @author niuzf
	 */
	public long incr(String key, int expireInSeconds) {
		long s = getJedis().incr(SerializeUtils.serialize(key));
		getJedis().expire(SerializeUtils.serialize(key), expireInSeconds);
		return s;
	}

	public boolean replace(String key, Object value) {
		if (getJedis().exists(SerializeUtils.serialize(key))) {
			return add(key, value);
		} else {
			return false;
		}
	}

	public boolean replace(String key, Object value, int expireInSeconds) {
		if (getJedis().exists(SerializeUtils.serialize(key))) {
			return add(key, value, expireInSeconds);
		} else {
			return false;
		}
	}

	public void expire(String key, int expireInSeconds) {
		getJedis().expire(SerializeUtils.serialize(key), expireInSeconds);
	}

	public static void main(String[] args) {

	}
}