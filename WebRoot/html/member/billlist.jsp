<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/member/billlist?id=${memberid}"
		method="post">
		<input type="hidden" name="pageSize" value="${pageSize}" id="pageSize"> 
		<input type="hidden" name="pageCurrent" value="${pageCurrent}" id="pageCurrent">
		<input type="hidden" id="memberid" value="${memberid}">
		<div class="bjui-searchBar">
			<button type="submit" class="btn-default" data-icon="search" style="float:right;">查询</button>
			<button type="button" class="btn-default" onclick="exportExcel();" style="float:left;">导出</button>
		</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
            		<th width="20">#</th>
					<th>业主姓名</th>
					<th>账单号</th>
					<th>账单说明</th>
					<th>账单类型</th>
					<th>支付方式</th>
					<th>账单状态</th>
					<th>支付金额</th>
					<th width="300">操作</th>
				</tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
				<c:forEach items="${billlist}" var="bill">
					<tr data-id="${index }">
	      			<td>${index }</td>
	      			<td>${bill.username }</td>
	      			<td>${bill.billno }</td>
	      			<td>${bill.billtypes }</td>
	      			<td>${bill.paymentinstruction }</td>
	      			<td>${bill.paytypes }</td>
	      			<td>${bill.rstates }</td>
	      			<td>${bill.cost }</td>
						<td > 
						<a href="/<%=PropKit.get("project_name") %>/admin/member/viewbill?id=${bill.id }" class="btn btn-green" data-toggle="navtab" data-id="info_view_bill" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="查看">查看详情</a>
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
<script type="text/javascript">
function exportExcel(){
	var pageSize = $("#pageSize").val();
	var pageCurrent = $("#pageCurrent").val();
	var memberid = $("#memberid").val();
	var url = "/<%=PropKit.get("project_name") %>/admin/member/exportExcel?memberid="+memberid+
			"&pageSize="+pageSize+"&pageCurrent="+pageCurrent;
	window.location.href=url;	
	
}
</script>