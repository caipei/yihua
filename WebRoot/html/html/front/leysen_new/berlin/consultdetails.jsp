<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>${title }</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/berlin/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/berlin/css/newsDetails.css">
</head>
		<style type="text/css">
			.main {
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/gsjj_bg.jpg) no-repeat;
				background-size: cover;
				height: 100%;
			}
			
			.zxdt_title {
				color: #fff;
				text-align: left;
				padding: 0.5rem 0.3rem 0;
			}
			
			.zxdt_time {
				color: #9FA0A6;
				text-align: left;
				margin-top: 0.3rem;
				padding: 0 0.3rem;
			}
			
			.zxdt_content {
				padding: 0.3rem;
				color: #C3C4C8;
				font-size: 0.26rem;
				line-height: 0.5rem;
			}
			
			.zxdt_content p {
				font-size: 0.26rem;
				line-height: 0.5rem;
				color: #fff;
				text-align: justify;
				text-justify: distribute-all-lines;
				/*ie6-8*/
				text-align-last: false;
				/* ie9*/
				-moz-text-align-last: false;
				/*ff*/
				-webkit-text-align-last: false;
				/*chrome 20+*/
			}
			
			.zxdt_content .p_img{
				margin: 0.4rem 0;
				text-align: center;
			}
			
			.zxdt_content .p_img img{
				max-width: 100%;
			}
			
			.absolute_img_div {
				margin: 0 auto;
				width: 100%;
				text-align: center;
			}
			
			.absolute_img_div img {
				max-width: 100%;
			}
		</style>
	<body>
	
	<div class="main">
		<div class="content" style=" position: relative; width: 100%; height: 100%;">
				<div class="zxdt_title" style="font-size: 0.35rem">
					${title }
				</div>

				<div class="zxdt_time" style="font-size: 0.24rem">
					${intime_format }
				</div>

				<div class="absolute_img_div" style="margin-top: 0.2rem; font-size: 0.2rem">
					<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/zxdt_img3.png" />
				</div>

				<div class="zxdt_content">
					<c:forEach items="${contents }" var="content">
						<c:if test="${content.type eq 1 }">
							<p>
								${content.content }
							</p>
						</c:if>
						<c:if test="${content.type eq 2 }">
							<p class="p_img">
								<img src="${content.url }" />
							</p>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/profile/js/jquery-min.js"></script>
	<script>
		var font = document.documentElement.clientWidth/640;
		$('.cool').click(function(){
			var hidH = $('.hid').height();
			if(hidH<=50*font){
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