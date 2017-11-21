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
			
			.text_span2 {
				text-decoration: underline;
			}
			
			.lpxq_span {
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/ljy_new_img3.png); 
				background-size: contain; 
				display: flex; 
				padding-top: 0.5rem;
				justify-content: center; 
				align-items: center;
			}
			
			.xzmd_span {
				display: inline-block;
				border: 0;
				text-align: center;
				color: #081A50;
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/ljy_new_img7.png) no-repeat;
				background-size: contain;
			}
			
			@media ( min-width: 641px) {
				.text_span1,
				.text_span3,
				.lpxq_span {
					font-size: 0.7rem;
				}
				.srdh_input {
					font-size: 0.8rem;
				}
				.text_span2 {
					font-size: 1.05rem;
				}
				.xzmd_span {
					font-size: 0.8em;
				}
				.lpxq_span {
					line-height: 0.85rem;
				}
			}
			
			@media ( max-width: 640px) and (min-width: 481px) {
				.text_span1,
				.text_span3,
				.lpxq_span {
					font-size: 0.7rem;
				}
				.srdh_input {
					font-size: 0.8rem;
				}
				.text_span2 {
					font-size: 1.05rem;
				}
				.xzmd_span {
					font-size: 0.8em;
				}
				.lpxq_span {
					line-height: 0.75rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.text_span1,
				.text_span3,
				.lpxq_span {
					font-size: 0.6rem;
				}
				.srdh_input {
					font-size: 0.75rem;
				}
				.text_span2 {
					font-size: 0.95rem;
				}
				.xzmd_span {
					font-size: 0.75em;
				}
				.lpxq_span {
					line-height: 0.65rem;
				}
			}
			
			@media (max-width: 320px) {
				.text_span1,
				.text_span3,
				.lpxq_span {
					font-size: 0.6rem;
				}
				.text_span2 {
					font-size: 0.85rem;
				}
				.xzmd_span {
					font-size: 0.7em;
				}
				.srdh_input {
					font-size: 0.70rem;
				}
				.lpxq_span {
					line-height: 0.65rem;
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

					<div style="width: 100%; height: 100%; text-align: center; position: absolute;">
						<div style="width: 100%;"><img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/ljy_new_img1.png" style="max-width: 100%;" /></div>
						<div id="content_div" style="margin: 0 auto; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/ljy_new_img5.png) no-repeat; background-size: contain; display: flex; flex-direction: column; justify-content: center; align-items: center;">
							<div style="width: 100%; text-align: center;"><img id="logo" src="${logo }" style="max-width: 100%;" /></div>
							<div style="width: 100%; text-align: center;">
								<span class="text_span1" style="color: #fff; display: block;">恭喜您获得:</span>
								<span class="text_span2" style="color: #F7B755; display: block;">${name}1件</span>
								<span class="text_span1" style="color: #fff; display: block;">(领取时间:${lqsj})</span>
							</div>
							<div style="width: 100%; text-align: center; margin-top: 0.5rem; position: relative;">
								<span onclick="ck_detail()" class="text_span3" style="color: #B6934B; text-decoration: underline; display: block;">查看领取详情</span>
								<div id="lpxq_div" style="position: absolute; width: 100%; text-align: center; display: none;">
									<span style="display: inline-block">
										<span class="lpxq_span" id="lpxq_span">
											尊敬的王室成员<br>请在提示时间内<br>凭此页面到选择门店领取礼品<br>过期未领，礼品将返还礼品池
										</span>
									</span>
									
								</div>
								
							</div>
							<div style="width: 100%; text-align: center; margin-top: 0.5rem;">
								<div style="width: 100%; text-align: center; margin-top: 0.5rem;">
									<input class="srdh_input" id="lpmm_input" placeholder="输入礼品密码" />
								</div>
							</div>

						</div>
						<div style="width: 100%; margin-top: 2rem;">
							<img onclick="qrlq()" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/ljy_new_img4_1.png" style="max-width: 100%;" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="id" value="${id }">
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
					$('#content_div').css('width', 426);
					$('#content_div').css('height', 543);
					$('#logo').css('width', 136);
					$('#logo').css('height', 136);
					
					$('#xzmd_span').css('width', 276);
					$('#xzmd_span').css('height', 43);
					$('#xzmd_span').css('line-height', 43 + 'px');
					
					$('#lpxq_span').css('width', 350);
					$('#lpxq_span').css('height', 150);
					
					$('.srdh_input').css('width', 275);
					$('.srdh_input').css('height', 42);
					$('.srdh_input').css('line-height', 42 + 'px');
					
				} else {
					$('#content_div').css('width', 426 * proportion);
					$('#content_div').css('height', 543 * proportion);

					$('#logo').css('width', 136 * proportion);
					$('#logo').css('height', 136 * proportion);
					
					$('#xzmd_span').css('width', 276 * proportion);
					$('#xzmd_span').css('height', 43 * proportion);
					$('#xzmd_span').css('line-height', (43 * proportion) + 'px');
					
					
					$('#lpxq_span').css('width', 350 * proportion);
					$('#lpxq_span').css('height', 150 * proportion);
					
					$('.srdh_input').css('width', 275 * proportion);
					$('.srdh_input').css('height', 42 * proportion);
					$('.srdh_input').css('line-height', (42 * proportion) + 'px');
				}
			});
			
			function ck_detail() {
				
				if ($('#lpxq_div').is(":hidden")) {
					$('#lpxq_div').show();
				} else {
					$('#lpxq_div').hide();
				}
			}
			
			function qrlq() {
				var id = $('#id').val();
				var lpmm = $('#lpmm_input').val();
				if ($.isEmptyObject(lpmm)) {
					$.toast('请输入礼品密码');
				} else {
					var params = {};
					params.id = id;
					params.lpmm = lpmm;
					$.post('/<%=PropKit.get("project_name") %>/wxcj/jinjie2_lpmm_submit', params, function (returnJson){
		    			var rescode = returnJson.rescode;
		    			var rescnt = returnJson.rescnt;
		    			if (rescode == '0000') {
		    				window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/jieshu';
		    			} else {
		    				$.toast(rescnt);
		    			}
		    		}, "json");
				}
			}
		</script>
	</body>

</html>