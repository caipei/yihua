<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen/res/css/sm.css">
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>mine/res/css/style.css">
<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>mine/res/css/swiper.css">
<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>mine/res/css/layer.css">
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp&key=FVDBZ-T3EKR-XUJWJ-WG5AU-PDVY2-X7FVH"></script>
<style type="text/css">
	.bar-tab:before {
		background-color: transparent;
	}
	.bar:after {
		background-color: transparent;
	}
	
	.tip_content_span {
		display: inline-block;
		font-size: 0.7rem; 
		display: inline-block; 
		padding: 0.5rem; 
		border-radius: 4px; 
		background: #2A4399; 
		color: #FFD840;
	}
</style>
<script type="text/javascript">

	var jsApiList = ['onMenuShareTimeline',
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
		                'openCard'];

function is_weixin(){
    var ua = navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i)=="micromessenger") {
        return true;
    } else {
        return false;
    }
}

</script>
