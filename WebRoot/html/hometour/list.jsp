<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/hometour/" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
            <label>跳转类别：</label>
			<select name="type" id="type" data-toggle="selectpicker" >
	            <option value="">请选择</option>
	            <option value="1">跳转网页</option>
	            <option value="2">跳转商家</option>
			</select>
			<button type="submit" class="btn-default" data-icon="search" style="align:right">查询</button>
        </div>
        <div class="bjui-searchBar">
			<div class="pull-right">
				<a href="/<%=PropKit.get("project_name")%>/admin/hometour/add/"
					class="btn btn-green" data-toggle="navtab" data-id="property_add"
					data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增轮巡信息">新增轮巡信息</a>
			</div>
		</div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>跳转类别</th>
                <th>跳转地址</th>
                <th>跳转商家名</th>
                <th>创建时间</th>
                <th width="300">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${tourlist}" var="tour">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${tour.types }</td>
                <td>${tour.linkaddress }</td>
                <td>${tour.sellername }</td>
                <td>${tour.createtimes }</td>
                <td>
                <a href="/<%=PropKit.get("project_name") %>/admin/hometour/edit?id=${tour.id }" class="btn btn-green" data-toggle="navtab" data-id="info_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="处理">处理</a>
                <a href="/<%=PropKit.get("project_name") %>/admin/hometour/del?id=${tour.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                </td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
            
        </tbody>
    </table>
    <input type="hidden" id ="type" value="${type }" />
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页${pageitem} 条，共 ${totalSize } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageSize }" data-page-size="1" data-page-current="${pageCurrent }">
    </div>
</div>
<script type="text/javascript">
$(document).ready(
		function() {
			$("#type option[value=" + $("#type").val() + "]").attr("selected", true);
			
		});
</script>