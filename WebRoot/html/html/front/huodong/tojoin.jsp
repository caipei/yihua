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
			.shuoming {
				display: inline-block;
				text-align: left;
				background: #fff;
				color: #000;
				font-size: 0.65rem;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: left;
				-moz-text-align-last: left;
				-webkit-text-align-last: left;
			}
			
			.close_span {
				padding: 0.1rem 0.8rem;
				border: 1px solid #898A8E;
				font-size: 0.65rem;
				color: #898A8E;
				border-radius: 2rem;
				display: inline-block;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>img/bg_04.jpg); background-size: cover; width: 100%; height: 100%; position: relative;">
					<div style="text-align: center; position: absolute; top: 3.5rem; width: 100%;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/img_16.png" style="max-width: 100%;" />
						
						<div style="text-align: center; position: absolute; top: 9rem; width: 100%">
							<div style="text-align: center;  width: 100%;">
								<span class="tip_content_span" id="tip_content_div">精彩继续，大奖拿到手软！</span>
							</div>
							<div style="text-align: center; margin-top: 0.2rem; position: relative;">
								<span style="display: inline-block; color: #fff; font-size: 0.6rem;">邀请好友，再赢迪士尼门票！</span>
							</div>
							
							<div id="shuoming" style="text-align: center; position: absolute; width: 100%; bottom: 1.3rem; display: none; z-index: 999; ">
								<div id="shuoming_div" style="display: inline-block; margin-top: 0.4rem; width: 10rem; border-radius: 5px; padding: 10px; background: #fff; text-align: center;">
									<span class="shuoming">即日起邀请好友注册成为通灵珠宝FANS，5.20前邀请注册人数排名前十位的用户，即可获得迪士尼成人门票1张 </span>
									<span onclick="close_shuoming()" class="close_span" style="margin-top: 0.5rem;">关闭</span>
								</div>
								<div style="text-align: center; position: absolute; bottom: -0.8rem; width: 100%;">
									<img style="height: 0.5rem;" src="<%=PropKit.get("front_res_prefix") %>img/img_26.png" />
								</div>
							</div>
							
							<div onclick="show_shuoming()" style="text-align: center; margin-top: 0.5rem; position: relative;">
								<span style="display: inline-block; color: #EDBC32; font-size: 0.5rem; text-decoration:underline;  font-weight: bold;">活动说明</span>
							</div>
						</div>
					</div>
					<div style="text-align: center; margin-top: 1rem; position: relative;"><img src="<%=PropKit.get("front_res_prefix") %>img/icon_logo.png" style="height: 2rem;" /></div>

					<div style="text-align: center; position: absolute; width: 100%; bottom: 3rem;">
						<img onclick="invitelist();" src="<%=PropKit.get("front_res_prefix") %>img/img_14.png" style="height: 2rem;" />
					</div>
					<div id="shuoming_bg" style="display:none; position: absolute; background: #000; top: 0; opacity:0.4; filter:alpha(opacity=40); width: 100%; height: 100%;"></div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		
		<script type="application/javascript">
		
		$(document).ready(function(){
			
			$('#shuoming_div').width($(window).width() - 140);
			$('#tip_content_div').width($(window).width() - 140);
			
		});
		function show_shuoming() {
			$('#shuoming').show();
			$('#shuoming_bg').show();
		}
		
		function close_shuoming() {
			$('#shuoming').hide();
			$('#shuoming_bg').hide();
		}
		
		function invitelist() {
			window.location.href = '/<%=PropKit.get("project_name") %>/hd/invitelist';
		}
		</script>
	</body>

</html>