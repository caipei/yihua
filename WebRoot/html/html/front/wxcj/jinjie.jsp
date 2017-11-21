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
			.jinjie_dl {
				width: 100%; 
				text-align: center; 
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img3.png) no-repeat;
				background-size: contain;
				margin: 0 auto;
				position: relative;
			}
		</style>
	</head>
	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; text-align: center; width: 100%; height: 100%; background: #000530;">
					
					<div style="position: absolute; width: 100%; height: 100%; text-align: center;">
						<div style="width: 100%; text-align: center; position: absolute;">
							<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img1.jpg" style="max-width: 100%;" />
						</div>
						<div style="width: 100%; text-align: center; position: absolute;">
							<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img2.png" style="max-width: 100%;" />
						</div>
						<div style="width: 100%; text-align: center; position: absolute; bottom: 0;">
							<div class="jinjie_dl">
								<div style="width: 100%; text-align: center; position: absolute; bottom: 0;">
									<img onclick="gsjj()" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img4.png" style="max-width: 100%;" />
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer_wxcj.jsp"></jsp:include>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
		<script type="application/javascript">
			$(document).ready(function(){
				
				var screenWidth = window.screen.width;
				var proportion = screenWidth / 640;

				if(screenWidth > 640) {
					$('.jinjie_dl').css('width', 640);
					$('.jinjie_dl').css('height', 696);
					
				} else {
					$('.jinjie_dl').css('width', 640 * proportion);
					$('.jinjie_dl').css('height', 696 * proportion);
				}
				
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
			});
			
			function gsjj() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/gsjj';
			}
		</script>
	</body>

</html>