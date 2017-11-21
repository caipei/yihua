<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>通灵珠宝</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/brand/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/brand/css/brand.css">
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
						<a href="#">
							<div class="pic-1 pic-a">
								<div class="beg"><p> PR ACTIVITIES</p><span>公关资讯</span></div>
								
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="pic-1 pic-b">
								<div class="beg"><p>Star  activity</p><span>明星活动</span></div>
							</div>
						</a>
					</li>
					<li>
						<a href="/<%=PropKit.get("project_name") %>/lstl/brand_newshop">
							<div class="pic-1 pic-c">
								<div class="beg"><p>NEW SHOP</p><span>新开店资讯</span></div>
							</div>
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