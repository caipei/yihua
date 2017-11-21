<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<head>
	<meta charset="UTF-8">
	<title>最新动态</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/lastedNews.css">
</head>
</head>
<body>
	<div id="header">
		<div class="header">
				<div class="nav"></div>
			</div>
		<div class="hid">
			<div class="hid-1 cool"><a href="javascript:void(0)"><span>最新动态</span><i></i></a></div>
			<div class="hid-2"><a href="/<%=PropKit.get("project_name") %>/lstl/profile_details">公司概况</a></div>
			<div class="hid-3"><a href="/<%=PropKit.get("project_name") %>/lstl/profile_story">品牌历程</a></div>
		</div>
	</div>
	<c:forEach items="${infolist }" var="info">
	<div class="news clearfix">
		
		<a href="/<%=PropKit.get("project_name") %>/lstl/profile_newsdetails?id=${info.id }">
			<div class="pic fl"><img src="${info.imgpath }" alt=""></div>
			<div class="content fr">
				<h2>${info.title }</h2>
				<div>
					<p>${info.remark }</p>
				</div>
			</div>
		</a>
	</div>
	</c:forEach>
	
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/profile/js/jquery-min.js"></script>
	<script>
		$('.top>a').click(function(){
			$('.hid').show();
		})
		var font = document.documentElement.clientWidth/640;
		$('.cool').click(function(){
			var hidH = $('.hid').height();
			console.log(hidH)
			console.log(font)
			if(hidH<=50*font){
				console.log(222)
				$('.hid').animate({height:'1.6rem'},300);
				$('.hid').css({background:'rgba(57,62,82,0.8)'});
				$(this).find('i').css({borderColor:'transparent transparent #636468 transparent',marginTop:'0'})
			}else{
				$('.hid').animate({height:'0.4rem'},300);
				$('.hid').css({background:'transparent'})
				$(this).find('i').css({borderColor:'#636468 transparent transparent  transparent',marginTop:'.06rem'})
			}
			
		});
	</script>
</body>
</html>