package com.doing.dataservice.entity;

import com.google.gson.annotations.Expose;

public class RespDataEntity {

	@Expose
	private RespDataHeader header;

	@Expose
	private String sign;

	@Expose
	private Object body;

	public RespDataHeader getHeader() {
		return header;
	}

	public void setHeader(RespDataHeader header) {
		this.header = header;
	}

	public Object getBody() {
		return body;
	}

	public void setBody(Object body) {
		this.body = body;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public static class RespDataHeader {

		@Expose
		private String imei;

		@Expose
		private String versioncode;

		@Expose
		private String versionname;

		@Expose
		private String sdkversion;

		@Expose
		private String imsi;

		@Expose
		private String deviceid;

		public String getImei() {
			return imei;
		}

		public void setImei(String imei) {
			this.imei = imei;
		}

		public String getVersioncode() {
			return versioncode;
		}

		public void setVersioncode(String versioncode) {
			this.versioncode = versioncode;
		}

		public String getVersionname() {
			return versionname;
		}

		public void setVersionname(String versionname) {
			this.versionname = versionname;
		}

		public String getSdkversion() {
			return sdkversion;
		}

		public void setSdkversion(String sdkversion) {
			this.sdkversion = sdkversion;
		}

		public String getImsi() {
			return imsi;
		}

		public void setImsi(String imsi) {
			this.imsi = imsi;
		}

		public String getDeviceid() {
			return deviceid;
		}

		public void setDeviceid(String deviceid) {
			this.deviceid = deviceid;
		}

	}
}
