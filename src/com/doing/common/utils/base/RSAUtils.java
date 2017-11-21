package com.doing.common.utils.base;

import java.io.ByteArrayOutputStream;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

import org.apache.commons.codec.binary.Base64;
//import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

/**
 * <p>
 * RSA公钥/私钥/签名工具包 字符串格式的密钥在未在特殊说明情况下都为BASE64编码格式<br/>
 * 由于非对称加密速度极其缓慢，一般文件不使用它来加密而是使用对称加密，<br/>
 * 非对称加密算法可以用来对对称加密的密钥加密，这样保证密钥的安全也就保证了数据的安全
 */
public class RSAUtils {

	/**
	 * 加密算法RSA
	 */
	public static final String KEY_ALGORITHM = "RSA";

	/**
	 * 签名算法
	 */
	public static final String SIGNATURE_ALGORITHM = "MD5withRSA";

	/**
	 * 获取公钥的key
	 */
	private static final String PUBLIC_KEY = "RSAPublicKey";

	/**
	 * 获取私钥的key
	 */
	private static final String PRIVATE_KEY = "RSAPrivateKey";
	private static final String CHARACTER_ENCODEING = "utf-8";
	/**
	 * RSA最大加密明文大小
	 */
	private static final int MAX_ENCRYPT_BLOCK = 117;

	/**
	 * RSA最大解密密文大小
	 */
	private static final int MAX_DECRYPT_BLOCK = 128;

	/**
	 * <p>
	 * 生成密钥对(公钥和私钥)
	 * </p>
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Map<String, Object> genKeyPair() throws Exception {
		KeyPairGenerator keyPairGen = KeyPairGenerator
				.getInstance(KEY_ALGORITHM);
		keyPairGen.initialize(1024);
		KeyPair keyPair = keyPairGen.generateKeyPair();
		RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
		RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
		Map<String, Object> keyMap = new HashMap<String, Object>(2);
		keyMap.put(PUBLIC_KEY, publicKey);
		keyMap.put(PRIVATE_KEY, privateKey);
		return keyMap;
	}

	/**
	 * <p>
	 * 用私钥对信息生成数字签名
	 * </p>
	 * 
	 * @param src 源数据
	 * @param privateKey 私钥(BASE64编码)
	 * 
	 * @return
	 * @throws Exception
	 */
	public static String sign(String src, String privateKey) throws Exception {
		byte[] keyBytes = Base64.decodeBase64(privateKey);
		PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		PrivateKey privateK = keyFactory.generatePrivate(pkcs8KeySpec);
		Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
		signature.initSign(privateK);
		byte[] data = src.getBytes(CHARACTER_ENCODEING);
		signature.update(data);
		return Base64.encodeBase64String(signature.sign());
	}

	/**
	 * <p>
	 * 校验数字签名
	 * </p>
	 * 
	 * @param data 源数据
	 * @param publicKey 公钥(BASE64编码)
	 * @param sign 数字签名
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public static boolean verify(String src, String publicKey, String sign)
			throws Exception {
		byte[] keyBytes = Base64.decodeBase64(publicKey);
		X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		PublicKey publicK = keyFactory.generatePublic(keySpec);
		Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
		signature.initVerify(publicK);
		signature.update(src.getBytes(CHARACTER_ENCODEING));
		return signature.verify(Base64.decodeBase64(sign));
	}
	
	
	/**
	 * <p>
	 * 加密
	 * </p>
	 * 
	 * @param data 源数据
	 * @param publicKey 公钥(BASE64编码)
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public static String encrypt(String src, String publicKey) throws Exception {
		byte[] keyBytes = Base64.decodeBase64(publicKey);
		X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		PublicKey publicK = keyFactory.generatePublic(keySpec);
		Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		cipher.init(Cipher.ENCRYPT_MODE, publicK);
		byte[] data = src.getBytes(CHARACTER_ENCODEING);
		int inputLen = data.length;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		int offSet = 0;
		byte[] cache;
		int i = 0;
		// 对数据分段加密
		while (inputLen - offSet > 0) {
			if (inputLen - offSet > MAX_ENCRYPT_BLOCK) {
				cache = cipher.doFinal(data, offSet, MAX_ENCRYPT_BLOCK);
			} else {
				cache = cipher.doFinal(data, offSet, inputLen - offSet);
			}
			out.write(cache, 0, cache.length);
			i++;
			offSet = i * MAX_ENCRYPT_BLOCK;
		}
		byte[] encryptedData = out.toByteArray();
		out.close();
		return Base64.encodeBase64String(encryptedData);
	}

	/**
	 * <P>
	 * 私钥解密
	 * </p>
	 * 
	 * @param src 已加密数据
	 * @param privateKey 私钥(BASE64编码)
	 * @return
	 * @throws Exception
	 */
	public static String decryptByPrivateKey(String src, String privateKey)
			throws Exception {
//		byte[] keyBytes = Base64.decode(privateKey);
		byte[] keyBytes = Base64.decodeBase64(privateKey);
		PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		Key privateK = keyFactory.generatePrivate(pkcs8KeySpec);
		Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		cipher.init(Cipher.DECRYPT_MODE, privateK);
		byte[] encryptedData = Base64.decodeBase64(src);
		int inputLen = encryptedData.length;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		int offSet = 0;
		byte[] cache;
		int i = 0;
		// 对数据分段解密
		while (inputLen - offSet > 0) {
			if (inputLen - offSet > MAX_DECRYPT_BLOCK) {
				cache = cipher
						.doFinal(encryptedData, offSet, MAX_DECRYPT_BLOCK);
			} else {
				cache = cipher
						.doFinal(encryptedData, offSet, inputLen - offSet);
			}
			out.write(cache, 0, cache.length);
			i++;
			offSet = i * MAX_DECRYPT_BLOCK;
		}
		byte[] decryptedData = out.toByteArray();
		out.close();
		return new String(decryptedData,CHARACTER_ENCODEING);
	}

	/**
	 * <p>
	 * 获取私钥
	 * </p>
	 * 
	 * @param keyMap
	 *            密钥对
	 * @return
	 * @throws Exception
	 */
	public static String getPrivateKey(Map<String, Object> keyMap)
			throws Exception {
		Key key = (Key) keyMap.get(PRIVATE_KEY);
		return Base64.encodeBase64String(key.getEncoded());
	}

	/**
	 * <p>
	 * 获取公钥
	 * </p>
	 * 
	 * @param keyMap
	 *            密钥对
	 * @return
	 * @throws Exception
	 */
	public static String getPublicKey(Map<String, Object> keyMap)
			throws Exception {
		Key key = (Key) keyMap.get(PUBLIC_KEY);
//		return Base64.encode(key.getEncoded());
		return Base64.encodeBase64String(key.getEncoded());
	}

	public static void main(String[] args) throws Exception {
		String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCNJX1rHZ3M14/w5faRDtr74hbsA9ij49e74q62cigRV8xPErYZQ5kLQY9bBWPgnvU2C/WXLMJdjNugcmIEWG9V2tn2nU/y4zYV7/scci+O78CUdRiynIB0EGM16EXBt0j1cKh2+Yes7XHLsfKA0rKNR0nWIXBUHZAszV00ltOGUwIDAQAB";
		
		String privateKey = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAI0lfWsdnczXj/Dl9pEO2vviFuwD2KPj17virrZyKBFXzE8SthlDmQtBj1sFY+Ce9TYL9Zcswl2M26ByYgRYb1Xa2fadT/LjNhXv+xxyL47vwJR1GLKcgHQQYzXoRcG3SPVwqHb5h6ztccux8oDSso1HSdYhcFQdkCzNXTSW04ZTAgMBAAECgYBCHtbjEAu1QyI2GrRn/cqOBrrwM1kQZZLRfH6WD2I/xZ57SGuv6B/QyxSJ8jt4pV5/xBh3iks/IdZdElhiar80iZbduoUHQImQGQ8RMc1qIRfXhDVLpoaKtPfKmAzJtEXvDdZqQBNTJGVxYb2vwZk0EcLZidrYSxr3W44/RYpwKQJBAMnhIovem4zc7p2nqtV7P4CQsRgQhyD3Vp2fYYWsc32j2AiHsrcSf+cCvTpAZgP/h9ym4O38XLKF7u162sgOKv0CQQCy/ElFT2fIz/A9nJyoEIr7zJ0C2krrj8aKUSmQbIvt84CWL5d8dJlE97Wk+SC5seo3eOVeYFhDA1mpkg+Yzn+PAkEAgRiUE+eNhx29BVoz94JyEE/2v5HKJ72jSPaj0Wx/CigdPQ8xrLqKyfpJcZe+5O2iPusESYuo54yYRoranzXYLQJAfhOgOSZZ4OY4P+4Vm30rqXrUDrJdm9jG7Z+GO6l6V77ykNgtSQmI/T/Pv8mM98EPTsvmJbiP84RkoEG2otiymQJBAKvemSTAE4jBfU2NE11aAdwN3vHo4gLSh/bkcuuz5FtpjVMmhn0uIEIrTEq+l8MB+Ru2156aChCbZ4qLCKQRehk=";
		
		System.out.println(Base64.encodeBase64String("{\"head\":{\"requestTime\":\"20141019063256\",\"requestId\":\"66a5c254-ae13-4f94-8c1b-a6fa9359e9eb\",\"traderLoginName\":\"test\"},\"body\":{\"phoneNum\":\"13914778196\",\"goodsValue\":\"100\"}}".getBytes()));
//		Map<String, Object> key = RSAUtils.genKeyPair();
		System.out.println("公钥:"+publicKey);
		System.out.println("私钥:"+privateKey);
		String src="{\"head\":{\"requestTime\":\"20141019063256\",\"requestId\":\"66a5c254-ae13-4f94-8c1b-a6fa9359e9eb\",\"traderLoginName\":\"test\"},\"body\":{\"phoneNum\":\"13914778196\",\"goodsValue\":\"100\"}}";
		System.out.println("源数据:"+src);
		String sign = RSAUtils.sign(src, privateKey);
		System.out.println("私钥签名后:"+sign);
		boolean checkSign = RSAUtils.verify(src, publicKey, sign);
		System.out.println("公钥验签结果:"+checkSign);
		String encryResult = RSAUtils.encrypt(src, publicKey);
		System.out.println("公钥加密后:"+encryResult);
		String decryptResult = RSAUtils.decryptByPrivateKey(encryResult, privateKey);
		System.out.println("私钥解密后:"+decryptResult);
	}
}
