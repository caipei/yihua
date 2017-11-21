<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>产品列表</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
				background: #fff;
			}
			
			.content_list {
				display: flex;
				flex-wrap: wrap;
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
				text-align: center;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #000061;">
					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
					<div class="title" style="color: #000061; display: flex; align-items: center; justify-content: center;"><label>王室珍宝</label><img style="height: 0.6rem; margin-left: 0.3rem;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_arrow_down.png"/></div>
				</header>
				<div class="content">
					<div class="content_list">
						<div onclick="detail()" class="content_item">
							<span class="content_item_span">
									<img class="content_item_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_product_img.jpg" />
									<label class="size7-05">18k金 黄钻戒指</label>
									<label class="size7-05" style="color: #000076;">￥90890</label>
								</span>
						</div>
						<div onclick="detail()" class="content_item">
							<span class="content_item_span">
									<img class="content_item_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_product_img.jpg" />
									<label class="size7-05">18k金 黄钻戒指</label>
									<label class="size7-05" style="color: #000076;">￥90890</label>
								</span>
						</div>
						<div onclick="detail()" class="content_item">
							<span class="content_item_span">
									<img class="content_item_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_product_img.jpg" />
									<label class="size7-05">18k金 黄钻戒指</label>
									<label class="size7-05" style="color: #000076;">￥90890</label>
								</span>
						</div>
						<div onclick="detail()" class="content_item">
							<span class="content_item_span">
									<img class="content_item_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_product_img.jpg" />
									<label class="size7-05">18k金 黄钻戒指</label>
									<label class="size7-05" style="color: #000076;">2000积分</label>
								</span>
						</div>
					</div>
				</div>

				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 40px; border-top: 1px solid #f2f2f2;">
					<span style="display: inline-block; flex: 1; text-align: center; line-height: 35px; font-size: 16px;">客服</span>
					<span style="display: inline-block; flex: 1; text-align: center; line-height: 35px; font-size: 16px;">个人中心</span>
				</nav>
			</div>
		</div>

		<jsp:include page="footer_mine.jsp"></jsp:include>
		
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
			}
		});
		
		function detail() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/productdetail/';   
		}
		
			
		</script>
	</body>

</html>