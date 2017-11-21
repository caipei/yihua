<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/merchant/productList?id=${merchantId}"
		method="post">
		<input type="hidden" name="pageSize" value="${pageSize}" id="pageSize">
		<input type="hidden" name="pageCurrent" value="${pageCurrent}"
			id="pageCurrent"> <input type="hidden" id="merchantId"
			value="${merchantId}">
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
				<th>商品名称</th>
				<th>价格</th>
				<th>产品图片</th>
				<th>描述</th>
				<th>是否上架</th>
				<th>销量</th>
				<th>类别</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="index">1</c:set>
			<c:forEach items="${productList}" var="product">
				<tr data-id="${index }">
					<td>${index }</td>
					<td>${product.name }</td>
					<td>${product.price }</td>
					<td>${product.imageurl }</td>
					<td>${product.content }</td>
					<td>${product.status==1?'上架':'下架' }</td>
					<td>${product.salenum }</td>
					<td>${product.kind }</td>
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
