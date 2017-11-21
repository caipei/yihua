<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>门店查询</title>

		<style type="text/css">
			.content {
				width: 100%;
				text-align: center;
				background: #02071B;
				margin: 0 auto;
				position: relative;
				line-height: 0;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%;">
					<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/mdcx.jpg" style="max-width: 100%;" />
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
				} else {
					$('.content').width(screenWidth);
				}
			});
		</script>
	</body>

</html>