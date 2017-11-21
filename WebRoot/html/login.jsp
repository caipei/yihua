<%@page import="com.jfinal.kit.PropKit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=PropKit.get("project_title") %></title>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/jquery-1.9.1.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/jquery.cookie.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/md5.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/md5.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/bjui-all.js"></script>
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/css/bootstrap.min.css" rel="stylesheet">
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/css/style.css" rel="stylesheet">
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/blue/core.css" id="bjui-link-theme" rel="stylesheet">

<style type="text/css">
* {font-family: "Verdana", "Tahoma", "Lucida Grande", "Microsoft YaHei", "Hiragino Sans GB", sans-serif;}
body {
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
a:link {color: #285e8e;}
.main_box {
    position: absolute; top:50%; left:50%; margin-top:-260px; margin-left: -300px; padding: 30px; width:600px; height:360px;
    background: #FAFAFA; background: rgba(255,255,255,0.5); border: 1px #DDD solid;
    border-radius: 5px;
    -webkit-box-shadow: 1px 5px 8px #888888; -moz-box-shadow: 1px 5px 8px #888888; box-shadow: 1px 5px 8px #888888;
}
.main_box .setting {position: absolute; top: 5px; right: 10px; width: 10px; height: 10px;}
.main_box .setting a {color: #FF6600;}
.main_box .setting a:hover {color: #555;}
.login_logo {margin-bottom: 10px; height: 25px; text-align: center;}
.login_logo img {height: 45px;}
.login_msg {text-align: center; font-size: 16px;}
.login_form {padding-top: 20px; font-size: 16px;}
.login_box .form-control {display: inline-block; *display: inline; zoom: 1; width: auto; font-size: 18px;}
.login_box .form-control.x319 {width: 319px;}
.login_box .form-control.x164 {width: 164px;}
.login_box .form-group {margin-bottom: 20px;}
.login_box .form-group label.t {width: 120px; text-align: right; cursor: pointer;}
.login_box .form-group.space {padding-top: 15px; border-top: 1px #FFF dotted;}
.login_box .form-group img {margin-top: 1px; height: 32px; vertical-align: top;}
.login_box .m {cursor: pointer;}
.bottom {text-align: center; font-size: 12px;}
</style>
<script type="text/javascript">
var COOKIE_NAME = '<%=PropKit.get("project_name") %>__username';
$(function() {
	//changeCode();
	if ($.cookie(COOKIE_NAME)){
	    $("#j_username").val($.cookie(COOKIE_NAME));
	} else {
		$("#j_username").focus();
	}
	/*$("#captcha_img").click(function(){
		changeCode();
	});*/
	$("#login_ok").click(function(){
		var issubmit = true;
		var i_index  = 0;
		$(this).find('.in').each(function(i){
			if ($.trim($(this).val()).length == 0) {
				$(this).css('border', '1px #ff0000 solid');
				issubmit = false;
				if (i_index == 0)
					i_index  = i;
			}
		});
		if (!issubmit) {
			$(this).find('.in').eq(i_index).focus();
			return false;
		}
		$.cookie(COOKIE_NAME, $("#j_username").val(), { path: '/', expires: 15 });
		
		$("#login_ok").attr("disabled", true);
		
		var username = $("#j_username").val();
		var password = $("#j_password").val();
		$.post("/<%=PropKit.get("project_name") %>/admin/verify", {username:username,password:password}, function (returnJson){
			var rescode = returnJson.rescode;
			if (rescode == '0000') {
				window.location.href = "/<%=PropKit.get("project_name") %>/admin/";
			} else {
				$("#login_ok").attr("disabled", false);
				$(this).alertmsg('error', '登录失败', {displayMode:'slide', displayPosition:'topcenter', title:'登录失败', okCall:function() {
					$("#j_password").val('');
				}})
			}
		}, "json");
		
        return false;
	});
});
function genTimestamp(){
	var time = new Date();
	return time.getTime();
}
</script>
</head>
<body style="background:#309FCA">
<!--[if lte IE 7]>
<style type="text/css">
#errorie {position: fixed; top: 0; z-index: 100000; height: 30px; background: #FCF8E3;}
#errorie div {width: 900px; margin: 0 auto; line-height: 30px; color: orange; font-size: 14px; text-align: center;}
#errorie div a {color: #459f79;font-size: 14px;}
#errorie div a:hover {text-decoration: underline;}
</style>
<div id="errorie"><div>请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
<![endif]-->
<div class="main_box">
	<div class="login_box">
		<div class="login_logo">
            <span style="font-size:24px; line-height:32px; color:#000; margin-left:5px;">宜华地产-管理平台</span>
        </div>
        <div class="login_form">
    		<form id="login_form">
    			<div class="form-group">
    				<label for="j_username" class="t" style="font-size:16px; line-height:16px;">用户名：</label> <input id="j_username" value="" name="username" type="text" class="form-control x319 input-nm" autocomplete="off">
    			</div>
    			<div class="form-group">
    				<label for="j_password" class="t" style="font-size:16px; line-height:16px;">密　码：</label> <input id="j_password" value="" name="passwordhash" type="password" class="form-control x319 input-nm">
    			</div>
    			<div class="form-group" style="display:none">
    				<label for="j_code" class="t" style="font-size:16px; line-height:16px;">验证码：</label> <input id="j_code" value="" name="code" type="text" class="form-control x319 input-nm" autocomplete="off">
    			</div>
    			<div class="form-group space">
                    <label class="t"></label>　　　
    				<input type="button" id="login_ok" value="&nbsp;登&nbsp;录&nbsp;" class="btn btn-primary btn-lg">
    			</div>
    		</form>
        </div>
	</div>
</div>
</body>
</html>

