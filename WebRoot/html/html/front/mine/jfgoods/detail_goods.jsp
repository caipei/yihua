<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_mine.jsp"></jsp:include>
    <title>详情</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
			}
			
			.detail {
				border-bottom: 10px solid #f2f2f2;
			}
			
			.detail_content p {
				font-size: 13px;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
				text-indent: 2em;
			}
			
			.sl_div {
				display: inline-flex;
				align-items: center;
			}
			
			.sl_plus_span {
				display: inline-flex;
				width: 25px;
				height: 25px;
				background: #ADADAD;
				color: #fff;
				line-height: 25px;
				justify-content: center;
				align-items: center;
			}
			
			.sl_minus_span {
				display: inline-flex;
				width: 25px;
				height: 25px;
				line-height: 25px;
				background: #ADADAD;
				color: #fff;
				justify-content: center;
				align-items: center;
			}
			
			.sl_num_span input {
				height: 25px;
				width: 40px;
				background: #fff;
				text-align: center;
				border: 1px solid #ADADAD;
			}
			
			.xxcs_div {
				padding: 8px 0 10px;
			}
			
			.xxcs_item_span {
				display: block;
				margin-top: 5px;
				color: #838383;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
			}
			
			.xxcs_item_span label {
				color: #838383;
			}
			
			.twxq_div img {
				width: 100%;
				margin-bottom: 10px;
			}
			
			.twxq_div span {
				display: block;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
				margin-bottom: 10px;
			}
			
			.bottom_btns {
				display: inline-flex;
				flex: 3;
			}
			
			.bottom_btns span {
				display: inline-flex;
				flex: 1;
				flex-direction: column;
				text-align: center;
				align-items: center;
				justify-content: center;
			}
			
			.bottom_btns span label {
				display: block;
				font-size: 12px;
				margin-top: -2px;
			}
			
			.bottom_btns span img {
				width: 20px;
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
			
			.city_span {
				display: block;
				font-size: 0.75rem;
				padding: 5px 0.8rem;
				color: #000061;
				border-bottom: 1px solid #f2f2f2;
			}
			
			@media (min-width: 481px) {
				.twxq_div span {
					font-size: 0.75rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.twxq_div span {
					font-size: 0.7rem;
				}
			}
			
			@media (max-width: 320px) {
				.twxq_div span {
					font-size: 0.65rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #f2f2f2;">
					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
					<h1 class="title" style="color: #000061">详情</h1>
				</header>
				<div class="content">
					<div style="padding-bottom: 80px;">
						<div class="absolute_img_div">
							<img src="${imgpath }" />
						</div>

						<div style="padding: 15px; border-bottom: 10px solid #f2f2f2;">
							<span style="display: block;" class="size7-05-05">
							${name }
							</span>
							<span style="display: flex; align-items: center; margin-top: 5px;">
								<span style="display: inline-flex; flex: 1; align-items: baseline; color: #00278A;">
									${pricecontent }
								</span>
								<span style="display: inline-block;">
									<label class="size6-05" style="padding: 3px 5px; color: #fff; background: #7B91B8;">已兑${dhnum }件</label>
								</span>
							</span>
						</div>

						<div style="padding: 15px; border-bottom: 10px solid #f2f2f2;">
							<div style="display: flex; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #f2f2f2;">
								<label class="size7-05-05">我的选择</label><img style="height: 8px; margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png" />
							</div>
							
							<c:if test="${issc eq 1 }">
							<div style="display: flex; align-items: center; margin-top: 15px;font-size: 14px;">
								<label style="margin-right: 10px;">手寸</label>
								<span style="border: 1px solid #6B8BC1; display: inline-flex; align-items: center; height: 28px;">
									<input id="scxh_input" value="" style="border: 0; background: transparent; width: 60px; text-align: center; color: #003894;" />
									<img style="height: 8px; margin-right: 5px; margin-left: -10px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_arrow_down.png" />
								</span>
							</div>
							</c:if>

							<div style="display: flex; align-items: center; margin-top: 15px;font-size: 14px;">
								<label style="margin-right: 10px;">数量</label>
								<div class="sl_div">
									<span onclick="minus_click()" class="sl_minus_span">-</span>
									<span class="sl_num_span"><input onchange="change_num();" id="input_num" type="number" class="size6-05-05" value="1"/></span>
									<span onclick="plus_click()" class="sl_plus_span">+</span>
								</div>
							</div>
							<div style="display: flex; align-items: center; margin-top: 15px; font-size: 14px;">
								<label style="margin-right: 10px; text-align: right; font-size: 14px;">领取门店</label>
								<span onclick="$.popup('#shop_popup')" style="border: 1px solid #e2e2e2; display: inline-flex; align-items: center; height: 28px;">
									<label id="city_label" style="padding: 0 15px; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<img style="height: 8px; margin-right: 5px; margin-left: -10px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_arrow_down.png" />
								</span>
							</div>
							<div style="margin-top: 10px;" class="size6-05">
								<span style="display: block;">说明：兑换商品由用户在可使用门店自行领取</span>
							</div>
						</div>

						<div style="padding: 15px 15px 5px 15px; border-bottom: 10px solid #f2f2f2;">
							<div style="display: flex; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #f2f2f2;">
								<label class="size7-05-05">详细参数</label><img style="height: 8px; margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png" />
							</div>

							<div class="xxcs_div size7-05">
								<c:forEach items="${xxcslist }" var="xxcs">
								<span class="xxcs_item_span">${xxcs.content}</span>
								</c:forEach>
							</div>
						</div>
						
						<div style="padding: 15px 15px 5px 15px; border-bottom: 10px solid #f2f2f2;">
							<div style="display: flex; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #f2f2f2;">
								<label class="size7-05-05">图文详情</label><img style="height: 8px; margin-left: 5px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_zxkf_arrow_down.png" />
							</div>

							<div class="twxq_div size7-05">
								<c:forEach items="${contentlist }" var="content">
									<c:if test="${content.type eq 1 }">
									<span>${content.content }</span>
									</c:if>
									<c:if test="${content.type eq 2 }">
									<img src="${content.url }" />
									</c:if>
								</c:forEach>
							</div>
						</div>

					</div>
				</div>

				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 44px; border-top: 1px solid #f2f2f2;">
					<span class="bottom_btns">
						<span style="border-right: 1px solid #f2f2f2;">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img6.jpg" />
							<label>客服</label>
						</span>
						<span onclick="togwc()" style="border-right: 1px solid #f2f2f2;">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img7.jpg" />
							<label>购物车</label>
						</span>
						<span onclick="toindex()">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_img8.jpg" />
							<label>首页</label>
						</span>
					</span>
					<span onclick="add2gwc()" style="display: inline-flex; flex: 2; font-size: 14px; background: #A1A1A1; color: #fff; justify-content: center; align-items: center;">
						加入购物车
					</span>
					<span onclick="check_dh()" style="display: inline-flex; flex: 2; font-size: 14px; background: #003795; color: #fff; justify-content: center; align-items: center;">
						立即兑换
					</span>
				</nav>
			</div>
			
			<!-- edit -->
			<div id="sc_popup" class="popup" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff;">
 					<a onclick="$.closeModal('#sc_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">选择手寸</h1>
				</header>
				<div class="content popup_content1" style="border-top: 1px solid #F2F6F9; display: flex;">
					<div id="province_left" class="province_left">
					</div>
				</div>
			</div>
			
			<div id="ljdh_popup" class="popup" style="background: #f2f2f2;">
				<header class="bar bar-nav" style="background: #fff; border-bottom:1px solid #f2f2f2;">
 					<a onclick="$.closeModal('#ljdh_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">立即兑换</h1>
				</header>
				<div class="content popup_content1">
					<div style="padding-bottom: 80px;">
						<div style="padding: 20px 0; background: #fff;">
							<div class="size8-05" style="text-align: center; font-weight: bold;">订单金额</div>
							<div id="ljdh_total_price" class="size7-05-05" style="text-align: center; margin-top: 10px; color: #00278A;"></div>	
						</div>
					</div>
				</div>
				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 44px; border-top: 1px solid #f2f2f2;">
					<span onclick="add2order();" style="display: inline-flex; flex: 2; font-size: 14px; background: #003795; color: #fff; justify-content: center; align-items: center;">
						确认兑换
					</span>
				</nav>
			</div>
			
			<div id="shop_popup" class="popup">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #000061;">
 					<a onclick="$.closeModal('#shop_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">选择门店</h1>
				</header>
				<div class="content popup_content1">
					<div id="citys" class="citys">
						<c:forEach items="${citylist}" var="city">
						<span onclick="city_up_down(1,${city.cityc})" class="city_span" id="city_1_span_${city.cityc}">${city.citycname}</span>
						<div id="city_1_div_${city.cityc}" style="display: none;">
							<c:forEach items="${city.shoplist}" var="shop">
							<span onclick="choice_shop('${shop.oldwerks}','${shop.werksname}')" class="city_span" style="padding-left: 2rem; font-size: 0.65rem">${shop.werksname}</span>
							</c:forEach>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="shopid" value="" />
		<input type="hidden" id="oldwerks" value="" />
		<input type="hidden" id="shopname" value="" />
		<input type="hidden" id="id" value="${id }" />
		<input type="hidden" id="issc" value="${issc }" />
		<input type="hidden" id="scxh" value="${scxh }" />
		<input type="hidden" id="jf" value="${jf }" />
		<input type="hidden" id="price" value="${price }" />
		<input type="hidden" id="orderno" value="" />
		<jsp:include page="../footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;
			
			$('.popup_content1').height($('.page-current').height() - 46);

			if(screenWidth > 640) {
				$('.content').width(640);
			} else {
				$('.content').width(screenWidth);
			}
			
			getsc();
		});
		
		// 如果是手寸商品，获取手寸选择
		var scxhArray = new Array();
		function getsc() {
			
			var issc = $('#issc').val();
			
			if (issc == 1) {
				
				var scxhArr = $('#scxh').val().split('|');
				
				var index = 0;
				for (var i = 0; i < scxhArr.length; i ++) {
					if (!$.isEmptyObject(scxhArr[i])) {
						scxhArray.push(scxhArr[i]);
						if (index == 0) {
							$('#scxh_input').val(scxhArr[i]);
							index ++;
						}
					}
				}
				
				$("#scxh_input").picker({
					  toolbarTemplate: '<header class="bar bar-nav">\
					  <button class="button button-link pull-right close-picker">确定</button>\
					  <h1 class="title">手寸型号</h1>\
					  </header>',
					  cols: [
					    {
					      textAlign: 'center',
					      values: scxhArray
					    }
					  ]
					});
			}
		}
		
		function minus_click() {
			var num = $('#input_num').val();
			if (num <= 1) {
				
			} else {
				$('#input_num').val(Number(num) - 1);
			}
		}
		
		function plus_click() {
			var num = $('#input_num').val();
			$('#input_num').val(Number(num) + 1);
		}
		
		function change_num() {
			var num = $('#input_num').val();
			if (!$.isNumeric(num)) {
				$('#input_num').val(1);
			}
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
		
		function choice_shop(oldwerks, werksname) {
			$('#city_label').html(werksname);
			$('#oldwerks').val(oldwerks);
			$('#shopname').val(werksname);
			$.closeModal('#shop_popup');
		}
		
		function add2gwc() {
			
			var id = $('#id').val();
			var oldwerks = $('#oldwerks').val();
			var shopname = $('#shopname').val();
			var num = $('#input_num').val();
			if ($.isEmptyObject(oldwerks)) {
				toast('请选择领取门店')
			} else {
				var params = {};
				params.id = id;
				params.oldwerks = oldwerks;
				params.shopname = shopname;
				params.num = num;
				$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/add2gwc', params, function (returnJson){
	    			var rescode = returnJson.rescode;
	    			var rescnt = returnJson.rescnt;
	    			if (rescode == '0000') {
	    				toast('加入成功');
	    			} else {
	    				
	    			}
	    		}, "json");
			}
		}
		
		function check_dh() {
			
			var id = $('#id').val();
			var num = $('#input_num').val();
			var params = {};
			params.id = id;
			params.num = num;
			$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/check_dh', params, function (returnJson){
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				var orderno = rescnt.orderno;
    				var payjf = rescnt.payjf;
    				var paymount = rescnt.paymount;
    				$('#orderno').val(orderno);
    				$('#ljdh_total_price').html(rescnt.pricecontent);
    				$.popup('#ljdh_popup');
    			} else {
    				toast(rescnt);
    			}
    		}, "json");
		}
		
		function add2order() {
			
			var id = $('#id').val();
			var oldwerks = $('#oldwerks').val();
			var shopname = $('#shopname').val();
			var num = $('#input_num').val();
			var orderno = $('#orderno').val();
			$.showIndicator()
			if ($.isEmptyObject(oldwerks)) {
				toast('请选择领取门店')
			} else {
				var params = {};
				params.id = id;
				params.oldwerks = oldwerks;
				params.shopname = shopname;
				params.num = num;
				params.orderno = orderno;
				$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/add2order', params, function (returnJson){
	    			var rescode = returnJson.rescode;
	    			var rescnt = returnJson.rescnt;
	    			if (rescode == '0000') {
	    				$.hideIndicator()
	    				$.closeModal('#ljdh_popup');
	    				toast('兑换成功');
	    			} else {
	    				$.hideIndicator()
	    				toast(rescnt);
	    			}
	    		}, "json");
			}
		}
		
		function togwc() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/gwc';
		}
		
		function toindex() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/homepage';
		}
		</script>
	</body>

</html>