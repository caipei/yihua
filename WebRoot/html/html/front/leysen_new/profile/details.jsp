<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>公司概况</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/profile/css/details.css">
</head>
<body>
	<div id="main">
		<div id="header">
			<div class="header">
				<div class="nav"></div>
			</div>
			<div class="hid">
				<div class="hid-1 cool"><a href="javascript:void(0)"><span>公司概况</span><i></i></a></div>
				<div class="hid-2"><a href="/<%=PropKit.get("project_name") %>/lstl/profile_story">品牌历程</a></div>
				<div class="hid-3"><a href="/<%=PropKit.get("project_name") %>/lstl/profile_lastednews">最新动态</a></div>
			</div>
			<div class="pro">
				<p>公司简介</p>
				<i></i>
			</div>
		</div>
		<div class="main">
			<div class="pic-1"><img src="<%=PropKit.get("front_prefix") %>leysen_new/profile/images/flower.jpg" alt=""></div>
			<div class="content">
				<p>莱绅通灵是一个为顾客创造值得“为下一代珍藏，直至世代传承”的珠宝首饰品牌。公司从事中高档首饰产品的设计、研发及销售，核心业务是对"莱绅通灵"和"传世翡翠"两个珠宝品牌的连锁经营管理。</p>
				<p>莱绅通灵是全球著名的钻石贸易切割机构(EDT)投资的珠宝品牌，已连续9年作为柏林电影节官方合作伙伴、为国际明星所钟爱，其独家发售的BLUE FLAME曾作为比利时国礼，于2009年在比利时王储见证下赠与中国代表团。</p>
			</div>
			<div class="clock clearfix">
				<div class="pic-2 fl"><img src="<%=PropKit.get("front_prefix") %>leysen_new/profile/images/clock.jpg" alt=""></div>
				<div class="content-1 fr">
					<div class="line line1"></div>
					<h2>品牌优势是莱绅通灵的核心竞争优势 </h2>
					<p>莱绅通灵专注于比利时优质切工钻石的推广及传世翡翠文化的传播，为消费者提供值得"为下一代珍藏"的传世珠宝</p>
				</div>
			</div>
			<p style="margin-top:.1rem;margin-bottom:.2rem;">公司始终致力于建设有国际竞争力的珠宝品牌，逐步将“莱绅通灵”品牌价值塑造为公司的核心竞争力之一。 </p>
			<div class="pic-3">
				<div class="pic-right"><img src="<%=PropKit.get("front_prefix") %>leysen_new/profile/images/worker.jpg" alt=""></div>
				<div class="pic-left"><img src="<%=PropKit.get("front_prefix") %>leysen_new/profile/images/machine.jpg" alt=""></div>
			</div>
			<p class="hp bold">自主研发设计优势</p>
			<p class="hp">公司始终致力于产品创新，为消费者提供设计独特、品质卓越的产品。莱绅通灵"蓝色火焰"系列产品是拥有89面切工的钻石产品相对于传统的50-59面切工的钻石，其光线折射更加丰富。近年来，"蓝色火焰"获得一系列荣誉，并因此形成了莱绅通灵独特的产品优势。</p>
			<p class="hp" style="margin-bottom:.2rem;">此外，公司注重引进和培养珠宝首饰设计师团队，并不断吸取国际珠宝饰品设计潮流元素，在创造和巩固经典的基础上，不断推陈出新。</p>
			<div class="pic-4">
				<img src="<%=PropKit.get("front_prefix") %>leysen_new/profile/images/taken.jpg" alt="">
			</div>
			<p class="hp bold">供应商整合优势</p>
			<p class="hp" style="margin-bottom:.2rem;">经过多年的品牌运作，公司积累的丰富优质的供应商、物流及渠道资源，与供应链各方构成了长期而稳定的合作关系。同时，公司已建立以SAP、ERP管理系统为平台，名店,商品部，仓储物流以及公司各相关部门，共同参与的供应链管理体系，以实际对客户需求、门店库存及补货、供应商及渠道动态等信息的及时掌控</p>
			<div class="pic-5 clearfix">
				<div class="content-l fl">
					<div class="line"></div>
					<p class="hp">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截止2017年2月末， 公司在北京、上海、杭州、南京、武安等20个省市自治区拥有门店数量达到近600家，形成了覆盖全国的珠宝首饰销售网络，近年来取得了良好的销售业绩。</p>
				</div>
				<div class="pic-r fr">
					<img src="<%=PropKit.get("front_prefix") %>leysen_new/profile/images/house.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
	<script src="<%=PropKit.get("front_prefix") %>leysen_new/profile/js/jquery-3.1.0.min.js"></script>
	<script>
		var font = document.documentElement.clientWidth/640;
		$('.cool').click(function(){
			var hidH = $('.hid').height();
			if(hidH<=40*font){
				$('.hid').animate({height:'1.6rem'},300);
				$('.hid').css({background:'rgba(57,62,82,0.8)'});
				$(this).find('i').css({borderColor:'transparent transparent #636468 transparent',marginTop:'0'})
			}else{
				$('.hid').animate({height:'0.4rem'},300);
				$('.hid').css({background:'transparent'})
				$(this).find('i').css({borderColor:'#636468 transparent transparent  transparent',marginTop:'0.06rem'})
			}
			
		});
	</script>
</body>
</html>