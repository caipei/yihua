<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/memberpro/"
		method="post">
		<input type="hidden" name="pageSize" value="${pageSize}"> <input
			type="hidden" name="pageCurrent" value="${pageCurrent}">
	</form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
           			<th width="20">#</th>
					<th>客户姓名</th>
					<th>客户电话</th>
					<th>客户住址</th>
					<th>客户性别</th>
					<th>客户小区</th>
					<th width="200">操作</th>
				</tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
				<c:forEach items="${userlist}" var="mem">
						<tr data-id="${index }">
						<td>${index }</td>
						<td style="width: 15px;">${mem.username}</td>
						<td>${mem.mobile}</td>
						<td>${mem.address }</td>
						<td>
						${mem.sexs }
						</td>
						<td>${mem.villagename }</td>
						<td>
						<a href="/<%=PropKit.get("project_name") %>/admin/member/billlist?id=${mem.id }" class="btn btn-green" data-toggle="navtab" data-id="info_bill_list" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="用户账单">账单列表</a>
						<a href="/<%=PropKit.get("project_name") %>/admin/memberpro/memberrate?id=${mem.id }" class="btn btn-green" data-toggle="navtab" data-id="info_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="用户费用管理">用户费用管理</a>
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
    <div class="pagination-box" data-toggle="pagination" data-total="${pageSize }" data-page-size="1" data-page-current="${pageCurrent }">
    </div>
</div>
