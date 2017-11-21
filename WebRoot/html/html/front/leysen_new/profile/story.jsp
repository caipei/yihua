<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>品牌故事</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/reset.css">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/jquery-zyslide.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/story.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen/res/css/swiper.css">
	
	<style type="text/css">
			
			.swiper-container {
				margin: 0;
				width: 100%;
				padding: 0 30px;
			}
			
			.swiper-slide {
				text-align: center;
				background: #fff;
				/* Center slide text vertically */
				display: -webkit-box;
				display: -ms-flexbox;
				display: -webkit-flex;
				display: flex;
				-webkit-box-pack: center;
				-ms-flex-pack: center;
				-webkit-justify-content: center;
				justify-content: center;
				-webkit-box-align: center;
				-ms-flex-align: center;
				-webkit-align-items: center;
				align-items: center;
			}
			
			.swiper-img {
				max-width: 100%;
				max-height: 100%;
			}
			
			.swiper-opt-btns {
				height: 100%;
				display: block;
				align-items: center;
				position: absolute;
				top: 0;
				z-index: 999;
			}
			
			.swiper-left {
				position: absolute;
				left: 5px;
			}
			
			.swiper-right {
				position: absolute;
				right: 5px;
			}
			
			.name_span {
				color:  #AAAEAD;
				height: 40px;
				font-size: 16px;
				line-height: 20px;
			}
			
			.year_label {
				color: #fff
			}
			
			@media (min-width: 481px) {
				.swiper-right,
				.swiper-left {
					width: 26px;
				}
				.name_span {
					font-size: 16px;
				}
				
				.year_label {
					font-size: 32px;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.swiper-right,
				.swiper-left {
					width: 22px;
				}
				.name_span {
					font-size: 14px;
				}
				
				.year_label {
					font-size: 32px;
				}
			}
			
			@media (max-width: 320px) {
				.swiper-right,
				.swiper-left {
					width: 18px;
				}
				.name_span {
					font-size: 12px;
				}
				
				.year_label {
					font-size: 28px;
				}
			}
		</style>
</head>
<body>
	<div id="header">
		<div class="header">
				<div class="nav"></div>
			</div>
		<div class="hid">
			<div class="hid-1 cool"><a href="javascript:void(0)"><span>品牌历程</span><i></i></a></div>
			<div class="hid-2"><a href="/<%=PropKit.get("project_name") %>/lstl/profile_details">公司概况</a></div>
			<div class="hid-3"><a href="/<%=PropKit.get("project_name") %>/lstl/profile_lastednews">最新动态</a></div>
		</div>
	</div>
	<div class="logo"><img src="<%=PropKit.get("front_prefix") %>leysen_new/profile/images/logo.png" alt=""></div>
		<div style="width: 100%; text-align: center; padding: 0 1rem;">
			<span class="year_span" style="font-size: 0.24rem; line-height: 0.4rem; color: #fff;">
				<label id="year_label" class="year_label" style="font-size: 0.4rem; line-height: 0.4rem;"></label>年
			</span>
		</div>
		<div style="position: relative; margin-top: 0.25rem">
			<div class="swiper-container">
				<div class="swiper-wrapper">
				<c:forEach items="${infolist }" var="info">
				<div class="swiper-slide"><img class="swiper-img" src="${info.imgpath }" /></div>
				</c:forEach>
				</div>
			</div>
			<div class="swiper-opt-btns">
				<img id="swiper-left" class="swiper-left" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_img4.png" />
			</div>
			<div class="swiper-opt-btns" style="right: 0;">
				<img id="swiper-right" class="swiper-right" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_img5.png" />
			</div>
		</div>

		<div style="width: 100%; text-align: center; padding: 0.4rem 0.8rem; font-size: 0.24rem; line-height: 0.4rem;">
			<label id="name_span" class="year_label" style="font-size: 0.24rem; line-height: 0.4rem; color: #8D8E92"></label>
		</div>
	
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/profile/js/jquery-min.js"></script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/profile/js/jquery-3.1.0.min.js"></script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/profile/js/jquery-touchSwipe.js"></script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/profile/js/story.js"></script>
	<script type='text/javascript' src='<%=PropKit.get("front_prefix") %>leysen/res/js/swiper.js' charset='utf-8'></script>
	<script>
		var font = document.documentElement.clientWidth/640;
		$('.cool').on('click',function(){
			var hidH = $('.hid').height();
			if(hidH<=40*font){
				$('.hid').animate({height:'1.6rem'},300);
				$('.hid').css({background:'rgba(57,62,82,0.8)'});
				$(this).find('i').css({borderColor:'transparent transparent #636468 transparent',marginTop:'0'})
			}else{
				$('.hid').animate({height:'0.4rem'},300);
				$('.hid').css({background:'transparent'})
				$(this).find('i').css({borderColor:'#636468 transparent transparent  transparent',marginTop:'.06rem'})
			}
		});
		
		var screenWidth = window.screen.width;
		var proportion = screenWidth / 640;

		if(screenWidth > 640) {
			var swiperimgwidth = 640 - 60;
			$('.swiper-img').width(swiperimgwidth);
			$('.swiper-img').height(swiperimgwidth / 4 * 3);
			$('.swiper-container').height(swiperimgwidth / 4 * 3);
			$('.swiper-opt-btns').height(swiperimgwidth / 4 * 3);
			$('#swiper-left').css('margin-top', swiperimgwidth / 8 * 3);
			$('#swiper-right').css('margin-top', swiperimgwidth / 8 * 3);
		} else {
			var swiperimgwidth = 640 * proportion - 60;
			$('.swiper-img').width(swiperimgwidth);
			$('.swiper-img').height(swiperimgwidth / 4 * 3);
			$('.swiper-container').height(swiperimgwidth / 4 * 3);
			$('.swiper-opt-btns').height(swiperimgwidth / 4 * 3);
			$('#swiper-left').css('margin-top', swiperimgwidth / 8 * 3);
			$('#swiper-right').css('margin-top', swiperimgwidth / 8 * 3);
		}
		
		var swipernames;
		$.post("/<%=PropKit.get("project_name") %>/leysen/ppgs_json", function (returnJson){
			var rescode = returnJson.rescode;
			var rescnt = returnJson.rescnt;
			if (rescode == '0000') {
				swipernames = rescnt;
				$('#name_span').html(swipernames[0].content);
				$('#year_label').html(swipernames[0].ppgsyear);
			}
		}, "json");
		

		var mySwiper = new Swiper('.swiper-container', {
			slidesPerView: 1,
			effect: 'coverflow',
			grabCursor: true,
			centeredSlides: true,
			slidesPerView: 'auto',
			spaceBetween: -100,
			loop: true,
			autoplay: 3000,
			coverflow: {
				rotate: 0,
				stretch: 0,
				depth: 400,
				modifier: 1,
				slideShadows: true
			},
			onTransitionEnd: function(swiper) {
				if (swipernames != null && swipernames.length > 0) {
					$('#name_span').html(swipernames[swiper.activeIndex % swipernames.length].content);
					$('#year_label').html(swipernames[swiper.activeIndex % swipernames.length].ppgsyear);
				}
			},
			onInit: function(swiper) {
				
			}
		});

		$('.swiper-left').click(function() {
			mySwiper.slidePrev();
		})
		$('.swiper-right').click(function() {
			mySwiper.slideNext();
		})
	</script>
</body>
</html>