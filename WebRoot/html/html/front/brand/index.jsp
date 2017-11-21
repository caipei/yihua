<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head lang="zh">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="target-densitydpi=device-dpi, width=640px, user-scalable=no" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes"/><!--启用webapp的全屏模式-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" /><!--隐藏状态浪/设置状态栏颜色-->
    <meta name="apple-mobile-web-app-title" content="通灵" /><!--添加到主屏上的标题-->
    <meta content="telephone=no" name="format-detection" />
    <meta name="description" content="网站描述,字数尽量控制在80个汉字,160个字符以内" />
    <meta name="keywords" content="" />
    <meta name="author" content="DooPaa Team" />
    <meta name="robots" content="index,follow" />
    <title>TESIRO通灵珠宝</title>
    <meta name="description" content="" />
    <link rel="stylesheet" href="<%=PropKit.get("front_res_prefix") %>brand/css/reset.css"/>
    <link rel="stylesheet" href="<%=PropKit.get("front_res_prefix") %>brand/css/main.css"/>
</head>
<body>
<!--主题列表-->
<div id="theme_list">
    <ul>
        <li><a href="/<%=PropKit.get("project_name") %>/brand/ztxl"><img src="${ztxl_img }" alt="主体系列"/></a></li>
        <li><a href="/<%=PropKit.get("project_name") %>/brand/lshy"><img src="${lshy_img }" alt="蓝色火焰"/></a></li>
        <li><a href="/<%=PropKit.get("project_name") %>/brand/gjdz"><img src="${gjdz_img }" alt="高级定制"/></a></li>
        <li><a href="/<%=PropKit.get("project_name") %>/brand/csfc"><img src="${csfc_img }" alt="传世翡翠"/></a></li>
    </ul>
</div>
<script src="<%=PropKit.get("front_res_prefix") %>brand/js/jquery-3.1.0.min.js"></script>
<script src="<%=PropKit.get("front_res_prefix") %>brand/js/main.js"></script>
</body>
</html>