<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_mine.jsp"></jsp:include>
    <title>礼金券</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
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
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #f2f2f2;">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">礼金券</h1>
				</header>
				<div class="content">
					<div class="absolute_img_div">
						<img src="${imgpath }"  />
					</div>
					<div style="padding: 10px; border-bottom: 10px solid #f2f2f2;">
						<span style="display: block;" class="size7-05-05">${name }</span>
						<span style="display: block; color: #001883; margin-top: 5px;" class="size7-05-05">${jf }积分</span>
					</div>
					
					<div class="detail" style="padding: 10px; margin-bottom: 80px;">
						<div class="size7-05-05">礼券说明</div>
						<div class="twxq_div size7-05" style="margin-top: 10px">
							<c:forEach items="${contentlist }" var="content">
								<c:if test="${content.type eq 1 }">
								<span>${content.content }</span>
								</c:if>
								<c:if test="${content.type eq 2 }">
								<img src="${content.url }" />
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 40px; border-top: 1px solid #f2f2f2;">
					<span onclick="add2order(${id});" style="display: inline-block; flex: 1; background: #013895; color: #fff; text-align: center; line-height: 35px; font-size: 16px;">立即兑换</span>
				</nav>
			</div>
		</div>

		<jsp:include page="../footer_mine.jsp"></jsp:include>
		
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
		
		function add2order(id) {
			
			var num = 1;
			var params = {};
			params.id = id;
			params.num = num;
			$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/add2order_ljq', params, function (returnJson){
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				toast('兑换成功');
    			} else {
    				toast(rescnt);
    			}
    		}, "json");
		}
			
		</script>
	</body>

</html>