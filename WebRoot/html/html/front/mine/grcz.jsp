<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>个人成长</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
				padding-bottom: 2rem;
			}
			
			.nav {
				position: absolute;
				z-index: 999;
				width: 100%;
				top: 2.2rem;
				border-top: 1px solid #0C2978;
			}
			
			.nav_top {
				background: #fff;
				width: 100%;
				display: flex;
				align-items: baseline;
				margin: 0 auto;
				height: 2rem;
				line-height: 2rem;
				border-bottom: 1px solid #f2f2f2;
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
			
			.nav_top div span {
				font-size: 0.7rem;
			}
			
			.grcz_top_div {
				margin-top: 2rem;
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img2.png) no-repeat;
				background-size: contain;
				border-top: 5px solid #f2f5f8;
				border-bottom: 5px solid #f2f5f8;
				display: flex;
				flex-direction: column;
				justify-content: center;
			}
			
			.grcz_top_item1 {
				text-align: center;
			}
			
			.grcz_top_item1_span {
				display: inline-flex;
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img1.png) no-repeat;
				background-size: contain;
				text-align: center;
				justify-content: center;
				align-items: center;
				align-content: center;
				color: #fff;
			}
			
			.grcz_top_item1_label1 {
				font-style: italic;
				margin-right: 2px;
			}
			
			.grcz_top_item2 {
				padding: 5px 10px 0 10px;
				display: flex;
			}
			
			.grcz_top_item3 {
				padding: 0px 10px 5px 10px;
				display: flex;
				color: #fff;
				font-style: italic;
			}
			
			.grcz_top_item2_line1 {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img7.png) repeat-x;
				background-size: contain;
				flex: 1;
				display: inline-block;
			}
			
			.grcz_top_item2_line0 {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img8.png) repeat-x;
				background-size: contain;
				flex: 1;
				display: inline-block;
			}
			
			.grcz_top_item3_line {
				flex: 1;
				display: inline-block;
			}
			
			.grcz_top_item4 {
				padding: 5px 10px 0;
			}
			
			.grcz_top_item4 span {
				display: block;
				color: #fff;
			}
			
			.text_div {
				padding: 20px 12px;
			}
			
			.text_item1 {
				color: #000;
			}
			
			.text_item2 {
				color: #B0B0B0;
				text-align: justify;
				text-justify: distribute-all-lines;
				/*ie6-8*/
				text-align-last: false;
				/* ie9*/
				-moz-text-align-last: false;
				/*ff*/
				-webkit-text-align-last: false;
				/*chrome 20+*/
			}
			
			.text_item3 {
				background: #013895;
				color: #fff;
				display: flex;
				align-items: center;
				padding: 5px 0;
			}
			
			.text_item4 {
				background: transparent;
				color: #B0B0B0;
				border-bottom: 1px solid #CACACA;
				display: flex;
				align-items: center;
			}
			
			.text_item3 span {
				text-align: center;
			}
			
			.text_item4 span {
				text-align: center;
				border-left: 1px solid #CACACA;
				padding: 8px 0;
			}
			
			.xx_list {
				margin-top: 2rem;
				border-top: 5px solid #f2f5f8;
			}
			
			.xx_item {
				margin: 18px 10px 12px;
				color: #464646;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: false;
				-moz-text-align-last: false;
				-webkit-text-align-last: false;
				overflow: hidden;
				text-overflow: ellipsis;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
			}
			
			.xx_list hr {
				border-top: 1px #F9F9F9 solid;
				margin: 0 10px;
			}
			
			@media (min-width: 481px) {
				.grcz_top_item1_span {
					font-size: 0.7rem;
				}
				.grcz_top_item3 {
					font-size: 0.7rem;
				}
				.grcz_top_item4 span {
					font-size: 0.7rem;
				}
				.text_item1 {
					font-size: 0.85rem;
				}
				.text_item2 {
					font-size: 0.75rem;
					line-height: 1.4rem;
				}
				.text_item3 span,
				.text_item4 span {
					font-size: 0.7rem;
				}
				.xx_item {
					font-size: 0.7rem;
				}
			}
			
			@media ( max-width: 480px) and (min-width: 321px) {
				.grcz_top_item1_span {
					font-size: 0.65rem;
				}
				.grcz_top_item3 {
					font-size: 0.65rem;
				}
				.grcz_top_item4 span {
					font-size: 0.65rem;
				}
				.text_item1 {
					font-size: 0.8rem;
				}
				.text_item2 {
					font-size: 0.7rem;
					line-height: 1.2rem;
				}
				.text_item3 span,
				.text_item4 span {
					font-size: 0.65rem;
				}
				.xx_item {
					font-size: 0.65rem;
				}
			}
			
			@media (max-width: 320px) {
				
				.grcz_top_item1_span {
					font-size: 0.6rem;
				}
				.grcz_top_item3 {
					font-size: 0.6rem;
				}
				.grcz_top_item4 span {
					font-size: 0.6rem;
				}
				.text_item1 {
					font-size: 0.75rem;
				}
				.text_item2 {
					font-size: 0.65rem;
					line-height: 1rem;
				}
				.text_item3 span,
				.text_item4 span {
					font-size: 0.6rem;
				}
				.xx_item {
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
 					<h1 class="title" style="color: #0C2978">个人成长</h1>
				</header>
				<div class="nav">
					<div class="nav_top">
						<div>
							<span id="czlc_span" onclick="czlc()" class="on">
								成长历程
							</span>
						</div>
						<div>
							<span id="xxts_span" onclick="xxts()">
								消息提示
							</span>
						</div>
					</div>
				</div>
				<div id="czlc_div" class="content" style="display: block;">
					<div class="grcz_top_div">
						<div class="grcz_top_item1">
							<span class="grcz_top_item1_span">
								<span>
									<label class="grcz_top_item1_label1">V</label>${level }
								</span>
							</span>
						</div>
						<div class="grcz_top_item2">
							<span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img1${level1}.png" />
							</span>
							<span class="grcz_top_item2_line grcz_top_item2_line${level2}"></span>
							<span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img2${level2}.png" />
							</span>
							<span class="grcz_top_item2_line grcz_top_item2_line${level3}"></span>
							<span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img3${level3}.png" />
							</span>
							<span class="grcz_top_item2_line grcz_top_item2_line${level4}"></span>
							<span>
								<img src="<%=PropKit.get("front_prefix") %>mine/res/img/mine_grcz_img4${level4}.png" />
							</span>
						</div>
						<div class="grcz_top_item3">
							<span>
								铂金
							</span>
							<span class="grcz_top_item3_line"></span>
							<span>
								钻石
							</span>
							<span class="grcz_top_item3_line"></span>
							<span>
								克拉
							</span>
							<span class="grcz_top_item3_line"></span>
							<span>
								蓝钻
							</span>
						</div>
						<div class="grcz_top_item4">
							<c:if test="${level eq 1}">
								<span>[当前等级铂金</span>
								<span>升级至下一等级还需消费${tiertierupgradehint }元 ]</span>
							</c:if>
							<c:if test="${level eq 2}">
								<span>[当前等级钻石</span>
								<span>升级至下一等级还需消费${tiertierupgradehint }元 ]</span>
							</c:if>
							<c:if test="${level eq 3}">
								<span>[当前等级克拉</span>
								<span>升级至下一等级还需消费${tiertierupgradehint }元 ]</span>
							</c:if>
							<c:if test="${level eq 4}">
								<span>[当前等级蓝钻]</span>
							</c:if>
						</div>
					</div>
					<div class="text_div">
						<div class="text_item1">如何加入会员？</div>
						<div class="text_item2" style="margin-top: 20px;">在Leysen1855莱绅通灵购买任意饰品即可成为VIP成员，会籍终身有效。</div>

						<div class="text_item3" style="margin-top: 10px;">
							<span style="flex: 2;">现有会籍</span>
							<span style="flex: 5;">累计消费金额<br>（包含入会消费金额）</span>
						</div>
						<div class="text_item4">
							<span style="flex: 2;">铂金</span>
							<span style="flex: 5;border-right: 1px solid #CACACA;">累计消费＜1万元</span>
						</div>
						<div class="text_item4">
							<span style="flex: 2;">钻石</span>
							<span style="flex: 5;border-right: 1px solid #CACACA;">1万元≤累计消费＜10万元</span>
						</div>
						<div class="text_item4">
							<span style="flex: 2;">克拉</span>
							<span style="flex: 5;border-right: 1px solid #CACACA;">10万元≤累计消费＜50万元</span>
						</div>
						<div class="text_item4">
							<span style="flex: 2;">蓝钻</span>
							<span style="flex: 5;border-right: 1px solid #CACACA;">50万元≤累计消费</span>
						</div>

						<div class="text_item1" style="margin-top: 30px;">会籍管理</div>
						<div class="text_item2" style="margin-top: 15px;">1、等级调整<br>消费累计金额达到更高级别的标准时，可即时升级或跳级，享受相应级别的会员权益。</div>
						<div class="text_item2" style="margin-top: 15px;">2、权益终止<br>会员卡仅限卡主本人使用，如使用会员卡获取不正当利益，您的会员卡将被冻结或取消会员资格。</div>
						<div class="text_item4" style="margin-top: 5px;">
							<span style="flex: 1; border-top: 1px solid #CACACA;">铂金</span>
							<span style="flex: 1; border-top: 1px solid #CACACA;">钻石</span>
							<span style="flex: 1; border-top: 1px solid #CACACA;">克拉</span>
							<span style="flex: 1; border-top: 1px solid #CACACA; border-right: 1px solid #CACACA;">蓝钻</span>
						</div>
						<div class="text_item4">
							<span style="flex: 1;">一次9折</span>
							<span style="flex: 1;">9折</span>
							<span style="flex: 1;">8.8折</span>
							<span style="flex: 1; border-right: 1px solid #CACACA;">8.5折</span>
						</div>
						<div class="text_item1" style="margin-top: 30px;">会员权益</div>
						<div class="text_item2" style="margin-top: 15px;">1、折扣权益<br>购买指定产品（素金、特价及特殊强调饰品除外）可享有相应折扣优惠</div>
						<div class="text_item2" style="margin-top: 15px;">2、积分权益<br>积分获取方式：消费/推荐消费/活动参与<br>积分规则：<br>以消费实际支付金额换算积分，1元=1分；<br>首次正价或使用推荐券购买可享受积分；<br>素金/特价类商品/低于会员折扣消费享0.5倍积分；<br>参与莱绅通灵指定活动，可根据活动规则获取相应积分。</div>
						<div class="text_item2" style="margin-top: 15px;">3、推荐消费权益<br>会员可在会员礼券中获取推荐券，推荐好友消费，好友可尊享推荐优惠，推荐双方更可获得等值消费积分。</div>
						<div class="text_item2" style="margin-top: 15px;">4、生子权益<br>克拉及蓝钻会员在其子女一周岁以内尊享精美（婴幼儿）饰品一件，可凭卡主身份证及子女出生医学证明到店申领。</div>
						<div class="text_item2" style="margin-top: 15px;">5、售后服务权益<br>享受专业的清洗保养服务；<br/>个性化及高端定制等增值服务。</div>
					</div>
				</div>

				<div id="xxts_div" class="content" style="display: none;">
					<div class="xx_list">
						<div class="xx_item">
							1、消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息
						</div>
						<hr />
						<div class="xx_item">
							1、消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息
						</div>
						<hr />
						<div class="xx_item">
							1、消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息
						</div>
						<hr />
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;

			if(screenWidth > 640) {
				$('.content').width(640);
				$('.nav_top').width(640);

				$('.grcz_top_div').width(640);
				$('.grcz_top_div').height(370);

				$('.grcz_top_item1_span').width(150);
				$('.grcz_top_item1_span').height(148);

				$('.grcz_top_item2 img').height(31);
				$('.grcz_top_item2_line').height(31);

				$('.grcz_top_item1_span span').css('padding-right', '10px');

				$('.grcz_top_item1_label1').css('font-size', '1.8rem');

			} else {
				$('.content').width(screenWidth);
				$('.nav_top').width(screenWidth);

				$('.grcz_top_div').width(640 * proportion);
				$('.grcz_top_div').height(370 * proportion);

				$('.grcz_top_item1_span').width(150 * proportion);
				$('.grcz_top_item1_span').height(148 * proportion);

				$('.grcz_top_item2 img').height(31 * proportion);
				$('.grcz_top_item2_line').height(31 * proportion);

				$('.grcz_top_item1_span span').css('padding-right', 10 * proportion + 'px');

				$('.grcz_top_item1_label1').css('font-size', 1.8 * proportion + 'rem');

			}
		});
		
		function czlc() {
			$('#czlc_span').addClass('on');
			$('#xxts_span').removeClass('on');
			$('#czlc_div').show();
			$('#xxts_div').hide();
		}
		
		function xxts() {
			$('#xxts_span').addClass('on');
			$('#czlc_span').removeClass('on');
			$('#xxts_div').show();
			$('#czlc_div').hide();
		}
			
		</script>
	</body>

</html>