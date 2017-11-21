<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
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
							<span onclick="bldyj_click();" id="bldyj_span">
								柏林电影节
							</span>
							<span class="bldyj_img_span">
							</span>
						</div>
						<div onclick="yzcczx_click();" id="yzcczx_div">
							<span onclick="yzcczx_click();" id="yzcczx_span" class="on">
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
				</div>
				
				<div id="yzcczx_content" class="content yzcczx_content">
					<div id="yzcczx" class="yzcczx_detail">
						<div class="absolute_img_div">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_img4.png" />
						</div>
						<div class="dyj_title">
							第<label id="yzcczx_dyj_num_span" class="dyj_num_span">${yzcczxfirstnum }</label>届亚洲璀璨之星
						</div>
						<div class="swiper-container swiper-container-v yzcczx-v">
							<div class="swiper-wrapper">
								<c:forEach items="${yzcczxnumlist }" var="yzcczxnum">
									<div class="swiper-slide">
										<div class="swiper-container swiper-container-h yzcczx-h">
											<div class="swiper-wrapper">
												<c:forEach items="${yzcczxnum.yzcczxlist }" var="yzcczx">
												<div class="swiper-slide img-swiper-slide"><img class="swiper-img" src="${yzcczx.imgpath }" /></div>
												</c:forEach>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div style="width: 100%; text-align: center; padding: 0 1.5rem;">
							<span id="yzcczx_name_span" class="bldyj_name_span">
							</span>
						</div>
					</div>
				</div>

			</div>
		</div>

		<jsp:include page="footer_leysen.jsp"></jsp:include>
		
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
				
				
				// 亚洲璀璨之星
				var yzcczxcontent = null;
				$.post("/<%=PropKit.get("project_name") %>/leysen/bldyj_json", {type: 2}, function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						yzcczxcontent = rescnt;
						$('#yzcczx_dyj_num_span').html(yzcczxcontent[0].num);
						$('#yzcczx_name_span').html(yzcczxcontent[0].bldyjlist[0].content);
					}
				}, "json");
				
				var yzcczxswiperV = new Swiper('.yzcczx-v', {
					slidesPerView: 1,
					grabCursor: true,
					centeredSlides: true,
					slidesPerView: 'auto',
					direction: 'vertical',
					spaceBetween: 10,
					onTransitionEnd: function(swiper) {
						if (yzcczxcontent != null) {
							$('#yzcczx_dyj_num_span').html(yzcczxcontent[swiper.activeIndex].num);
							var index = yzcczxswiperHArr[swiper.activeIndex].activeIndex % yzcczxcontent[swiper.activeIndex].bldyjlist.length;
							$('#yzcczx_name_span').html(yzcczxcontent[swiper.activeIndex].bldyjlist[index].content);
						}
					},
					onInit: function(swiper) {
					}
				});
				
				var yzcczxswiperHArr = [];
				
				var yzcczxswiperHindex = 0;
				var yzcczxswiperH = new Swiper('.yzcczx-h', {
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
						if (yzcczxcontent != null) {
							var index = swiper.activeIndex % yzcczxcontent[yzcczxswiperV.activeIndex].bldyjlist.length;
							$('#yzcczx_name_span').html(yzcczxcontent[index].bldyjlist[index].content);
						}
					},
					onInit: function(swiper) {
						yzcczxswiperHArr[yzcczxswiperHindex] = swiper;
						yzcczxswiperHindex ++;
					}
				});
				
				
			});
			
			function bldyj_click() {
				window.location.href = "/<%=PropKit.get("project_name") %>/leysen/bldyj";
			}
			
			function yzcczx_click() {
				
			}
			
			function ozcczx_click() {
				window.location.href = "/<%=PropKit.get("project_name") %>/leysen/ozcczx";
			}
			
		</script>
	</body>

</html>