<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="pull-right">
         <button id="jinjie3_export" type="button" class="btn-blue" >导出</button>
   	</div>
	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/wxcj/jinjie3list" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th width="100">姓名</th>
                <th width="100">电话</th>
                <th>门店信息</th>
                <th>销售单号</th>
                <th>礼品密码</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${info.nickname }</td>
                <td>${info.mobile }</td>
                <td>${info.city1 }${info.city2 }${info.shopname }</td>
                <td>${info.xsdh }</td>
                <td>${info.lpmm }</td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页15条，共 ${totalSize } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${totalSize }" data-page-size="15" data-page-current="${pageCurrent }">
    </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#jinjie3_export').click(function() {
		var params = {};
		params.id = $('#id').val();
		$.post("/<%=PropKit.get("project_name") %>/admin/wxcj/jinjie3_export", function (returnJson){
			var rescode = returnJson.rescode;
			var rescnt = returnJson.rescnt;
			if (rescode == '0000') {
				window.open(rescnt);
			}
		}, "json");
	});
});
</script>
