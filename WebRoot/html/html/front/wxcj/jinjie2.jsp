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
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie_new1_img5_1.png) no-repeat;
				background-size: contain;
				margin: 0 auto;
				position: relative;
			}
			
			.synum {
				display: inline-block;
				color: #dcad58;
				margin-bottom: 0.8rem;
				background: #2a2327;
				padding: 4px 10px;
			}
			
			.synum label {
				color: #fff;
				padding: 0 2px;
			}
			
			@media (min-width: 481px) {
				.synum {
					font-size: 0.80rem;
				}
				.synum label {
					font-size: 0.9rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.synum {
					font-size: 0.70rem;
				}
				.synum label {
					font-size: 0.8rem;
				}
			}
			
			@media (max-width: 320px) {
				.synum {
					font-size: 0.60rem;
				}
				.synum label {
					font-size: 0.7rem;
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
								<div style="width: 100%; position: absolute; bottom: 0.5rem; z-index: 999; text-align: center">
									<div class="synum">还差<label>${synum}</label>位好友帮您发布，即可获得皇家博物馆勋章</div>
									<br>
									<img onclick="share()" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/jinjie2_img6.png" style="max-width: 100%;">
								</div>
							</div>
						</div>
					</div>
					
					<div id="tishi_div" onclick="tishi_hide();" style="position: absolute; width: 100%; height: 100%; text-align: center; z-index: 999; display:none">
						<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/share_img2.jpg" style="width: 100%; height: 100%;" />
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="token" value="${token }" />
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
							wx.showMenuItems({
							    menuList: ['menuItem:share:appMessage',
							               'menuItem:share:timeline',
							               'menuItem:share:qq',
							               'menuItem:share:weiboApp',
							               'menuItem:favorite'] // 要显示的菜单项，所有menu项见附录3
							});
							var title = '荣耀升级  壕礼来袭';
							var desc = 'Leysen1855莱绅通灵比利时王室珠宝品牌162周年';
							var imgurl = 'http://op788qydz.bkt.clouddn.com/logo.png';
							var token = $('#token').val();
							var url = '<%=PropKit.get("project_url") %>wxcj/index?token=' + token;
							console.info(url);
							wx.onMenuShareAppMessage({
							    title: title, // 分享标题
							    desc: desc, // 分享描述
							    link: url, // 分享链接
							    imgUrl: imgurl, // 分享图标
							    type: 'link', // 分享类型,music、video或link，不填默认为link
							    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
							    success: function () {
							        // 用户确认分享后执行的回调函数
							    	share_success();
							    },
							    cancel: function () {
							        // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareTimeline({
								title: title,  // 分享标题
							    link: url, // 分享链接
							    imgUrl: imgurl, // 分享图标
							    success: function () { 
							        // 用户确认分享后执行的回调函数
							    	share_success();
							    },
							    cancel: function () { 
							        // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareQQ({
								title: title, // 分享标题
							    desc: desc, // 分享描述
							    link: url, // 分享链接
							    imgUrl: imgurl, // 分享图标
							    success: function () { 
							       // 用户确认分享后执行的回调函数
							    	share_success();
							    },
							    cancel: function () { 
							       // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareWeibo({
								title: title, // 分享标题
							    desc: desc, // 分享描述
							    link: url, // 分享链接
							    imgUrl: imgurl, // 分享图标
							    success: function () { 
							       // 用户确认分享后执行的回调函数
							    	share_success();
							    },
							    cancel: function () { 
							       // 用户取消分享后执行的回调函数
							    }
							});
							
							wx.onMenuShareQZone({
								title: title, // 分享标题
							    desc: desc, // 分享描述
							    link: url, // 分享链接
							    imgUrl: imgurl, // 分享图标
							    success: function () { 
							       // 用户确认分享后执行的回调函数
							    	share_success();
							    },
							    cancel: function () { 
							       // 用户取消分享后执行的回调函数
							    }
							});
						});
					}
				}, "json");
			});
			
			function share_success() {
				
			}
			
			function share() {
				
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
						}  else if (type2state == 2) {
							// 礼品密码
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jinjie2_lpmm';
						} else if (type2state == 1) {
							// 跳转二阶段完成界面
							window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jinjie2_end';
						} else {
							$('#tishi_div').show();
						}
					} else {
						$('#tishi_div').show();
					}
				}, "json");
			}
			function tishi_hide() {
				$('#tishi_div').hide();
			}
		</script>
	</body>

</html>