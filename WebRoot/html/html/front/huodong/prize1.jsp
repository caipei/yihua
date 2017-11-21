<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta.jsp"></jsp:include>
    <title>我要参加</title>
		<style type="text/css">
			.shuoming {
				display: inline-block;
				text-align: left;
				background: #fff;
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
			
			.city_choice_span {
				
				flex: 1;
			}
			
			.city_choice_span label{
				font-size: 0.65rem;
				color: #fff;
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
				color: #fff;
				border-bottom: 1px solid #0894EC;
			}
			
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>img/bg_04.jpg); background-size: cover; width: 100%; height: 100%; position: relative;">
					<div style="text-align: center; position: absolute; top: 3.5rem; width: 100%;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/img_16.png" style="max-width: 100%;" />
					</div>
					<div style="text-align: center; margin-top: 1rem;"><img src="<%=PropKit.get("front_res_prefix") %>img/icon_logo.png" style="height: 2rem;" /></div>

					<div style="margin-top: 1rem; text-align: center; position: absolute; bottom: 0.5rem; width: 100%;">
						
						<div style="text-align: center;">
							<span class="tip_content_span" id="tip_content_div">神秘礼物&nbsp;为您开启<br>恭喜获得</span>
						</div>
						<img src="${imgpath}" style="height: 4rem;" />
						<span style="font-size: 0.65rem; display: block; color: #fff; margin-top: -0.3rem; line-height: 0.9rem;">
							${prizeremark}
						</span>
						
						<div id="shuoming" style="text-align: center; position: absolute; width: 100%; bottom: 7rem; display: none; z-index: 999; ">
							<div id="shuoming_div" style="display: inline-block; margin-top: 0.4rem; width: 10rem; border-radius: 5px; padding: 10px; background: #fff; text-align: center;">
								<span class="shuoming">查看特权券<label style="color: #D5A65E">请登陆官方微信-微俱乐部-个人中心-我的券包</label><br>实物礼品1周内配发，到店后我们会与您联系，请耐心等待 </span>
								<span onclick="close_shuoming()" class="close_span" style="margin-top: 0.5rem;">关闭</span>
							</div>
							<div style="text-align: center; position: absolute; bottom: -0.8rem; width: 100%;">
								<img style="height: 0.5rem;" src="<%=PropKit.get("front_res_prefix") %>img/img_26.png" />
							</div>
						</div>
						
						<div style="text-align: center; width: 100%;">
							<span onclick="show_shuoming()" style="display: inline-block; color: #EDBC32; font-size: 0.5rem; font-weight: bold; text-decoration:underline;">活动说明</span>
						</div>
						
						<div style="display: flex; text-align: center; font-size: 0.65rem; color: #fff; width: 100%; padding: 0 40px; margin-top: 0.4rem;">
							<span style="display: inline-block; background: url(<%=PropKit.get("front_res_prefix") %>img/img_22.png) repeat-x center; flex: 1;"></span>
							<span style="display: inline-block; width: 5rem;">领取门店选择</span>
							<span style="display: inline-block; background: url(<%=PropKit.get("front_res_prefix") %>img/img_22.png) repeat-x center; flex: 1;"></span>
						</div>
						
						<div style="display: inline-block; margin-top: 0.4rem; ">
							<div onclick="show_city_popup()" id="city_choice_div" style="width: 10rem; background: #EDBC32; padding: 0.3rem 0; display: flex; border-radius: 0.3rem;">
								<span class="city_choice_span">
								<c:if test="${!empty shopname}">
									<label id="shop_label">${shopname }</label>
								</c:if>
								<c:if test="${empty shopname}">
									<label id="shop_label">门店选择</label>
								</c:if>
								</span>
							</div>
						</div>
						<div style="width: 100%;margin-top: 0.2rem; ">
							<span onclick="qrlq()" style="background: url(<%=PropKit.get("front_res_prefix") %>img/img_11.png); background-size: cover; display: inline-block; width: 6rem; height: 2rem; line-height: 2.2rem; font-size: 0.75rem; color: #fff;">确认领取</span>
						</div>
					</div>
					<div id="shuoming_bg" style="display:none; position: absolute; background: #000; top: 0; opacity:0.4; filter:alpha(opacity=40); width: 100%; height: 100%;"></div>
				</div>
			</div>
			<div id="city_popup" class="popup">
				<div class="bar bar-footer" style="margin: 0; padding: 0; display: flex; background: #fff;  opacity:0.9; filter:alpha(opacity=90); align-items: center; justify-content: center; text-align: center;">
					<span style="background: #EDBC32; padding: 0.2rem 1.5rem; display: inline-block; border-radius: 0.3rem; font-size:0.75rem; color:#fff" onclick="close_popup('city_popup')">取消</span>
				</div>
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>img/bg_04.jpg); background-size: cover; width: 100%; height: 100%; position: relative; padding-bottom: 44px;">
					<div id="citys" style="background: #003284; opacity:0.8; filter:alpha(opacity=80);">
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
		<input type="hidden" id="memprizeid" value="${memprizeid }">
		<input type="hidden" id="shopid" value="${shopid }">
		<input type="hidden" id="shopname" value="${shopname }">
		<jsp:include page="../footer.jsp"></jsp:include>
		
		<script type="application/javascript">
		
		$(document).ready(function(){
			
			$('#city_choice_div').width($(window).width() - 100);
			
			$('#shuoming_div').width($(window).width() - 120);
			
			$('#tip_content_div').width($(window).width() - 140);
		});
		
		function show_shuoming() {
			$('#shuoming').show();
			$('#shuoming_bg').show();
		}
		
		function close_shuoming() {
			$('#shuoming').hide();
			$('#shuoming_bg').hide();
		}
		
		function show_city_popup() {
			
			$.popup('#city_popup');
		}
		
		function close_popup(id) {
			$.closeModal('#' + id);
		}
		
		function qrlq() {
			
			// 上传领取门店信息
			var shopid = $('#shopid').val();
			if ($.isEmptyObject(shopid)) {
				$.alert('请选择门店');
				return;
			}
			var params = {};
			params.memprizeid = $('#memprizeid').val();
			params.shopid = $('#shopid').val();
			params.shopname = $('#shopname').val();
			$.post('/<%=PropKit.get("project_name") %>/hd/setshop2prize', params, function (returnJson){
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				window.location.href = '/<%=PropKit.get("project_name") %>/hd/tojoin';
    			} else {
    				$.alert('领取失败')
    			}
    		}, "json");
			
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
			$.post('/<%=PropKit.get("project_name") %>/hd/getshopname', params, function (returnJson){
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				$('#shop_label').html(rescnt);
    				$('#shopid').val(id);
    				$('#shopname').val(rescnt);
    				$.closeModal('#city_popup');
    			} else {
    				
    			}
    		}, "json");
		}
		
		</script>
	</body>

</html>