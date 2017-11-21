<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>个人中心</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
			}
			
			.content_div {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_bg2.png) no-repeat;
				background-size: contain;
				padding-bottom: 60px;
				padding-top: 20px;
			}
			
			.info_bg {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_bg1.png) no-repeat;
				background-size: contain;
				z-index: 999;
				display: flex;
				position: relative;
				flex-direction: column;
				justify-content: center;
			}
			
			.info_top {
				display: flex;
				align-items: center;
				margin-top: 10px;
			}
			
			.logo_span img {
				width: 3rem;
				height: 3rem;
				border-radius: 3rem;
			}
			
			.name_span {
				margin-left: 1rem;
			}
			
			.name_span label {
				display: block;
			}
			
			.qd_label {
				border: 1px solid #003894;
				border-radius: 5px;
				padding: 2px 0px;
				width: 50px;
				text-align: center;
				margin-top: .2rem;
			}
			
			.info_bottom {
				display: flex;
				align-items: center;
				width: 100%;
			}
			
			.info_bottom_label1 {
				font-family: Arial;
			}
			
			.info_bottom_label2 {
				color: #757677;
			}
			
			.info_bottom_label3 {
				font-size: 0.6rem;
			}
			
			.info_bottom_span {
				flex: 1;
				text-align: center;
			}
			
			.info_bottom_span label {
				display: block;
			}
			
			.grzl_div {
				position: absolute;
				top: 1rem;
				right: 1rem;
				display: flex;
				align-items: center;
				color: #B9B9B9;
			}
			
			.grzl_div span {
				margin-right: 0.3rem;
			}
			
			.info_grid {
				display: flex;
				flex-wrap: wrap;
			}
			
			.info_grid span {
				text-align: center;
				flex: 0 0 33.3333%;
				
			}
			
			.info_grid span label {
				display: block;
				color: #7C7C7C;
			}
			
			.logout_div {
				width: 100%;
				color: #7B7B7B;
				margin-top: 0.6rem;
			}
			.logout_div span {
				border: 1px solid #E2E2E2;
				display: block;
				margin: 0 1rem;
				text-align: center;
			}
			
			.grzl_content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.member_info_div {
				display: flex;
				align-items: center;
			}
			
			.member_info_div span {
				flex: 1;
			}
			
			.popup_input_style {
				border: 0; 
				display: block; 
				height: 40px; 
				line-height: 30px;
				width: 100%; 
				background: transparent; 
				border: 1px solid #E4E4E4; 
				padding: 5px; 
				border-radius: 4px; 
				font-size: 14px;
			}
			
			.popup_btn_style {
				display: inline-block; 
				flex:1; 
				height: 40px; 
				margin-right: 5px; 
				width: 100%; 
				text-align: center; 
				line-height: 40px; 
				border: 1px solid  #000061; 
				border-radius: 4px; 
				color:  #000061; 
				font-size: 14px;
			}
			
			.province_left {
				flex: 1;
				height: 100%;
				overflow-y: auto;
				background: #EBEBEB;
				font-size: 0.75rem;
			}
			
			.province_right {
				flex: 1;
				height: 100%;
				overflow-y: auto;
				background: #fff;
				font-size: 0.75rem;
			}
			
			.province_left .on {
				background: #fff;
			}
			
			.province_left_item, .province_right_item {
				height: 40px;
				line-height: 40px;
				padding-left: 15px;
				border-bottom: #D2D2D2 solid 1px;
			}
			
			@media (min-width: 481px) {
				.name_label {
					font-size: 0.8rem;
				}
				.qd_label {
					font-size: 0.7rem;
				}
				.info_bottom_label1 {
					font-size: 0.9rem;
				}
				.info_bottom_label2 {
					font-size: 0.7rem;
				}
				.grzl_div span {
					font-size: 0.9rem;
				}
				
				.grzl_div img {
					height: 1.05rem;
				}
				
				.info_grid span label {
					font-size: 0.8rem;
				}
				
				
				.info_grid span {
					margin: 1.2rem 0;
				}
				
				.logout_div span {
					font-size: 0.8rem;
					line-height: 2.0rem;
				}
				
				.logo_img {
					width: 2.4rem;
					height: 2.4rem;
					border-radius: 2.4rem;
				}
				
				.member_info_div span {
					font-size: 0.9rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.name_label {
					font-size: 0.75rem;
				}
				.qd_label {
					font-size: 0.65rem;
				}
				.info_bottom_label1 {
					font-size: 0.8rem;
				}
				.info_bottom_label2 {
					font-size: 0.65rem;
				}
				.grzl_div span {
					font-size: 0.8rem;
				}
				.grzl_div img {
					height: 0.85rem;
				}
				
				.info_grid span label {
					font-size: 0.7rem;
				}
				
				.info_grid span {
					margin: 1rem 0;
				}
				
				.logout_div span {
					font-size: 0.7rem;
					line-height: 1.8rem;
				}
				
				.logo_img {
					width: 2.2rem;
					border-radius: 2.2rem;
				}
				.member_info_div span {
					font-size: 0.8rem;
				}
			}
			
			@media (max-width: 320px) {
				.name_label {
					font-size: 0.7rem;
				}
				.qd_label {
					font-size: 0.6rem;
				}
				.info_bottom_label1 {
					font-size: 0.75rem;
				}
				.info_bottom_label2 {
					font-size: 0.4rem;
				}
				.grzl_div span {
					font-size: 0.7rem;
				}
				
				.grzl_div img {
					height: 0.65rem;
				}
				
				.info_grid span label {
					font-size: 0.6rem;
				}
				
				.info_grid span {
					margin: 0.8rem 0;
				}
				
				.logout_div span {
					font-size: 0.6rem;
					line-height: 1.5rem;
				}
				
				.logo_img {
					width: 2rem;
					border-radius: 2rem;
				}
				.member_info_div span {
					font-size: 0.7rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">我的</h1>
				</header>
				<div class="content">
					<div class="content_div">
						<div class="info_bg">
							<div class="info_top">
								<span class="logo_span">
								<c:if test="${!empty icon }">
									<img id="logo" src="${icon }" />
								</c:if>
								<c:if test="${empty icon }">
									<img id="logo" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_default.jpg" />
								</c:if>
								</span>
								<span class="name_span">
									<label class="name_label">${nickname }</label>
									<c:if test="${issign eq '0' }">
										<label onclick="signin();" id="qd_label" class="qd_label">签到</label>
									</c:if>
									<c:if test="${issign eq '1' }">
										<label id="qd_label" class="qd_label">已签到</label>
									</c:if>
								</span>
							</div>
							<div class="info_bottom">
								<span class="info_bottom_span">
									<label class="info_bottom_label1">${point }</label>
									<label class="info_bottom_label2">现有积分</label>
								</span>
								<span class="info_bottom_span">
									<label class="info_bottom_label1">${cadr_no }</label>
									<label class="info_bottom_label2">会员卡号</label>
								</span>
								<span class="info_bottom_span">
									<c:if test="${level eq 1}">
										<label class="info_bottom_label1">铂金</label>
									</c:if>
									<c:if test="${level eq 2}">
										<label class="info_bottom_label1">钻石</label>
									</c:if>
									<c:if test="${level eq 3}">
										<label class="info_bottom_label1">克拉</label>
									</c:if>
									<c:if test="${level eq 4}">
										<label class="info_bottom_label1">蓝钻</label>
									</c:if>
									<label class="info_bottom_label2">会员等级</label>
								</span>
							</div>
							<div style=" height: 16px; line-height: 15px;">
								<label class="size6-05" style="color:#757677;" id="yxq_label">(有效期：${pointexpiredate})</label>
							</div>
							<div onclick="grzl()" class="grzl_div">
								<span>个人资料</span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png">
							</div>
						</div>
						
						<div class="info_grid">
							<span onclick="zsqy();">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_zsqy.png" />
								<label>专属权益</label>
							</span>
							<span onclick="grcz();">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_grcz.png" />
								<label>个人成长</label>
							</span>
							<span onclick="jfsc();">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_jfsc.png" />
								<label>积分商城</label>
							</span>
							<span onclick="hylq();">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_hylq.png" />
								<label>会员礼券</label>
							</span>
							<span onclick="hyhd();">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_hyzshd.png" />
								<label>会员专属活动</label>
							</span>
							<span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_hydzzz.png" />
								<label>会员电子杂志</label>
							</span>
							<span onclick="fjdmd();">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_fjdmd.png" />
								<label>附近的门店</label>
							</span>
							<span onclick="yjfk();">
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_hyfkyj.png" />
								<label>会员反馈意见</label>
							</span>
							<span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_mdgw.png" />
								<label>门店顾问</label>
							</span>
						</div>
						
						<div onclick="logout();" class="logout_div">
							<span>退出登录</span>
						</div>
					</div>
				</div>
			</div>
			<div id="grzl_page" class="page" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="$.router.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<button id="edit_btn" onclick="edit();" class="button button-link button-nav pull-right" style="color: #000061">编辑</button>
 					<h1 class="title" style="color: #000061">个人资料</h1>
				</header>
				<div class="content grzl_content">
					<div class="member_info_div" onclick="changeheader()" style="border-top: 10px solid #F2F6F9;padding: 0.6rem 0.8rem; border-bottom: 10px solid #F2F6F9;">
						<span>头像</span>
						<c:if test="${!empty icon }">
							<img class="logo_img" id="logo_grzl" src="${icon }" />
						</c:if>
						<c:if test="${empty icon }">
							<img class="logo_img" id="logo_grzl" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_default.jpg" />
						</c:if>
						<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png" style="width: 8px; margin-left: 10px;" />
					</div>
					<div class="member_info_div" style="padding: 0.6rem 0; margin: 0 0.8rem; border-bottom: 1px solid #F2F6F9;">
						<span>姓名：</span>
						<span style="text-align: right;">${nickname }</span>
					</div>
					<div class="member_info_div" style="padding: 0.6rem 0; margin: 0 0.8rem; border-bottom: 1px solid #F2F6F9;">
						<span>手机：</span>
						<span style="text-align: right;">${mobile }</span>
					</div>
					<div onclick="birth_change()" class="member_info_div" style="padding: 0.6rem 0; margin: 0 0.8rem; border-bottom: 1px solid #F2F6F9;">
						<span>生日：</span>
						<span id="birth_span" style="text-align: right;">${birth }</span>
					</div>
					<div onclick="marialdate_change()" class="member_info_div" style="padding: 0.6rem 0; margin: 0 0.8rem; border-bottom: 1px solid #F2F6F9;">
						<span>结婚纪念日：</span>
						<span id="marialdate_span" style="text-align: right;">${marialdate }</span>
					</div>
					<div onclick="sdetaileaddress_change()" class="member_info_div" style="padding: 0.6rem 0; margin: 0 0.8rem; border-bottom: 1px solid #F2F6F9;">
						<span>通讯地址：</span>
						<span id="sdetaileaddress_span" style="text-align: right;">${province}${city}${detaileaddress }</span>
					</div>
				</div>
			</div>
			
			<!-- edit -->
			<div id="birth_edit_popup" class="popup" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff;">
 					<a onclick="$.closeModal('#birth_edit_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">修改生日</h1>
				</header>
				<div class="content popup_content" style="border-top: 10px solid #F2F6F9">
					<div style="margin: 10px;">
						<input id="birth_edit_input" class="popup_input_style" placeholder="选择生日" />
					</div>
					<div style="margin: 10px; display: flex;">
						<a onclick="birth_edit_submit()" id="birth_edit_submit" href="javascript:;" class="popup_btn_style">确定</a>
						<a onclick="birth_edit_cancel()" id="birth_edit_cancel" href="javascript:;" class="popup_btn_style">取消</a>
					</div>
				</div>
			</div>
			
			<!-- edit -->
			<div id="marialdate_edit_popup" class="popup" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff;">
 					<a onclick="$.closeModal('#marialdate_edit_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">修改结婚纪念日</h1>
				</header>
				<div class="content popup_content" style="border-top: 10px solid #F2F6F9">
					<div style="margin: 10px;">
						<input id="marialdate_edit_input" class="popup_input_style" placeholder="选择结婚纪念日" />
					</div>
					<div style="margin: 10px; display: flex;">
						<a onclick="marialdate_edit_submit()" id="marialdate_edit_submit" href="javascript:;" style="display: inline-block; flex:1; height: 40px; margin-right: 5px; width: 100%; text-align: center; line-height: 40px; border: 1px solid  #000061; border-radius: 4px; color:  #000061; font-size: 14px;">确定</a>
						<a onclick="marialdate_edit_cancel()" id="marialdate_edit_cancel" href="javascript:;" class="popup_btn_style">取消</a>
					</div>
				</div>
			</div>
			
			<!-- edit -->
			<div id="sdetaileaddress_edit_popup" class="popup" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff;">
 					<a onclick="$.closeModal('#sdetaileaddress_edit_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">修改通讯地址</h1>
				</header>
				<div class="content popup_content" style="border-top: 10px solid #F2F6F9">
					<div style="margin: 10px; display: flex">
						<c:if test="${empty province }">
						<span onclick="show_province_edit_popup();" id="province_edit_input" class="popup_input_style">选择省市</span>
						</c:if>
						<c:if test="${!empty province }">
						<span onclick="show_province_edit_popup();" id="province_edit_input" class="popup_input_style">${province}${city}</span>
						</c:if>
					</div>
					<div style="margin: 10px;">
						<input id="sdetaileaddress_edit_input" value="${detaileaddress }" class="popup_input_style" placeholder="输入详细地址" />
					</div>
					<div style="margin: 10px; display: flex;">
						<a onclick="sdetaileaddress_edit_submit()" id="sdetaileaddress_edit_submit" href="javascript:;" style="display: inline-block; flex:1; height: 40px; margin-right: 5px; width: 100%; text-align: center; line-height: 40px; border: 1px solid  #000061; border-radius: 4px; color:  #000061; font-size: 14px;">确定</a>
						<a onclick="sdetaileaddress_edit_cancel()" id="sdetaileaddress_edit_cancel" href="javascript:;" class="popup_btn_style">取消</a>
					</div>
				</div>
			</div>
			
			<!-- edit -->
			<div id="province_edit_popup" class="popup" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff;">
 					<a onclick="$.closeModal('#province_edit_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">选择省市</h1>
				</header>
				<div class="content popup_content1" style="border-top: 1px solid #F2F6F9; display: flex;">
					<div id="province_left" class="province_left">
						<c:forEach items="${provincelist }" var="province">
							<div id="province_id_${province.province_id }" onclick="province_item_click(${province.province_id}, '${province.name}')" class="province_left_item">${province.name}</div>
						</c:forEach>
					</div>
					<div id="province_right" class="province_right">
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="icon_input" value="${icon }" />
		<input type="hidden" id="province_input" value="${province }" />
		<input type="hidden" id="city_input" value="${city }" />
		<input type="hidden" id="detaileaddress_input" value="${detaileaddress }" />
		<input type="hidden" id="editstate" value="0"> 
		<jsp:include page="footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;

			$('.popup_content').height($('.page-current').height() - 56);
			
			$('.popup_content1').height($('.page-current').height() - 46);
			
			if(screenWidth > 640) {
				$('.content').width(640);

				$('.info_bg').width(640);
				$('.info_bg').height(357);
				$('.logo_span').css('margin-left', '4rem');
				
				$('.info_bottom').css('margin-top', '1.2rem');
				$('.info_bottom').css('padding-left', '0.6rem');
				$('.info_bottom').css('padding-right', '0.6rem');
				
				$('#yxq_label').css('margin-left', '60px');
				
				$('.grzl_div').css('top', '2rem');
				$('.grzl_div').css('right', '3rem');
				
				$('.info_grid img').width(56);
				
				$('.qd_label').width(100);

			} else {
				$('.content').width(screenWidth);

				$('.info_bg').width(640 * proportion);
				$('.info_bg').height(357 * proportion);
				$('.logo_span').css('margin-left', (4 * proportion) + 'rem');
				
				$('.info_bottom').css('margin-top', (1.2 * proportion) + 'rem');
				$('.info_bottom').css('padding-left', (0.6 * proportion) + 'rem');
				$('.info_bottom').css('padding-right', (0.6 * proportion) + 'rem');
				
				$('#yxq_label').css('margin-left', (60 * proportion) + 'px');

				$('.grzl_div').css('top', (2 * proportion) + 'rem');
				$('.grzl_div').css('right', (3 * proportion) + 'rem');
				
				$('.info_grid img').width(56 * proportion);
				
				$('.qd_label').width(100 * proportion);

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
					});
				}
			}, "json");
			
			$('#birth_edit_input').calendar({
			    value: ['01/01/1990'],
			    dateFormat: 'mm/dd/yyyy'
			});
			
			$('#marialdate_edit_input').calendar({
				value: ['01/01/2010'],
			    dateFormat: 'mm/dd/yyyy'
			});
			
			
			initFirstProvince();
		});
		
		function grcz() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/grcz';
		}
		
		function grzl() {
			$.router.load('#grzl_page'); 
		}
		
		function zsqy() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/zsqylist';
		}
		
		function hylq() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/voucherlist';
		}
		
		function hyhd() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/zshdlist';
		}
		
		function fjdmd() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/shoplist';
		}
		
		function signin() {
			
			$.post("/<%=PropKit.get("project_name") %>/mine/signin_json", function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					$('#qd_label').html('已签到');
				} else {
					layer.open({content: '您已签到' ,skin: 'msg' ,time: 2 });
				}
			});
		}
		
		function yjfk() {
			
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/yjfk';
		}
		
		function edit() {
			var editstate = $('#editstate').val();
			if (editstate == 0) {
				$('#editstate').val(1);
				$('#edit_btn').html('保存');
			} else {
				// 同步是数据
				var icon = $('#icon_input').val();
				var birth = $('#birth_span').html();
				var marialdate = $('#marialdate_span').html();
				var province = $('#province_input').val();
				var city = $('#city_input').val();
				var detaileaddress = $('#detaileaddress_input').val();
				var params = {};
				params.icon = icon;
				params.birth = birth;
				params.marialdate = marialdate;
				params.province = province;
				params.city = city;
				params.detaileaddress = detaileaddress;
				$.post("/<%=PropKit.get("project_name") %>/mine/meminfo_submit", params, function (returnJson){
					var rescode = returnJson.rescode;
					var rescnt = returnJson.rescnt;
					if (rescode == '0000') {
						toast('保存成功');
					} else {
						toast('保存失败');
					}
					$('#editstate').val(0);
					$('#edit_btn').html('编辑');
				});
			}
		}
		
		function birth_change() {
			var editstate = $('#editstate').val();
			if (editstate == 1) {
				$.popup('#birth_edit_popup');
			}
		}
		
		function birth_edit_cancel() {
			$.closeModal('#birth_edit_popup')
		}
		
		function birth_edit_submit() {
			var birth_edit_input = $('#birth_edit_input').val();
			$('#birth_span').html(birth_edit_input);
			$.closeModal('#birth_edit_popup')
		}
		
		function marialdate_change() {
			var editstate = $('#editstate').val();
			if (editstate == 1) {
				$.popup('#marialdate_edit_popup');
			}
		}
		
		function marialdate_edit_cancel() {
			$.closeModal('#marialdate_edit_popup')
		}
		
		function marialdate_edit_submit() {
			var marialdate_edit_input = $('#marialdate_edit_input').val();
			$('#marialdate_span').html(marialdate_edit_input);
			$.closeModal('#marialdate_edit_popup')
		}
		
		function sdetaileaddress_change() {
			var editstate = $('#editstate').val();
			if (editstate == 1) {
				$.popup('#sdetaileaddress_edit_popup');
			}
		}
		
		function sdetaileaddress_edit_cancel() {
			$.closeModal('#sdetaileaddress_edit_popup')
		}
		
		function sdetaileaddress_edit_submit() {
			var sdetaileaddress = $('#sdetaileaddress_edit_input').val();
			var province = $('#province_input').val();
			var city = $('#city_input').val();
			$('#detaileaddress_input').val(sdetaileaddress);
			$('#sdetaileaddress_span').html(province + city + sdetaileaddress);
			$.closeModal('#sdetaileaddress_edit_popup')
		}
		
		
		function changeheader() {
			wx.ready(function(){
				wx.chooseImage({
				    count: 1, // 默认9
				    sizeType: ['compressed'], // 可以指定是原图还是压缩图，默认二者都有
				    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
				    success: function (res) {
				        var localIds = res.localIds; // 返回选定图片的本地ID列表，localId可以作为img标签的src属性显示图片
				        setTimeout("uploadHeaderImage('" + localIds + "')",500);
				    }
				});
			});
		}
		
		function uploadHeaderImage(localIds) {
			wx.ready(function(){
				wx.uploadImage({
		    	    localId: localIds, // 需要上传的图片的本地ID，由chooseImage接口获得
		    	    isShowProgressTips: 1, // 默认为1，显示进度提示
		    	    success: function (res) {
		    	        var serverId = res.serverId; // 返回图片的服务器端ID
		    	        // 上传至服务器，生成服务器地址
		    	        $.post("/<%=PropKit.get("project_name") %>/mine/serverid2qiniu", {serverid:serverId}, function (returnJson){
		        			var rescode = returnJson.rescode;
		        			var rescnt = returnJson.rescnt;
		        			if (rescode == '0000') {
		        				$('#logo').attr('src', rescnt);
		        				$('#logo_grzl').attr('src', rescnt);
		        				$('#icon_input').val(rescnt);
		        			}
		        		}, "json");
		    	    }
		    	});
			});
		}
		
		function show_province_edit_popup() {
			$.popup('#province_edit_popup');
		}
		
		
		function initFirstProvince() {
			var provinceid = $('#province_left div').first().attr('id');
			if (!$.isEmptyObject(provinceid)) {
				var provincename = $('#province_left div').first().html();
				provinceid = provinceid.replace('province_id_', ''); 
				province_item_click(provinceid, provincename);
			}
		}
		
		function province_item_click(privinceid, name) {
			var params = {};
			params.privinceid = privinceid;
			$('#province_input').val(name);
			$.post("/<%=PropKit.get("project_name") %>/mine/city_json", params, function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					var content = '';
					$.each(rescnt, function(index, cnt) {
						content += '<div onclick="city_item_click('+cnt.city_id+',\''+ cnt.name +'\')" class="province_right_item">'+cnt.name+'</div>\n';
					});
					$('#province_right').html(content);
				}
			});
			
			$('#province_left div').each(function(index, value) {
				$(this).removeClass('on');
			});
			$('#province_id_' + privinceid).addClass('on');
		}
		
		function city_item_click(cityid, name) {
			$('#city_input').val(name);
			$.closeModal('#province_edit_popup');
			$('#province_edit_input').html($('#province_input').val() + $('#city_input').val());
		}
		
		function jfsc() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/';     
		}
		
		function logout() {
			$.post("/<%=PropKit.get("project_name") %>/mine/logout", function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					window.location.href = '/<%=PropKit.get("project_name") %>/mine/login';
				} else {
				}
			});
		}
			
		</script>
	</body>

</html>