package com.doing.dataservice.entity;

import java.io.Serializable;
import java.util.List;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
public class ParamsRegexEntity implements Serializable {

	@Expose
	private List<ParamsRegex> list;

	public List<ParamsRegex> getList() {
		return list;
	}

	public void setList(List<ParamsRegex> list) {
		this.list = list;
	}

	public static class ParamsRegex implements Serializable {

		@Expose
		private String name;

		@Expose
		private Params params;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Params getParams() {
			return params;
		}

		public void setParams(Params params) {
			this.params = params;
		}
	}

	public static class Params implements Serializable {
		@Expose
		private String name;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

	}
}
