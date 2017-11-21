<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/order/mallorder/"
		method="post">
		<input type="hidden" name="pageSize" value="${pageSize}"> <input
			type="hidden" name="pageCurrent" value="${pageCurrent}">
		<div class="bjui-searchBar">
			<label>关键字：</label><input type="text" id="keyword"
				value="${keyword }" name="keyword" class="form-control" size="20">&nbsp;
			<button type="submit" class="btn-default" data-icon="search">查询</button>
			&nbsp;
			</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
           <tr>
                <th width="30">#</th>
                <th>客户姓名</th>
                <th>联系方式</th>
                <th>支付方式</th>
                <th>交易号</th>
                <th>订单编号</th>
                <tH>下单时间</tH>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${info.khxm }</td>
                <td>${info.lxfs }</td>
                <td>${info.paytypes }</td>
                <td>${info.payno }</td>
                <td>${info.orderno }</td>
                <td>${info.intimes }</td>
                <td>
                    <a href="/<%=PropKit.get("project_name") %>/admin/order/mallorder/edit?id=${info.id }" class="btn btn-green" data-toggle="navtab" data-id="info_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                	<a href="/<%=PropKit.get("project_name") %>/admin/order/mallorder/del?id=${info.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                	
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