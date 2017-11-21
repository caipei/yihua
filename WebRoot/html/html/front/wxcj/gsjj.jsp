<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_wxcj.jsp"></jsp:include>
  	<link rel="stylesheet" href="<%=PropKit.get("front_res_prefix") %>wxcj/css/style.css">
    <title>荣耀升级  壕礼来袭</title>
		<style type="text/css">
			.mobile_input {
				color: #cda05e;
			}
			@media ( max-width: 640px) and (min-width: 481px) {
				.mobile_span, .mobile_input {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.mobile_span, .mobile_input {
					font-size: 0.65rem;
				}
			}
			
			@media (max-width: 320px) {
				.mobile_span, .mobile_input {
					font-size: 0.6rem;
				}
			}
			
			.gsjj_top {
				position: relative;
				width: 100%;
				margin: 0 auto;
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_img1.png) no-repeat;
				background-size: contain;
			}
			
			.gsjj_middle {
				position: relative;
				width: 100%;
				margin: 0 auto;
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_img2.png) no-repeat;
				background-size: contain;
			}
			
			.gsjj_bottom {
				position: relative;
				width: 100%;
				margin: 0 auto;
			}
		</style>
	</head>
	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_bg.jpg);">

					<div style="position: absolute; width: 100%; text-align: center; bottom: 0;">
						<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_img4.png" style="max-width: 100%;" />
					</div>

					<div class="gsjj_top">

					</div>
					<div class="gsjj_middle">
						
						<img id="pinpai_img" style="max-width: 100%;" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_ppimg1.png" />
					
					</div>
					<div id="gsjj_bottom1" class="gsjj_bottom" style="background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_bottom_img1.png) no-repeat;background-size: contain;">
						<div style="width: 100%; display: flex; height: 100%">
							<img onclick="next1();" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/touming.png" style="display: inline-block; flex: 1; height: 80%">
						</div>
					</div>
					<div id="gsjj_bottom2" class="gsjj_bottom" style="display:none; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_bottom_img2.png) no-repeat;background-size: contain;">
						<div style="width: 100%; display: flex;  height: 100%">
							<img onclick="pre1();" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/touming.png" style="display: inline-block; flex: 1; height: 80%">
							<img onclick="next2();" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/touming.png" style="display: inline-block; flex: 1; height: 80%">
						</div>
						
					</div>
					<div id="gsjj_bottom3" class="gsjj_bottom" style="display:none; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_bottom_img3.png) no-repeat;background-size: contain;">
						<div style="width: 100%; display: flex;  height: 100%">
							<img onclick="pre2();" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/touming.png" style="display: inline-block; flex: 0.7; height: 80%">
							<img onclick="tgmm();" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/touming.png" style="display: inline-block; flex: 1; height: 80%">
						</div>
					</div>

				</div>
			</div>
		</div>
		<jsp:include page="../footer_wxcj.jsp"></jsp:include>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
		<script type="application/javascript">
			$(document).ready(function(){
				
				var url = window.location.href;
				$.post("/<%=PropKit.get("project_name") %>/wx/getWxConfig", {url:url}, function (returnJson){
					var rescode = returnJson.rescode;
					if (rescode == '0000') {
						var rescnt = returnJson.rescnt;
						wx.config({
						    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
						    appId: rescnt.appId, // 必填，公众号的唯一标识
						    timestamp: rescnt.timestamp, // 必填，生成签名的时间戳
						    nonceStr: rescnt.nonceStr, // 必填，生成签名的随机串
						    signature: rescnt.signature,// 必填，签名，见附录1
						    jsApiList: jsApiList // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
						});
						wx.ready(function(){
							wx.hideAllNonBaseMenuItem();
						});
					}
				}, "json");
				
				var screenWidth = window.screen.width;
				var proportion = screenWidth / 640;
				if (screenWidth > 640) {
					
					$('.gsjj_top').css('width', 640);
					$('.gsjj_top').css('height', 297);

					$('.gsjj_middle').css('width', 640);
					$('.gsjj_middle').css('height', 594);

					$('.gsjj_bottom').css('width', 640);
					$('.gsjj_bottom').css('height', 69);
					
					$('#gsjj_more').css('width', 30);
					
					$('#gsjj_img').css('width', 590);
					$('#gsjj_img').css('height', 538);
					
				} else {
					
					$('.gsjj_top').css('width', 640 * proportion);
					$('.gsjj_top').css('height', 297 * proportion);

					$('.gsjj_middle').css('width', 640 * proportion);
					$('.gsjj_middle').css('height', 594 * proportion);

					$('.gsjj_bottom').css('width', 640 * proportion);
					$('.gsjj_bottom').css('height', 69 * proportion);
					
					$('#gsjj_more').css('width', 30 * proportion);
					
					$('#gsjj_img').css('width', 590 * proportion);
					$('#gsjj_img').css('height', 538 * proportion);
				}
			});
			
			function next1() {
				$('#pinpai_img').attr('src', '<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_ppimg3.png');
				$('#gsjj_bottom1').hide();
				$('#gsjj_bottom2').show();
				$('#gsjj_bottom3').hide();
			}
			
			function next2() {
				$('#pinpai_img').attr('src', '<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_ppimg2.png');
				$('#gsjj_bottom1').hide();
				$('#gsjj_bottom2').hide();
				$('#gsjj_bottom3').show();
			}
			
			function tgmm() {
				window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/dt';
			}
			
			function pre1() {
				$('#pinpai_img').attr('src', '<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_ppimg1.png');
				$('#gsjj_bottom1').show();
				$('#gsjj_bottom2').hide();
				$('#gsjj_bottom3').hide();
			}
			
			function pre2() {
				$('#pinpai_img').attr('src', '<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_new_ppimg3.png');
				$('#gsjj_bottom1').hide();
				$('#gsjj_bottom2').show();
				$('#gsjj_bottom3').hide();
			}
		</script>
	</body>

</html>