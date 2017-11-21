<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/merchant/orderList?id=${merchantId}"
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
				<th>订单编号</th>
				<th>收货地址</th>
				<th>支付方式</th>
				<th>订单状态</th>
				<th>下单时间</th>
				<th>支付金额</th>
				<th>配送费</th>
				<th width="150">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="index">1</c:set>
			<c:forEach items="${orderList}" var="order">
				<tr data-id="${index }">
					<td>${index }</td>
					<td>${order.orderno }</td>
					<td>${order.address }</td>
					<td><c:if test="${order.paytype==1 }">余额支付</c:if> <c:if
							test="${order.paytype==2 }">支付宝支付</c:if> <c:if
							test="${order.paytype==3 }">微信支付</c:if> <c:if
							test="${order.paytype==4 }">银行卡支付</c:if> <!-- 1.余额支付，2.支付宝支付，3.微信支付，4.银行卡支付 -->
					<td><c:if test="${order.orderstatus==1 }">待处理</c:if> <c:if
							test="${order.orderstatus==2 }">待配送</c:if> <c:if
							test="${order.orderstatus==3 }">待送达</c:if> <c:if
							test="${order.orderstatus==4 }">待退款</c:if> <c:if
							test="${order.orderstatus==5 }">已完成</c:if> <c:if
							test="${order.orderstatus==6 }">已关闭</c:if> <c:if
							test="${order.orderstatus==7 }">未支付</c:if> <c:if
							test="${order.orderstatus==8 }">申请退款成功</c:if></td>
					<!-- 1.待处理 2.待配送 3.待送达 4.待退款 5.已完成 6.已关闭 7.未支付 8.申请退款成功 -->
					<td>${order.createtime }</td>
					<td>${order.paymoney }</td>
					<td>${order.send }</td>
					<td><a
						href="/<%=PropKit.get("project_name") %>/admin/merchant/orderDetail?id=${order.id }"
						class="btn btn-green" data-toggle="navtab" data-id="info_edit"
						data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="查看">查看</a></td>
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
