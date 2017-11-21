<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>门店详情</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #efefef;
				margin: 0 auto;
			}
			
			.detail_div {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_fjmd_img5.png) no-repeat;
				background-size: contain;
				margin: 1rem auto;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
			}
			
			.detail_name {
				margin: 1rem 0.8rem 0 0.8rem;
			}
			
			.detail_tel {
				margin: 0rem 0.8rem 1.2rem 0.8rem;
			}
			
			.detail_tel span {
				display: block;
			}
			
			.detail_bottom {
				height: 2rem;
				display: flex;
				justify-content: space-between;
				position: absolute;
				bottom: 44px;
				width: 100%;
				line-height: 2rem;
				color: #fff;
			}
			
			.detail_bottom span {
				display: inline-block;
				flex: 1;
				text-align: center;
				font-size: 0.7rem;
			}
			
			@media (min-width: 481px) {
				.detail_name {
					font-size: 1.1rem;
				}
				.detail_tel {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.detail_name {
					font-size: 1rem;
				}
				.detail_tel {
					font-size: 0.65rem;
				}
			}
			
			@media (max-width: 320px) {
				.detail_name {
					font-size: 0.9rem;
				}
				.detail_tel {
					font-size: 0.6rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">附近的门店</h1>
				</header>
				<div class="content">
					<div class="detail_div">
						<div class="detail_name">${shop }</div>
						<div class="detail_tel">
							<span>座机号：${telephone }</span>
							<span style="margin-top: 0.2rem;">地址：${address }</span>
						</div>
					</div>
				</div>
				
				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 40px; border-top: 1px solid #f2f2f2;">
					<span style="margin-right: 0.1rem; background: #003894;">
						联系商家
					</span>
	 	  			<span style="margin-left: 0.1rem; background: #919191;">
						导航去这里
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
				$('.detail_div').width(581);
				$('.detail_div').height(310);
			} else {
				$('.content').width(screenWidth);
				
				$('.detail_div').width(581 * proportion);
				$('.detail_div').height(310 * proportion);
			}
		});
			
		</script>
	</body>

</html>