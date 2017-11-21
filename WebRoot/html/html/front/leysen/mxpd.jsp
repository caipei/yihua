<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>明星佩戴</title>

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
				top: 2rem;
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
						<div onclick="dyjzx();">
							<span>
								电影节资讯
							</span>
						</div>
						<div>
							<span class="on">
								明星佩戴
							</span>
						</div>
					</div>
				</div>
				<div class="content" style="display: block">
					<div class="detail">
					<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/bldyj_gjdz.jpg" style="max-width: 100%;" />
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
				$('.nav_top').width(640);
				$('.content').width(640);
				
			} else {
				$('.nav_top').width(screenWidth);
				$('.content').width(screenWidth);
			}
		});
		
		function dyjzx() {
			window.location.href = "/<%=PropKit.get("project_name") %>/leysen/dyjzx";
		}
			
		</script>
	</body>

</html>