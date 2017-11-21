<%@page import="com.jfinal.kit.PropKit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><%=PropKit.get("project_title") %></title>
<meta name="renderer" content="webkit">
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/jquery-1.10.2.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/md5/jquery.md5.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/layer/layer.js"></script>
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
html, body { height: 100%; overflow: hidden; }
body {
    font-family: "Verdana", "Tahoma", "Lucida Grande", "Microsoft YaHei", "Hiragino Sans GB", sans-serif;
    background: url(/<%=PropKit.get("project_name") %>/res/images/loginbg_01.jpg) no-repeat center center fixed;
    background-size: cover;
}
.form-control{height:37px;}
.main_box{position:absolute; top:45%; left:50%; margin:-200px 0 0 -180px; padding:15px 20px; width:360px; height:400px; min-width:320px; background:#FAFAFA; background:rgba(255,255,255,0.5); box-shadow: 1px 5px 8px #888888; border-radius:6px;}
.login_msg{height:30px;}
.input-group >.input-group-addon.code{padding:0;}
#captcha_img{cursor:pointer;}
.main_box .logo img{height:50px;}
@media (min-width: 768px) {
    .main_box {margin-left:-240px; padding:15px 55px; width:480px;}
    .main_box .logo img{height:50px;}
}
.logo{
	line-height: 32px;
	color: #EDEBEE;
	font-size: 32px;
}
</style>
<script type="text/javascript">
$(function() {
	choose_bg();
	$("#login").click(function(){
		$("#login").attr("disabled", true);
		var username = $("#username").val();
		var password = $("#password").val();
		password = $.md5(username + password);
		$.post("/<%=PropKit.get("project_name") %>/admin/verify", {username:username,password:password}, function (returnJson){
			var rescode = returnJson.rescode;
			if (rescode == '0000') {
				window.location.href = "/<%=PropKit.get("project_name") %>/admin/";
			} else {
				$("#login").attr("disabled", false);
				layer.alert('登录失败', {
					  	closeBtn: 0
					}, function(index){
						layer.close(index);
					});
			}
		}, "json");
		
	    return false;
	});
});

function choose_bg() {
    var bg = Math.floor(Math.random() * 9 + 1);
    $('body').css('background-image', 'url(/<%=PropKit.get("project_name") %>/res/images/loginbg_0'+ bg +'.jpg)');
}
</script>
</head>
<body>
<!--[if lte IE 7]>
<style type="text/css">
#errorie {position: fixed; top: 0; z-index: 100000; height: 30px; background: #FCF8E3;}
#errorie div {width: 900px; margin: 0 auto; line-height: 30px; color: orange; font-size: 14px; text-align: center;}
#errorie div a {color: #459f79;font-size: 14px;}
#errorie div a:hover {text-decoration: underline;}
</style>
<div id="errorie"><div>您还在使用老掉牙的IE，请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
<![endif]-->
<div class="container">
    <div class="main_box">
        <form id="login_form" method="post">
        	<br/>
            <p class="text-center logo"><%=PropKit.get("project_title") %></p>
            <br/>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon-user"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" id="username" name="username" value="" placeholder="登录账号" aria-describedby="sizing-addon-user">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon-password"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="登录密码" aria-describedby="sizing-addon-password">
                </div>
            </div>
            <br/>
            <div class="text-center">
                <button type="button" id="login" class="btn btn-primary">&nbsp;登&nbsp;录&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="reset" class="btn btn-default">&nbsp;重&nbsp;置&nbsp;</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>