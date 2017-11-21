<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta.jsp"></jsp:include>
    <title>我要参加</title>
		<style type="text/css">
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>img/bg_04.jpg); background-size: cover; width: 100%; height: 100%; position: relative;">
					<div style="text-align: center; position: absolute; top: 4rem; width: 100%;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/img_16.png" style="max-width: 100%;" />
						<div style="text-align: center; position: absolute; top: 7rem; width: 100%">
							<div style="text-align: center; position: relative;">
								<span class="tip_content_span" id="tip_content_div">
									很抱歉<br>您未获得神秘礼盒惊喜<br><br>别可惜<br>邀请好友助攻<br>赢迪士尼门票
								</span>
							</div>
						</div>
					</div>
					<div style="text-align: center; margin-top: 1rem;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/icon_logo.png" style="height: 2rem;" />
					</div>

					<div style="text-align: center; position: absolute; bottom: 2rem; width: 100%;">
						<img onclick="toshare()" src="<%=PropKit.get("front_res_prefix") %>img/img_14.png" style="height: 2rem;" />
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		
		<script type="application/javascript">
		
		$(document).ready(function(){
			
			$('#tip_content_div').width($(window).width() - 140);
		});
		
		function toshare() {
			
			window.location.href = '/<%=PropKit.get("project_name") %>/hd/tojoin';
		}
		</script>
	</body>

</html>