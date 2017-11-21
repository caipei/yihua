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
					<td colspan="4"><label class="control-label">订单信息</label></td>
				</tr>
				<tr>
					<td><label for="name" class="control-label x85">订单编号：</label>
						${orderno }</td>
					<td><label for="telephone" class="control-label x85">预约送达时间：</label>
						${delivertime }</td>
				</tr>
				<tr>
					<td><label for="username" class="control-label x85">下单用户：</label>
						${memname }</td>
					<td><label for="mername" class="control-label x85">商家名称：</label>
						${mername }</td>
				</tr>
				<tr>
					<td><label for="cost" class="control-label x85">支付方式：</label>
						<c:if test="${paytype==1 }">余额支付</c:if> <c:if
							test="${paytype==2 }">支付宝支付</c:if> <c:if test="${paytype==3 }">微信支付</c:if>
						<c:if test="${paytype==4 }">银行卡支付</c:if> <!-- 1.余额支付，2.支付宝支付，3.微信支付，4.银行卡支付 --></td>
					<td><label for="orderstatus" class="control-label x85">订单状态：
					</label> <c:if test="${orderstatus==1 }">待处理</c:if> <c:if
							test="${orderstatus==2 }">待配送</c:if> <c:if
							test="${orderstatus==3 }">待送达</c:if> <c:if
							test="${orderstatus==4 }">待退款</c:if> <c:if
							test="${orderstatus==5 }">已完成</c:if> <c:if
							test="${orderstatus==6 }">已关闭</c:if> <c:if
							test="${orderstatus==7 }">未支付</c:if> <c:if
							test="${orderstatus==8 }">申请退款成功</c:if></td>
				</tr>
				<tr>
					<td><label for="paymoney" class="control-label x85">支付金额：</label>
						${paymoney }</td>
					<td><label for="time" class="control-label x85">配送费：</label>
						${send }</td>
				</tr>
				<tr>
					<td><label for="createtime" class="control-label x85">下单时间：</label>
						${createtime }</td>
					<td><label for="yhqprice" class="control-label x85">优惠金额：</label>
						${yhqprice }</td>
				</tr>
				<tr>
					<td><label for="delivertime" class="control-label x85">送货地址：</label>
						${address }</td>
					<td><label for="username" class="control-label x85">收货人：</label>
						${username }</td>
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
