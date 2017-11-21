<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="bjui-searchBar">
		<div class="pull-right">
           <a class="btn btn-blue" href="/<%=PropKit.get("project_name") %>/admin/brand/ztxl_type_dialog" class= "btn btn-blue" data-toggle="dialog" data-width="600" data-height="400" data-id="ztxl_type_dialog" data-mask="true">新增</a>
    	</div>
    </div>
    <form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/brand/ztxl" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>类型</th>
                <th width="100">排序</th>
                <th width="150">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <!-- 1幻灯片 2一个 3左大右小 4左小又大 5两个均分 6三个 -->
                <td>
                <c:choose>
                	<c:when test="${info.type == 1 }">幻灯片</c:when>
                	<c:when test="${info.type == 2 }">一个</c:when>
                	<c:when test="${info.type == 3 }">左大右小</c:when>
                	<c:when test="${info.type == 4 }">左小又大</c:when>
                	<c:when test="${info.type == 5 }">两个均分</c:when>
                	<c:when test="${info.type == 6 }">三个</c:when>
                </c:choose>
                </td>
                <td><input type="number" id="seq_${info.id }" value="${info.seq }" onblur="change_seq(${info.id}, this)" name="seq_name" class="input-nm" style="width:50px"></td>
                <td>
                	<a href="/<%=PropKit.get("project_name") %>/admin/brand/ztxl_edit?id=${info.id }" class= "btn btn-blue" data-toggle="navtab" data-id="brand_theme_ztxl_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                	<a href="/<%=PropKit.get("project_name") %>/admin/brand/ztxl_del?id=${info.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                </td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
});

function change_seq(id, obj) {
	$.post("/<%=PropKit.get("project_name") %>/admin/brand/ztxl_change_seq", {id: id, seq: $(obj).val()}, function(returnJson){
		var rescode = returnJson.rescode;
		if (rescode == '0000') {
			$.CurrentNavtab.find("#pagerForm").submit();
		}
	}, "json");
}


</script>