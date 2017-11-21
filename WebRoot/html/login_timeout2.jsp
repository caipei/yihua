<%@page import="com.jfinal.kit.PropKit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script type="text/javascript">
var COOKIE_NAME = '<%=PropKit.get("project_name")%>__username';
$(function() {
	//changeCode();
	if ($.cookie(COOKIE_NAME)){
	    $("#username").val($.cookie(COOKIE_NAME));
	} else {
		$("#username").focus();
	}
	/*$("#captcha_img").click(function(){
		changeCode();
	});*/
	$("#login_ok").click(function(){
		$("#password").val(CryptoJS.MD5($("#username").val() + $("#password").val()));
		
		var username = $("#username").val();
		var password = $("#password").val();
		$.post("/<%=PropKit.get("project_name")%>
	/admin/verify", {
						username : username,
						password : password
					}, function(returnJson) {
						var rescode = returnJson.rescode;
						if (rescode == '0000') {
							$(this).alertmsg('ok', '登录成功', {
								displayMode : 'slide',
								displayPosition : 'topcenter',
								title : '登录成功',
								okCall : function() {
									$.CurrentDialog.closeCurrent();
								}
							});
						} else {
							$(this).alertmsg('error', '登录失败', {
								displayMode : 'slide',
								displayPosition : 'topcenter',
								title : '登录失败',
								okCall : function() {
									$("#password").val('');
								}
							});
						}
					}, "json");

					return false;
				});
	});
</script>
<div class="bjui-pageContent">
	<form
		action="/<%=PropKit.get("project_name")%>/admin/category/submit/"
		id="category_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
			<tbody>
				<tr>
					<td><label for="" class="control-label x85">用户名：</label> <input
						type="text" name="username" id="username" value=""
						data-rule="required;" size="20"></td>

				</tr>
				<tr>
					<td><label for="" class="control-label x85">密码：</label> <input
						type="password" name="password" id="password" value=""
						data-rule="required;" size="20"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<div class="bjui-pageFooter">
	<ul>
		<li><button type="button" class="btn-close">取消</button></li>
		<li><button type="button" id="login_ok" class="btn-default">登录</button></li>
	</ul>
</div>
