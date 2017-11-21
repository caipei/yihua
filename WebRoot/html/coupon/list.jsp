<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/coupon/" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
        </div>
        <div class="bjui-searchBar">
            <div class="pull-right">
                <a href="/<%=PropKit.get("project_name") %>/admin/coupon/add/" class="btn btn-green" data-toggle="navtab" data-id="college_good_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增优惠券">新增优惠券</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>所有人姓名</th>
                <th>优惠券金额</th>
                <th>优惠券状态</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${couponlist}" var="coupon">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${coupon.username }</td>
                <td>${coupon.amount }</td>
                <td>${coupon.states }</td>
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
    <div class="pagination-box" data-toggle="pagination" data-total="${pageSize }" data-page-size="1" data-page-current="${pageCurrent }">
    </div>
</div>