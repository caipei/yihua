<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="bjui-searchBar">
    </div>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="10">#</th>
                <th>主题名称</th>
                <th>图片</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${info.name }</td>
                <td><a href="/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=${info.imgpath }" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog-img" data-mask="true"><img src="${info.imgpath }" style="max-width:100px; max-height:100px;" /></a></td>
                <td>
                	<a href="/<%=PropKit.get("project_name") %>/admin/brand/themeedit?id=${info.id }" class= "btn btn-blue" data-toggle="navtab" data-id="brand_theme_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                	<c:if test="${info.type eq 1 }">
		            <a href="/<%=PropKit.get("project_name") %>/front/brand/ztxl" class= "btn btn-blue" target="_blank">预览</a>
		            </c:if>
		            <c:if test="${info.type eq 2 }">
		            <a href="/<%=PropKit.get("project_name") %>/brand/lshy" class= "btn btn-blue" target="_blank">预览</a>
		            </c:if>
		            <c:if test="${info.type eq 3 }">
		            <a href="/<%=PropKit.get("project_name") %>/brand/gjdz" class= "btn btn-blue" target="_blank">预览</a>
		            </c:if>
		            <c:if test="${info.type eq 4 }">
		            <a href="/<%=PropKit.get("project_name") %>/brand/csfc" class= "btn btn-blue" target="_blank">预览</a>
		            </c:if>
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