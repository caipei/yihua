<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>公司简介</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/profile_list.css">
</head>
<body>
	<div id="main">
		<div class="con">
			<div class="rect">
				<div class="rect-1"></div>
				<div class="rect-2"></div>
				<div class="rect-3"></div>
			</div>
			<div class="pic">
				<ul>
					<li>
						<a href="/<%=PropKit.get("project_name") %>/lstl/profile_details">
							<div class="pic-1 pic-a"><p>公司概况</p></div>
						</a>
					</li>
					<li>
						<a href="/<%=PropKit.get("project_name") %>/lstl/profile_story">
							<div class="pic-1 pic-b"><p>品牌历程</p></div>
						</a>
					</li>
					<li>
						<a href="/<%=PropKit.get("project_name") %>/lstl/profile_lastednews">
							<div class="pic-1 pic-c"><p>最新动态</p></div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		
	</div>
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
</body>
</html>