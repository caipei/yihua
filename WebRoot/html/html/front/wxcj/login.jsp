<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_wxcj.jsp"></jsp:include>
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
		</style>
	</head>
	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_bg.jpg); text-align: center;">
					
					<div style="position: absolute; width: 100%; text-align: center; bottom: 0;">
						<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_img4.png" style="max-width: 100%; margin-bottom: -7px" />
					</div>
					
					<div style="width: 100%; height: 100%; position: absolute; text-align: center;">
						<div style="width: 100%;">
							<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/login_img1.png" style="max-width: 100%;" />
						</div>
						
						<div style="width: 100%;">
							<div style="display: flex; width: 100%; justify-content: center; align-items: center; align-content: center;">
								<span class="mobile_span" style="display: inline-block; margin-right: 1rem; color:#cda05e ;">手机号</span>
								<input maxlength="18" class="mobile_input" id="login_mobile" style="display: inline-block; border: 0; padding: 0 10px; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/login7.png) no-repeat; background-size: contain;" />
							</div>
							<br />
							<div style="display: flex; width: 100%; justify-content: center; align-items: center; align-content: center;">
								<span class="mobile_span" style="display: inline-block; margin-right: 1rem; color:#cda05e ;">验证码</span>
								<input maxlength="6" class="mobile_input" id="login_code" style="display: inline-block; border: 0; padding: 0 10px; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/login8.png) no-repeat; background-size: contain;" />
								<span class="mobile_span" id="login_getcode" onclick="login_getcode();" style="background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/login6.png) no-repeat; background-size: contain; text-align: center;">
									获取验证码
								</span>
							</div>
							
							<div style="display: flex; width: 100%; margin-top: 2rem; justify-content: center; align-items: center; align-content: space-between;">
								<img onclick="login_submit()" id="hssf" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/login_new_img1.png" style="max-width: 100%" />
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
		<input id="redirect" type="hidden" value="${redirect }">
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
				if (screenWidth > 640) {
					$('#login_mobile').css('width', 322);
					$('#login_mobile').css('height', 50);
					
					$('#login_code').css('width', 191);
					$('#login_code').css('height', 50);
					
					$('#login_getcode').css('width', 131);
					$('#login_getcode').css('height', 50);
					$('#login_getcode').css('line-height', 50 + 'px');
					
					$('#hssf').css('height', 46);
					$('#rzws').css('height', 46);
					
				} else {
					$('#login_mobile').css('width', screenWidth * 0.503);
					$('#login_mobile').css('height', screenWidth * 0.503 * 50 / 322);
					
					$('#login_code').css('width', screenWidth * 0.298);
					$('#login_code').css('height', screenWidth * 0.298 * 50 / 191);
					
					$('#login_getcode').css('width', screenWidth * 0.204);
					$('#login_getcode').css('height', screenWidth * 0.204 * 50 / 131);
					$('#login_getcode').css('line-height', (screenWidth * 0.204 * 50 / 131) + 'px');
					
					$('#hssf').css('height', screenWidth * 0.071);
					$('#rzws').css('height', screenWidth * 0.071);
				}
			});
			
			
		function login_getcode() {
				
				var $$ = $('#login_getcode');
				var mobile = $('#login_mobile').val();
				if ($.isEmptyObject(mobile)) {
					$.toast('请输入手机号码');
					return;
				}
				$.showIndicator();
				$.post("/<%=PropKit.get("project_name") %>/wxcj/judge_mobile", {mobile:mobile}, function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						$.post("/<%=PropKit.get("project_name") %>/hd/msgcode", {mobile:mobile}, function (returnJson){
							var rescode = returnJson.rescode;
							var rescnt = returnJson.rescnt;
							if (rescode == '0000') {
								login_settime($$);
							} else {
								$.alert(rescnt);
							}
							 $.hideIndicator();
						}, "json");
					} else {
						$.hideIndicator();
						$.modal({
						      title:  rescnt,
						      buttons: [
						        {
						          text: '注册',
						          onClick: function() {
						        	  window.location.href = 'http://wx.tesiro.com:8899/tesiroWeb/tongLing/register.jsp';
						          }
						        },
						        {
						          text: '取消'
						        }
						      ]
						    })
					}
				}, "json");
			}
			// 登录相关
			var login_t;
			var login_countdown=120; 
			function login_settime(obj) { 
				if (login_countdown == 0) { 
					clearTimeout(login_t);
					$(obj).removeAttr('disabled');
					$(obj).html('获取验证码');
					login_countdown = 120;
				} else { 
					$(obj).attr('disabled',"true");
					$(obj).html(login_countdown + "s");
					login_countdown--; 
					login_t = setTimeout(function() { login_settime(obj) },1000) 
				} 
			}
			
			function login_submit() {
				var mobile = $('#login_mobile').val();
				var code = $('#login_code').val();
				var params = {};
				params.mobile = mobile;
				params.code = code;
				$.post("/<%=PropKit.get("project_name") %>/wxcj/login_submit", params, function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/stage_redirect';
					} else {
						$.alert(rescnt);
					}
				}, "json");
			}
			
		</script>
	</body>

</html>