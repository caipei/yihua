<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>加盟信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/css/reset.css">
	<link rel="stylesheet" href="<%=PropKit.get("front_prefix") %>leysen_new/dreamer/css/join.css">
</head>
<body style="background: #000">
	<section class="mid">
		<div class="createD">
			<p><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer">creativedreamer</a></p>
		</div>
		<div class="join">
			<ul>
				<li><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer_support">优势支持<i></i></a></li>
				<li><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer_join">加盟信息<i></i></a></li>
				<li><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer_interview">经验访谈<i></i></a></li>
			</ul>
		</div>
	</section>
	<section class="main">
		<div class="main-info">
			<h2><a href="/<%=PropKit.get("project_name") %>/lstl/dreamer">创客盟想家</a></h2>
			<div class="join-info fl"><p>加盟信息</p></div>
			<div class="detail-info fr">
				<div class="pic">
					<div class="pic-1">
						<p>梦想激涌，每个成就都是新起点，莱绅通灵珠宝欢迎每一位创客梦想家的加入，与领军者沈东军一起，用钻石丈量人生宽度，传递值得“为下一代珍藏”的传世珠宝</p>
					</div>
				</div>
				<p>欢迎拨打加盟热线，了解详情:</p>
				<div class="phone cls">400-828-9736</div>
				<p>(加盟热线：此加盟招商电话为公司唯一授权加盟招商电话，除此以外的其他任何电话、手机皆未经公司授权)</p>
				<div class="email cls">jm@tesiro.com</div>
				<p>(加盟邮箱)</p>
				<p>加入我们，你就是下一个创客盟想家</p>
				<h3>可加盟区域:</h3>
				<div class="area">
					<div class="ico"></div>
					<div class="content"><p><span>华东</span>(上海周边区县；江苏连云港灌南县、东海县；江苏淮安洪泽县；安徽部分县市；浙江丽水周边县市；山东德州市、日照市、聊城市、莱芜市、滨州市及周边县市；福建除福州以外市场)</p></div>
				</div>
				<div class="area">
					<div class="ico"></div>
					<div class="content"><p><span>华中</span>(河南鹤壁市、新乡市、濮阳市、漯河市、三门峡市、驻马店市及周边县市；湖北除武汉市、十堰市、宜昌市以外市场；湖南除长沙市、岳阳市以外市场；海南除海口以外市场、广东省）</p></div>
				</div>
				<div class="area">
					<div class="ico"></div>
					<div class="content"><p><span>华北</span> （北京除通州区周边区县、天津周边区县；河北除石家庄市、唐山市、邯郸市、秦皇岛市、保定市以外市场；山西除太原市、临汾市、晋中市、运城市以外市场；内蒙除赤峰市以外市场）</p></div>
				</div>
				<div class="area">
					<div class="ico"></div>
					<div class="content"><p><span>东北</span>（辽宁除沈阳市、大连市以外市场；吉林省；黑龙江省）</p></div>
				</div>
				<div class="area">
					<div class="ico"></div>
					<div class="content"><p><span>西南</span>（重庆周边区县；四川除成都市以外市场；贵州省；云南省；西藏）</p></div>
				</div>
				<div class="area">
					<div class="ico"></div>
					<div class="content"><p><span>西北</span>（陕西除西安以外市场；甘肃省；青海省；宁夏；新疆）</p></div>
				</div>
			</div>
		</div>
		
	</section>
	<script>
		document.documentElement.style.fontSize = document.documentElement.clientWidth/640 * 100 + 'px';
	</script>
</body>
</html>