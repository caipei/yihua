package com.doing.common.utils.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HtmlUtils {

	public static HashMap<String, Object> getClearHtml(String content) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		List<HashMap<String, Object>> imgsList = new ArrayList<HashMap<String, Object>>();
		content = content.replaceAll(".*?<body.*?>(.*?)<\\/body>", "$1"); // 读出body内里所有内容
		content = content.replaceAll("</?[^/?(br)|(p)|(img)][^><]*>", "");// 保留br标签和p标签
		content = content.replaceAll("style=\".*?\"", "");
		content = content.replaceAll("<p.*?>", "<p>");
		content = content.replaceAll("<br.*?>", "<br>");
		content = content.replaceAll("&.*?;", "");
		Pattern p = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");//<img[^<>]*src=[\'\"]([0-9A-Za-z.\\/]*)[\'\"].(.*?)>");
        Matcher m = p.matcher(content);
        while(m.find()){
        	HashMap<String, Object> imgsHm = new HashMap<String, Object>();
        	content = content.replace(m.group(), "#^$@img#^$");
            imgsHm.put("linkurl", m.group(1));
            imgsList.add(imgsHm);
        }
        content = content.replace("</p>", "#^$br#^$");
        content = content.replace("<br>", "#^$br#^$");
        content = content.replace("<p>", "");
        Pattern p1 = Pattern.compile("\\s*|\t|\r|\n");
        Matcher m1 = p1.matcher(content);
        content = m1.replaceAll("");
        hm.put("strs", content);
        hm.put("imgs", imgsList);
        return hm;
	}
}
