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
				background: linear-gradient(to bottom, #000009, #18214d);
				margin: 0 auto;
			}
			
			.input_div {
				border-bottom: 1px solid #fff;
				padding: 0.5rem 0;
				display: flex;
				align-items: center;
			}
			
			.input_div img {
				width: 1.2rem;
				margin-left: 0.2rem;
			}
			
			.input_div input {
				flex: 1;
				background: transparent;
				border: 0;
				font-size: 0.7rem;
				margin-left: 0.4rem;
				color: #fff;
			}
			
			.input_div input::-webkit-input-placeholder {
				color: #fff;
			}
			
			.input_div input:-moz-placeholder {
				color: #fff;
			}
			
			.input_div input:-ms-input-placeholder {
				color: #fff;
			}
			
			.input_div span {
				width: 4rem;
				height: 1.5rem;
				line-height: 1.5rem;
				text-align: center;
				color: #fff;
				font-size: 0.7rem;
				background: #1F2C6C;
				border-radius: 4px;
			}
			
			.login_btn {
				width: 100%;
				height: 2rem;
				line-height: 2rem;
				text-align: center;
				background: #fff;
				border-radius: 4px;
				margin-top: 2rem;
				color: #000021;
				font-size: 0.8rem;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav" style="background: #1B1A20; border-bottom-color: transparent;">
					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #fff"></a>
					<h1 class="title" style="color: #fff">登录</h1>
				</header>
				<div class="content">
					<div class="absolute_img_div">
						<img src="<%=PropKit.get("front_prefix") %>mine/res/img/login_new_img1.png" />
					</div>

					<div style="padding: 0 1.5rem; z-index: 10000;">
						<div class="input_div">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/login_new_img3.png" />
							<input id="login_mobile" placeholder="请输入手机号码"/>
							<span onclick="login_getcode()" id="login_getcode">
								验证码
							</span>
						</div>
						<div class="input_div">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/login_new_img4.png" />
							<input id="login_code" placeholder="请输入验证码"/>
						</div>
						
						<div onclick="login_submit()" class="login_btn">登录</div>
					</div>

					<div id="bottom_div" style="bottom: 2.2rem;">
						<img id="bottom_img" style="max-width: 100%; max-height: 100%;" src="<%=PropKit.get("front_prefix") %>mine/res/img/login_new_img2.png" />
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
				$('#bottom_div').width(640);
				$('#bottom_div').height(317);
			} else {
				$('.content').width(screenWidth);
				$('#bottom_div').width(640 * proportion);
				$('#bottom_div').height(317 * proportion);
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