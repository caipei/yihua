package com.doing.base;

import java.util.HashMap;

public class ContentTypeKit {
	
	static HashMap<String, String> map = new HashMap<String, String>();

	static {
		
		map.put("jpeg","image/jpeg");
		map.put("jpg","image/jpeg");
		map.put("jpe","image/jpeg");
		map.put("png","image/png");
	}
	
	public static String get(String mimetype) {
		
		return map.get(mimetype);
	}
}
