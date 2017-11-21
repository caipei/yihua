<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>登录</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_bg1.png) no-repeat;
				background-size: cover;
				margin: 0 auto;
			}
			
			.login_div1 {
				text-align: center;
				color: #10256F;
				margin-top: 1rem;
			}
			
			.login_input {
				width: 100%;
			}
			
			.login_input input {
				width: 100%;
				height: 1.8rem;
				padding: 0 5px;
				color: #2A6291;
				border: 1px solid #2A6291;
			}
			
			.code_btn {
				color: #2A6291;
				height: 1.75rem;
				background: #fff;
				line-height: 1.70rem;
				width: 3rem;
				text-align: center;
				border: 1px solid #2A6291;
			}
			
			.code_remark_div {
				text-align: center;
			}
			
			.login_btn {
				margin-top: 2rem;
				height: 2rem;
				text-align: center;
				color: #fff;
				background: #16307C;
				line-height: 2rem;
			}
			
			@media (min-width: 481px) {
				.login_div1 label {
					font-size: 0.8rem;
				}
				.login_inputs {
					padding: 2.4rem;
				}
				.login_input input, .code_btn {
					font-size: 0.8rem;
				}
				.code_remark_div {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.login_div1 label {
					font-size: 0.75rem;
				}
				.login_inputs {
					padding: 2.2rem;
				}
				.login_input input, .code_btn {
					font-size: 0.75rem;
				}
				.code_remark_div {
					font-size: 0.65rem;
				}
			}
			
			@media (max-width: 320px) {
				.login_div1 label {
					font-size: 0.7rem;
				}
				.login_inputs {
					padding: 2rem;
				}
				.login_input input, .code_btn, .login_btn {
					font-size: 0.7rem;
				}
				
				.code_remark_div {
					font-size: 0.6rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">登录</h1>
				</header>
				<div class="content">
					<div class="absolute_img_div" style="margin-top: 2rem;">
						<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_logo1.png" />
					</div>
					<div class="login_div1" style="display:none">
						<span style="border-bottom: 1px solid #244996;">
							<label>如果您还未注册，</label>
							<label onclick="toregister();" style="color: #fff;">请点击加入我们</label>
						</span>
					</div>

					<div class="login_inputs" style="margin-top: 0.5rem;">
						<div class="login_input">
							<input id="login_mobile" placeholder="手机号码" />
						</div>
						<div class="login_input" style="margin-top: 1rem; display: flex;">
							<input id="login_code" style="flex: 1; margin-right: 1rem;" placeholder="验证码" />
							<span onclick="login_getcode()" id="login_getcode" class="code_btn">获取</span>
						</div>
						<div class="code_remark_div" style="margin-top: 0.5rem;">
							(90秒后可重新获取，验证码90秒内有效)
						</div>
						
						<div onclick="login_submit()" class="login_btn" >
							登录
						</div>
					</div>
				</div>
			</div>
			
			<div id="register_page" class="page" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="$.router.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">注册</h1>
				</header>
				<div class="content">
					<div class="absolute_img_div" style="margin-top: 2rem;">
						<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_logo1.png" />
					</div>
					<div class="login_div1">
						<span style="border-bottom: 1px solid #244996;">
							<label>如果您已经注册了会员，</label>
							<label onclick="tologin();" style="color: #fff;">请立即登录</label>
						</span>
					</div>

					<div class="login_inputs" style="margin-top: 0.5rem;">
						<div class="login_input" style="margin-top: 1rem;">
							<input id="register_nickname" placeholder="姓名" />
						</div>
						<div class="login_input">
							<input id="register_mobile" placeholder="手机号码" />
						</div>
						<div class="login_input" style="margin-top: 1rem; display: flex;">
							<span style="flex: 1; display: inline-flex; align-items: center; margin-right: 0.5rem;">
								<input style="width: 100%;" placeholder="所在省" />
								<img style="margin-left: -1rem;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down.png" />
							</span>
							<span style="flex: 1; display: inline-flex; align-items: center; margin-left: 0.5rem; text-align: right;">
								<input style="width: 100%;" placeholder="所在市" />
								<img style="margin-left: -1rem;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down.png" />
							</span>
						</div>
						<div class="login_input" style="margin-top: 1rem; display: flex;">
							<input style="flex: 1; margin-right: 0.5rem;" placeholder="验证码" />
							<span onclick="register_getcode()" id="register_getcode" class="code_btn">获取</span>
						</div>
						
						<div onclick="register()" class="login_btn" >
							注册
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer_mine.jsp"></jsp:include>
		
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
		
		function toregister() {
			$.router.load('#register_page'); 
		}
		
		function tologin() {
			$.router.back();
		}
		
		function login_getcode() {
			
			var $$ = $('#login_getcode');
			var mobile = $('#login_mobile').val();
			if ($.isEmptyObject(mobile)) {
				$.toast('请输入手机号码');
				return;
			}
			$.showIndicator();
			$.post("/<%=PropKit.get("project_name") %>/mine/judge_mine_mobile", {mobile:mobile}, function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					$.post("/<%=PropKit.get("project_name") %>/mine/msgcode", {mobile:mobile}, function (returnJson){
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
					$.alert(rescnt);
				}
			}, "json");
		}
		
		// 登录相关
		var login_t;
		var login_countdown=90; 
		function login_settime(obj) { 
			if (login_countdown == 0) { 
				clearTimeout(login_t);
				$(obj).removeAttr('disabled');
				$(obj).html('获取');
				login_countdown = 90;
			} else { 
				$(obj).attr('disabled',"true");
				$(obj).html(login_countdown);
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
			$.post("/<%=PropKit.get("project_name") %>/mine/login_submit", params, function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					window.location.href = '/<%=PropKit.get("project_name") %>/mine/homepage';
				} else {
					$.alert(rescnt);
				}
			}, "json");
		}
			
		</script>
	</body>

</html>