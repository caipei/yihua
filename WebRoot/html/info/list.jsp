<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/info/" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
            <label>类别:</label>
            <select name="categoryid" data-toggle="selectpicker">
                <option value="">全部</option>
                <c:forEach items="${categorylist}" var="category">
                	<option value="${category.id }">${category.name }</option>
                </c:forEach>
            </select>&nbsp;
            <label>关键字：</label><input type="text" id="keyword" value="" name="keyword" class="form-control" size="20">&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
            	<a href="/<%=PropKit.get("project_name") %>/admin/category/list?type=1" class="btn btn-default" data-toggle="navtab" data-id="category_list" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="信息类别">类别</a>
                <a href="/<%=PropKit.get("project_name") %>/admin/info/add/" class="btn btn-green" data-toggle="navtab" data-id="info_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增信息">新增信息</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>标题</th>
                <th width="100">类别</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${info.title }</td>
                <td>${info.categoryname }</td>
                <td>
                    <a href="/<%=PropKit.get("project_name") %>/admin/info/edit?id=${info.id }" class="btn btn-green" data-toggle="navtab" data-id="info_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="/<%=PropKit.get("project_name") %>/admin/info/del?id=${info.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                </td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
            
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页10条，共 ${totalSize } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageSize }" data-page-size="1" data-page-current="${pageCurrent }">
    </div>
</div>