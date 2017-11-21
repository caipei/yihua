<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="pull-right">
           <button id="wxcj_member_export" type="button" class="btn-blue" >导出</button>
    	</div>
	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/wxcj/member" method="post">
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
                <th width="50">类型</th>
                <th width="100">获奖时间</th>
                <th>进阶阶段</th>
                <th>进阶状态</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${info.nickname }</td>
                <td>${info.mobile }</td>
                <td>${info.vipflag }</td>
                <td>${info.lqsj }</td>
                <td>
                	<c:if test="${info.stagetype eq '1' }">进阶一</c:if>
                	<c:if test="${info.stagetype eq '2' }">进阶二</c:if>
                	<c:if test="${info.stagetype eq '3' }">进阶三</c:if>
                </td>
                <td>
                	<c:if test="${info.stagestate eq '0' }">未完成</c:if>
                	<c:if test="${info.stagestate eq '1' }">已完成</c:if>
                	<c:if test="${info.stagestate eq '2' }">已选择门店</c:if>
                	<c:if test="${info.stagestate eq '3' }">已领取</c:if>
                </td>
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
<input type="hidden" id="categoryid" name="categoryid" value="${categoryid }" />
<script type="text/javascript">
$(document).ready(function(){
	
	$('#wxcj_member_export').click(function() {
		var params = {};
		params.id = $('#id').val();
		$.post("/<%=PropKit.get("project_name") %>/admin/wxcj/memlist_export", function (returnJson){
			var rescode = returnJson.rescode;
			var rescnt = returnJson.rescnt;
			if (rescode == '0000') {
				window.open(rescnt);
			}
		}, "json");
	});
});
</script>