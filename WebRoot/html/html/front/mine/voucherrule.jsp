<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>礼券规则</title>

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
				border-top: 1px solid #0C2978;
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
			
			.text_div {
				margin-top: 2rem;
				border-top: 5px solid #F2F6F9;
				padding: 0px 12px 70px;
			}
			
			.text_item1 {
				color: #000;
			}
			
			.text_item2 {
				color: #B0B0B0;
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
			
			@media (min-width: 481px) {
				.nav_top div span {
					font-size: 0.9rem;
				}
				.text_item1 {
					font-size: 0.85rem;
				}
				.text_item2 {
					font-size: 0.75rem;
					line-height: 1.4rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.nav_top div span {
					font-size: 0.8rem;
				}
				.text_item1 {
					font-size: 0.8rem;
				}
				.text_item2 {
					font-size: 0.7rem;
					line-height: 1.2rem;
				}
			}
			
			@media (max-width: 320px) {
				.nav_top div span {
					font-size: 0.7rem;
				}
				.text_item1 {
					font-size: 0.75rem;
				}
				.text_item2 {
					font-size: 0.65rem;
					line-height: 1rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">礼券规则</h1>
				</header>
				<div class="nav">
					<div class="nav_top">
						<div>
							<span>
								会员礼券规则说明
							</span>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="text_div">
						<div class="text_item2" style="margin-top: 15px;">1. 会员礼券内预付价值一元等值于一元人民币。</div>
						<div class="text_item2" style="margin-top: 15px;">2. 会员礼券可支付：机票、预付酒店、签证、邮轮、自由行套餐（机+酒、景+酒）、旅游、旅游类团购、旅游保险、用车服务、预付门票等产品订单。（注：部分机票、部分门票、部分用车产品以及团购中非旅游类产品、银行专享类旅游产品及其他特殊产品等暂不支持任我行礼品卡支付）。</div>
						<div class="text_item2" style="margin-top: 15px;">3.会员礼券可支付：预付酒店、非零售商自由行套餐（机+酒、景+酒）非零售商旅游度假、邮轮、旅游类团购、签证、旅游保险、用车、预付门票等产品订单。（注：部分门票、部分用车产品、团购中非旅游类产品、特殊零售商旅游产品、银行专享类旅游产品及其他特殊产品等暂不支持任我游礼品卡支付）。 </div>
						<div class="text_item2" style="margin-top: 15px;">4. 通过通灵珠宝官网购买的会员礼券实体卡，需要在点击“确认收货”后方可激活领用；通过线下采购，采取支票、汇款等方式支付的携程礼品卡，一般在资金到帐后7个工作日方可激活领用。</div>
						<div class="text_item2" style="margin-top: 15px;">5. 会员礼券需要领用至会员帐户内方可使用。 在被领用至会员账户时需要设置支付密码，密码可以由顾客自行修改。</div>
						<div class="text_item2" style="margin-top: 15px;">6. 已领用至会员帐户内的礼品卡可以分次消费，单个会员帐户内的携程礼品卡金额在有效期内不限额、不限人次、不限次数使用。</div>
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

			} else {
				$('.content').width(screenWidth);
				$('.nav_top').width(screenWidth);

			}
		});
			
		</script>
	</body>

</html>