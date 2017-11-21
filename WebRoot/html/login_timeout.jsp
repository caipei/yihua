<%@page import="com.jfinal.kit.PropKit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div>
	<span id="num">1</span>秒后跳转登录
</div>

<script type="text/javascript">
<!--

//-->
var num = 1;
var interval = self.setInterval('change()',1000);
function change() {
	if (--num <= 0) {
		window.location.href = '/<%=PropKit.get("project_name") %>/admin/login';
	} else {
		$('#num').html(num);
	}
}

</script>
