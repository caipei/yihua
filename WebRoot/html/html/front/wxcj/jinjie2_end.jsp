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
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img9.png) no-repeat;
				background-size: contain;
				margin: 0 auto;
				position: relative;
			}
			
			@media ( min-width: 641px) {
				.tk_span {
					font-size: 0.8em;
				}
			}
			@media ( max-width: 640px) and (min-width: 481px) {
				.tk_span {
					font-size: 0.8em;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.tk_span {
					font-size: 0.7rem;
				}
			}
			
			@media (max-width: 320px) {
				.tk_span {
					font-size: 0.6em;
				}
			}
		</style>
	</head>
	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%; background: #00052F;">
					<div style="position: absolute; width: 100%; height: 100%; text-align: center;">
						<div style="width: 100%; text-align: center; position: absolute;">
							<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img1.jpg" style="max-width: 100%;" />
						</div>
						<div style="width: 100%; text-align: center; position: absolute;">
							<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img2.png" style="max-width: 100%;" />
						</div>
						<div style="width: 100%; text-align: center; position: absolute; bottom: 0;">
							<div class="jinjie_dl">
								<div style="width: 100%; display: flex; align-content: center; align-items: baseline; position: absolute; bottom: 1rem; z-index: 999; text-align: center">
									<span style="display: inline-block; flex: 1; text-align: right; padding-right: 1rem;">
										<img onclick="jxjj()" class="jinjie_dl_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img6.png" />
									</span>
									<span style="display: inline-block; flex: 1; text-align: left; padding-left: 1rem;">
										<img onclick="dhjp()" class="jinjie_dl_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img7.png" />
									</span>
								</div>
							</div>
						</div>
					</div>
					
					<div id="dhjp_tishi" style="display:none; position:absolute; width: 100%; height: 100%">
						<div id="cover" style="position: absolute; top: 0; background: #000; width: 100%; height: 100%;opacity:0.8; filter:alpha(opacity=80);"></div>
						<div style="position: absolute; width: 100%; height: 100%; text-align: center; display: flex; flex-direction: column; justify-content: center; align-items: center;">
							<div id="tk_div" style="background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie2_img2.png) no-repeat; background-size: contain; display: flex; flex-direction: column; justify-content: center; align-items: center;">
								<span class="tk_span">已有92%的王室成员选择继续进阶<br>您确认兑换礼品吗？</span>
								<div style="text-align: center; margin-top: 2rem;">
									<img onclick="jxjj();" id="jxjj_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie2_img3.png" style="margin-right: 0.4rem;" />
									<img onclick="qrdh();" id="qrdh_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie2_img4.png" style="margin-left: 0.4rem;" />
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

				if(screenWidth > 640) {
					$('#tk_div').css('width', 424);
					$('#tk_div').css('height', 442);
					
					$('#jxjj_img').css('width', 131);
					$('#qrdh_img').css('width', 131);
					
					$('.jinjie_dl').css('width', 640);
					$('.jinjie_dl').css('height', 696);
					
					$('.jinjie_dl_img').css('width', 170);
					$('.jinjie_dl_img').css('height', 46);
				} else {
					$('#tk_div').css('width', 424 * proportion);
					$('#tk_div').css('height', 442 * proportion);
					
					$('#jxjj_img').css('width', 131 * proportion);
					$('#qrdh_img').css('width', 131 * proportion);
					
					$('.jinjie_dl').css('width', 640 * proportion);
					$('.jinjie_dl').css('height', 696 * proportion);
					
					$('.jinjie_dl_img').css('width', 170 * proportion);
					$('.jinjie_dl_img').css('height', 46 * proportion);
				}
			});
			
			function jxjj() {
				
				$.post("/<%=PropKit.get("project_name") %>/wxcj/stage_json", function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						
						var type1state = rescnt.type1;
						var type2state = rescnt.type2;
						var type3state = rescnt.type3;
						
						if (type3state == 3) {
							// 跳转结束
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
						} else if (type2state == 3) {
							// 跳转结束
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
						} else if (type1state == 3) {
							// 跳转结束
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
						} else if (type2state == 2) {
							// 跳转结束
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jinjie2_lpmm';
						} else {
							$.post('/<%=PropKit.get("project_name") %>/wxcj/tojj3_json', function (returnJson){
				    			var rescode = returnJson.rescode;
				    			var rescnt = returnJson.rescnt;
				    			if (rescode == '0000') {
				    				window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jinjie3';
				    			}
				    		}, "json");
						}
						
					} else {
						$.post('/<%=PropKit.get("project_name") %>/wxcj/tojj3_json', function (returnJson){
			    			var rescode = returnJson.rescode;
			    			var rescnt = returnJson.rescnt;
			    			if (rescode == '0000') {
			    				window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jinjie3';
			    			}
			    		}, "json");
					}
				}, "json");
				
				
			}
			
			function dhjp() {
				
				$.post("/<%=PropKit.get("project_name") %>/wxcj/stage_json", function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						
						var type1state = rescnt.type1;
						var type2state = rescnt.type2;
						var type3state = rescnt.type3;
						
						if (type3state == 3) {
							// 跳转结束
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
						} else if (type2state == 3) {
							// 跳转结束
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
						} else if (type1state == 3) {
							// 跳转结束
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
						} else if (type2state == 2) {
							// 礼品密码
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jinjie2_lpmm';
						} else {
							// 跳转二阶段完成界面
							$('#dhjp_tishi').show();
						}
						
					} else {
						// 判断进阶1的状态
						$('#dhjp_tishi').show();
					}
				}, "json");
			}
			
			function qrdh() {
				
				window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jinjie2_lpxq';
			}
		</script>
	</body>

</html>