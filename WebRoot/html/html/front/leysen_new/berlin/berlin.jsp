<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1">
	<link rel="shortcut icon" href="/favicon.ico">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen/res/css/sm.css">
	<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen/res/css/style.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen/res/css/swiper.css">
	<style type="text/css">
		.bar-tab:before {
			background-color: transparent;
		}
		.bar:after {
			background-color: transparent;
		}
		
		.tip_content_span {
			display: inline-block;
			font-size: 0.7rem; 
			display: inline-block; 
			padding: 0.5rem; 
			border-radius: 4px; 
			background: #2A4399; 
			color: #FFD840;
		}
	</style>
    <title>柏林电影节</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
			}
			
			.bldyj_content {
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_bg.jpg) repeat-y;
				background-size: cover;
			}
			
			.yzcczx_content {
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_img3.jpg) repeat-y;
				background-size: cover;
			}
			
			.ozcczx_content {
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_bg.jpg) repeat-y;
				background-size: cover;
			}
			
			.nav {
				position: absolute;
				z-index: 999;
				width: 100%;
			}
			
			.nav_top,
			.nav_bottom {
				background: #e4e4e4;
				width: 100%;
				display: flex;
				height: 2rem;
				align-items: baseline;
				margin: 0 auto;
			}
			
			.nav_bottom {
				height: 1.8rem;
				opacity: 0.9;
			}
			
			.nav_top div,
			.nav_bottom div {
				flex: 1;
				display: inline-block;
				height: 100%;
				display: flex;
				flex-direction: row;
				justify-content: center;
			}
			
			.nav_top div span {
				line-height: 2rem;
			}
			
			.nav_bottom div span {
				line-height: 1.8rem;
			}
			
			.nav_top div .on,
			.nav_bottom div .on {
				border-bottom: 1px solid #b9001b;
			}
			
			.bg_div {
				position: absolute;
				margin: 0 auto;
				text-align: center;
				width: 100%;
			}
			
			.bg_div img {
				max-width: 100%;
			}
			
			.detail, .yzcczx_detail, .ozcczx_detail {
				position: absolute;
				top: 3.8rem;
				width: 100%;
				margin: 0 auto;
			}
			
			.yzcczx_detail {
				top: 2rem;
			}
			
			.ozcczx_detail {
				top: 2rem;
			}
			
			.absolute_img_div {
				margin: 0 auto;
				width: 100%;
				text-align: center;
			}
			
			.absolute_img_div img {
				max-width: 100%;
			}
			
			.dyjzx_list_div {
				display: flex;
				width: 100%;
				flex-flow: row wrap;
				align-content: flex-start;
				padding: 0 0.2rem;
			}
			
			.dyjzx_item_div {
				flex: 0 0 50%;
				text-align: center;
				margin: 0.5rem 0;
			}
			
			.dyjzx_item_img_span {
				display: inline-block;
				width: 90%;
				border: 2px solid #050206;
				padding: 1px;
			}
			
			.dyjzx_item_text_span {
				display: inline-block;
				width: 90%;
				text-align: center;
				color: #fff;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
			}
			
			.dyjzx_item_img_span img {
				max-width: 100%;
			}
			
			.dyj_title {
				color: #fff;
				text-align: center;
			}
			
			.dyj_title label {
				padding: 0;
				margin: 0;
			}
			
			.dyj_num_span {
				color: #e50020;
			}
			
			.bldyj_name_span {
				color:  #AAAEAD;
			}
			
			.swiper-container {
				margin: 1rem 0;
				width: 100%;
				padding: 0;
			}
			
			.swiper-slide {
				text-align: center;
				background: transparent;
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
			
			@media (min-width: 481px) {
				.nav_top div span,
				.nav_bottom div span,
				.dyjzx_item_text_span, .bldyj_name_span {
					font-size: 0.8rem;
				}
				.img_arrow {
					width: 16px;
					vertical-align: middle;
					margin-top: -4px;
				}
				.dyj_title {
					font-size: 1.8rem;
				}
				.dyj_num_span {
					font-size: 2.8rem;
				}
				.bldyj_img_span {
					display: inline-block;
					width: 16px;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.nav_top div span,
				.nav_bottom div span,
				.dyjzx_item_text_span, .bldyj_name_span {
					font-size: 0.7rem;
				}
				.img_arrow {
					width: 13px;
					vertical-align: middle;
					margin-top: -3px;
				}
				.dyj_title {
					font-size: 1.6rem;
				}
				.dyj_num_span {
					font-size: 2.6rem;
				}
				.bldyj_img_span {
					display: inline-block;
					width: 13px;
				}
			}
			
			@media (max-width: 320px) {
				.nav_top div span,
				.nav_bottom div span,
				.dyjzx_item_text_span, .bldyj_name_span {
					font-size: 0.6rem;
				}
				.img_arrow {
					width: 10px;
					vertical-align: middle;
					margin-top: -2px;
				}
				.dyj_title {
					font-size: 1.4rem;
				}
				.dyj_num_span {
					font-size: 2.4rem;
				}
				.bldyj_img_span {
					display: inline-block;
					width: 10px;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="nav">
					<div class="nav_top">
						<div onclick="bldyj_click();" id="bldyj_div">
							<span id="bldyj_span" class="on">
								柏林电影节
							</span>
							<span class="bldyj_img_span">
								<img id="bldyj_img_arrow" class="img_arrow" style="margin-left: 3px;" src="<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_img2.jpg" />
							</span>
						</div>
						<div onclick="yzcczx_click();" id="yzcczx_div">
							<span onclick="yzcczx_click();" id="yzcczx_span">
								亚洲璀璨之星
							</span>
							<span class="bldyj_img_span">
								<img id="yzcczx_img_arrow" class="img_arrow" style="margin-left: 3px; display: none;" src="<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_img2.jpg" />
							</span>
						</div>
						<div onclick="ozcczx_click();" id="ozcczx_div">
							<span onclick="ozcczx_click();" id="ozcczx_span">
								欧洲璀璨之星
							</span>
							<span class="bldyj_img_span">
								<img id="ozcczx_img_arrow" class="img_arrow" style="margin-left: 3px; display: none;" src="<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_img2.jpg" />
							</span>
						</div>
					</div>
					<div class="nav_bottom" id="nav_bottom" style="display: none">
						<div id="dyjzx_div">
							<span onclick="dyjzx_click()" id="dyjzx_span">
								电影节资讯
							</span>
						</div>
						<div id="mxpd_div">
							<span onclick="mxpd_click()" id="mxpd_span">
								明星佩戴
							</span>
						</div>
					</div>
				</div>
				<div id="bldyj_content" class="content bldyj_content" style="display: block">
					<div id="bldyj" class="detail" style="display: block;">
						<div class="absolute_img_div">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_img1.png" />
						</div>
						<div class="dyj_title">
							第<label id="dyj_num_span" class="dyj_num_span">${bldyjfirstnum }</label>届柏林电影节
						</div>
						<div class="swiper-container swiper-container-v bldyj-v">
							<div class="swiper-wrapper">
								<c:forEach items="${bldyjnumlist }" var="bldyjnum">
									<div class="swiper-slide">
										<div class="swiper-container swiper-container-h bldyj-h">
											<div class="swiper-wrapper">
												<c:forEach items="${bldyjnum.bldyjlist }" var="bldyj">
												<div class="swiper-slide img-swiper-slide"><img class="swiper-img" src="${bldyj.imgpath }" /></div>
												</c:forEach>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div style="width: 100%; text-align: center; padding: 0 1.5rem;">
							<span id="bldyj_name_span" class="bldyj_name_span">
							</span>
						</div>
					</div>
				</div>

			</div>
		</div>

		<script type='text/javascript' src='https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js' charset='utf-8'></script>
		<script>var Zepto = jQuery</script>
		<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
		<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
		<script type='text/javascript' src='<%=PropKit.get("front_prefix") %>leysen/res/js/swiper.js' charset='utf-8'></script>
		
		<script type="application/javascript">
			$(document).ready(function(){
				var screenWidth = window.screen.width;
				var proportion = screenWidth / 640;

				if(screenWidth > 640) {
					$('.zxdt_remark').css('margin-top', '0.9rem');
					$('.dyjzx_item_text_span').width(288);
					$('.nav_top').width(640);
					$('.nav_bottom').width(640);
					$('.content').width(640);
					
					var swiperimgwidth = 440;
					var swiperimgheight = 400;
					$('.swiper-img').width(swiperimgwidth);
					$('.swiper-img').height(swiperimgheight);
					
					$('.img-swiper-slide').width(swiperimgwidth);
					$('.img-swiper-slide').height(swiperimgheight);
					
					$('.swiper-container').height(swiperimgheight);
					
					$('.dyjzx_item_img').width(640 * 0.45 - 6);
					$('.dyjzx_item_img').height((640 * 0.45 - 6) * 3 / 5);
				} else {
					$('.zxdt_remark').css('margin-top', proportion * 0.9 + 'rem');
					$('.dyjzx_item_text_span').width(proportion * 288);
					$('.nav_top').width(screenWidth);
					$('.nav_bottom').width(screenWidth);
					$('.content').width(screenWidth);
					
					var swiperimgwidth = 440 * proportion;
					var swiperimgheight = 400 * proportion;
					
					$('.swiper-img').width(swiperimgwidth);
					$('.swiper-img').height(swiperimgheight);
					
					$('.img-swiper-slide').width(swiperimgwidth);
					$('.img-swiper-slide').height(swiperimgheight);
					
					$('.swiper-container').height(swiperimgheight);
					
					$('.dyjzx_item_img').width(screenWidth * 0.45 - 6);
					$('.dyjzx_item_img').height((screenWidth * 0.45 - 6) * 3 / 5);					
				}
				
				
				// 柏林电影节
				var bldyjcontent = null;
				$.post("/<%=PropKit.get("project_name") %>/leysen/bldyj_json", {type: 1}, function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						bldyjcontent = rescnt;
						$('#dyj_num_span').html(bldyjcontent[0].num);
						$('#bldyj_name_span').html(bldyjcontent[0].bldyjlist[0].content);
					}
				}, "json");

				var swiperV = new Swiper('.bldyj-v', {
					slidesPerView: 1,
					grabCursor: true,
					centeredSlides: true,
					slidesPerView: 'auto',
					direction: 'vertical',
					spaceBetween: 10,
					onTransitionEnd: function(swiper) {
						if (bldyjcontent != null) {
							$('#dyj_num_span').html(bldyjcontent[swiper.activeIndex].num);
							var index = swiperHArr[swiper.activeIndex].activeIndex % bldyjcontent[swiper.activeIndex].bldyjlist.length;
							$('#bldyj_name_span').html(bldyjcontent[swiper.activeIndex].bldyjlist[index].content);
						}
					},
					onInit: function(swiper) {
					}
				});
				
				var swiperHArr = [];
				
				var swiperHindex = 0;
				var swiperH = new Swiper('.bldyj-h', {
					slidesPerView: 1,
					effect: 'coverflow',
					grabCursor: true,
					centeredSlides: true,
					slidesPerView: 'auto',
					spaceBetween: -100,
					loop: true,
					coverflow: {
						rotate: 0,
						stretch: 0,
						depth: 400,
						modifier: 1,
						slideShadows: true
					},
					onTransitionEnd: function(swiper) {
						if (bldyjcontent != null) {
							var index = swiper.activeIndex % bldyjcontent[swiperV.activeIndex].bldyjlist.length;
							$('#bldyj_name_span').html(bldyjcontent[swiperV.activeIndex].bldyjlist[index].content);
						}
						
					},
					onInit: function(swiper) {
						swiperHArr[swiperHindex] = swiper;
						swiperHindex ++;
					}
				});
				
				
			});
			
			function bldyj_click() {
				if ($('#nav_bottom').is(':hidden')) {
					$('#nav_bottom').css('display', 'flex');
				} else {
					$('#nav_bottom').hide();
					$('#bldyj').show();
					$('#bldyj_dyjzx').hide();
					$('#bldyj_gjdz').hide();
					$('#dyjzx_span').removeClass('on');
					$('#mxpd_span').removeClass('on');
				}
			}
			
			function dyjzx_click() {
				window.location.href = "/<%=PropKit.get("project_name") %>/lstl/berlin_consult";
			}
			
			function mxpd_click() {
				window.location.href = "/<%=PropKit.get("project_name") %>/lstl/berlin_mxpd";
			}
			
			function yzcczx_click() {
				window.location.href = "/<%=PropKit.get("project_name") %>/lstl/asia";
			}
			
			function ozcczx_click() {
				window.location.href = "/<%=PropKit.get("project_name") %>/lstl/europe";
			}
		</script>
		
		<script>
			var _hmt = _hmt || [];
			(function() {
			  var hm = document.createElement("script");
			  hm.src = "https://hm.baidu.com/hm.js?7b42cfab9acdbfc6f209e9ae796142b5";
			  var s = document.getElementsByTagName("script")[0]; 
			  s.parentNode.insertBefore(hm, s);
			})();
			</script>
	</body>

</html>