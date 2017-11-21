<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageContent">
	<form action="/<%=PropKit.get("project_name")%>/admin/merchant"
		id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
			<tbody>
				<tr>
					<td colspan="4"><label class="control-label">商家信息</label></td>
				</tr>
				<tr>
					<td><label for="name" class="control-label x85">商家姓名：</label>
						${name }</td>
					<td><label for="telephone" class="control-label x85">注册手机号：</label>
						${telephone }</td>
				</tr>
				<tr>
					<td><label for="sex" class="control-label x85">营业时间：</label>
						${actiontime } -- ${endtime }</td>
					<td><label for="address" class="control-label x85">地址：</label>
						${address }</td>
				</tr>
				<tr>
					<td><label for="cost" class="control-label x85">配送费：</label>
						${cost }</td>
					<td><label for="logo" class="control-label x85">图标：</label>
						${logo }</td>
				</tr>
				<tr>
					<td><label for="send" class="control-label x85">起送价格：</label>
						${send }</td>
					<td><label for="time" class="control-label x85">配送时间：</label>
						${time }</td>
				</tr>
				<tr>
					<td><label for="category" class="control-label x85">品类：</label>
						${category }</td>
					<td><label for="license" class="control-label x85">营业执照图片地址：</label>
						${license }</td>
				</tr>
				<tr>
					<td><label for="restaurant" class="control-label x85">餐饮许可证图片地址：</label>
						${restaurant }</td>
					<td><label for="canapplymoney" class="control-label x85">余额：</label>
						${canapplymoney }</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<div class="bjui-pageFooter">
	<ul>
		<li><button type="button" class="btn-close" data-icon="close">返回</button></li>
	</ul>
</div>
