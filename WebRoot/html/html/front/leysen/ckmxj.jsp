<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>创客梦想家</title>

		<style type="text/css">
			.content {
				width: 100%;
				text-align: center;
				margin: 0 auto;
				position: relative;
			}
			
			.middle_div {
				background: url(<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_img2.jpg) no-repeat;
				background-size: contain;
				line-height: 0;
				position: relative;
				margin: 0 auto;
			}
			.ckmxj_img {
				margin-top: 0.4rem;
				margin-right: 0.3rem;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">

				<div class="content" style=" position: relative; width: 100%; height: 100%;">

					<div style="width: 100%; text-align: center; position: relative;">
						<div style="width: 100%; text-align: center; line-height: 0;">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_img1.jpg" style="max-width: 100%;" />
						</div>
						<div class="middle_div">
							<div style="position: absolute; top: 5px; right: 5px;">
								<img onclick="yszc();" class="ckmxj_img" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_yszc_img1.png" /><br />
								<img onclick="jmxx();" class="ckmxj_img" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jmxx_img1.png" /><br />
								<img onclick="jyft();" class="ckmxj_img" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jyft_img1.png" />
							</div>
						</div>
						<div style="width: 100%; text-align: center; line-height: 0;">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_img3.jpg" style="max-width: 100%;" />
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
					$('.middle_div').css('width', 640);
					$('.middle_div').css('height', 197);
					
					$('.ckmxj_img').css('width', 120);
				} else {
					$('.middle_div').css('width', 640 * proportion);
					$('.middle_div').css('height', 197 * proportion);
					
					$('.ckmxj_img').css('width', 120 * proportion);
				}
			});
			
			function yszc() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/ckmxj_sub?type=1';
			}
			
			function jmxx() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/ckmxj_sub?type=2';
			}
			
			function jyft() {
	
				window.location.href = '/<%=PropKit.get("project_name") %>/leysen/ckmxj_sub?type=3';
			}	
		</script>
	</body>

</html>