<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>创客梦想家</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/css/dreamer.css">
</head>
<body>
	<!-- 头部 -->
	<header>
		<img src="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/images/boss.jpg" alt="">
	</header>
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
	<!-- 底部 -->
	<footer>
		<div class="embody">
			<h1><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer">创客盟想家</a></h1>
			<div class="writing">
				<h5>传递珍藏品质</h5>
				<p>当你年华老去的一天，和孩子讲起年岁月，奋力拼搏，燃梦时光，遇见爱情的年代。打开那个陪伴半生的盒子，内嵌莱绅通灵钻石依然像当初那样熠熠发光，它珍藏着你的青春故事，燃情岁月。</p>
				<p>创客盟想家"沈东军"，就是以这样的思想，三十年来，传递着值得"为下一代珍藏"的珠宝。期间，极致的品质，得到柏林电影节9年的邀约，王室青睐，成为比利时国礼……，与王妃一样，三十年来，无数消费者将莱绅通灵珍藏在盒子里，记录声明重要时刻，见证情感怦然一刻。</p>
				<p>珠宝市场快速发展，需求旺盛，一线大牌老去，年轻化下沉，只有大胆飞跃才能开创一片蓝海————越来越多的消费者希望拥有莱绅通灵，也更为注重奢侈品消费的情感诉求。</p>
				<p>作为莱绅通灵创客梦想家的领军者，邀您加入莱绅通灵，以热爱的重量，追逐极致净度，以智慧的切工，闪耀魄力的色彩。了解莱绅通灵"创客盟想家"，与领军者沈东军一起，用钻石丈量人生宽度 传递值得"为下一代珍藏"的传世珠宝。</p>
			</div>
		</div>
		
	</footer>
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
</body>
</html>