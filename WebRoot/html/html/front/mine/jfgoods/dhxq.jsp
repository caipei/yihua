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
			
			.item_div {
				display: flex;
				align-items: center;
				padding: 10px;
				border-top: 10px solid #f2f2f2;
				border-bottom: 10px solid #f2f2f2;
			}
			
			.title_div {
				margin-left: 8px;
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
			
			.dhxq_sm_div {
				flex: 1;
				margin-left: 20px;
				border-bottom: 0px solid #f2f2f2;
				padding: 15px 0;
			}
			
			.dhxq_sm_txt {
				display: block;
				font-size: 14px;
				color: #545454;
				padding-right: 10px;
			}
			
			.dhxq_sm_txt_on {
				display: block;
				font-size: 14px;
				color: #013895;
				padding-right: 10px;
			}
			
			.dhxq_xian {
				display: inline-block;
				width: 9px;
				height: 9px;
				border-radius: 8px;
				background: #DBDBDB;
				top: 20px;
				right: -5px;
				position: absolute;
			}
			
			.dhxq_xian_on {
				display: inline-block;
				width: 13px;
				height: 13px;
				border-radius: 12px;
				background: #013895;
				top: 0px;
				border: 1px solid #D2E1FE;
				right: -7px;
				position: absolute;
			}
			
			.dhxq_xian_div {
				width: 20px;
				border-right: 1px solid #D2D2D2;
				position: relative;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<header class="bar bar-nav" style="background: #fff">
					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #000061"></a>
					<h1 class="title" style="color: #000061">兑换详情</h1>
				</header>
				<div class="content" style="background: #f2f2f2;">
					<div class="item_div" style="background: #fff;">
						<img class="goods_img" src="${jfgoodsimgpath}" />
						<div class="title_div">
							<span class="title_span size7-05-05">
								${jfgoodsname}
							</span>
							<span class="price_span">
								<span class="price_label size6-05-05">${pricecontent}</span><span class="num_label size6-05">x${num}</span>
							</span>
						</div>
					</div>
					<div style="padding: 10px; border-bottom: 1px solid #f2f2f2; background: #fff;" class="size7-05">您的兑换礼品已经开始处理，当前进度如下：</div>
					<div style="width: 100%; background: #fff; padding: 15px 0 0;">
						<c:if test="${orderstate eq 1 }">
							<div style="display: flex;">
								<div style="width: 20px; border-right: 1px solid #D2D2D2; position: relative; margin-top: 3px;">
									<span class="dhxq_xian_on"></span>
								</div>
								<div style="flex: 1;margin-left: 20px; padding-bottom: 15px;">
									<span class="dhxq_sm_txt_on">已开始处理</span>
								</div>
							</div>
						</c:if>
						<c:if test="${orderstate eq 2 }">
							<div style="display: flex;">
								<div style="width: 20px; border-right: 1px solid #D2D2D2; position: relative; margin-top: 3px;">
									<span class="dhxq_xian_on"></span>
								</div>
								<div style="flex: 1;margin-left: 20px; border-bottom: 1px solid #f2f2f2; padding-bottom: 15px;">
									<span class="dhxq_sm_txt_on">已发货</span>
								</div>
							</div>
							<div style="display: flex;">
								<div class="dhxq_xian_div">
									<span class="dhxq_xian"></span>
								</div>
								<div class="dhxq_sm_div">
									<span class="dhxq_sm_txt">已开始处理</span>
								</div>
							</div>
						</c:if>
						<c:if test="${orderstate eq 3 }">
							<div style="display: flex;">
								<div style="width: 20px; border-right: 1px solid #D2D2D2; position: relative; margin-top: 3px;">
									<span class="dhxq_xian_on"></span>
								</div>
								<div style="flex: 1;margin-left: 20px; border-bottom: 1px solid #f2f2f2; padding-bottom: 15px;">
									<span class="dhxq_sm_txt_on">已到店[${shopname }]</span>
								</div>
							</div>
							<div style="display: flex;">
								<div class="dhxq_xian_div">
									<span class="dhxq_xian"></span>
								</div>
								<div class="dhxq_sm_div" style=" border-bottom: 1px solid #f2f2f2;">
									<span class="dhxq_sm_txt">已发货</span>
								</div>
							</div>
							<div style="display: flex;">
								<div class="dhxq_xian_div">
									<span class="dhxq_xian"></span>
								</div>
								<div class="dhxq_sm_div">
									<span class="dhxq_sm_txt">已开始处理</span>
								</div>
							</div>
						</c:if>
						
						<c:if test="${orderstate eq 4 }">
							<div style="display: flex;">
								<div style="width: 20px; border-right: 1px solid #D2D2D2; position: relative; margin-top: 3px;">
									<span class="dhxq_xian_on"></span>
								</div>
								<div style="flex: 1;margin-left: 20px; border-bottom: 1px solid #f2f2f2; padding-bottom: 15px;">
									<span class="dhxq_sm_txt_on">已领取</span>
								</div>
							</div>
							<div style="display: flex;">
								<div class="dhxq_xian_div">
									<span class="dhxq_xian"></span>
								</div>
								<div class="dhxq_sm_div" style=" border-bottom: 1px solid #f2f2f2;">
									<span class="dhxq_sm_txt">已到店[${shopname }]</span>
								</div>
							</div>
							<div style="display: flex;">
								<div class="dhxq_xian_div">
									<span class="dhxq_xian"></span>
								</div>
								<div class="dhxq_sm_div" style=" border-bottom: 1px solid #f2f2f2;">
									<span class="dhxq_sm_txt">已发货</span>
								</div>
							</div>
							<div style="display: flex;">
								<div class="dhxq_xian_div">
									<span class="dhxq_xian"></span>
								</div>
								<div class="dhxq_sm_div">
									<span class="dhxq_sm_txt">已开始处理</span>
								</div>
							</div>
						</c:if>
					</div>

					<div style="height: 2rem; margin-top: 10px; background: #fff; display: flex; font-size: 14px; line-height: 2rem;">
						<span style="display: inline-block; flex: 1; text-align: center;">客服</span>
						<span onclick="grzx();" style="display: inline-block; flex: 1; text-align: center;">个人中心</span>
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
			var imgwidth = (screenWidth - 20) / 3;
			var imgheight = imgwidth / 3 * 2;
			$('.goods_img').width(imgwidth);
			$('.goods_img').height(imgheight);
			$('.title_div').height(imgheight);
		}
		
		function grzx() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/';
		}
		
			
		</script>
	</body>

</html>