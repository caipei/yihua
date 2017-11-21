<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_leysen.jsp"></jsp:include>
    <title>创客梦想家</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				margin: 0 auto;
				background: #000;
			}
			
			.btns_div {
				position: absolute;
				z-index: 999;
				text-align: right;
				display: block;
				margin: 0 auto;
			}
			
			.ckmxj_img {
				margin-bottom: 0.4rem;
			}
			
			.swiper-container {
				position: absolute;
				right: 0;
			}
			
			.swiper-slide {
				text-align: center;
				background: transparent;
				/* Center slide text vertically */
				display: -webkit-box;
				display: -ms-flexbox;
				display: -webkit-flex;
				display: flex;
				-webkit-box-pack: center;
				-ms-flex-pack: center;
				-webkit-justify-content: center;
				justify-content: center;
				-webkit-box-align: center;
				-ms-flex-align: center;
				-webkit-align-items: center;
				align-items: center;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style=" position: relative; width: 100%; height: 100%;">
					<div style="width: 100%; text-align: center; position: relative;">
						<div style="width: 100%; text-align: center; line-height: 0; position: absolute;">
							<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_sub_img1.jpg"  style="max-width: 100%;" />
							<div id="sub_div1" style="display: none; position: relative; line-height: 0;">
								<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_sub_img3.jpg" style="max-width: 100%;" />
							</div>
							<div id="sub_div2" style="display: none; position: relative; line-height: 0;">
								<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_sub_img2.jpg" style="max-width: 100%;" />
							</div>
							<div id="sub_div3" style="display: block; position: relative; line-height: 0;">
								<div style="position: absolute; text-align: center; width: 100%;">
									<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_sub_img4.jpg" style="max-width: 100%;" />
								</div>
								<div style="position: absolute; text-align: center; width: 100%;">
									<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_sub_img5.png" style="max-width: 100%;" />
									<div id="swiper_container" style="width: 100%; text-align: right; position: relative;">
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<c:forEach items="${yjftlist }" var="yjft">
												<div class="swiper-slide"><img class="swiper-img" src="${yjft.imgpath }" /></div>
												</c:forEach>
											</div>
										</div>
									</div>
									<img src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_sub_img6.png" style="max-width: 100%;" />
								</div>
							</div>
						</div>
						<div class="btns_div" style="width: 100%; text-align: center; line-height: 0; position: absolute;">
							<div style="text-align: right; margin: 0.8rem;">
								<img onclick="yszc(1)" id="yszc_img" class="ckmxj_img" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_yszc_img2.png" /><br />
								<img onclick="yszc(2)" id="jmxx_img" class="ckmxj_img" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jmxx_img1.png" /><br />
								<img onclick="yszc(3)" id="jyft_img" class="ckmxj_img" src="<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jyft_img1.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="ckmxj_type" value="${type }">
		<jsp:include page="footer_leysen.jsp"></jsp:include>
		
		<script type="application/javascript">
			$(document).ready(function(){
				var screenWidth = window.screen.width;
				var proportion = screenWidth / 640;

				if(screenWidth > 640) {
					$('.btns_div').css('width', 640);
					$('.ckmxj_img').css('width', 120);
					$('.content').width(640);
					
					$('#swiper_container').height(245);
					
					$('.swiper-container').width(430);
					$('.swiper-container').height(245);
					
					$('.swiper-img').width(400);
					$('.swiper-img').height(245);
					
					$('.swiper-slide').width(400);
					$('.swiper-slide').height(245);
				} else {
					$('.btns_div').css('width', 640 * proportion);
					$('.ckmxj_img').css('width', 120 * proportion);
					$('.content').width(screenWidth);
					$('.swiper-container').width(430 * proportion);
					$('.swiper-container').height(245 * proportion);
					
					$('#swiper_container').height(245 * proportion);
					
					$('.swiper-img').width(400 * proportion);
					$('.swiper-img').height(245 * proportion);
					
					$('.swiper-slide').width(400 * proportion);
					$('.swiper-slide').height(245 * proportion);
				}
				
				var swiper = new Swiper('.swiper-container', {
					slidesPerView: 1,
					effect: 'coverflow',
					grabCursor: true,
					centeredSlides: true,
					slidesPerView: 'auto',
					spaceBetween: 15,
					coverflow: {
						rotate: 0,
						stretch: 0,
						depth: 100,
						modifier: 1,
						slideShadows: true
					},
					onTransitionEnd: function(swiper) {
					},
					onInit: function(swiper) {
						
					}
				});
				
				$('#sub_div1').hide();
				$('#sub_div2').hide();
				$('#sub_div3').hide();
				$('#yszc_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_yszc_img1.png');
				$('#jmxx_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jmxx_img1.png');
				$('#jyft_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jyft_img1.png');
				var ckmxj_type = $('#ckmxj_type').val();
				if (ckmxj_type == 1) {
					$('#sub_div1').show();
					$('#yszc_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_yszc_img2.png');
				} else if (ckmxj_type == 2) {
					$('#sub_div2').show();
					$('#jmxx_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jmxx_img2.png');
				} else if (ckmxj_type == 3) {
					$('#sub_div3').show();
					$('#jyft_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jyft_img2.png');
				}
			});
			
			function yszc(type) {
				$('#sub_div1').hide();
				$('#sub_div2').hide();
				$('#sub_div3').hide();
				$('#yszc_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_yszc_img1.png');
				$('#jmxx_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jmxx_img1.png');
				$('#jyft_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jyft_img1.png');
				var ckmxj_type = type;
				if (ckmxj_type == 1) {
					$('#sub_div1').show();
					$('#yszc_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_yszc_img2.png');
				} else if (ckmxj_type == 2) {
					$('#sub_div2').show();
					$('#jmxx_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jmxx_img2.png');
				} else if (ckmxj_type == 3) {
					$('#sub_div3').show();
					$('#jyft_img').attr('src', '<%=PropKit.get("front_prefix") %>leysen/res/img/ckmxj_jyft_img2.png');
				}
			}
			
		</script>
	</body>

</html>