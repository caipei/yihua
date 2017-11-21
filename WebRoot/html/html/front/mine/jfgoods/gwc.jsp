<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_mine.jsp"></jsp:include>
    <title>购物车</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
			}
			
			.item_div {
				display: flex;
				align-items: center;
				padding: 10px;
				border-bottom: 1px solid #f2f2f2;
			}
			
			.check_img {
				width: 16px;
			}
			
			.title_div {
				margin-left: 5px;
				display: flex;
				flex: 1;
				flex-direction: column;
				justify-content: space-between;
			}
			
			.price_span {
				display: flex;
				align-items: center;
				justify-content: space-between;
			}
			
			.price_span span {
				display: inline-block;
			}
			
			.price_label {
				color: #013895;
			}
			
			.bottom_btns {
				display: inline-flex;
				flex: 1;
				align-items: center;
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
				<header class="bar bar-nav" style="background: #fff">
					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
					<button class="button button-link button-nav pull-right" style="color: #9A9A9A; font-size: 14px; display: none;">编辑</button>
					<h1 class="title" style="color: #000061">购物车</h1>
				</header>
				<div class="content">
					<div id="items_div" style="padding-bottom: 80px; border-top: 10px solid #f2f2f2;">
					</div>
				</div>

				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 44px; border-top: 1px solid #f2f2f2;">
					<span class="bottom_btns">
						<span onclick="check_all_img()" style="line-height: 0; margin-left: 10px;"><img id="check_all" class="check_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg" /></span>
						<span class="size6-05-05" style="margin-left: 5px;">全选</span>
						<span class="size6-05-05" style="flex: 1; text-align: right; padding-right: 5px;">
							<label>合计:</label>
							<label id="total_price" style=" color: #013895;"></label>
						</span>
					</span>
					<span onclick="$.popup('#ljdh_popup')" style="display: inline-flex; padding: 0 10px; font-size: 14px; background: #003795; color: #fff; justify-content: center; align-items: center;">
						立即兑换
					</span>
				</nav>
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
							<div id="ljdh_total_price" class="size7-05-05" style="text-align: center; margin-top: 10px; color: #00278A;">5000积分+1000元</div>	
						</div>
					</div>
				</div>
				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 44px; border-top: 1px solid #f2f2f2;">
					<span onclick="qrdh()" style="display: inline-flex; flex: 2; font-size: 14px; background: #003795; color: #fff; justify-content: center; align-items: center;">
						确认兑换
					</span>
				</nav>
			</div>
		</div>

		<jsp:include page="../footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			refresh_list();
			
			refreshcss();
		});
		
		function refreshcss() {
			
			$('.content').width(screenWidth);
			var imgWidth = screenWidth / 3;
			var imgHeight = imgWidth / 3 * 2
			$('.goods_img').width(imgWidth);
			$('.goods_img').height(imgHeight);
			$('.title_div').height(imgHeight);
			
			$('.popup_content1').height($('.page-current').height() - 46);
		}
		
		function refresh_list() {
			
			$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/gwclist_json', function (returnJson){
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				var content = '';
    				$.each(rescnt, function(index, cnt) {
    					content += '<div class="item_div">\n';
    					content += '<img onclick="check_img('+cnt.id+')" id="check_img_'+cnt.id+'" class="check_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg" />\n';
    					content += '<img class="goods_img" src="'+cnt.jfgoodsimgpath+'" style="margin-left: 5px;" />\n';
    					content += '<div class="title_div">\n';
    					content += '<span class="title_span size7-05-05">'+cnt.jfgoodsname+'</span>\n';
    					content += '<span class="price_span">\n';
    					content += '<span class="price_label size6-05-05">'+cnt.pricecontent+'</span><span class="num_label size6-05">x'+cnt.num+'</span>\n';
    					content += '</span>\n';
    					content += '</div>\n';
    					content += '</div>\n';
    				});
    				$('#items_div').html(content);
    			} else {
    				
    			}
    			
    			refreshcss();
    			
    			refresh_totalprice();
    			
    		}, "json");
		}
		
		function check_img(id) {
			var checkimgid = '#check_img_' + id;
			var checkimgsrc = $(checkimgid).attr('src');
			if (checkimgsrc == '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg') {
				$(checkimgid).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check0.jpg');
			} else {
				$(checkimgid).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg');
			}
			
			setcheckallimg();
			
			refresh_totalprice();
		}
		
		function check_all_img() {
			var checkimgid = '#check_all';
			var checkimgsrc = $(checkimgid).attr('src');
			if (checkimgsrc == '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg') {
				$(checkimgid).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check0.jpg');
				$('#items_div img[class="check_img"]').each(function(index, value) {
					$(this).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check0.jpg');
				});
			} else {
				$(checkimgid).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg');
				$('#items_div img[class="check_img"]').each(function(index, value) {
					$(this).attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg');
				});
			}
			
			refresh_totalprice();
		}
		
		function setcheckallimg() {
			var flag = 1;
			$('#items_div img[class="check_img"]').each(function(index, value) {
				if($(this).attr('src') == '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check0.jpg') {
					flag = 0;
				}
			});
			if (flag == 1) {
				$('#check_all').attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg');
			} else {
				$('#check_all').attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check0.jpg');
			}
		}
		
		function refresh_totalprice() {
			
			var ids = '';
			$('#items_div img[class="check_img"]').each(function(index, value) {
				if ($(this).attr('src') == '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg') {
					var id = $(this).attr('id');
					ids += id.replace('check_img_', '') + '|';
				}
			});
			var params = {};
			params.ids = ids;
			$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/gwctotalprice', params, function (returnJson){
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				$('#total_price').html(rescnt);
    				$('#ljdh_total_price').html(rescnt);
    			} else {
    				
    			}
    		}, "json");
		}
		
		function qrdh() {
			var ids = '';
			$('#items_div img[class="check_img"]').each(function(index, value) {
				if ($(this).attr('src') == '<%=PropKit.get("front_prefix") %>mine/res/img/mine_jfsc_gwc_check1.jpg') {
					var id = $(this).attr('id');
					ids += id.replace('check_img_', '') + '|';
				}
			});
			
			var params = {};
			params.ids = ids;
			$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/check_gwc2dh', params, function (returnJson){
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				var totaljf = rescnt.totaljf;
    				var totalprice = rescnt.totalprice;
    				params.totaljf = totaljf;
    				params.totalprice = totalprice;
    				$.post('/<%=PropKit.get("project_name") %>/mine/jfgoods/gwc2dh', params, function (returnJson){
    	    			var rescode = returnJson.rescode;
    	    			var rescnt = returnJson.rescnt;
    	    			if (rescode == '0000') {
    	    				$.closeModal('#ljdh_popup');
    	    				refresh_list();
    	    				refresh_totalprice();
    	    				toast('兑换成功');
    	    			} else {
    	    				toast(rescnt);
    	    			}
    	    		}, "json");
    			} else {
    				toast(rescnt);
    			}
    		}, "json");
		}
			
		</script>
	</body>

</html>