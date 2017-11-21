<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta_mine.jsp"></jsp:include>
    <title>兑换记录</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.nav {
				position: absolute;
				z-index: 999;
				width: 100%;
				margin-top: 2.2rem;
			}
			
			.nav_top {
				background: #fff;
				width: 100%;
				display: flex;
				align-items: baseline;
				margin: 0 auto;
				height: 2rem;
				line-height: 40px;
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
				color: #013895;
			}
			
			
			.nav_top div span {
				font-size: 0.7rem;
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
			
			.list {
				margin-top: 2rem;
				border-top: 10px solid #f2f2f2;
			}
			
			.list_item {
				padding: 10px;
				display: flex;
				align-items: center;
				border-bottom: 10px solid #f2f2f2;
			}
			
			.list_item_div {
				display: inline-flex;
				flex: 1;
				margin: 0 5px;
				flex-direction: column;
				justify-content: space-between;
			}
			
			.list_item_span span {
				display: block;
			}
			
			.list_item_sm_label {
				border: 1px solid #F90000;
				padding: 1px 4px;
				color: #F90000;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #f2f2f2;">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
 					<h1 class="title" style="color: #000061">兑换记录</h1>
				</header>
				<div class="nav">
					<div class="nav_top">
						<div onclick="yzf();">
							<span id="yzf_span" class="on">
								已支付
							</span>
							<span>
								<img id="yzf_arrow_img" class="img_arrow" style="margin-left: 3px; width: 10px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down_1.png" />
							</span>
						</div>
						<div onclick="wzf();">
							<span id="wzf_span">
								未支付
							</span>
							<span>
								<img id="wzf_arrow_img" class="img_arrow" style="margin-left: 3px; width: 10px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down.png" />
							</span>
						</div>
					</div>
				</div>
				<div class="content">
					
					<div id="yzf_list_div" class="list">
						<c:forEach items="${yzflist }" var="yzf">
						<div onclick="dhxq(${yzf.id }, ${yzf.jfgoodstype});" class="list_item">
							<img class="list_item_img" src="${yzf.jfgoodsimgpath }" />
							<div class="list_item_div">
								<span class="list_item_span">
									<span class="size7-05">${yzf.jfgoodsname }</span>
									<span>
									</span>
								</span>
								<c:if test="${yzf.jfgoodstype eq 1 }">
								<span class="size6-05-05" style="color: #00127E;">${yzf.statename }</span>
								</c:if>
							</div>
							<span>
								<img style="width: 6px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png">
							</span>
						</div>
						</c:forEach>
					</div>
					
					<div id="wzf_list_div" class="list" style="display: none;">
						<c:forEach items="${wzflist }" var="wzf">
						<div class="list_item">
							<img class="list_item_img" src="${wzf.jfgoodsimgpath }" />
							<div class="list_item_div">
								<span class="list_item_span">
									<span class="size7-05">${wzf.jfgoodsname }</span>
									<span>
									</span>
								</span>
								<span class="size6-05-05" style="color: #00127E;">未支付</span>
							</div>
							<span>
								<img style="width: 6px;" src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grzx_arrow_right.png">
							</span>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			refreshcss();
		});
		
		function refreshcss() {
			$('.content').width(screenWidth);
			$('.nav_top').width(screenWidth);
			var imgwidth = (screenWidth - 20) / 3;
			var imgheight = imgwidth / 3 * 2;
			$('.list_item_img').width(imgwidth);
			$('.list_item_img').height(imgheight);
			$('.list_item_div').height(imgheight);
		}
		
		function wzf() {
			
			$('#wzf_span').addClass('on');
			$('#yzf_span').removeClass('on');
			$('#wzf_arrow_img').attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down_1.png');
			$('#yzf_arrow_img').attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down.png');
		
			$('#wzf_list_div').show();
			$('#yzf_list_div').hide();
		}
		
		function yzf() {
			
			$('#wzf_span').removeClass('on');
			$('#yzf_span').addClass('on');
			$('#wzf_arrow_img').attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down.png');
			$('#yzf_arrow_img').attr('src', '<%=PropKit.get("front_prefix") %>mine/res/img/mine_login_arrow_down_1.png');
		
			$('#wzf_list_div').hide();
			$('#yzf_list_div').show();
		}
		
		function dhxq(id, jfgoodstype) {
			if (jfgoodstype == 1) {
				window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/dhxq?id=' + id;
			}
		}
			
		</script>
	</body>

</html>