<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/repair/imagelist?id=${repairid}"
		method="post">
		<input type="hidden" name="pageSize" value="${pageSize}"> <input
			type="hidden" name="pageCurrent" value="${pageCurrent}">
		<div class="bjui-searchBar">
			<button type="submit" class="btn-default" data-icon="search">查询</button>
			
		</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
            		<th width="20">#</th>
					<th >图片标号</th>
					<th width="300">操作</th>
				</tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
				<c:forEach items="${imagelist}" var="ima">
					<tr data-id="${index }">
	      			<td>${index }</td>
	      			<td>${index }</td>
						<td > 
                    <a href="javascript:void(window.open ('${ ima.imageurl}/','newwindow', 'height=500, width=800, top=100, left=300, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no'))" class="btn btn-green" >查看</a>
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
