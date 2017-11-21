<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>专属权益</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.nav {
				position: absolute;
				z-index: 999;
				width: 100%;
				top: 2.2rem;
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
				padding: 0 15px;
				border-top: 5px solid #F3F6F9;
			}
			
			.zxkf_item {
				margin-top: 0.2rem;
				padding: 0.2rem 0 0.5rem;
				border-bottom: 1px solid #E5E5E5;
			}
			
			.item_title {
				display: flex;
				align-items: center;
				padding:  0 0 4px;
				border-bottom: #F2F2F2;
			}
			
			.item_title label {
				flex: 1;
			}
			
			.item_content {
				color: #6E6E6E;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
				line-height: 1.2rem;
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
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #0C2978;">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">专属权益</h1>
				</header>
				<div class="nav" style="display: none">
					<div class="nav_top">
						<div>
							<span class="size7-05">
								专属权益
							</span>
						</div>
					</div>
				</div>
				<div id="zxkf_div" class="content" style="display: block;">
					<div class="zxkf_list" style="padding-bottom: 2rem">
						<c:if test="${level eq '1' }">
						<div class="zxkf_item">
							<div class="item_title size7-05">
								<label style="font-weight: bold;">铂金</label>
							</div>
							<div class="item_content size6-05">
								<label style="font-weight: 1000;">折扣权益:</label><br/>
								购买指定产品（素金、特价及特殊强调饰品除外）尊享一次9折优惠<br/>
								<label style="font-weight: 1000;">推荐消费权益:</label><br/>
								尊享一次9折推荐优惠
							</div>
						</div>
						</c:if>
						<c:if test="${level eq '2' }">
						<div class="zxkf_item">
							<div class="item_title size7-05">
								<label style="font-weight: bold;">钻石</label>
							</div>
							<div class="item_content size6-05">
								<label style="font-weight: bold;">折扣权益:</label><br/>
								购买指定产品（素金、特价及特殊强调饰品除外）尊享9折优惠<br/>
								<label style="font-weight: bold;">推荐消费权益:</label><br/>
								尊享9折推荐优惠，推荐好友消费可同享消费积分
							</div>
						</div>
						</c:if>
						<c:if test="${level eq '3' }">
						<div class="zxkf_item">
							<div class="item_title size7-05">
								<label style="font-weight: bold;">克拉</label>
							</div>
							<div class="item_content size6-05">
								<label style="font-weight: bold;">折扣权益:</label><br/>
								购买指定产品（素金、特价及特殊强调饰品除外）尊享8.8折优惠<br/>
								<label style="font-weight: bold;">推荐消费权益:</label><br/>
								尊享8.8折/9折推荐优惠，推荐好友消费可同享消费积分<br/>
								<label style="font-weight: bold;">免费改款权益:</label><br/>
								会员卡中购买的钻饰品，若改款，可免收非系列化饰品加工费及金损费<br/>
								<label style="font-weight: bold;">生子权益:</label><br/>
								子女出生之日起的一年内尊享精美（婴幼儿）饰品一件，凭卡主身份证及子女出生医学证明到店申领
							</div>
						</div>
						</c:if>
						<c:if test="${level eq '4' }">
						<div class="zxkf_item">
							<div class="item_title size7-05">
								<label style="font-weight: bold;">蓝钻</label>
							</div>
							<div class="item_content size6-05">
								<label style="font-weight: bold;">折扣权益:</label><br/>
								购买指定产品（素金、特价及特殊强调饰品除外）尊享8.5折优惠<br/>
								<label style="font-weight: bold;">推荐消费权益:</label><br/>
								尊享8.5折/8.8折推荐优惠，推荐好友消费可同享消费积分<br/>
								<label style="font-weight: bold;">免费改款权益:</label><br/>
								会员卡中购买的钻饰品，若改款，可免收非系列化饰品加工费及金损费<br/>
								<label style="font-weight: bold;">生子权益:</label><br/>
								子女出生之日起的一年内尊享精美（婴幼儿）饰品一件，凭卡主身份证及子女出生医学证明到店申领
							</div>
						</div>
						</c:if>
					</div>
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
			
		</script>
	</body>

</html>