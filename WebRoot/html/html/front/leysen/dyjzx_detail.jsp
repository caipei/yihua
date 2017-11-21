<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>${title }</title>
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
				color: #fff;
				padding: 0 1rem 1rem;
				text-align: left;
			}
			
			.zxdt_time {
				color: #9FA0A6;
				text-align: left;
				padding: 0 1rem;
			}
			
			.zxdt_content {
				margin: 0 1rem 0.5rem 1rem;
				color: #C3C4C8;
			}
			
			.zxdt_content p {
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
			
			.zxdt_content .p_img{
				text-align: center;
			}
			
			.zxdt_content .p_img img{
				max-width: 100%;
			}
			
			@media (min-width: 481px) {
				.zxdt_title {
					font-size: 1.2rem;
					line-height: 1.5rem;
				}
				.zxdt_time {
					font-size: 0.8rem;
				}
				
				.zxdt_content p {
					font-size: 0.9rem;
					line-height: 1.2rem;
				}
				.nav_item {
					padding: 0.2rem 0.4rem;
					font-size: 0.8rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.zxdt_title {
					font-size: 1rem;
					line-height: 1.3rem;
				}
				.zxdt_time {
					font-size: 0.7rem;
				}
				.zxdt_content p {
					font-size: 0.8rem;
					line-height: 1.1rem;
				}
				.nav_item {
					font-size: 0.7rem;
					padding: 0.2rem 0.3rem;
				}
			}
			
			@media (max-width: 320px) {
				.zxdt_title {
					font-size: 0.8rem;
					line-height: 1rem;
				}
				.zxdt_time {
					font-size: 0.6rem;
				}
				.zxdt_content p {
					font-size: 0.7rem;
					line-height: 1rem;
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
					
					<div class="zxdt_title">
						${title }
					</div>

					<div class="zxdt_time">
						${intime_format }
					</div>

					<div class="absolute_img_div" style="margin-top: 0.5rem;">
						<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/zxdt_img3.png" />
					</div>

					<div class="zxdt_content">
						<c:forEach items="${contents }" var="content">
							<c:if test="${content.type eq 1 }">
								<p>
									${content.content }
								</p>
							</c:if>
							<c:if test="${content.type eq 2 }">
								<p class="p_img">
									<img src="${content.url }" />
								</p>
							</c:if>
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
					$('.zxdt_remark').css('margin-top', '0.9rem');
					
					$('.zxdt_title').css({
						marginTop: '40px'
					});
					
					$('.nav').height(81);
					$('.nav').css('padding-top', 10 + 'px');
				} else {
					$('.zxdt_remark').css('margin-top', proportion * 0.9 + 'rem');
					
					$('.zxdt_title').css({
						marginTop: 40 * proportion + 'px'
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