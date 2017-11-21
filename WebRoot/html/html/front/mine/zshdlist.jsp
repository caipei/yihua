<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>会员活动</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.list_item {
				display: flex;
				align-items: center;
				border-bottom: 5px solid #F2F6F9;
				padding: 10px;
			}
			
			.list_item span {
				display: inline-block;
				flex: 1;
				margin: 0 10px;
				overflow: hidden;
			}
			
			.list_item span label {
				display: block;
				color: #353535;
			}
			
			.list_item span .label2 {
				color: #8a8a8a;
				margin-top: 0.2rem;
			}
			
			.img_arrow {
				height: 0.6rem;
			}
			
			@media (min-width: 481px) {
				.label1 {
					font-size: 0.9rem;
				}
				.label2 {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.label1 {
					font-size: 0.85rem;
				}
				.label2 {
					font-size: 0.765rem;
				}
			}
			
			@media (max-width: 320px) {
				.label1 {
					font-size: 0.8rem;
				}
				.label2 {
					font-size: 0.6rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #0C2978;">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">会员专属活动</h1>
				</header>
				<div class="content">
					<div class="list">
						<c:forEach items="${zshdlist }" var="zshd">
							<div onclick="detail(${zshd.id})" class="list_item">
								<img class="img1" src="${zshd.imgpath }" />
								<span>
									<label class="label1">${zshd.title }</label>
									<label class="label2">${zshd.starttime_format }-${zshd.endtime_format }</label>
								</span>
								<img class="img_arrow" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png" />
							</div>
						</c:forEach>
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
				
				$('.img1').width(180);
				$('.img1').height(120);
			} else {
				$('.content').width(screenWidth);
				
				$('.img1').width(180 * proportion);
				$('.img1').height(120 * proportion);
			}
		});
		
		function detail(id) {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/zshddetail?id=' + id;
		}
			
		</script>
	</body>

</html>