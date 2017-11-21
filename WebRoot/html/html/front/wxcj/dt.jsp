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
			.timu_img {
				margin-left: 1rem;
			}
			
			.timu_span {
				margin: 0 0.4rem;
				color: #d9ac5d;
				padding-top: 0.5rem;
			}
			
			.timu_sel_span_on {
				display: inline-block;
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img5.png) no-repeat;
				background-size: contain;
				color: #010217;
				white-space: nowrap;　　/* 文字不折行 */
			}
			
			.timu_sel_span_pre {
				color: #d9ac5d;
			}
			
			.timu_sel_span_off {
				display: inline-block;
				background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img6.png) no-repeat;
				background-size: contain;
				color: #d9ac5d;
				white-space: nowrap;　　/* 文字不折行 */
			}
			
			@media (min-width: 481px) {
				.timu_span, .timu_sel_span_pre {
					font-size: 0.8rem;
				}
				.timu_sel_span_on, .timu_sel_span_off {
					font-size: 0.8rem;
				}
				.mobile_span, .mobile_input {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.timu_span, .timu_sel_span_pre {
					font-size: 0.7rem;
				}
				.timu_sel_span_on, .timu_sel_span_off {
					font-size: 0.7rem;
				}
				.mobile_span, .mobile_input {
					font-size: 0.65rem;
				}
			}
			
			@media (max-width: 320px) {
				.timu_span, .timu_sel_span_pre {
					font-size: 0.6rem;
				}
				.timu_sel_span_on, .timu_sel_span_off {
					font-size: 0.6rem;
				}
				.mobile_span, .mobile_input {
					font-size: 0.6rem;
				}
			}
			
			.mobile_input {
				color: #cda05e;
			}
		</style>
	</head>
	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_bg.jpg);">

					<div id="content_div" style="width: 100%; text-align: center; position: absolute;">
						
						<div style="position: absolute; width: 100%; text-align: center; bottom: 0;">
							<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/gsjj_img4.png" style="max-width: 100%; margin-bottom: -7px;" />
						</div>
						
						<div style="width: 100%; text-align: center;"><img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img1.png" style="max-width: 100%;" /></div>
						<div id="bjt_top" style="width: 100%; text-align: center; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img2.png) no-repeat; background-size: contain; position: relative; margin: 0 auto;">&nbsp;</div>
						<div id="bjt_middle" style="width: 100%; padding-bottom: 1rem; text-align: center; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img3.png) repeat-y; background-size: contain; margin: 0 auto; position: relative;">
							<div style="width: 100%; padding-top: 1rem; position: relative;">
								<div style="padding: 0 1rem; display: flex; align-items: center;">
									<img id="timu1_img" class="timu_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img4.png" />
									<span class="timu_span">Leysen1855莱绅通灵是( )</span>
								</div>
								<div onclick="timu_check(1,1)" style="margin-top: 0.5rem;">
									<span class="timu_sel_span_pre" style="margin-right: 5px;">A</span>
									<span class="timu_sel_span_off" id="timu1_a_span">
										比利时王室珠宝品牌
									</span>
								</div>
								<div onclick="timu_check(1,2)" style="margin-top: 0.4rem;">
									<span class="timu_sel_span_pre" style="margin-right: 5px;">B</span>
									<span class="timu_sel_span_off" id="timu1_b_span">
										英国王室珠宝品牌
									</span>
								</div>
								<div id="tip1_div" style="display: none; position: absolute; text-align: center; top: 1rem; right: 1rem; z-index: 10000;">
									<img id="tip1_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img13.png" /><br />
									<img onclick="close_err_tip(1);" id="tip1_del_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img11.png" />
								</div>
							</div>
							
							<div style="width: 100%; text-align: center; margin-top: 0.5rem;">
								<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img12.png" style="max-width: 100%;"/>
							</div>
							
							<div style="width: 100%; padding-top: 0.5rem; position: relative;">
								<div style="padding: 0 1rem; display: flex; align-items: center;">
									<img id="timu2_img" class="timu_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img7.png" />
									<span class="timu_span">Leysen1855莱绅通灵拥有( )年的历史</span>
								</div>
								<div onclick="timu_check(2,1)" style="margin-top: 0.5rem;">
									<span class="timu_sel_span_pre" style="margin-right: 5px;">A</span>
									<span class="timu_sel_span_off" id="timu2_a_span">
										152
									</span>
								</div>
								<div onclick="timu_check(2,2)" style="margin-top: 0.4rem;">
									<span class="timu_sel_span_pre" style="margin-right: 5px;">B</span>
									<span class="timu_sel_span_off" id="timu2_b_span">
										162
									</span>
								</div>
								
								<div id="tip2_div" style="display: none; position: absolute; text-align: center; top: 1rem; right: 1rem; z-index: 10000;">
									<img id="tip2_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img14.png" /><br />
									<img onclick="close_err_tip(2);" id="tip2_del_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img11.png" />
								</div>
							</div>
							
							<div style="width: 100%; text-align: center; margin-top: 0.5rem;">
								<img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img12.png" style="max-width: 100%;" />
							</div>
							
							<div style="width: 100%; padding-top: 0.5rem; position: relative;">
								<div style="padding: 0 1rem; display: flex; align-items: center;">
									<img id="timu3_img" class="timu_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img8.png" />
									<span class="timu_span">Leysen1855莱绅通灵的( )系列化产品是在比利时国王、王后共同见证下发布的</span>
								</div>
								<div onclick="timu_check(3,1)" style="margin-top: 0.5rem;">
									<span class="timu_sel_span_pre" style="margin-right: 5px;">A</span>
									<span class="timu_sel_span_off" id="timu3_a_span">
										MY QUEEN(王后)系列
									</span>
								</div>
								<div onclick="timu_check(3,2)" style="margin-top: 0.4rem;">
									<span class="timu_sel_span_pre" style="margin-right: 5px;">B</span>
									<span class="timu_sel_span_off" id="timu3_b_span">
										KING(国王)系列
									</span>
								</div>
								
								<div id="tip3_div" style="display: none; position: absolute; text-align: center; top: 1rem; right: 1rem; z-index: 10000;">
									<img id="tip3_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img15.png" /><br />
									<img onclick="close_err_tip(3);" id="tip3_del_img" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img11.png" />
								</div>
							</div>

						</div>
						<div id="bjt_bottom" style="width: 100%; text-align: center; background: url(<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img10.png) no-repeat; background-size: contain; margin: 0 auto; position: relative;">&nbsp;</div>

						<div style="width: 100%; text-align: center; padding: 0.7rem 0; position: relative;">
							<img id="qrtj" src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_new_img9.png" />
						</div>
						
						<div id="cover" style="display: none; position: absolute; top: 0; background: #000; width: 100%; height: 100%;opacity:0.8; filter:alpha(opacity=80);"></div>
					</div>
				</div>
				
				<div id="answer_tip" style="display: none; position: absolute; top: 0; width: 100%; height: 100%">
					<div style="display: flex; position: absolute; top: 0; width: 100%; flex-direction: column; height: 100%; justify-content: center; align-items: center; ">
						<div style="width: 100%; text-align: center;"><img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_img11.png" style="max-width: 100%;" /></div>
						<div onclick="tgmm();" style="width: 100%; text-align: center;"><img src="<%=PropKit.get("front_res_prefix") %>wxcj/img/dty_img12.png" style="max-width: 100%;" /></div>
					</div>
				</div>
			</div>
			
			<div id="login_page" class="page">
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
		<input type="hidden" id="answer1" value="" />
		<input type="hidden" id="answer2" value="" />
		<input type="hidden" id="answer3" value="" />
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
				if(screenWidth > 640) {
					$('#bjt_top').css('width', 640);
					$('#bjt_top').css('height', 15);

					$('#bjt_bottom').css('width', 640);
					$('#bjt_bottom').css('height', 13);
					
					$('#bjt_middle').css('width', 640);

					$('#qrtj').css('width', 123);
					$('#qrtj').css('height', 50);

					$('#timu1_img').css('width', 67);
					$('#timu2_img').css('width', 67);
					$('#timu3_img').css('width', 67);
					
					$('#timu1_a_span').css('width', 280);
					$('#timu1_a_span').css('height', 50);
					$('#timu1_a_span').css('line-height', '50px');
					
					$('#timu1_b_span').css('width', 280);
					$('#timu1_b_span').css('height', 50);
					$('#timu1_b_span').css('line-height', '50px');
					
					$('#timu2_a_span').css('width', 280);
					$('#timu2_a_span').css('height', 50);
					$('#timu2_a_span').css('line-height', '50px');
					
					$('#timu2_b_span').css('width', 280);
					$('#timu2_b_span').css('height', 50);
					$('#timu2_b_span').css('line-height', '50px');
					
					$('#timu3_a_span').css('width', 280 * 1.2);
					$('#timu3_a_span').css('height', 50 * 1.2);
					$('#timu3_a_span').css('line-height', '50px');
					
					$('#timu3_b_span').css('width', 280);
					$('#timu3_b_span').css('height', 50);
					$('#timu3_b_span').css('line-height', '50px');
					
					$('#tip3_img').css('width', 259);
					$('#tip3_del_img').css('width', 30);
					
					$('#tip2_img').css('width', 259);
					$('#tip2_del_img').css('width', 30);
					
					$('#tip1_img').css('width', 259);
					$('#tip1_del_img').css('width', 30);
					
					
					$('#login_mobile').css('width', 322);
					$('#login_mobile').css('height', 50);
					
					$('#login_code').css('width', 191);
					$('#login_code').css('height', 50);
					
					$('#login_getcode').css('width', 131);
					$('#login_getcode').css('height', 50);
					$('#login_getcode').css('line-height', 50 + 'px');
					
					
				} else {
					$('#bjt_top').css('width', screenWidth);
					$('#bjt_top').css('height', screenWidth * 15 / 640);

					$('#bjt_bottom').css('width', screenWidth);
					$('#bjt_bottom').css('height', screenWidth * 13 / 640);
					
					$('#bjt_middle').css('width', screenWidth);

					$('#qrtj').css('width', screenWidth * 123 / 640);
					$('#qrtj').css('height', screenWidth * 50 / 640);

					$('#timu1_img').css('width', screenWidth * 67 / 640);
					$('#timu2_img').css('width', screenWidth * 67 / 640);
					$('#timu3_img').css('width', screenWidth * 67 / 640);
					
					$('#timu1_a_span').css('width', screenWidth * 280 / 640);
					$('#timu1_a_span').css('height', screenWidth * 50 / 640);
					$('#timu1_a_span').css('line-height', (screenWidth * 50 / 640) + 'px');
					
					$('#timu1_b_span').css('width', screenWidth * 280 / 640);
					$('#timu1_b_span').css('height', screenWidth * 50 / 640);
					$('#timu1_b_span').css('line-height', (screenWidth * 50 / 640) + 'px');
					
					$('#timu2_a_span').css('width', screenWidth * 280 / 640);
					$('#timu2_a_span').css('height', screenWidth * 50 / 640);
					$('#timu2_a_span').css('line-height', (screenWidth * 50 / 640) + 'px');
					
					$('#timu2_b_span').css('width', screenWidth * 280 / 640);
					$('#timu2_b_span').css('height', screenWidth * 50 / 640);
					$('#timu2_b_span').css('line-height', (screenWidth * 50 / 640) + 'px');
					
					$('#timu3_a_span').css('width', screenWidth * 280 / 640);
					$('#timu3_a_span').css('height', screenWidth * 50 / 640);
					$('#timu3_a_span').css('line-height', (screenWidth * 50 / 640) + 'px');
					
					$('#timu3_b_span').css('width', screenWidth * 280 / 640);
					$('#timu3_b_span').css('height', screenWidth * 50 / 640);
					$('#timu3_b_span').css('line-height', (screenWidth * 50 / 640) + 'px');
					
					$('#tip3_img').css('width', screenWidth * 259 / 640);
					$('#tip3_del_img').css('width', screenWidth * 30 / 640);
					
					$('#tip2_img').css('width', screenWidth * 259 / 640);
					$('#tip2_del_img').css('width', screenWidth * 30 / 640);
					
					$('#tip1_img').css('width', screenWidth * 259 / 640);
					$('#tip1_del_img').css('width', screenWidth * 30 / 640);
					
					$('#login_mobile').css('width', screenWidth * 0.503);
					$('#login_mobile').css('height', screenWidth * 0.503 * 50 / 322);
					
					$('#login_code').css('width', screenWidth * 0.298);
					$('#login_code').css('height', screenWidth * 0.298 * 50 / 191);
					
					$('#login_getcode').css('width', screenWidth * 0.204);
					$('#login_getcode').css('height', screenWidth * 0.204 * 50 / 131);
					$('#login_getcode').css('line-height', (screenWidth * 0.204 * 50 / 131) + 'px');
					
				}
				
				$('#qrtj').click(function() {
					var answer1 = $('#answer1').val();
					var answer2 = $('#answer2').val();
					var answer3 = $('#answer3').val();
					if (answer1 != 'a') {
						var contentheight = $('#content_div').height();
						console.info(contentheight);
						$('#tip1_div').show();
						$('#cover').css({
							'height':contentheight,
							'opacity':0.8,
							'display':'block'
						}); 
					} else if (answer2 != 'b') {
						$('#tip2_div').show();
						$('#cover').css({
							'height':contentheight,
							'opacity':0.8,
							'display':'block'
						}); 
					} else if (answer3 != 'a') {
						$('#tip3_div').show();
						$('#cover').show();
					} else {
						$('#answer_tip').show();
						$('#cover').css({
							'height':contentheight,
							'opacity':0.8,
							'display':'block'
						}); 
					}
				});
				
			});
			
			function timu_check(timuindex, selindex) {
				
				$('#timu'+timuindex+'_a_span').attr('class','timu_sel_span_off');
				$('#timu'+timuindex+'_b_span').attr('class','timu_sel_span_off');
				if (selindex == 1) {
					$('#timu'+timuindex+'_a_span').attr('class','timu_sel_span_on');
					$('#answer'+timuindex).val('a');
				} else {
					$('#timu'+timuindex+'_b_span').attr('class','timu_sel_span_on');
					$('#answer'+timuindex).val('b');
				}
			}
			
			function close_err_tip(index) {
				$('#tip'+index+'_div').hide();
				$('#cover').hide();
			}
			
			function tgmm() {
				$.post("/<%=PropKit.get("project_name") %>/wxcj/dt_success_json", function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						$.post("/<%=PropKit.get("project_name") %>/wxcj/judge_logged", function (returnJson){
							var rescode = returnJson.rescode;
							var rescnt = returnJson.rescnt;
							if (rescode == '0000') {
								window.location.href = '/<%=PropKit.get("project_name") %>/wxcj/stage_redirect';
							} else {
								$.router.load("#login_page");
							}
						}, "json");
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
				if ($.isEmptyObject(mobile)) {
					$.toast('请输入手机号码');
					return;
				}
				if ($.isEmptyObject(code)) {
					$.toast('请输入验证码');
					return;
				}
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