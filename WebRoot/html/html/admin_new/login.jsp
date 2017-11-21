<%@page import="com.jfinal.kit.PropKit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from www.zi-han.net/theme/hplus/login_v2.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:49 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title><%=PropKit.get("project_title") %> - 登录</title>
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/bootstrap.min.css" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/animate.min.css" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/style.min.css" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/login.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                    	<img src="/<%=PropKit.get("project_name") %>/html/admin_new/res/image/index_logo.png">
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md"><%=PropKit.get("project_title") %></p>
                    <input id="username" type="text" class="form-control uname" placeholder="用户名" />
                    <input id="password" type="password" class="form-control pword m-b" placeholder="密码" />
                    <button id="login" type="button" class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2017 All Rights Reserved.
            </div>
        </div>
    </div>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/jquery.min.js?v=2.1.4"></script>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/md5/jquery.md5.js"></script>
</body>

<script type="text/javascript">
$(function() {
	$("#login").click(function(){
		$("#login").attr("disabled", true);
		var username = $("#username").val();
		var password = $("#password").val();
		password = $.md5(username + password);
		$.post("/<%=PropKit.get("project_name") %>/admin_new/verify", {username:username,password:password}, function (returnJson){
			var rescode = returnJson.rescode;
			if (rescode == '0000') {
				window.location.href = "/<%=PropKit.get("project_name") %>/admin_new/";
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
</script>

<!-- Mirrored from www.zi-han.net/theme/hplus/login_v2.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:52 GMT -->
</html>
