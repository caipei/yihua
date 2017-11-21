<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>优势支持</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/css/support.css">
</head>
<body>
	<section class="mid">
		<div class="createD">
			<p><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer">creative<br>dreamer</a></p>
		</div>
		<div class="join">
			<ul>
				<li><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer_support">优势支持<i></i></a></li>
				<li><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer_join">加盟信息<i></i></a></li>
				<li><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer_interview">经验访谈<i></i></a></li>
			</ul>
		</div>
	</section>
	<section class="main">
		<a href="./dreamer.html"><div class="dream"></div></a>
		<img src="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/images/main.jpg" alt="" width=100% height=100%>
	</section>
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
</body>
</html>