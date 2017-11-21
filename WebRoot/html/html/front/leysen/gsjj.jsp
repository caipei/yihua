<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>公司简介</title>

		<style type="text/css">
			.content {
				width: 100%;
				text-align: center;
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/gsjj_bg.jpg) no-repeat;
				background-size: cover;
				margin: 0 auto;
				position: relative;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">

				<div class="content" style=" position: relative; width: 100%; height: 100%;">

					<div style="width: 100%; text-align: center; padding: 1rem 0;">
						<div onclick="gsgk()" style="width: 100%; text-align: center; line-height: 0;">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/gsjj_img1.png" style="max-width: 100%;" />
						</div>
						<div onclick="pplc()" style="width: 100%; text-align: center; line-height: 0;">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/gsjj_img2.png" style="max-width: 100%;" />
						</div>
						<div onclick="zxdt()" style="width: 100%; text-align: center; line-height: 0;">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/gsjj_img3.png" style="max-width: 100%;" />
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

				} else {
					
				}
			});
			
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
		
		
		<script>
			var _hmt = _hmt || [];
			(function() {
			  var hm = document.createElement("script");
			  hm.src = "https://hm.baidu.com/hm.js?7b42cfab9acdbfc6f209e9ae796142b5";
			  var s = document.getElementsByTagName("script")[0]; 
			  s.parentNode.insertBefore(hm, s);
			})();
			</script>
	</body>

</html>