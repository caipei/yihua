<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="meta_mine.jsp"></jsp:include>
    <title>意见反馈</title>

		<style type="text/css">
			.content {
				position: relative;
				width: 100%;
				height: 100%;
				background: #fff;
				margin: 0 auto;
			}
			
			.detail_div {
				background: url(<%=PropKit.get("front_prefix") %>mine/res/img/mine_yjkf_img1.png) no-repeat;
				background-size: contain;
				margin: 1rem auto;
				display: flex;
				flex-direction: column;
			}
			
			.detail_item_div {
				padding: 0.8rem;
				padding-bottom: 0;
			}
			
			.detail_item_div span {
				
				
			}
			
			.detail_item_div input {
				border: 0;
				background: transparent;
			}
			
			.detail_item_div textarea {
				border: 0;
				background: transparent;
				width: 100%;
				height: 100%;
				resize: none;
			}
			
			.login_btn {
				margin: 1rem auto;
				height: 2rem;
				text-align: center;
				color: #fff;
				background: #16307C;
				line-height: 2rem;
				font-size: 14px;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav" style="background: #fff; border-bottom: 1px solid #0C2978;">
 					<a onclick="history.back()" class="icon icon-left pull-left" style="color: #0C2978"></a>
 					<h1 class="title" style="color: #0C2978">意见反馈</h1>
				</header>
				<div class="content" style="background: #f2f2f2;">
					<div class="detail_div">
						<div class="detail_item_div size6-05">
							<span>姓名：</span>
							<input id="xm" type="text">
						</div>
						<div class="detail_item_div size6-05" style="padding-top: 5px;">
							<span>联系方式：</span>
							<input id="lxfs" type="text">
						</div>
						<div class="detail_item_div size6-05" style="padding-top: 5px; flex: 1; padding-bottom: 10px;">
							<textarea id="content" placeholder="欢迎您输入反馈意见"></textarea>
						</div>
					</div>
					
					<div onclick="submit();" id="submit" class="login_btn" >提交</div>
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
				$('.detail_div').width(582);
				$('.detail_div').height(374);
				
				$('#submit').width(582);
			} else {
				$('.content').width(screenWidth);
				$('.detail_div').width(582 * proportion);
				$('.detail_div').height(374 * proportion);
				
				$('#submit').width(582 * proportion);
			}
		});
		
		function submit() {
			var xm = $('#xm').val();
			var lxfs = $('#lxfs').val();
			var content = $('#content').val();
			if ($.isEmptyObject(xm)) {
				toast('请输入姓名');
				return;
			}
			if ($.isEmptyObject(lxfs)) {
				toast('请输入联系方式');
				return;
			}
			if ($.isEmptyObject(content)) {
				toast('请输入意见内容');
				return;
			}
			var params = {};
			params.xm = xm;
			params.lxfs = lxfs;
			params.content = content;
			$.post("/<%=PropKit.get("project_name") %>/mine/yjfk_submit", params, function (returnJson){
				var rescode = returnJson.rescode;
				var rescnt = returnJson.rescnt;
				if (rescode == '0000') {
					layer.open({
						content: '提交成功，我们将于24小时内处理，感谢您的反馈'
						,btn: '确定'
					    ,yes: function(index){
					    	// 根据类别跳转
					    	history.back();
					    }
					});
					
				} else {
					toast('意见提交失败');
				}
			});
		}
			
		</script>
	</body>

</html>