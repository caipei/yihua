<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="bjui-searchBar">
       	<div class="pull-right">
           <button type="button" class="btn-blue" data-url="/<%=PropKit.get("project_name") %>/admin/city/add?pid=${pid}" data-toggle="navtab" data-id="city_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增城市">新增</button>
           <button type="button" class="btn-blue" data-url="/<%=PropKit.get("project_name") %>/admin/city/city_export" data-toggle="navtab" data-id="city_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="城市导入">城市导入</button>
    	</div>
    </div>
	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/city/" method="post">
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
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td><a href="/<%=PropKit.get("project_name") %>/admin/city?pid=${info.id}" data-toggle="navtab" data-id="tab_city_${info.id }" data-title="城市管理">${info.name }</a></td>
                <td>
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

</script>