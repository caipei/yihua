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
			
			.detail {
				position: absolute;
				top: 2rem;
				width: 100%;
				margin: 0 auto;
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
			
			.bldyj_name_span {
				color:  #AAAEAD;
			}
			
			@media (min-width: 481px) {
				.nav_top div span, .dyjzx_item_text_span {
					font-size: 0.8rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.nav_top div span, .dyjzx_item_text_span {
					font-size: 0.7rem;
				}
			}
			
			@media (max-width: 320px) {
				.nav_top div span, .dyjzx_item_text_span {
					font-size: 0.6rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="nav">
					<div class="nav_top">
						<div>
							<span class="on">
								电影节资讯
							</span>
						</div>
						<div onclick="mxpd();">
							<span onclick="mxpd();">
								明星佩戴
							</span>
						</div>
					</div>
				</div>
				<div id="bldyj_content" class="content bldyj_content" style="display: block">
					<div id="bldyj_dyjzx" class="detail">
						<div class="dyjzx_list_div">
							<c:forEach items="${dyjzxlist }" var="dyjzx">
							<div onclick="detail(${dyjzx.id })" class="dyjzx_item_div">
								<span class="dyjzx_item_img_span">
									<img class="dyjzx_item_img" src="${dyjzx.imgpath }" />
								</span>
								<span class="dyjzx_item_text_span">
									${dyjzx.title }
								</span>
							</div>
							</c:forEach>
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
		});
		
		function mxpd() {
			window.location.href = "/<%=PropKit.get("project_name") %>/leysen/mxpd";
		}
		
		function detail(id) {
			window.location.href = '/<%=PropKit.get("project_name") %>/leysen/dyjzx_detail?id=' + id;
		}
			
		</script>
	</body>

</html>