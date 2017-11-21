<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="../meta.jsp"></jsp:include>
    <title>邀请好友</title>
		<style type="text/css">
			.shuoming_span {
				display: block;
				text-align: left;
				width: 100%;;
				color: #000;
				font-size: 0.65rem;
				text-align: justify;
				text-justify: distribute-all-lines;
				text-align-last: left;
				-moz-text-align-last: left;
				-webkit-text-align-last: left;
			}
			
			.close_span {
				padding: 0.1rem 0.8rem;
				border: 1px solid #898A8E;
				font-size: 0.65rem;
				color: #898A8E;
				border-radius: 2rem;
				display: inline-block;
			}
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style="background: url(<%=PropKit.get("front_res_prefix") %>img/bg_04.jpg); background-size: cover; width: 100%; height: 100%; position: relative;">

					<div style="margin-top: 2.5rem; text-align: center; position: absolute; top: 1.5rem; width: 100%;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/img_16.png" style="max-width: 100%;" />
					</div>
					
					<div style="text-align: center; margin-top: 1rem; position: relative;"><img src="<%=PropKit.get("front_res_prefix") %>img/icon_logo.png" style="height: 2rem;" /></div>
					
					<div style="text-align: center; position: absolute; width: 100%; bottom: 0;">
						<div style="text-align: center; position: relative; margin-bottom: 0.5rem">
							<span class="tip_content_span" id="tip_content_div">
								<span style="display: block;">${remark}<br></span>
								<img onclick="toinvite();" style="height: 1.8rem; margin-top: 0.5rem;" src="<%=PropKit.get("front_res_prefix") %>img/img_17.png"/>
							</span>
						</div>
						<div style="display: flex; align-items: center; padding: 0 0.5rem; margin-bottom: 0.5rem">
							<span onclick="show_shuoming();" style="display: inline-block; font-size: 0.65rem; flex: 1; text-decoration:underline; color: #fff; text-align: left;">点击查看活动说明</span>
							<span style="display: inline-block; font-size: 0.65rem; color: #fff; height: 1.2rem; background: #4F5EB9; border-radius: 1.2rem; line-height: 1.2rem; padding: 0 0.3rem;">活动已结束</span>
						</div>
						<div style=" height: 12rem; overflow: hidden; overflow-y: auto; width: 100%; background: #4F5EB9;">
							<c:forEach items="${list }" var="info">
								<c:if test="${info.ismobile eq 0 }">
									<div style="width: 100%; padding: 0.5rem; display: flex; border-bottom: 1px solid #334394; align-items: center;">
										<img src="${info.icon}" style="width: 2.4rem; height: 2.4rem; border-radius: 2rem; display:none" />
										<div style="flex: 1; text-align: left; margin-left: 0.6rem;">
											<span style="display: block; font-size: 0.65rem; color: #fff; line-height: 1.2rem;">${info.nickname }（第${info.inviteindex }名）</span>
											<span style="display: block; font-size: 0.65rem; color: #fff; line-height: 1.2rem;"><img src="<%=PropKit.get("front_res_prefix") %>img/img_19.png" style="height: 0.65rem; margin-right: 0.3rem; vertical-align: middle; margin-top: -4px;" /><label>已邀请${info.invitenum }位好友</label></span>
										</div>
									</div>
								</c:if>
								<c:if test="${info.ismobile eq 1 }">
									<div style="width: 100%; padding: 0.5rem; display: flex; border-bottom: 1px solid #334394; align-items: center; background: #fff">
										<img src="${info.icon}" style="width: 2.4rem; height: 2.4rem; border-radius: 2rem; display:none" />
										<div style="flex: 1; text-align: left; margin-left: 0.6rem;">
											<span style="display: block; font-size: 0.65rem; color: #4F5EB9; line-height: 1.2rem;">${info.nickname }（第${info.inviteindex }名）</span>
											<span style="display: block; font-size: 0.65rem; color: #4F5EB9; line-height: 1.2rem;"><img src="<%=PropKit.get("front_res_prefix") %>img/img_27.png" style="height: 0.65rem; margin-right: 0.3rem; vertical-align: middle; margin-top: -4px;" /><label>已邀请${info.invitenum }位好友</label></span>
										</div>
									</div>
								</c:if>
							
							</c:forEach>
						</div>
					</div>
					
					<div id="shuoming" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; display:none">
						<div style="position: absolute; background: #000; opacity:0.4; filter:alpha(opacity=40); width: 100%; height: 100%;"></div>
						<div style="position: absolute; opacity:0.9; filter:alpha(opacity=90); width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
							<div id="shuoming_div" style="background: #fff; border-radius: 0.2rem; padding: 0.5rem; text-align: center;">
								<span class="shuoming_span">
									即日起邀请好友注册成为通灵珠宝FANS，5.20前邀请注册人数排名前十位的用户，即可获得迪士尼成人门票1张 
								</span>
								<span onclick="close_shuoming()" class="close_span" style="margin-top: 0.5rem;">关闭</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="token" value="${token }">
		<jsp:include page="../footer.jsp"></jsp:include>
		
		<script type="application/javascript">
		
		$(document).ready(function(){
			
			$('#tip_content_div').width($(window).width() - 140);
			
			$('#shuoming_div').width($(window).width() - 140);
		});
		
		function toinvite() {
			
			window.location.href = '/<%=PropKit.get("project_name") %>/hd/invite?token=' + $('#token').val();
		}
		
		function show_shuoming() {
			
			$('#shuoming').show();
			
		}
		
		function close_shuoming() {
			
			$('#shuoming').hide();
		}
		</script>
	</body>

</html>