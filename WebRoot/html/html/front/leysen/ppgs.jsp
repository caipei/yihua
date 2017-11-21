<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>品牌故事</title>

		<style type="text/css">
			
			.content {
				width: 100%;
				text-align: center;
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_bg.jpg) no-repeat;
				background-size: cover;
				margin: 0 auto;
				position: relative;
			}
			
			.nav {
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_nav.png) no-repeat;
				background-size: contain;
				color: #636468;
			}
			
			.nav_items {
				display: inline-block;
				height: 1.3rem;
				border-radius: 0.2rem;
				padding: 0 0.2rem;
			}
			
			.nav_item {
				display: flex;
				align-items: center;
				flex: 1;
				height: 1.3rem;
			}
			
			.nav_item span {
				display: inline-block;
			}
			
			.swiper-container {
				margin: 0.5rem 0 1.5rem;
				width: 100%;
				padding: 0 30px;
			}
			
			.swiper-slide {
				text-align: center;
				background: transparent;
				/* Center slide text vertically */
			}
			
			.swiper-img {
				max-width: 100%;
				max-height: 100%;
			}
			
			.swiper-opt-btns {
				height: 100%;
				display: flex;
				align-items: center;
				justify-content: space-between;
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
				color: #AAAEAD;
			}
			
			.year_span {
				padding: 0.5rem 0;
				display: block;
			}
			
			@media (min-width: 481px) {
				.swiper-right,
				.swiper-left {
					width: 26px;
				}
				.name_span {
					font-size: 0.8rem;
				}
				.nav_item {
					padding: 0.2rem 0.4rem;
					font-size: 0.8rem;
				}
				
				.year_span {
					font-size: 1.2rem;
				}
				
				.year_label {
					font-size: 1.6rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.swiper-right,
				.swiper-left {
					width: 22px;
				}
				.name_span {
					font-size: 0.7rem;
				}
				.nav_item {
					font-size: 0.7rem;
					padding: 0.2rem 0.3rem;
				}
				
				.year_span {
					font-size: 1rem;
				}
				
				.year_label {
					font-size: 1.4rem;
				}
			}
			
			@media (max-width: 320px) {
				.swiper-right,
				.swiper-left {
					width: 18px;
				}
				.name_span {
					font-size: 0.6rem;
				}
				.nav_item {
					font-size: 0.6rem;
					padding: 0.2rem 0.2rem;
				}
				.year_span {
					font-size: 0.8rem;
				}
				
				.year_label {
					font-size: 1.2rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%;">
					<div style="width: 100%; text-align: center; position: absolute; top: 0;">
						<div class="nav" style="width: 100%; text-align: center; position: absolute;">
							<div class="nav_items">
								<div onclick="show();" class="nav_item on"><span>品牌历程</span><img id="arrow" style="margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_arrow_bottom.png" /></div>
								<div onclick="gsgk();" class="nav_item" id="gsgk" style="display: none;"><span>公司概况</span></div>
								<div onclick="zxdt();" class="nav_item" id="zxdt" style="display: none;"><span>最新动态</span></div>
							</div>
						</div>

						<div class="logo" style="width: 100%; text-align: center;">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_logo.png" style="max-width: 100%;" />
						</div>

						<div style="position: relative;">
							<div class="swiper-container">
								<div class="swiper-wrapper">
								<c:forEach items="${infolist }" var="info">
								<div class="swiper-slide">
									<span class="year_span" style="color: #fff;">
										<label class="year_label">${info.ppgsyear }</label>年
									</span>
									<img class="swiper-img" src="${info.imgpath }" />
								</div>
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

						<div style="width: 100%; text-align: center; padding: 0 1.5rem;">
							<span id="name_span" class="name_span">
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
				
				$('#swiper-left').hide();
				$('#swiper-right').hide();

				if(screenWidth > 640) {
					$('.content').width(640);
					var swiperimgwidth = 640 - 60;
					$('.swiper-img').width(swiperimgwidth);
					$('.swiper-img').height(swiperimgwidth / 4 * 3);
					
					$('.logo').css({
						marginTop: '140px'
					});

					$('.nav').height(81);
					$('.nav').css('padding-top', 10 + 'px');
					
					
				} else {
					$('.content').width(screenWidth);
					var swiperimgwidth = 640 * proportion - 60;
					$('.swiper-img').width(swiperimgwidth);
					$('.swiper-img').height(swiperimgwidth / 4 * 3);
					
					$('.logo').css({
						marginTop: 140 * proportion + 'px'
					});

					$('.nav').height(81 * proportion);
					$('.nav').css('padding-top', 10 * proportion + 'px');
					
				}
				
				var swipernames = [];
				$.post("/<%=PropKit.get("project_name") %>/leysen/ppgs_json", function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						$.each(rescnt, function(index, value) {
							swipernames[index] = value.content;
						});
						$('#name_span').html(swipernames[0]);
					}
				}, "json");
				

				var mySwiper = new Swiper('.swiper-container', {
					slidesPerView: 1,
					effect: 'coverflow',
					grabCursor: true,
					centeredSlides: true,
					slidesPerView: 'auto',
					spaceBetween: -10,
					loop: true,
					autoplay: 5000,
					coverflow: {
						rotate: 0,
						stretch: 0,
						depth: 400,
						modifier: 1,
						slideShadows: false
					},
					onTransitionEnd: function(swiper) {
						if (swipernames != null && swipernames.length > 0) {
							$('#name_span').html(swipernames[swiper.activeIndex % swipernames.length]);
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
			});
			
			var isshow = false;

			function show() {
				if(!isshow) {
					$('.nav_items').animate({
						height: '3.9rem'
					}, 300);
					$('.nav_items').css({
						background: 'rgba(57,62,82,0.8)'
					});
					$('#gsgk').css('display', 'flex');
					$('#zxdt').css('display', 'flex');
					$('#arrow').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_arrow_top.png')
				} else {
					$('.nav_items').animate({
						height: '1.3rem'
					}, 300);
					$('.nav_items').css({
						background: 'transparent'
					})
					$('#gsgk').hide();
					$('#zxdt').hide();
					$('#arrow').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_arrow_bottom.png')
				}
				isshow = !isshow;
			}
			
			
			function gsgk() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/gsgk';
			}
			
			function pplc() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/ppgs';
			}
			
			function zxdt() {
	
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/zxdt';
			}	
		</script>
	</body>

</html>