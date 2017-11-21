<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta.jsp"></jsp:include>
    <title>神秘礼盒 为您而来</title>
		<style type="text/css">
			.shuoming_span {
				display: block;
				text-align: left;
				width: 100%;;
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
			
			.chankan_span1 {
				display: block;
				text-align: left;
				width: 100%;
				color: #061046;
				font-size: 0.85rem;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: left;
				-moz-text-align-last: left;
				-webkit-text-align-last: left;
			}
			
			.chankan_span1 {
				display: block;
				text-align: left;
				width: 100%;
				color: #061046;
				font-size: 0.8rem;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: left;
				-moz-text-align-last: left;
				-webkit-text-align-last: left;
				font-weight: bold;
				line-height: 1.2rem;
			}
			
			.chankan_span2 {
				display: block;
				text-align: left;
				width: 100%;
				color: #061046;
				font-size: 0.55rem;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: left;
				-moz-text-align-last: left;
				-webkit-text-align-last: left;
				text-decoration:underline;
			}
			
			.chankan_span3 {
				display: block;
				text-align: left;
				width: 100%;
				padding: 0 0.3rem;
				color: #061046;
				font-size: 0.8rem;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: left;
				-moz-text-align-last: left;
				-webkit-text-align-last: left;
				font-weight: bold;
				line-height: 1.2rem;
			}
			
			.chankan_span4 {
				display: block;
				text-align: left;
				width: 100%;
				padding: 0 0.3rem;
				color: #061046;
				font-size: 0.55rem;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: left;
				-moz-text-align-last: left;
				-webkit-text-align-last: left;
			}
			
			.login_input {
				border: 2px solid #40B7F2;
				background: transparent;
				border-radius: 4px;
				width: 100%;
				height: 1.8rem;
				color: #fff;
				padding: 0 5px;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
			<img src="<%=PropKit.get("project_url") %>/html/front/res/img/img_24.png" style="max-width: 100%; display:none" />
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>img/bg_01.jpg); background-size: cover; width: 100%; height: 100%; position: relative;">
					<div style="text-align: center; margin-top: 1rem;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/icon_logo.png" style="height: 2rem;" />
					</div>
					<div style="display: flex; margin-top: 11.5rem;">
						<div onclick="show_shuoming();" style="margin-left: 0.5rem; flex: 1; display: inline-block;">
							<img src="<%=PropKit.get("front_res_prefix") %>img/img_06.png" style="height: 0.8rem; vertical-align: middle; margin-top: -1px;" />
							<label style="color: #FFE082;text-decoration:underline; font-size: 0.7rem;">Leysen 1855</label>
						</div>
						<div onclick="show_chakan();" style="margin-right: 0.5rem; flex: 1; display: inline-block; text-align: right;">
							<label style="color: #FFE082;text-decoration:underline; font-size: 0.7rem;">查看有好礼</label>
							<img src="<%=PropKit.get("front_res_prefix") %>img/img_07.png" style="height: 0.8rem; vertical-align: middle; margin-top: -1px;" />
						</div>
					</div>
					
					<div style="text-align: center; padding: 0 0.5rem; margin-top: 0.5rem;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/img_12.png" style="max-width: 100%;" />
					</div>
					
					<div style="text-align: center; margin-top: 0.3rem;">
						<img onclick="wyklh();" src="<%=PropKit.get("front_res_prefix") %>img/img_05.png" style="height: 2rem;" />
					</div>
					
					<div id="shuoming" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; display:none">
						<div style="position: absolute; background: #000; opacity:0.4; filter:alpha(opacity=40); width: 100%; height: 100%;"></div>
						<div style="position: absolute; opacity:0.9; filter:alpha(opacity=90); width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
							<div id="shuoming_div" style="background: #fff; border-radius: 0.2rem; padding: 0.5rem; text-align: center;">
								<img src="<%=PropKit.get("front_res_prefix") %>img/img_08.jpg" style="width: 100%;" />
								<span class="shuoming_span">
									成立于1855年的比利时，其精湛工艺成为比利时王室的钟爱，比利时三代王后均佩戴其制作的“比利时九省王冠”。2017年4月正式归于通灵珠宝旗下，通灵珠宝品牌也全面升级为Leysen1855莱绅通灵。
								</span>
								<span onclick="close_shuoming()" class="close_span" style="margin-top: 0.5rem;">关闭</span>
							</div>
						</div>
					</div>
					
					<div id="chakan" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; display:none;">
						<div style="position: absolute; background: #000; opacity:0.4; filter:alpha(opacity=40); width: 100%; height: 100%;"></div>
						<div style="position: absolute; opacity:0.9; filter:alpha(opacity=90); width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
							<div id="chakan_div" style="background: #fff; border-radius: 0.2rem; padding: 0.7rem; text-align: center;">
								<div id="chakan_content_div" style="overflow: hidden; overflow-y: auto;">
									<span class="chankan_span1" style="display: block;">
										点击“我要开礼盒”，抽取属于你的神秘好礼吧
									</span>
									<span class="chankan_span2" style="margin-top: 0.3rem;">
										王室丽人&nbsp;非你莫属钻石吊坠&nbsp; 1件
									</span>
									<span class="chankan_span2">
										王室收藏&nbsp;定制珠宝箱&nbsp;&nbsp;50件
									</span>
									<span class="chankan_span2">
										王室颜值&nbsp;定制化妆镜&nbsp;&nbsp;1000件
									</span>
									<span class="chankan_span2">
										王室特权&nbsp;现金抵用券&nbsp;&nbsp;若干
									</span>
									<img src="<%=PropKit.get("front_res_prefix") %>img/img_20.png" style="max-height: 8rem; margin-top: 0.5rem;" />
									<span class="chankan_span3" style="margin-top: 0.5rem;">
										没有抽中怎么办？别急！
									</span>
									<span class="chankan_span4">
										我们还为您准备了迪士尼门票，圆你公主王子梦！快来邀请好友注册成为通灵珠宝FANS吧！
									</span>
									<span class="chankan_span3" style="margin-top: 0.5rem;">
										备注
									</span>
									<span class="chankan_span4">
										任何疑问，详询4008289736
									</span>
									<span class="chankan_span4">
										通灵珠宝为您耐心解答
									</span>
								</div>
								<span onclick="close_chakan();" class="close_span" style="margin-top: 0.5rem;">关闭</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="login_page" class="page">
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>img/bg_01.jpg); background-size: cover; width: 100%; height: 100%; position: relative;">
					<div style="text-align: center; margin-top: 1rem;"><img src="<%=PropKit.get("front_res_prefix") %>img/icon_logo.png" style="height: 2rem;" /></div>
					<div style="margin-top: 13rem; padding: 0 1.5rem 0 0.2rem; display: flex; align-items: center;">
						<label style="color: #fff; width: 4rem; text-align: right;">手机号</label>
						<span style="display: inline-block; flex: 1;margin-left: 0.6rem;">
						<input id="login_mobile" type="tel" class="login_input" />
						</span>
					</div>
					<div style="margin-top: 0.8rem;  padding: 0 1.5rem 0 0.2rem;  display: flex; align-items: center;">
						<label style="color: #fff; width: 4rem; text-align: right; ">验证码</label>
						<span style="display: inline-block; flex: 1;margin-left: 0.6rem;">
						<input id="login_code" type="number" class="login_input" />
						</span>
						<span id="login_getcode" onclick="login_getcode();" style="width: 4.8rem;  margin-left: 0.4rem; height: 1.8rem; background: #162449; color: #fff; font-size: 0.65rem; text-align: center; line-height: 1.8rem;">获取验证码</span>
					</div>
					<div style="margin-top: 1rem; padding-left: 4.8rem;">
						<img onclick="login_submit()" src="<%=PropKit.get("front_res_prefix") %>img/img_13.png" style="height: 1.6rem;" />
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
		<script type="application/javascript">
	
			$(document).ready(function(){
				
				$('#shuoming_div').width($(window).width() - 60);
				
				$('#chakan_div').width($(window).width() - 60);
				
				$('#chakan_content_div').height($(window).height() - 150);
				
				
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
						    jsApiList: ['onMenuShareTimeline',
						                'onMenuShareAppMessage',
						                'onMenuShareQQ',
						                'onMenuShareWeibo',
						                'onMenuShareQZone',
						                'startRecord',
						                'stopRecord',
						                'onVoiceRecordEnd',
						                'playVoice',
						                'pauseVoice',
						                'stopVoice',
						                'onVoicePlayEnd',
						                'uploadVoice',
						                'downloadVoice',
						                'chooseImage',
						                'previewImage',
						                'uploadImage',
						                'downloadImage',
						                'translateVoice',
						                'getNetworkType',
						                'openLocation',
						                'getLocation',
						                'hideOptionMenu',
						                'showOptionMenu',
						                'hideMenuItems',
						                'showMenuItems',
						                'hideAllNonBaseMenuItem',
						                'showAllNonBaseMenuItem',
						                'closeWindow',
						                'scanQRCode',
						                'chooseWXPay',
						                'openProductSpecificView',
						                'addCard',
						                'chooseCard',
						                'openCard'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
						});
						
						wx.ready(function(){
							wx.hideAllNonBaseMenuItem();
							wx.showMenuItems({
							    menuList: ['menuItem:share:appMessage',
							               'menuItem:share:timeline',
							               'menuItem:share:qq',
							               'menuItem:share:weiboApp',
							               'menuItem:favorite'] // 要显示的菜单项，所有menu项见附录3
							});
							wx.onMenuShareAppMessage({
							    title: '神秘礼盒 为您而来', // 分享标题
							    desc: '比利时王室品牌Leysen1855进入中国', // 分享描述
							    link: url, // 分享链接
							    imgUrl: '<%=PropKit.get("project_url") %>html/front/res/img/logo.png', // 分享图标
							    type: 'link', // 分享类型,music、video或link，不填默认为link
							    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
							    success: function () {
							        // 用户确认分享后执行的回调函数
							    },
							    cancel: function () {
							        // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareTimeline({
								title: '神秘礼盒 为您而来',  // 分享标题
							    link: url, // 分享链接
							    imgUrl: '<%=PropKit.get("project_url") %>html/front/res/img/logo.png', // 分享图标
							    success: function () { 
							        // 用户确认分享后执行的回调函数
							    },
							    cancel: function () { 
							        // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareQQ({
								title: '神秘礼盒 为您而来', // 分享标题
							    desc: '比利时王室品牌Leysen1855进入中国', // 分享描述
							    link: url, // 分享链接
							    imgUrl: '<%=PropKit.get("project_url") %>html/front/res/img/logo.png', // 分享图标
							    success: function () { 
							       // 用户确认分享后执行的回调函数
							    },
							    cancel: function () { 
							       // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareWeibo({
								title: '神秘礼盒 为您而来', // 分享标题
							    desc: '比利时王室品牌Leysen1855进入中国', // 分享描述
							    link: url, // 分享链接
							    imgUrl: '<%=PropKit.get("project_url") %>html/front/res/img/logo.png', // 分享图标
							    success: function () { 
							       // 用户确认分享后执行的回调函数
							    },
							    cancel: function () { 
							       // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareQZone({
								title: '神秘礼盒 为您而来', // 分享标题
							    desc: '比利时王室品牌Leysen1855进入中国', // 分享描述
							    link: url, // 分享链接
							    imgUrl: '<%=PropKit.get("project_url") %>html/front/res/img/logo.png', // 分享图标
							    success: function () { 
							       // 用户确认分享后执行的回调函数
							    },
							    cancel: function () { 
							       // 用户取消分享后执行的回调函数
							    }
							});
						});
					}
				}, "json");
			});
			
			function show_shuoming() {
				
				$('#shuoming').show();
				
			}
			
			function close_shuoming() {
				
				$('#shuoming').hide();
			}
			
			function show_chakan() {
				
				$('#chakan').show();
				
			}
			
			function close_chakan() {
				
				$('#chakan').hide();
			}
			
			function wyklh() {
				
				$.post('/<%=PropKit.get("project_name") %>/hd/judge_logged', function (returnJson){
	    			var rescode = returnJson.rescode;
	    			var rescnt = returnJson.rescnt;
	    			if (rescode == '0000') {
	    				window.location.href = '/<%=PropKit.get("project_name") %>/hd/join2prize';
	    			} else {
	    				$.router.load("#login_page");
	    			}
	    		}, "json");
			}
			
			function login_getcode() {
				
				var $$ = $('#login_getcode');
				var mobile = $('#login_mobile').val();
				if ($.isEmptyObject(mobile)) {
					$.toast('请输入手机号码');
					return;
				}
				$.showIndicator();
				$.post("/<%=PropKit.get("project_name") %>/hd/judge_hd_mobile", {mobile:mobile}, function (returnJson){
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
						$.alert(rescnt);
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
					$(obj).html("重新发送(" + login_countdown + ")");
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
				$.post("/<%=PropKit.get("project_name") %>/hd/login_submit", params, function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						window.location.href = '/<%=PropKit.get("project_name") %>/hd/join2prize';
					} else {
						$.alert(rescnt);
					}
				}, "json");
			}
		
		</script>
	</body>

</html>