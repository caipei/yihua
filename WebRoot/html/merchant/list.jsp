<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/merchant/"
		method="post">
		<input type="hidden" name="pageSize" value="${pageSize}"> <input
			type="hidden" name="pageCurrent" value="${pageCurrent}">
		<div class="bjui-searchBar">
			<button type="submit" class="btn-default" data-icon="search">查询</button>
			&nbsp;
		</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
	<table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
		<thead>
			<tr>
				<th width="20">#</th>
				<th>商铺名称</th>
				<th>商铺手机号</th>
				<th>商铺地址</th>
				<th>营业时间</th>
				<th>商铺类型</th>
				<th width="150">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="index">1</c:set>
			<c:forEach items="${merchantList}" var="mer">
				<tr data-id="${index }">
					<td>${index }</td>
					<td style="width: 15px;">${mer.name}</td>
					<td>${mer.telephone}</td>
					<td>${mer.address }</td>
					<td>${mer.type }</td>
					<td>${mer.actiontime }- ${mer.endtime }</td>
					<td><a
						href="/<%=PropKit.get("project_name") %>/admin/merchant/detail?id=${mer.id }"
						class="btn btn-green" data-toggle="navtab" data-id="info_edit"
						data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="查看">查看</a>
						<a
						href="/<%=PropKit.get("project_name") %>/admin/merchant/productList?id=${mer.id }"
						class="btn btn-green" data-toggle="navtab"
						data-id="info_bill_list"
						data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="查看商品">查看商品</a>
						<br> <a
						href="/<%=PropKit.get("project_name") %>/admin/merchant/orderList?id=${mer.id }"
						class="btn btn-green" data-toggle="navtab"
						data-id="info_bill_list"
						data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="查看历史订单">查看历史订单</a>
					</td>
				</tr>
				<c:set var="index">${index + 1}</c:set>
			</c:forEach>

		</tbody>
	</table>
</div>
<div class="bjui-pageFooter">
	<div class="pages">
		<span>每页${pageitem} 条，共 ${totalSize } 条</span>
	</div>
	<div class="pagination-box" data-toggle="pagination"
		data-total="${pageSize }" data-page-size="1"
		data-page-current="${pageCurrent }"></div>
</div>
