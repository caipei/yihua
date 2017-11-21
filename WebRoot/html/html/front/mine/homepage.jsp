<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>TESIRO通灵珠宝</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.items1_div {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/homepage_img5.png) no-repeat;
				background-size: contain;
			}
			
			.items2_div {
				margin-top: 2px;
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/homepage_img_bottom.png) no-repeat;
				background-size: contain;
			}
			
			@media (min-width: 481px) {}
			
			@media ( max-width: 480px) and (min-width: 321px) {}
			
			@media (max-width: 320px) {}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current" style="background: #fff;">
				<div class="content">
					<div style="padding-bottom: 48px;">
						<div class="absolute_img_div">
							<img src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_banner.png" />
						</div>
						<div class="items1_div">
							<div class="absolute_img_div">
								<img onclick="cpsc()" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_cpsc.png" />
							</div>
							<div style="display: flex; align-items: flex-end; justify-content: space-between;">
								<img onclick="jfsc()" class="jfsc_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_jfsc.png" />
								<img onclick="hyzz()" class="hyzz_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_hyzz.png" />
								<img onclick="zshd()" class="zshd_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_zshd.png" />
							</div>
						</div>

						<div class="items2_div">
							<div class="absolute_img_div">
								<img onclick="dy()" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_dy.png" />
							</div>
							<div style="display: flex; align-items: flex-end; justify-content: space-between;">
								<img onclick="lq()" class="lq_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_lq.png" />
								<img onclick="vip()" class="vip_img" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_vip.png" />
							</div>
						</div>
					</div>
				</div>
				<nav class="bar bar-tab bottom" style="background: #fff; display: flex; border-top: 1px solid #f2f2f2;">
					<span onclick="tab_signin();" style="flex: 1; text-align: center; padding-top: 5px;">
						<img style="height: 1.4rem;" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_img1.png" />
						<span style="display: block; font-size: 0.6rem; margin-top: -5px;">签到</span>
					</span>
					<span onclick="tab_mine()" style="flex: 1; text-align: center; padding-top: 5px;">
						<img style="height: 1.4rem;" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_img2.png" />
						<span style="display: block; font-size: 0.6rem; margin-top: -5px;">个人中心</span>
					</span>
					<span onclick="tab_zxkf()" style="flex: 1; text-align: center; padding-top: 5px;">
						<img style="height: 1.4rem;" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_img3.png" />
						<span style="display: block; font-size: 0.6rem; margin-top: -5px;">在线客服</span>
					</span>
					<span onclick="tab_mdgw()" style="flex: 1; text-align: center; padding-top: 5px;">
						<img style="height: 1.4rem;" src="<%=PropKit.get("front_prefix") %>mine/res/img/homepage_img4.png" />
						<span style="display: block; font-size: 0.6rem; margin-top: -5px;">门店顾问</span>
					</span>
				</nav>
			</div>
			
		</div>
		<jsp:include page="footer_mine.jsp"></jsp:include>
		
		<script type="application/javascript">
		$(document).ready(function(){
			var screenWidth = window.screen.width;
			var proportion = screenWidth / 640;

			if(screenWidth > 640) {
				$('.content').width(640);

				$('.items1_div').width(640);
				$('.items1_div').height(478);

				$('.jfsc_img').width(224);
				$('.jfsc_img').height(273);
				$('.hyzz_img').width(174);
				$('.hyzz_img').height(273);
				$('.zshd_img').width(182);
				$('.zshd_img').height(248);

				$('.items2_div').width(640);
				$('.items2_div').height(438);

				$('.lq_img').width(255);
				$('.lq_img').height(258);

				$('.vip_img').width(385);
				$('.vip_img').height(258);
			} else {
				$('.content').width(screenWidth);

				$('.items1_div').width(640 * proportion);
				$('.items1_div').height(478 * proportion);

				$('.jfsc_img').width(224 * proportion);
				$('.jfsc_img').height(273 * proportion);
				$('.hyzz_img').width(174 * proportion);
				$('.hyzz_img').height(273 * proportion);
				$('.zshd_img').width(182 * proportion);
				$('.zshd_img').height(248 * proportion);

				$('.items2_div').width(640 * proportion);
				$('.items2_div').height(438 * proportion);

				$('.lq_img').width(255 * proportion);
				$('.lq_img').height(258 * proportion);

				$('.vip_img').width(385 * proportion);
				$('.vip_img').height(258 * proportion);
			}
			
		});
		
		function lq() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/voucherlist';     
		}
		
		function jfsc() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/jfgoods/';     
		}
		
		function cpsc() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/productlist/';     
		}
		
		function tab_mine() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/mine';
		}
		
		function tab_signin() {
			$.post("/<%=PropKit.get("project_name") %>/mine/signin_json", function (returnJson){
				var rescode = returnJson.rescode;
 			var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					layer.open({content: '签到成功' ,skin: 'msg' ,time: 2 });
				} else {
					layer.open({content: '您已签到' ,skin: 'msg' ,time: 2 });
				}
			});
		}
		
		function tab_zxkf() {
			window.location.href = '/<%=PropKit.get("project_name") %>/mine/fwzx';
		}
			
		</script>
	</body>

</html>