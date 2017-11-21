<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>活动详情</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.title_div {
				padding: 0.5rem 0.8rem;
				border-bottom: 5px solid #F3F7F9;
			}
			
			.title_div span {
				display: block;
			}
			
			.title_div .time_span {
				margin-top: 3px;
				color: #525252;
			}
			
			.content_div {
				padding: 0.8rem;
			}
			
			.content_div p {
				color: #525252;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
			}
			
			@media (min-width: 481px) {
				
				.content_div p {
					font-size: 0.75rem;
					line-height: 1.4rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				
				.content_div p {
					font-size: 0.7rem;
					line-height: 1.2rem;
				}
			}
			
			@media (max-width: 320px) {
				
				.content_div p {
					font-size: 0.65rem;
					line-height: 1rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #0C2978;">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">活动详情</h1>
				</header>
				<div class="content">
					<img id="zshd_img" src="${imgpath }" />
					<div class="title_div">
						<span class="title_span size8-05">${title }</span>
						<span class="time_span size7-05">${intime_format }</span>
					</div>
					
					<div class="content_div size6-05-05">
						${content }
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
				
				$('#zshd_img').width(640);
				$('#zshd_img').height(400);
			} else {
				$('.content').width(screenWidth);
				
				$('#zshd_img').width(screenWidth);
				$('#zshd_img').height(400 * proportion);
			}
		});
			
		</script>
	</body>

</html>