<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="bjui-pageHeader">
	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/category/"
		method="post">
		<input type="hidden" name="pageSize" value="${pageSize}"> <input
			type="hidden" name="pageCurrent" value="${pageCurrent}">
		<div class="bjui-searchBar">
			<button type="submit" class="btn-default" data-icon="search">查询</button>
			&nbsp;
		</div>
		<div class="bjui-searchBar">
			<div class="pull-right">
				<a href="/<%=PropKit.get("project_name")%>/admin/category/add"
					class="btn btn-green" data-toggle="navtab" data-id="village_add"
					data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增">新增</a>
			</div>
		</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
	<table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
		<thead>
			<tr>
				<th width="20">#</th>
				<th>类别名称</th>
				<th>状态</th>
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="index">1</c:set>
			<c:forEach items="${categorylist}" var="category">
				<tr data-id="${index }">
					<td>${index }</td>
					<td>${category.categoryname }</td>
					<td>${category.rstate==1?"启用":"禁用" }</td>
					<td><a
						href="/<%=PropKit.get("project_name") %>/admin/category/edit?type=${type}&id=${category.id}"
						class="btn btn-green" data-toggle="navtab" data-id="info_edit"
						data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
						<a
						href="/<%=PropKit.get("project_name") %>/admin/category/del?id=${category.id }"
						class="btn btn-red" data-toggle="doajax"
						data-confirm-msg="确定要删除该行信息吗？">删除</a></td>
				</tr>
				<c:set var="index">${index + 1}</c:set>
			</c:forEach>
		</tbody>
	</table>
</div>
