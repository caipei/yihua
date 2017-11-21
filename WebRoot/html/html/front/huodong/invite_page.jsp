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
		</style>

	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
				<div class="content" style="background: #fff; background-size: cover; width: 100%; height: 100%; position: relative;">

					<div style="text-align: center; width: 100%; position: relative;">
						<img src="<%=PropKit.get("front_res_prefix") %>img/img_24.png" style="max-width: 100%;" />
					</div>
					<div style="text-align: center; position: absolute; width: 100%; bottom: 0; font-size: 0.65rem; color: #01115B; padding: 0 3rem;">
						加入莱绅通灵fans俱乐部<br>
						码上有惊喜<br>
						5.20前于新注册fans里抽出10位幸运者获赠芭莎慈善明星同款手链
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		
		<script type="application/javascript">
		
		$(document).ready(function(){
			
		});
		</script>
	</body>

</html>