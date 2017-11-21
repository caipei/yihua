<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_mine.jsp"></jsp:include>
    <title>积分商城</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
			}
			
			.swiper-container {
				margin: 0;
				padding: 0;
			}
			
			.swiper-slide {
				text-align: center;
				background: transparent;
				line-height: 0;
				padding: 0;
				margin: 0;
				/* Center slide text vertically */
			}
			
			.swiper-img {
				width: 100%;
				height: 100%;
			}
			
			.jfsc_fl_div {
				display: flex;
				padding: 10px 0;
				border-bottom: 10px solid #f2f2f2;
			}
			
			.jfsc_fl_div span {
				display: inline-block;
				flex: 1;
				text-align: center;
			}
			
			.jfsc_fl_img1 {
				margin-top: 5px;
			}
			
			.content_list {
				display: flex;
				flex-wrap: wrap;
				border-bottom: 10px solid #f2f2f2;
			}
			
			.content_item {
				flex: 0 0 50%;
				padding: 8px;
			}
			
			.content_item img {
				width: 100%;
			}
			
			.content_item label {
				display: block;
				margin-left: 5px;
			}
			
			.content_item_span {
				display: inline-block;
				border: 1px solid #f2f2f2;
				padding-bottom: 5px;
			}
			
			.name_label {
				display: block;
				overflow: hidden; 
				white-space: nowrap; 
				text-overflow: ellipsis;
			}
			
			@media (min-width: 481px) {
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
			}
			
			@media (max-width: 320px) {
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<button onclick="dhjl();" class="button button-link button-nav pull-right" style="color: #9A9A9A; font-size: 14px;">兑换记录</button>
 					<h1 class="title" style="color: #000061">积分商城</h1>
				</header>
				<div class="content">
					<div class="absolute_img_div">
						<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img9.jpg" />
					</div>
					<div class="jfsc_fl_div">
						<span onclick="topics_click(1);" style="border-right: 1px solid #f2f2f2;">
							<label class="jfsc_fl_label1 size7-05" style="color: #0039A2;">新手必兑</label>
							<img class="jfsc_fl_img1" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img1.jpg" />
						</span>
						<span onclick="topics_click(2);" style="border-right: 1px solid #f2f2f2;">
							<label class="jfsc_fl_label1 size7-05" style="color: #D10043;">女王专区</label>
							<img class="jfsc_fl_img1" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img2.jpg" />
						</span>
						<span onclick="topics_click(3);" style="border-right: 1px solid #f2f2f2;">
							<label class="jfsc_fl_label1 size7-05" style="color: #218AB7;">旅行专区</label>
							<img class="jfsc_fl_img1" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img3.jpg" />
						</span>
						<span onclick="topics_click(4);">
							<label class="jfsc_fl_label1 size7-05" style="color: #783B98;">抽奖积分</label>
							<img class="jfsc_fl_img1" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img4.jpg" />
						</span>
					</div>
					
					<div style="padding-bottom: 80px;">
						<div style="margin: 0 10px; padding: 10px 0; display: flex; border-bottom: 1px solid #f2f2f2;">
							<span style="display: inline-block; flex: 1;" class="size7-05">兑换推荐</span>
							<span onclick="jfgoods_list();" style="display: inline-block;" class="size7-05">更多&gt;&gt;</span>
						</div>
						<div class="content_list">
							<c:forEach items="${jfgoodslist}" var="jfgoods">
							<div onclick="detail(${jfgoods.id})" class="content_item">
								<span class="content_item_span">
									<img class="content_item_img" src="${jfgoods.imgpath}" />
									<label class="name_label size7-05">${jfgoods.name}</label>
									<label class="size7-05" style="color: #000076;">${jfgoods.pricecontent}</label>
								</span>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 40px; border-top: 1px solid #f2f2f2;">
					<span style="display: inline-block; flex: 1; text-align: center; line-height: 35px; font-size: 16px;">客服</span>
					<span onclick="grzx();" style="display: inline-block; flex: 1; text-align: center; line-height: 35px; font-size: 16px;">个人中心</span>
				</nav>
			</div>
		</div>

		<jsp:include page="../footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;
			
			if(screenWidth > 640) {
				$('.content').width(640);
				
				var swiperWidth = 640;
				var swiperHeight = swiperWidth * 3 / 7;
				$('.swiper-top').width(swiperWidth);
				$('.swiper-top').height(swiperHeight);
				
				$('.jfsc_fl_img1').width(112);
				$('.jfsc_fl_img1').height(112);
				
				var imgwidth = (640 - 40) / 2;
				$('.content_item_img').width(imgwidth);
				$('.content_item_img').height(imgwidth / 3 * 2);
				
				$('.name_label').width(imgwidth - 15);
			} else {
				$('.content').width(screenWidth);
				
				var swiperWidth = screenWidth;
				var swiperHeight = swiperWidth * 3 / 7;
				$('.swiper-top').width(swiperWidth);
				$('.swiper-top').height(swiperHeight);
				
				$('.jfsc_fl_img1').width(112 * proportion);
				$('.jfsc_fl_img1').height(112 * proportion);
				
				var imgwidth = (screenWidth - 40) / 2;
				$('.content_item_img').width(imgwidth);
				$('.content_item_img').height(imgwidth / 3 * 2);
				
				$('.name_label').width(imgwidth -15);
			}
		});
		
		function detail(id) {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/detail?id=' + id;
		}
		
		function grzx() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/index';
		}
		
		function dhjl() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/dhjl';
		}
		
		function topics_click(topicsid) {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/topics_jfgoods_list?topicsid=' + topicsid;
		}
		
		function jfgoods_list() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/jfgoods_list';
		}
			
		</script>
	</body>

</html>