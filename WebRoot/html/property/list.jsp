<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/property/" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
        </div>
        <div class="bjui-searchBar">
            <div class="pull-right">
                <a href="/<%=PropKit.get("project_name") %>/admin/property/add/" class="btn btn-green" data-toggle="navtab" data-id="property_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增物业公司">新增物业公司</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>物业公司名称</th>
                <th>物业公司地址</th>
                <th>物业公司负责人</th>
                <th>负责人联系方式</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${propertylist}" var="pro">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${pro.propertyname }</td>
                <td>${pro.propertyaddress }</td>
                <td>${pro.leadingoffical }</td>
                <td>${pro.leadingmobile }</td>
                <td>
                    <a href="/<%=PropKit.get("project_name") %>/admin/property/edit?id=${pro.id }" class="btn btn-green" data-toggle="navtab" data-id="info_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="/<%=PropKit.get("project_name") %>/admin/property/del?id=${pro.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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