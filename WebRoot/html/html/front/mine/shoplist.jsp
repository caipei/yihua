<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>附近的门店</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.list_div {
				padding-bottom: 86px;
			}
			
			.list_item1 {
				display: flex;
				padding: 0.6rem 0;
				margin: 0 0.6rem;
				border-bottom: 1px solid #F2F2F2;
				align-items: center;
				justify-content: space-between;
			}
			
			.list_item2 {
				display: flex;
				padding: 0.6rem;
				border-bottom: 8px solid #F2F2F2;
				align-items: center;
				justify-content: space-between;
			}
			
			.list_item2_info {
				
			}
			
			.list_item2_info span {
				display: flex;
				align-items: center;
				color: #000;
			}
			
			.list_item2_info label {
				color: #8D8D8D;
			}
			
			.list_item2_info img {
				margin-right: 5px;
			}
			
			@media (min-width: 481px) {
				.list_item1 span {
					font-size: 0.85rem;
				}
				
				.list_item1 img {
					width: 29px;
				}
				
				.list_item2 span {
					font-size: 0.8rem;
				}
				
				.arrow_right {
					width: 14px;
				}
				
				.list_item2_info img {
					width: 18px;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.list_item1 span {
					font-size: 0.8rem;
				}
				
				.list_item1 img {
					width: 24px;
				}
				
				.list_item2 span {
					font-size: 0.75rem;
				}
				
				.arrow_right {
					width: 12px;
				}
				
				.list_item2_info img {
					width: 16px;
				}
			}
			
			@media (max-width: 320px) {
				.list_item1 span {
					font-size: 0.75rem;
				}
				
				.list_item1 img {
					width: 20px;
				}
				
				.list_item2 span {
					font-size: 0.7rem;
				}
				
				.arrow_right {
					width: 10px;
				}
				
				.list_item2_info img {
					width: 14px;
				}
			}
			
			
			
			.detail_div {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_fjmd_img5.png) no-repeat;
				background-size: contain;
				margin: 1rem auto;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
			}
			
			.detail_name {
				margin: 1rem 0.8rem 0 0.8rem;
			}
			
			.detail_tel {
				margin: 0rem 0.8rem 1.2rem 0.8rem;
			}
			
			.detail_tel span {
				display: block;
			}
			
			.detail_bottom {
				height: 2rem;
				display: flex;
				justify-content: space-between;
				position: absolute;
				bottom: 44px;
				width: 100%;
				line-height: 2rem;
				color: #fff;
			}
			
			.detail_bottom span {
				display: inline-block;
				flex: 1;
				text-align: center;
				font-size: 0.7rem;
			}
			
			@media (min-width: 481px) {
				.detail_name {
					font-size: 1.1rem;
				}
				.detail_tel {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.detail_name {
					font-size: 1rem;
				}
				.detail_tel {
					font-size: 0.65rem;
				}
			}
			
			@media (max-width: 320px) {
				.detail_name {
					font-size: 0.9rem;
				}
				.detail_tel {
					font-size: 0.6rem;
				}
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">附近的门店</h1>
				</header>
				<div class="bar bar-header-secondary">
				  	<div class="searchbar" style="display: flex">
				    	<div class="search-input" style="flex: 1">
				      		<label class="icon icon-search" for="search"></label>
				      		<input type="search" id="searcheky" placeholder='地址'/>
				    	</div>
				    	<label onclick="search();" style="font-size: 15px; padding-left:10px; display: inline-block;">搜索</label>
				  	</div>
				</div>
				<div class="content">
					<div class="map_div" id="map_div"></div>
					<div class="list_div">
						<div id="list_item1" class="list_item1" style="display:none">
							<span id="first_item_shop">通灵珠宝北京西环广场</span>
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_fjmd_img2.png">
						</div>
						<div id="list_div">
						</div>
					</div>
				</div>
			</div>
			
			<div id="detail_popup" class="popup" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom:1px solid #f2f2f2">
 					<a onclick="$.closeModal('#detail_popup')" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">附近的门店</h1>
				</header>
				<div class="content popup_content1">
					<div class="detail_div">
						<div id="detail_name" class="detail_name"></div>
						<div class="detail_tel">
							<span id="detail_telephone">座机号：${telephone }</span>
							<span id="detail_address" style="margin-top: 0.2rem;">地址：${address }</span>
						</div>
					</div>
				</div>
				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; height: 40px;">
					<span id="detail_lxsj" style="margin-right: 0.1rem; background: #003894; color: #fff; font-size: 14px; line-height: 40px; text-align: center; display:inline-block; flex: 1">
					</span>
	 	  			<span style="margin-left: 0.1rem; background: #919191; display:inline-block; color: #fff; font-size: 14px; line-height: 40px; text-align: center; flex: 1">
						导航去这里
					</span>
				</nav>
			</div>
		</div>

		<jsp:include page="footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			/*
			wx.getLocation({
			    type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
			    success: function (res) {
			        var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
			        var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
			        var speed = res.speed; // 速度，以米/每秒计
			        var accuracy = res.accuracy; // 位置精度
			    }
			});
			*/
			
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;

			if(screenWidth > 640) {
				$('.content').width(640);
				$('.map_div').width(640);
				$('.map_div').height(640 / 3 * 2);
				
				$('.detail_div').width(581);
				$('.detail_div').height(310);
			} else {
				$('.content').width(screenWidth);

				$('.map_div').width(screenWidth);
				$('.map_div').height(screenWidth / 3 * 2);
				
				$('.detail_div').width(581 * proportion);
				$('.detail_div').height(310 * proportion);
			}
			
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var latitude  = position.coords.latitude;
				   	var longitude = position.coords.longitude;
				   	sessionStorage.setItem('latitude', latitude);
				   	sessionStorage.setItem('longitude', longitude);
				   	var latitude = 32.058440;
					var longitude = 118.796540;
				   	refreshmap(latitude, longitude);
				   	nearby(latitude, longitude);
				}, function() {
					toast('无法获取您的位置');
					var latitude = 32.058440;
					var longitude = 118.796540;
					refreshmap(latitude, longitude);
					
					nearby(latitude, longitude);
				})
		    } else{
		    	toast('无法获取定位权限');
		    	var latitude = 32.058440;
				var longitude = 118.796540;
				refreshmap(latitude, longitude);
				nearby(latitude, longitude);
		  	}
		});
		
		var map, center;
		
		function refreshmap(latitude, longitude) {
			center = new qq.maps.LatLng(latitude, longitude);
			map = new qq.maps.Map(document.getElementById("map_div"), {
				//加载地图经纬度信息
				center: center,
				zoom: 13, //设置缩放级别
				draggable: true, //设置是否可以拖拽
				scrollwheel: true, //设置是否可以滚动
				disableDoubleClickZoom: false, //设置是否可以双击放大
			});
		}
		
		function nearby(latitude, longitude) {
			var params = {};
			params.latitude = latitude;
			params.longitude = longitude;
			$.post("/<%=PropKit.get("project_name") %>/mine/shoplist_nearby", params, function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					setListHtml(rescnt);
				}
			}, "json");
		}
		
		function showmaker(latitude, longitude, content, id) {
			var position = new qq.maps.LatLng(latitude, longitude);
			var marker = new qq.maps.Marker({
			    position: position,
			    map: map
			});
			var info = new qq.maps.InfoWindow({
		        map: map
		    });
			qq.maps.event.addListener(marker, 'click', function() {
		       info.open(); 
		       info.setContent('<div style="text-align:center;white-space:nowrap;'+
		       'margin:2px; font-size: 14px;" onclick="shopdetail('+id+')">'+content+'</div>');
		       info.setPosition(position); 
		   	});
		}
		
		function shopdetail(id, shop, telephone, address, latitude, longitude) {
			$('#detail_name').html(shop);
			$('#detail_telephone').html('座机号：' + telephone);
			$('#detail_address').html('地址：' + address);
			$('#detail_lxsj').html('<a style="font-size:14px; color:#fff;" href="tel:'+telephone+'">联系商家</a>');
			$('#detail_name').html(shop);
			$.popup('#detail_popup')
		}
		
		function search() {
			var searchkey = $('#searcheky').val();
			if ($.isEmptyObject(searchkey)) {
				toast('请输入搜索关键字');
				return;
			}
			var params = {};
			params.searchkey = searchkey;
			$.post("/<%=PropKit.get("project_name") %>/mine/shoplist_search", params, function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					setListHtml(rescnt);
				}
			}, "json");
		}
		
		function setListHtml(rescnt) {
			
			var content = '';
			$.hideIndicator();
			var firstcnt = rescnt.first;
			if (!$.isEmptyObject(firstcnt)) {
				$('#first_item_shop').html(firstcnt.shop);
				$('#list_item1').css('display','flex');
				$('#list_item1').bind('click', function(a) {
					shopdetail(firstcnt.id, firstcnt.shop, firstcnt.telephone, firstcnt.address, firstcnt.latitude, firstcnt.longitude);
				});
				refreshmap(firstcnt.latitude, firstcnt.longitude);
				showmaker(firstcnt.latitude, firstcnt.longitude, firstcnt.shop, firstcnt.id);
			} else {
				$('#list_item1').css('display','none');
			}
			$.each(rescnt.list, function(index, cnt) {
				content += '<div onclick="shopdetail('+cnt.id+', \''+cnt.shop+'\', \''+cnt.telephone+'\', \''+cnt.address+'\', \''+cnt.latitude+'\', \''+cnt.longitude+'\')" class="list_item2">\n';
				content += '<div class="list_item2_info">\n';
				content += '<span>'+cnt.shop+'</span>\n';
				content += '<span style="margin-top: 0.6rem;"><img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_fjmd_img3.png" /><label>'+cnt.address+'</label></span>\n';
				content += '<span style="margin-top: 0.2rem;"><img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_fjmd_img4.png" /><label>'+cnt.telephone+'</label></span>\n';
				content += '</div>\n';
				content += '<img class="arrow_right" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png">\n';
				content += '</div>\n';
			});
			$('#list_div').html(content);
		}
			
		</script>
	</body>

</html>