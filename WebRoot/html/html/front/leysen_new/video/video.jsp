<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>最新视频</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/video/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/video/css/video.css">
</head>
<body>
	<!-- 主体 -->
	<div id="main" class="m1200">
	<!-- logo -->
		<div class="logo"><img src="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video-logo.png" alt=""></div>
	</div>
	<div class="container">
		<div class="frame">
			<div class="box">
				<div class="list">
					<ul>
						<li class="p7">
							<p><span>2017</span>唐嫣签约仪式</p>
							<video src="<%=PropKit.get("front_prefix") %>leysen_new/video/video/movie.ogg" poster="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video1.jpg"></video>
							<div class="play"></div>
						</li>
						<li class="p6">
							<p><span>2017</span>唐嫣签约仪式</p>
							<video src="<%=PropKit.get("front_prefix") %>leysen_new/video/video/movie.ogg" poster="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video1.jpg"></video>
							<div class="play"></div>
						<li class="p5">
							<p><span>2017</span>唐嫣签约仪式</p>
							<video src="<%=PropKit.get("front_prefix") %>leysen_new/video/video/movie.ogg" poster="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video1.jpg"></video>
							<div class="play"></div>
						</li>
						<li class="p4">
							<p><span>2017</span>唐嫣签约仪式</p>
							<video src="<%=PropKit.get("front_prefix") %>leysen_new/video/video/movie.ogg" poster="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video1.jpg"></video>
							<div class="play"></div>
						</li>
						<li class="p3">
							<p><span>2017</span>唐嫣签约仪式</p>
							<video src="<%=PropKit.get("front_prefix") %>leysen_new/video/video/movie.ogg" poster="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video1.jpg"></video>
							<div class="play"></div>
						</li>
						<li class="p2">
							<p><span>2017</span>唐嫣签约仪式</p>
							<video src="<%=PropKit.get("front_prefix") %>leysen_new/video/video/movie.ogg" poster="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video1.jpg"></video>
							<div class="play"></div>
						</li>
						<li class="p1">
							<p><span>2017</span>唐嫣签约仪式</p>
							<video src="<%=PropKit.get("front_prefix") %>leysen_new/video/video/movie.ogg" poster="<%=PropKit.get("front_prefix") %>leysen_new/video/images/video1.jpg"></video>
							<div class="play"></div>
						</li>
						
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/video/js/jquery-3.1.0.min.js"></script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/video/js/jquery-touchSwipe.js"></script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/video/js/video.js"></script>
</body>
</html>