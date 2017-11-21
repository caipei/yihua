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
						<div style="text-align: center; position: absolute; top: 7rem; width: 100%">
							<div style="text-align: center;">
								<span class="tip_content_span" id="tip_content_div">神秘礼物&nbsp;为您开启<br>恭喜获得</span>
							</div>
							<span style="font-size: 0.65rem; display: block; color: #fff; margin-top: 0.5rem; line-height: 0.9rem;">
								${prizeremark}
							</span>
							<div id="shuoming" style="text-align: center; position: absolute; width: 100%; bottom: 1.3rem; display: none; z-index: 999; ">
								<div id="shuoming_div" style="display: inline-block; margin-top: 0.4rem; width: 10rem; border-radius: 5px; padding: 10px; background: #fff; text-align: center;">
									<span class="shuoming">查看特权券<label style="color: #D5A65E">请登陆官方微信-微俱乐部-个人中心-我的券包</label> </span>
									<span onclick="close_shuoming()" class="close_span" style="margin-top: 0.5rem;">关闭</span>
								</div>
								<div style="text-align: center; position: absolute; bottom: -0.8rem; width: 100%;">
									<img style="height: 0.5rem;" src="<%=PropKit.get("front_res_prefix") %>img/img_26.png" />
								</div>
							</div>
							<div style="text-align: center; width: 100%;">
								<span onclick="show_shuoming()" style="display: inline-block; color: #EDBC32; font-size: 0.5rem; text-decoration:underline; font-weight: bold;">活动说明</span>
							</div>
						</div>
					</div>
					<div style="text-align: center; margin-top: 1rem;"><img src="<%=PropKit.get("front_res_prefix") %>img/icon_logo.png" style="height: 2rem;" /></div>

					<div style="text-align: center; position: absolute; bottom: 0.5rem; width: 100%;">
						<span onclick="qrlq();" style="background: url(<%=PropKit.get("front_res_prefix") %>img/img_11.png); background-size: cover; display: inline-block; width: 6rem; height: 2rem; line-height: 2.2rem; font-size: 0.75rem; color: #fff;">确认领取</span>
					</div>
					
					<div id="shuoming_bg" style="display:none; position: absolute; background: #000; top: 0; opacity:0.4; filter:alpha(opacity=40); width: 100%; height: 100%;"></div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		
		<script type="application/javascript">
		
			$(document).ready(function(){
			
			$('#shuoming_div').width($(window).width() - 120);
			
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
		
		function qrlq() {
			
			window.location.href = '/<%=PropKit.get("project_name") %>/hd/tojoin';
		}
		</script>
	</body>

</html>