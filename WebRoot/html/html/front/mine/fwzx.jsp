<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>服务中心</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.nav {
				top: 2.2rem;
				position: absolute;
				z-index: 999;
				width: 100%;
			}
			
			.nav_top {
				background: #fff;
				width: 100%;
				display: flex;
				align-items: baseline;
				margin: 0 auto;
				height: 2rem;
				line-height: 2rem;
			}
			
			.nav_top div {
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
			
			.nav_top div .on {
				border-bottom: 1px solid #0F46D8;
			}
			
			.zxkf_list {
				margin-top: 40px;
				padding: 15px;
				border-top: 5px solid #F3F6F9;
			}
			
			.zxkf_item {
				margin-top: 10px;
				border-bottom: 1px solid #f2f2f2;
			}
			
			.item_title {
				display: flex;
				align-items: center;
				padding:  0 0 8px;
				border-bottom: #F2F2F2;
			}
			
			.item_title label {
				flex: 1;
			}
			
			.item_content {
				background: #F2F2F2;
				padding: 15px;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
			}
			
			.nav_top div span {
				font-size: 0.7rem;
			}
			
			@media (min-width: 481px) {
				
				.item_title img {
					width: 24px;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				
				.item_title img {
					width: 20px;
				}
			}
			
			@media (max-width: 320px) {
				
				.item_title img {
					width: 18px;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #0C2978;">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">服务中心</h1>
				</header>
				<div class="nav">
					<div class="nav_top">
						<div>
							<span class="text_span on">
								在线客服
							</span>
						</div>
						<div>
							<span>
								客服热线
							</span>
						</div>
					</div>
				</div>
				<div id="zxkf_div" class="content" style="display: block;">
					<div class="zxkf_list">
						<div class="zxkf_list_title size7-05">
							热门问题
						</div>
						<c:forEach items="${zxkflist}" var="zxkf">
						<div class="zxkf_item">
							<div class="item_title size6-05-05" onclick="show_zxkf(${zxkf.id});">
								<label>${zxkf.title }</label><img id="zxkf_img_${zxkf.id}" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png" />
							</div>
							<div id="content_zxkf_${zxkf.id }" class="item_content size6-05" style="display:none">
								${zxkf.content }
							</div>
						</div>
						</c:forEach>
					</div>
				</div>

				<div id="kfrx_div" class="content" style="display: none;">
				</div>
			</div>
		</div>

		<jsp:include page="footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;

			if(screenWidth > 640) {
				$('.content').width(640);
				$('.nav_top').width(640);

				$('.grcz_top_div').width(640);
				$('.grcz_top_div').height(370);

				$('.grcz_top_item1_span').width(150);
				$('.grcz_top_item1_span').height(148);

				$('.grcz_top_item2 img').height(31);
				$('.grcz_top_item2_line').height(31);

				$('.grcz_top_item1_span span').css('padding-right', '10px');

				$('.grcz_top_item1_label1').css('font-size', '1.8rem');

			} else {
				$('.content').width(screenWidth);
				$('.nav_top').width(screenWidth);

				$('.grcz_top_div').width(640 * proportion);
				$('.grcz_top_div').height(370 * proportion);

				$('.grcz_top_item1_span').width(150 * proportion);
				$('.grcz_top_item1_span').height(148 * proportion);

				$('.grcz_top_item2 img').height(31 * proportion);
				$('.grcz_top_item2_line').height(31 * proportion);

				$('.grcz_top_item1_span span').css('padding-right', 10 * proportion + 'px');

				$('.grcz_top_item1_label1').css('font-size', 1.8 * proportion + 'rem');

			}
		});
		
		function show_zxkf(id) {
			if ($('#content_zxkf_' + id).is(":hidden")) {
				$('#content_zxkf_' + id).show();
				$('#img_zxkf_' + id).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png')
			} else {
				$('#content_zxkf_' + id).hide();
				$('#img_zxkf_' + id).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_up.png')
			}
		}
			
		</script>
	</body>

</html>