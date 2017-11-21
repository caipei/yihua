<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_mine.jsp"></jsp:include>
    <title>积分商城</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
			}
			
			.content_list {
				display: flex;
				flex-wrap: wrap;
				padding-bottom: 44px;
			}
			
			.content_item {
				flex: 0 0 50%;
				padding: 8px;
			}
			
			.content_item img {
				width: 100%;
			}
			
			.content_item label {
				display: block;
				margin-left: 5px;
			}
			
			.content_item_span {
				display: inline-block;
				border: 1px solid #f2f2f2;
				padding-bottom: 5px;
			}
			
			.name_label {
				display: block;
				overflow: hidden; 
				white-space: nowrap; 
				text-overflow: ellipsis;
			}
			
			@media (min-width: 481px) {
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
			}
			
			@media (max-width: 320px) {
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #f2f2f2">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">积分商品</h1>
				</header>
				<div class="content">
					<div class="content_list">
						<c:forEach items="${jfgoodslist}" var="jfgoods">
						<div onclick="detail(${jfgoods.id})" class="content_item">
							<span class="content_item_span">
								<img class="content_item_img" src="${jfgoods.imgpath}" />
								<label class="name_label size7-05">${jfgoods.name}</label>
								<label class="size7-05" style="color: #000076;">${jfgoods.pricecontent}</label>
							</span>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;
			
			if(screenWidth > 640) {
				$('.content').width(640);
				
				var imgwidth = (640 - 40) / 2;
				$('.content_item_img').width(imgwidth);
				$('.content_item_img').height(imgwidth / 3 * 2);
				
				$('.name_label').width(imgwidth - 15);
			} else {
				$('.content').width(screenWidth);
				
				var imgwidth = (screenWidth - 40) / 2;
				$('.content_item_img').width(imgwidth);
				$('.content_item_img').height(imgwidth / 3 * 2);
				
				$('.name_label').width(imgwidth -15);
			}
		});
		
		function detail(id) {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/detail?id=' + id;
		}
			
		</script>
	</body>

</html>