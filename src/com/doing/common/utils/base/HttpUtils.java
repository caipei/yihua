package com.doing.common.utils.base;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.GzipDecompressingEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;

public class HttpUtils {

	private static HttpClient getHttpClient() {
		HttpClient httpClient = null;
		HttpParams httpParameters = new BasicHttpParams();
		HttpConnectionParams.setConnectionTimeout(httpParameters, 5000);
		HttpConnectionParams.setSoTimeout(httpParameters, 20000);
		httpClient = new DefaultHttpClient(httpParameters);
		return httpClient;
	}

	private static String retrieveEntity(HttpEntity httpEntity)
			throws IOException {
		Header header = httpEntity.getContentEncoding();
		InputStream in = null;
		if (header != null && header.getValue().equalsIgnoreCase("gzip")) {
			GzipDecompressingEntity gzipEntity = new GzipDecompressingEntity(
					httpEntity);
			in = gzipEntity.getContent();
		} else {
			in = httpEntity.getContent();
		}
		String requestStr = getContent(in);
		if (in != null) {
			in.close();
		}
		return requestStr;
	}

	private static String getContent(InputStream in) {
		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		try {
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	private static String excuteRequest(HttpClient httpClient, HttpPost method,
			List<NameValuePair> params) {
		String result = "";
		try {
			if (params != null) {
				HttpEntity entity = new UrlEncodedFormEntity(params, "UTF-8");
				method.setEntity(entity);
			}
			HttpResponse response = httpClient.execute(method);
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				result = retrieveEntity(response.getEntity());
			}
			EntityUtils.consume(response.getEntity());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private static String excuteRequest(HttpClient httpClient, HttpGet method) {
		String result = "";
		try {
			HttpResponse response = httpClient.execute(method);
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				result = retrieveEntity(response.getEntity());
			}
			EntityUtils.consume(response.getEntity());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String getWeather() {
		String urlStr = "https://api.thinkpage.cn/v2/weather/future.json?city=CHSD040500&language=zh-chs&unit=c&key=QWBVWBZFI3";
		HttpGet method = new HttpGet(urlStr);
		String result = excuteRequest(getHttpClient(), method);
		return result;
	}

	public static String showLocation(String address) {
		String urlStr = "http://api.map.baidu.com/geocoder/v2/?output=json&ak=ue3wSg7uMbidp9BQPvBNgFzk&address="
				+ address;
		HttpGet method = new HttpGet(urlStr);
		String result = excuteRequest(getHttpClient(), method);
		return result;
	}

	public static String showAddress(String longitude, String latitude) {
		String urlStr = "http://api.map.baidu.com/geocoder/v2/?output=json&ak=ue3wSg7uMbidp9BQPvBNgFzk&location="
				+ latitude + "," + longitude;
		HttpGet method = new HttpGet(urlStr);
		String result = excuteRequest(getHttpClient(), method);
		return result;
	}

	public static String getIfContent(String url, String params) {
		HttpPost method = new HttpPost(url);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("json", params));
		String result = excuteRequest(getHttpClient(), method, nvps);
		return result;
	}
}
