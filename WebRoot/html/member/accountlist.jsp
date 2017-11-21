<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/member/account" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <input type="hidden" name="memberid" value="${memberid}">
        <div class="bjui-searchBar">
        	<label>类型:</label>
            <select name="type" id="type_sel" data-toggle="selectpicker">
                <option value="">全部</option>
                <option value="1">充值</option>
                <option value="-1">支付</option>
            </select>&nbsp;
        	<label>开始:</label><input type="text" name="startdate" value="" data-toggle="datepicker" size="15">&nbsp;
            <label>结束:</label><input type="text" name="enddate" value="" data-toggle="datepicker" size="15">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>时间</th>
                <th>类型</th>
                <th>金额（元）</th>
                <th>内容</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${accountlist}" var="account">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${account.intime_format }</td>
                <td>${account.typename }</td>
                <td>${account.money_format }</td>
                <td>${account.content }</td>
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
<input type="hidden" id="type" value="${type }" >
<script type="text/javascript">
$(document).ready(function(){
	$("#type_sel option[value="+$("#type").val()+"]").attr("selected", true);
	$("#type_sel").change(function(e) {
		$("#pagerForm").submit();
	});
});

</script>