<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="pull-right">
    	<button type="button" class="btn-blue" data-url="/<%=PropKit.get("project_name") %>/admin/brand/product_add/" data-toggle="navtab" data-id="brand_product_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增">新增</button>
 	</div>
	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/brand/product_list" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="10">#</th>
                <th>名称</th>
                <th width="200">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td title="${info.name }">${info.name }</td>
                <td>
                <a href="/<%=PropKit.get("project_name") %>/admin/brand/product_edit?id=${info.id }" class= "btn btn-blue" data-toggle="navtab" data-id="goods_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                <a href="/<%=PropKit.get("project_name") %>/admin/brand/product_del?id=${info.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                <a href="/<%=PropKit.get("project_name") %>/brand/product?id=${info.id }" class= "btn btn-blue" data-toggle="navtab" data-id="comment_list" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="评论">预览</a>
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
	$("#goods_list #category_sel option[value="+$("#categoryid").val()+"]").attr("selected", true);
	$("#goods_list #category_sel").change(function(e) {
		$.CurrentNavtab.find("#pagerForm").submit();
	});
});

</script>