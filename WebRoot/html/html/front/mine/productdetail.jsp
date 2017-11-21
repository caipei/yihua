<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>产品详情</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
				background: #fff;
			}
			
			.detail {
				border-bottom: 10px solid #f2f2f2;
			}
			
			.detail_content p {
				font-size: 13px;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
				text-indent: 2em;
			}
			
			.sl_div {
				display: inline-flex;
				align-items: center;
			}
			
			.sl_plus_span {
				display: inline-flex;
				width: 25px;
				height: 25px;
				background: #ADADAD;
				color: #fff;
				line-height: 25px;
				justify-content: center;
				align-items: center;
			}
			
			.sl_minus_span {
				display: inline-flex;
				width: 25px;
				height: 25px;
				line-height: 25px;
				background: #ADADAD;
				color: #fff;
				justify-content: center;
				align-items: center;
			}
			
			.sl_num_span input {
				height: 25px;
				width: 40px;
				background: #fff;
				text-align: center;
				border: 1px solid #ADADAD;
			}
			
			.xxcs_div {
				display: flex;
				flex-wrap: wrap;
				padding: 8px 0 10px;
			}
			
			.xxcs_item_span {
				flex: 0 0 50%;
				display: inline-block;
				margin-top: 5px;
				color: #838383;
			}
			
			.xxcs_item_span label {
				color: #838383;
			}
			
			.twxq_div img {
				width: 100%;
				margin-bottom: 10px;
			}
			
			.twxq_div span {
				display: block;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
				margin-bottom: 10px;
			}
			
			.bottom_btns {
				display: inline-flex;
				flex: 3;
			}
			
			.bottom_btns span {
				display: inline-flex;
				flex: 1;
				flex-direction: column;
				text-align: center;
				align-items: center;
				justify-content: center;
			}
			
			.bottom_btns span label {
				display: block;
				font-size: 12px;
				margin-top: -2px;
			}
			
			.bottom_btns span img {
				width: 20px;
			}
			
			@media (min-width: 481px) {
				.twxq_div span {
					font-size: 0.75rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.twxq_div span {
					font-size: 0.7rem;
				}
			}
			
			@media (max-width: 320px) {
				.twxq_div span {
					font-size: 0.65rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav" style="background: #fff">
					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
					<h1 class="title" style="color: #000061">详情</h1>
				</header>
				<div class="content">
					<div style="padding-bottom: 80px;">
						<div class="absolute_img_div">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img5.jpg" />
						</div>

						<div style="padding: 15px; border-bottom: 10px solid #f2f2f2;">
							<span style="display: block; text-align: center; color: #333333; font-size: 1rem; font-weight: bold;">
							黄钻戒指，主石重CT:1.03
							</span>
							<span style="display: block; text-align: center; color: #000D7F; margin-top: 0.5rem; font-size: 0.8rem; font-weight: bold;">
							尊享价：￥98000
							</span>
							<span style="display: block; text-decoration:line-through; text-align: center; color: #848584; margin-top: 0.1rem; font-size: 0.6rem;">
							官方价：￥98000
							</span>
						</div>

						<div style="padding: 15px; border-bottom: 10px solid #f2f2f2;">
							<div style="display: flex; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #f2f2f2;">
								<label class="size7-05-05">我的选择</label><img style="height: 8px; margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png" />
							</div>

							<div style="display: flex; align-items: center; margin-top: 15px; font-size: 14px;">
								<label  style="margin-right: 10px; text-align: right;">尺寸</label>
								<span style="border: 1px solid #6B8BC1; display: inline-flex; align-items: center; height: 28px;">
									<input value="13#" style="border: 0; background: transparent; width: 60px; text-align: center; color: #003894;" />
									<img style="height: 8px; margin-right: 5px; margin-left: -10px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_arrow_down.png" />
								</span>
							</div>

							<div style="display: flex; align-items: center; margin-top: 15px; font-size: 14px;">
								<label style="margin-right: 10px; text-align: right;">数量</label>
								<div class="sl_div">
									<span class="sl_minus_span">-</span>
									<span class="sl_num_span"><input type="number" value="1"/></span>
									<span class="sl_plus_span">+</span>
								</div>
							</div>
							
							<div style="display: flex; align-items: center; margin-top: 15px; font-size: 14px;">
								<label style="margin-right: 10px; text-align: right; font-size: 14px;">领取门店</label>
								<span style="border: 1px solid #e2e2e2; display: inline-flex; align-items: center; height: 28px;">
									<label style="padding: 0 15px; font-size: 14px;">南京中央商场店</label>
									<img style="height: 8px; margin-right: 5px; margin-left: -10px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_arrow_down.png" />
								</span>
							</div>
							
							<div style="margin-top: 10px;" class="size6-05">
								<span style="display: block;">服务：由TESIRO通灵珠宝从江苏南京市发货并提供售后服务</span>
								<span style="display: block; margin-top: 2px;">提示 ：<label style="color: #E78400;">不支持7天无理由退货</label></span>
							</div>
						</div>

						<div style="padding: 15px 15px 5px 15px; border-bottom: 10px solid #f2f2f2;">
							<div style="display: flex; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #f2f2f2;">
								<label class="size7-05-05">详细参数</label><img style="height: 8px; margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png" />
							</div>

							<div class="xxcs_div size7-05">
								<span class="xxcs_item_span">条形码：HB8</span>
								<span class="xxcs_item_span">主石重：19</span>
								<span class="xxcs_item_span">副石重：19</span>
								<span class="xxcs_item_span">副石数：19</span>
								<span class="xxcs_item_span">金重：19</span>
								<span class="xxcs_item_span">金重：/</span>
							</div>
						</div>
						
						<div style="padding: 15px 15px 5px 15px; border-bottom: 10px solid #f2f2f2;">
							<div style="display: flex; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #f2f2f2;">
								<label class="size7-05-05">图文详情</label><img style="height: 8px; margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png" />
							</div>

							<div class="twxq_div size7-05">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_banner.png" />
								<span>详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数</span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_banner.png" />
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_banner.png" />
								<span>详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数</span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_banner.png" />
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_banner.png" />
								<span>详细参数详细参数详细参数详细参数详细参数详细参数详细参数详细参数</span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_banner.png" />
							</div>
						</div>

					</div>
				</div>

				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 44px; border-top: 1px solid #f2f2f2;">
					<span class="bottom_btns">
						<span style="border-right: 1px solid #f2f2f2;">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img6.jpg" />
							<label>客服</label>
						</span>
						<span style="border-right: 1px solid #f2f2f2;">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img7.jpg" />
							<label>购物车</label>
						</span>
						<span>
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img8.jpg" />
							<label>首页</label>
						</span>
					</span>
					<span style="display: inline-flex; flex: 2; font-size: 14px; background: #A1A1A1; color: #fff; justify-content: center; align-items: center;">
						加入购物车
					</span>
					<span style="display: inline-flex; flex: 2; font-size: 14px; background: #003795; color: #fff; justify-content: center; align-items: center;">
						立即购买
					</span>
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
			} else {
				$('.content').width(screenWidth);
			}
		});
		
			
		</script>
	</body>

</html>