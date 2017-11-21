<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>最新动态</title>
		<style type="text/css">
			.content {
				width: 100%;
				text-align: center;
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_bg.jpg) no-repeat;
				background-size: cover;
				margin: 0 auto;
				position: relative;
			}
			
			.nav {
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_nav.png) no-repeat;
				background-size: contain;
				color: #636468;
			}
			
			.nav_items {
				display: inline-block;
				height: 1.3rem;
				border-radius: 0.2rem;
				padding: 0 0.2rem;
				z-index: 10000;
			}
			
			.nav_item {
				display: flex;
				align-items: center;
				flex: 1;
				height: 1.3rem;
			}
			
			.nav_item span {
				display: inline-block;
			}
			
			.zxdt_title {
				display: block;
				font-size: 1rem;
				color: #C7CCDD;
			}
			
			.zxdt_remark {
				display: block;
				font-size: 0.8rem;
				color: #868B9D;
				margin-top: 1.2rem;
			}
			
			@media (min-width: 481px) {
				.zxdt_title {
					font-size: 1rem;
				}
				.zxdt_remark {
					font-size: 0.8rem;
					line-height: 1.1rem;
				}
				.nav_item {
					padding: 0.2rem 0.4rem;
					font-size: 0.8rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.zxdt_title {
					font-size: 0.85rem;
				}
				.zxdt_remark {
					font-size: 0.7rem;
					line-height: 1rem;
				}
				
				.nav_item {
					font-size: 0.7rem;
					padding: 0.2rem 0.3rem;
				}
			}
			
			@media (max-width: 320px) {
				.zxdt_title {
					font-size: 0.7rem;
				}
				.zxdt_remark {
					font-size: 0.6rem;
					line-height: 0.9rem;
				}
				.nav_item {
					font-size: 0.6rem;
					padding: 0.2rem 0.2rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%;">
					
					<div class="nav" style="width: 100%; text-align: center; position: absolute;">
						<div class="nav_items">
							<div onclick="show();" class="nav_item on"><span>最新动态</span><img id="arrow" style="margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_arrow_bottom.png" /></div>
							<div onclick="pplc();" class="nav_item" id="gsgk" style="display: none;"><span>品牌历程</span></div>
							<div onclick="gsgk();" class="nav_item" id="zxdt" style="display: none;"><span>公司概况</span></div>
						</div>
					</div>
					<div class="detail_list">
					<c:forEach items="${infolist }" var="info">
					<div onclick="detail(${info.id});" style="display: flex; align-items: center; margin-bottom: 0.5rem;">
						<div style="display: inline-block; flex: 1;">
							<span style="display: block; padding: 0.1rem 0.55rem;">
								<img src="${info.imgpath }" style="width: 100%; border: 3px solid #0c132a; padding: 1px;" />
							</span>
						</div>
						<div style="display: inline-block; flex: 1; text-align: left; padding-right: 0.5rem;">
							<span class="zxdt_title">${info.title }</span>
							<span class="zxdt_remark">${info.remark }</span>
						</div>
					</div>
					</c:forEach>
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
					$('.content').width(640);
					$('.zxdt_remark').css('margin-top', '0.9rem');
					
					$('.detail_list').css({
						marginTop: '120px'
					});
					
					$('.nav').height(81);
					$('.nav').css('padding-top', 10 + 'px');
				} else {
					$('.content').width(screenWidth);
					$('.zxdt_remark').css('margin-top', proportion * 0.9 + 'rem');
					
					$('.detail_list').css({
						marginTop: 120 * proportion + 'px'
					});
					
					$('.nav').height(81 * proportion);
					$('.nav').css('padding-top', 10 * proportion + 'px');
				}
			});
			
			var isshow = false;

			function show() {
				if(!isshow) {
					$('.nav_items').animate({
						height: '3.9rem'
					}, 300);
					$('.nav_items').css({
						background: 'rgba(57,62,82,0.8)',
						zIndex: '10000'
					});
					$('#gsgk').css('display', 'flex');
					$('#zxdt').css('display', 'flex');
					$('#arrow').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_arrow_top.png')
				} else {
					$('.nav_items').animate({
						height: '1.3rem'
					}, 300);
					$('.nav_items').css({
						background: 'transparent'
					})
					$('#gsgk').hide();
					$('#zxdt').hide();
					$('#arrow').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ppgs_arrow_bottom.png')
				}
				isshow = !isshow;
			}
			
			function detail(id) {
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/zxdt_detail?id=' + id;
			}
			
			function gsgk() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/gsgk';
			}
			
			function pplc() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/ppgs';
			}
			
			function zxdt() {
	
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/zxdt';
			}	
		</script>
	</body>

</html>