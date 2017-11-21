<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>我的礼券</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.nav {
				top: 2.2rem;
				border-top: 1px solid #0C2978;
				position: absolute;
				z-index: 999;
				width: 100%;
			}
			
			.nav_top {
				background: #fff;
				width: 100%;
				display: flex;
				align-items: baseline;
				margin: 0 auto;
				height: 2rem;
				line-height: 2rem;
			}
			
			.nav_top div {
				flex: 1;
				display: inline-block;
				height: 100%;
				display: flex;
				flex-direction: row;
				justify-content: center;
			}
		
			.nav_top div span {
				line-height: 2rem;
			}
			
			.nav_top div .on {
				border-bottom: 1px solid #0F46D8;
			}
			
			.quan_list {
				display: flex;
				justify-content: space-between;
				align-content: space-between;
				flex-wrap: wrap;
				border-top: 0.4rem solid #F2F6F9;
				margin-top: 2rem;
			}
			
			.quan_info_div {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_img1.png) no-repeat;
				background-size: contain;
				color: #fff;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
			}
			
			.quan_info_gz_div {
				background: #DEDEDE;
				text-align: center;
				display: flex;
				align-items: center;
				justify-content: center;
			}
			
			.quan_info_gz_div img {
				margin-left: 0.5rem;
			}
			
			.quan_info_gz_div span {
				padding-right: 0.5rem;
				border-right: 1px solid #969696;
			}
			
			.quan_info_name_div label {
				display: block;
			}
			
			.ljsl_div {
				display: inline-block;
			}
			
			.nav_bottom {
				background: #0B2569;
				color: #fff;
			}
			
			.nav_bottom div {
				display: flex;
				height: 100%;
				display: flex;
				flex-direction: row;
				text-align: center;
				justify-content: center;
				border-bottom: 1px solid #1E3981;
				padding: 7px 0;
			}
			
			.nav_bottom div span {
				display: inline-block;
				flex: 1;
			}
			
			.img_arrow {
				width: 20px;
			}
			
			@media (min-width: 481px) {
				.nav_top div span {
					font-size: 0.9rem;
				}
				.quan_info_gz_div span {
					font-size: 0.7rem;
				}
				.quan_info_name_div, .ljsl_div {
					font-size: 0.8rem;
				}
				.quan_info_price_label {
					font-size: 1.6rem;
				}
				
				.price_div {
					font-size: 0.9rem;
				}
				
				.nav_bottom div span {
					font-size: 0.8rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.nav_top div span {
					font-size: 0.8rem;
				}
				.quan_info_gz_div span {
					font-size: 0.65rem;
				}
				.quan_info_name_div, .ljsl_div {
					font-size: 0.7rem;
				}
				.quan_info_price_label {
					font-size: 1.4rem;
				}
				
				.price_div {
					font-size: 0.8rem;
				}
				
				.nav_bottom div span {
					font-size: 0.7rem;
				}
			}
			
			@media (max-width: 320px) {
				
				.nav_top div span {
					font-size: 0.7rem;
				}
				.quan_info_gz_div span {
					font-size: 0.6rem;
				}
				.quan_info_name_div, .ljsl_div {
					font-size: 0.6rem;
				}
				.quan_info_price_label {
					font-size: 1.2rem;
				}
				
				.price_div {
					font-size: 0.7rem;
				}
				
				.nav_bottom div span {
					font-size: 0.6rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">会员礼券</h1>
				</header>
				<div class="nav">
					<div class="nav_top">
						<div onclick="wdlq();">
							<span id="wdlq_span" class="on">
								我的礼券
							</span>
							<span>
								<img class="img_arrow" style="margin-left: 3px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_arrow_down.png" />
							</span>
						</div>
						<div onclick="tjq();">
							<span id="tjq_span">
								推荐券
							</span>
							<span>
								<img class="img_arrow" style="margin-left: 3px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_arrow_down.png" />
							</span>
						</div>
					</div>
					<div id="nav_bottom_wdlq" class="nav_bottom" style="display: none;">
					</div>
					<div id="nav_bottom_tjq" class="nav_bottom" style="display: none;">
						<div>
							<span>&nbsp;</span>
							<span>已拥有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</div>
						<div>
							<span>&nbsp;</span>
							<span>可申领&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</div>
					</div>
				</div>
				<div class="content">
					<div id="quan_list" class="quan_list">
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			refresh_css();
			
			refresh_quan();
		});
		
		var loyVoucherscombines;
		var voucherlist
		function refresh_quan() {
			$.showIndicator();
			$.post("/<%=PropKit.get("project_name") %>/mine/voucherlist_json", function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					$.hideIndicator();
					voucherlist = rescnt.voucherlist;
					loyVoucherscombines = rescnt.loyVoucherscombines;
					set_quan_list(voucherlist);
					
					setnavbottomwdlq();
				}
			}, "json");
		}
		
		function setnavbottomwdlq() {
			var content = '';
			$.each(loyVoucherscombines, function(index, cnt) {
				content += '<div onclick="navottom_click(\''+cnt.TESIROVoucherType+'\')">\n';
				content += '<span>'+cnt.TESIROVoucherType+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\n';
				content += '<span>&nbsp;</span>\n';
				content += '</div>\n';
			});
			$('#nav_bottom_wdlq').html(content);
		}
		
		function navottom_click(type) {
			
			$.each(loyVoucherscombines, function(index, typecnt) {
				var content = '';
				if (type == typecnt.TESIROVoucherType) {
					set_quan_list(typecnt.list);
				}
			});
			
			$('#nav_bottom_wdlq').hide();
		}
		
		function set_quan_list(list) {
			
			var content = '';
			$.each(list, function(index, cnt) {
				var quan_info_div_bg = '';
				if (cnt.Status == '可使用') {
					
				} else if (cnt.Status == '已过期') {
					quan_info_div_bg = 'style="background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_img3.png) no-repeat; background-size: contain;"';
				} else if (cnt.Status == '未激活') {
					
				} else if (cnt.Status == '已使用') {
					quan_info_div_bg = 'style="background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_img3.png) no-repeat; background-size: contain;"';
				}
				content += '<div class="quan_div">\n';
				content += '<div onclick="voucher_detail(\''+cnt.VoucherNumber+'\');" class="quan_info_div" '+quan_info_div_bg+'>\n';
				content += '<div class="price_div">\n';
				content += '<label class="quan_info_price_label">'+cnt.TESIRODiscountMethod+'</label>\n';
				content += '</div>\n';
				content += '<div class="quan_info_name_div">\n';
				content += '<label>'+cnt.ProductName+'</label>\n';
				content += '<label>有效期：'+cnt.ExpirationDate+'</label>\n';
				content += '</div>\n';
				content += '</div>\n';
				content += '<div class="quan_info_gz_div">\n';
				content += '<span onclick="voucher_rule();">规则</span>\n';
				content += '<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_hylq_img2.png" />\n';
				content += '</div>\n';
				content += '</div>\n';
			});
			$('#quan_list').html(content);
			refresh_css();
		}
		
		function refresh_css() {
			
			$('.content').width(screenWidth);
			$('.nav_top').width(screenWidth);
			//$('.img_arrow').width(36 * proportion);

			$('.quan_info_div').css({
				'width': 275 * proportion + 'px',
				'height': 204 * proportion + 'px',
				'padding-top': 1.5 * proportion + 'rem',
				'padding-left': 1 * proportion + 'rem',
				'padding-right': 1 * proportion + 'rem',
				'padding-bottom': 1.5 * proportion + 'rem'
			});

			$('.quan_info_gz_div').width(275 * proportion);
			$('.quan_info_gz_div').height(60 * proportion);

			$('.quan_info_gz_div img').width(30 * proportion);

			var padding = (640 - 275 * 2) / 3 * proportion + 'px';
			var padding_bottom = 4 * proportion + 'rem';
			$('.quan_list').css({
				'padding-top': padding,
				'padding-left': padding,
				'padding-right': padding,
				'padding-bottom': padding_bottom
			});

			$('.quan_div').width(275 * proportion);
			$('.quan_div').css('margin-bottom', padding);
		}
		
		var nattype = 1;
		function wdlq() {
			
			$('#wdlq_span').addClass('on');
			$('#tjq_span').removeClass('on');
			if (nattype == 1) {
				if ($('#nav_bottom_wdlq').is(':hidden')) {
					$('#nav_bottom_wdlq').show();
				} else {
					$('#nav_bottom_wdlq').hide();
				}
			} else if (nattype == 2) {
				$('#nav_bottom_tjq').hide();
			}
			nattype = 1;
		}
		
		function tjq() {
			
			$('#tjq_span').addClass('on');
			$('#wdlq_span').removeClass('on');
			if (nattype == 2) {
				if ($('#nav_bottom_tjq').is(':hidden')) {
					$('#nav_bottom_tjq').show();
				} else {
					$('#nav_bottom_tjq').hide();
				}
			} else if (nattype == 1) {
				$('#nav_bottom_wdlq').hide();
			}
			nattype = 2;
		}
		
		function voucher_detail(VoucherNumber) {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/voucherdetail?vouchernumber=' + VoucherNumber;
		}
		
		function voucher_rule() {
			
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/voucherrule';
		}
			
		</script>
	</body>

</html>