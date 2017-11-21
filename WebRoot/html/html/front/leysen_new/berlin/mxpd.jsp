<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>电影节咨询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/berlin/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/berlin/css/consult.css">
</head>
<style>
	header>ul>li:first-child>a{
		color:#A8A8A8;
		border-bottom:0px solid #B9001B;
	}
	
	header>ul>li:nth-child(2)>a{
		color:#B9001B;
		border-bottom:2px solid #B9001B;
	}
</style>
<body>
	<header>
		<ul>
			<li><a href="/<%=PropKit.get("project_name") %>/lstl/berlin_consult">电影节咨询</a></li>
			<li><a href="/<%=PropKit.get("project_name") %>/lstl/berlin_mxpd">明星佩戴</a></li>
		</ul>
	</header>
	<section class="main">
		<img style="max-width: 100%" src="<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_gjdz.jpg" />
	</section>
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/berlin/js/jquery-3.1.0.min.js"></script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/berlin/js/consult.js"></script>
</body>
</html>