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
			.srdh_input {
				display: inline-block;
				border: 0;
				padding: 0 10px;
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img4.png) no-repeat;
				background-size: contain;
				text-align: center;
				color: #D9B06C;
			}
			
			.xzmd_span {
				display: inline-block;
				border: 0;
				text-align: center;
				color: #081A50;
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img5.png) no-repeat;
				background-size: contain;
			}
			
			.srdh_input::-webkit-input-placeholder {
				/* Chrome/Opera/Safari */
				color: #D9B06C;
			}
			
			.srdh_input::-moz-placeholder {
				/* Firefox 19+ */
				color: #D9B06C;
			}
			
			.srdh_input::-ms-input-placeholder {
				/* IE 10+ */
				color: #D9B06C;
			}
			
			.srdh_input::-moz-placeholder {
				/* Firefox 18- */
				color: #D9B06C;
			}
			
			.lqxz_sm_span {
				display: block;
			}
			
			@media (min-width: 481px) {
				.srdh_input, .xzmd_span {
					font-size: 0.8em;
				}
				.text_span3, .lqxz_sm_span {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.srdh_input, .xzmd_span {
					font-size: 0.75em;
				}
				.text_span3, .lqxz_sm_span {
					font-size: 0.6rem;
				}
			}
			
			@media (max-width: 320px) {
				.srdh_input, .xzmd_span {
					font-size: 0.7em;
				}
				.text_span3, .lqxz_sm_span {
					font-size: 0.6rem;
				}
			}
			
			.city_choice_span {
				
				flex: 1;
			}
			
			.city_choice_span label{
				font-size: 0.65rem;
				color: #f7cd6e;
			}
			
			.city_choice_span img{
				height: 0.4rem;
				margin-left: 0.3rem;
				vertical-align: middle;
				margin-top: -2px;
			}
			
			.city_span {
				display: block;
				font-size: 0.75rem;
				padding: 5px 0.8rem;
				color: #f7cd6e;
				border-bottom: 1px solid #f7cd6e;
			}
		</style>
	</head>
	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_bg.jpg);">

					<div style="position: absolute; width: 100%; text-align: center; bottom: 0;">
						<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/ljy_img5.png" style="max-width: 100%; margin-bottom: -6px;" />
					</div>
					<div style="width: 100%; position: absolute; text-align: center;">
						<div id="lqxz_top" style="margin: 0 auto; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img1.png); background-size: contain;">
						</div>
						<div id="lqxz_middle" style="margin: 0 auto; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img2.png); background-size: contain; display: flex; flex-direction: column; justify-content: center; align-items: center;">
							<div style="width: 100%; text-align: center;">
								<input class="srdh_input" id="xsdh_input" placeholder="输入销售单号" />
							</div>
							<div style="width: 100%; text-align: center; margin-top: 0.7rem;">
								<span onclick="show_city_popup()" class="xzmd_span" id="xzmd_span">
									选择领取门店
								</span>
							</div>
							<div style="width: 100%; text-align: center; margin-top: 0.7rem;">
								<input class="srdh_input" id="lpmm_input" placeholder="输入礼品密码" />
							</div>
							
							<div style="width: 100%; text-align: center; margin-top: 3rem; position: relative;">
								<span onclick="ck_detail();" class="text_span3" style="color: #B6934B; text-decoration: underline; display: block;">查看礼品详情</span>
								<div id="lpxq_div" style="position: absolute; width: 100%; text-align: center; display: none; bottom: 0.8rem;">
									<div id="lqxz_sm_top" style="width: 100%; text-align: center; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img6.png) no-repeat; background-size: contain; position: relative; margin: 0 auto;">&nbsp;</div>
									<div id="lqxz_sm_middle" style="width: 100%; text-align: center; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img7.png) repeat-y; background-size: contain; margin: 0 auto; position: relative; padding: 5px">
										<span class="lqxz_sm_span">购买莱绅通灵饰品:</span>
										<span class="lqxz_sm_span">实际支付金额大于8000元可兑换王室化妆镜一件</span>
										<span class="lqxz_sm_span">1克拉及以上钻饰可兑换王室珠宝箱一件</span>
										<img class="lqxz_sm_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/lipin_logo4.png" />
										<span class="lqxz_sm_span">(每位王室成员限兑换一件礼品)</span>
									</div>
									<div id="lqxz_sm_bottom" style="width: 100%; text-align: center; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img8.png) no-repeat; background-size: contain; margin: 0 auto; position: relative;">&nbsp;</div>
									</div>
								</div>
						</div>
						<div id="lqxz_bottom" style="width: 100%; margin-top: 1.5rem;">
							<img onclick="jmww()" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/lqxz_new_img3.png" style="max-width: 100%;">
						</div>
					</div>
				</div>
			</div>
			
			<div id="city_popup" class="popup">
				<div class="bar bar-footer" style="margin: 0; padding: 0; display: flex; background: #f7cd6e; align-items: center; justify-content: center; text-align: center;">
					<span style="background: #090e28; padding: 0.2rem 1.5rem; display: inline-block; border-radius: 0.3rem; font-size:0.75rem; color: #f7cd6e" onclick="close_popup('city_popup')">取消</span>
				</div>
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_bg.jpg); background-size: cover; width: 100%; height: 100%; position: relative; padding-bottom: 56px;">
					<div id="citys" style="opacity:0.9; filter:alpha(opacity=90);">
						<c:forEach items="${list}" var="city1">
						<span name="city_1_span" onclick="city_up_down(1,${city1.id})" class="city_span" id="city_1_span_${city1.id}">${city1.name}</span>
						<div name="city_1_div" id="city_1_div_${city1.id}" style="display: none;">
							<c:forEach items="${city1.list}" var="city2">
							<span name="city_2_span" onclick="city_up_down(2,${city2.id})" class="city_span" id="city_2_span_${city2.id}" style="padding-left: 1.5rem; font-size: 0.7rem">${city2.name}</span>
							<div name="city_2_div" id="city_2_div_${city2.id}" style="display: none;">
								<c:forEach items="${city2.list}" var="city3">
								<span onclick="choice_shop(${city3.id})" class="city_span" style="padding-left: 2rem; font-size: 0.65rem">${city3.name}</span>
								</c:forEach>
							</div>
							</c:forEach>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		<input type="hidden" id="shopid" value="">
		<input type="hidden" id="shopname" value="">
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
					$('#lqxz_top').css('width', 640);
					$('#lqxz_top').css('height', 291);
					$('#lqxz_middle').css('width', 640);
					$('#lqxz_middle').css('height', 396);

					$('.srdh_input').css('width', 275);
					$('.srdh_input').css('height', 42);
					$('.srdh_input').css('line-height', 42 + 'px');
					
					$('.xzmd_span').css('width', 275);
					$('.xzmd_span').css('height', 38);
					$('.xzmd_span').css('line-height', 38 + 'px');
					
					$('#lqxz_sm_top').css('width', 383);
					$('#lqxz_sm_top').css('height', 9);

					$('#lqxz_sm_bottom').css('width', 383);
					$('#lqxz_sm_bottom').css('height', 21);
					
					$('#lqxz_sm_middle').css('width', 383);
					
					$('.lqxz_sm_img').css('width', 262);
				} else {

					$('#lqxz_top').css('width', 640 * proportion);
					$('#lqxz_top').css('height', 291 * proportion);
					$('#lqxz_middle').css('width', 640 * proportion);
					$('#lqxz_middle').css('height', 396 * proportion);

					$('.srdh_input').css('width', 275 * proportion);
					$('.srdh_input').css('height', 42 * proportion);
					$('.srdh_input').css('line-height', (42 * proportion) + 'px');
					
					$('.xzmd_span').css('width', 275 * proportion);
					$('.xzmd_span').css('height', 38 * proportion);
					$('.xzmd_span').css('line-height', (38 * proportion) + 'px');
					
					$('#lqxz_sm_top').css('width', 383 * proportion);
					$('#lqxz_sm_top').css('height', 9 * proportion);

					$('#lqxz_sm_bottom').css('width', 383 * proportion);
					$('#lqxz_sm_bottom').css('height', 21 * proportion);
					
					$('#lqxz_sm_middle').css('width', 383 * proportion);
					
					$('.lqxz_sm_img').css('width', 262 * proportion);
				}
			});
			
			function ck_detail() {
				
				if ($('#lpxq_div').is(":hidden")) {
					$('#lpxq_div').show();
				} else {
					$('#lpxq_div').hide();
				}
			}
			
			function show_city_popup() {
				$.popup('#city_popup');
			}
			
			function close_popup(id) {
				$.closeModal('#' + id);
			}
			
			function city_up_down(level, id) {
				
				$('#citys div[name="city_'+level+'_div"]').each(function() {
					$(this).slideUp();
				});
				if ($('#city_'+level+'_div_' + id).is(":hidden")) {
					$('#city_'+level+'_div_' + id).slideDown();
				} else {
					$('#city_'+level+'_div_' + id).slideUp();
				}
			}
			
			function choice_shop(id) {
				var params = {};
				params.id = id;
				$.post('/<%=PropKit.get("project_name") %>/wxcj/getjj3shopname', params, function (returnJson){
	    			var rescode = returnJson.rescode;
	    			var rescnt = returnJson.rescnt;
	    			if (rescode == '0000') {
	    				$('#xzmd_span').html(rescnt);
	    				$('#shopid').val(id);
	    				$('#shopname').val(rescnt);
	    				$.closeModal('#city_popup');
	    			} else {
	    				
	    			}
	    		}, "json");
			}
			
			function jmww() {
				
				var xsdh = $('#xsdh_input').val();
				var lpmm = $('#lpmm_input').val();
				var shopid = $('#shopid').val();
				var shopname = $('#shopname').val();
				if ($.isEmptyObject(xsdh)) {
					$.toast('请输入销售单号');
					return;
				}
				if ($.isEmptyObject(shopid)) {
					$.toast('请选择门店');
					return;
				}
				if ($.isEmptyObject(lpmm)) {
					$.toast('请输入领取密码');
					return;
				}
				var params = {};
				params.shopid = shopid;
				params.shopname = shopname;
				params.lpmm = lpmm;
				params.xsdh = xsdh;
				$.post('/<%=PropKit.get("project_name") %>/wxcj/jinjie3_jmww_json', params, function (returnJson){
	    			var rescode = returnJson.rescode;
	    			var rescnt = returnJson.rescnt;
	    			if (rescode == '0000') {
	    				window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
	    			} else {
	    				$.toast(rescnt);
	    			}
	    		}, "json");
			}
		</script>
	</body>

</html>