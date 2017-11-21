<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>礼券详情</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #4563BA;
				margin: 0 auto;
			}
			
			.info_content {
				background: #fff;
				text-align: center;
			}
			
			.info_top {
				background: #F5F5F5;
				display: flex;
				align-items: center;
				justify-content: center;
				padding: 0.5rem;			
			}
			
			.info_top label {
				display: block;
			}
			
			.info_content {
				padding: 0.5rem 0.5rem 0.2rem 0.5rem;
			}
			
			.info_content_div1 {
				color: #8F8F8F;
				margin-top: 0.3rem;
			}
			
			.info_content_div2 {
				margin-top: 0.3rem;
			}
			
			.info_content_div3 {
				color: #8F8F8F;
				margin-top: 0.3rem;
			}
			
			.info_content_div4 {
				color: #fff;
				margin-top: 0.8rem;
			}
			
			.info_content_div4 span {
				background: #4563BB;
				display: inline-block;
				height: 100%;
				padding: 0 1.5rem;
			}
			
			.info_content_zs {
				display: flex;
				justify-content: space-between;
				align-items: center;
				margin: 0 0.5rem;
				padding: 0.5rem 0;
				color: #000;
				border-bottom: 1px solid #F7F7F7;
			}
			
			@media (min-width: 481px) {
				.info_top label {
					font-size: .85rem;
				}
				.info_content_div1, .info_content_div3 {
					font-size: .9rem;
				}
				.info_content_div2 {
					font-size: 1.6rem;
				}
				
				.info_content_div4 {
					font-size: .9rem;
					height: 2.2rem;
					line-height: 2.2rem;
				}
				
				.info_content_zs span {
					font-size: .7rem;
				}
				
				.info_content_zs img {
					width: 10px;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.info_top label {
					font-size: .75rem;
				}
				.info_content_div1, .info_content_div3 {
					font-size: .8rem;
				}
				.info_content_div2 {
					font-size: 1.4rem;
				}
				.info_content_div4 {
					font-size: .8rem;
					height: 2rem;
					line-height: 2rem;
				}
				
				.info_content_zs span {
					font-size: .65rem;
				}
				
				.info_content_zs img {
					width: 9px;
				}
			}
			
			@media (max-width: 320px) {
				.info_top label {
					font-size: .65rem;
				}
				
				.info_content_div1, .info_content_div3 {
					font-size: .7rem;
				}
				
				.info_content_div2 {
					font-size: 1.2rem;
				}
				
				.info_content_div4 {
					font-size: .7rem;
					height: 1.8rem;
					line-height: 1.8rem;
				}
				
				.info_content_zs span {
					font-size: .6rem;
				}
				
				.info_content_zs img {
					width: 8px;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #4563BA;">
				<header class="bar bar-nav" style="background: #4563BA">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #fff"></a>
				</header>
				<div class="content">
					<div style="margin: 1rem;">
						<div class="info_top">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_img4.jpg" />
						</div>
						<div class="info_content">
							<div class="info_content_div1">TESIRO通灵珠宝</div>
							<div class="info_content_div2">${productname}</div>
							<div class="info_content_div3">有效期：${startdate2}-${expirationdate}</div>
							<div class="info_content_div4">
								<span>领取到卡包</span>
							</div>
							
							<div class="info_content_zs" style="margin-top: 1rem;">
								<span>赠送给朋友</span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png" />
							</div>
							<div class="info_content_zs">
								<span>折扣券详情</span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png" />
							</div>
							<div class="info_content_zs" style="border: 0;">
								<span>公众号</span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png" />
							</div>
						</div>
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
				$('.info_top img').width(90);

			} else {
				$('.content').width(screenWidth);
				$('.info_top img').width(90 * proportion);
			}
		});
			
		</script>
	</body>

</html>