package com.doing.admin.bean;

import java.io.Serializable;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
public class StatusBean implements Serializable {

	@Expose
	private int statusCode = 200;
	@Expose
	private String message = "操作成功";
	@Expose
	private String tabid = "";
	@Expose
	private boolean closeCurrent = true;
	@Expose
	private String forward = "";
	@Expose
	private String forwardConfirm = "";
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTabid() {
		return tabid;
	}
	public void setTabid(String tabid) {
		this.tabid = tabid;
	}
	public boolean isCloseCurrent() {
		return closeCurrent;
	}
	public void setCloseCurrent(boolean closeCurrent) {
		this.closeCurrent = closeCurrent;
	}
	public String getForward() {
		return forward;
	}
	public void setForward(String forward) {
		this.forward = forward;
	}
	public String getForwardConfirm() {
		return forwardConfirm;
	}
	public void setForwardConfirm(String forwardConfirm) {
		this.forwardConfirm = forwardConfirm;
	}
	
}
