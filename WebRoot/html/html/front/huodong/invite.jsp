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
		</style>
	</head>

	<body>
		<img src="<%=PropKit.get("project_url") %>/html/front/res/img/img_24.png" style="max-width: 100%; display:none" />
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style="background: #fff; background-size: cover; width: 100%; height: 100%; position: relative;">

					<div id="tishi_div" onclick="tishi_hide();" style="position: absolute; width: 100%; height: 100%; top: 0; right:0; text-align: right; z-index: 999;">
						<div id="shuoming_bg" style="display:block; position: absolute; background: #000; top: 0; opacity:0.4; filter:alpha(opacity=40); width: 100%; height: 100%;"></div>
						<img src="<%=PropKit.get("front_res_prefix") %>img/tishi.png" style="position: absolute; top: 0; right:0;" />
					</div>
					<div style="text-align: center; width: 100%; position: relative;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/img_24.png" style="max-width: 100%;" />
					</div>
					
					<div style="text-align: center; position: absolute; width: 100%; bottom: 0; font-size: 0.65rem; color: #01115B; ">
						<div style="text-align: center; width: 100%; position: relative; ">
							<img src="${url }" style="width: 4rem; border: 0.1rem solid #0c0c25;" />
						</div>
						
						<div style="text-align: center; position: relative; width: 100%; margin-bottom: 0.2rem">
							<label style="font-size: 1rem; font-weight: bold;">加入莱绅通灵fans俱乐部</label><br>
							码上有惊喜<br>
							5.20前于新注册fans里抽出10位幸运者<br>获赠芭莎慈善明星同款手链
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
		
		<script type="application/javascript">
		
		$(document).ready(function(){
			setTimeout(function() { tishi_hide() },6000);
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
		
		function tishi_hide() {
			$('#tishi_div').hide();
		}
		</script>
	</body>

</html>