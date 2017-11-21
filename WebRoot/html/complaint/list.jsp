<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/complaint/" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
            <label>处理类别：</label>
			<select name="state" id="state" data-toggle="selectpicker" >
	            <option value="">请选择</option>
	            <option value="0">未处理</option>
	            <option value="1">已处理</option>
			</select>
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>客户姓名</th>
                <th>联系方式</th>
                <th>投诉类型</th>
                <th>投诉时间</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${complaintslist}" var="comp">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${comp.username }</td>
                <td>${comp.mobile }</td>
                <td>${comp.complaintstypes }</td>
                <td>${comp.createtimes }</td>
                <td>
                	<c:if test="${comp.rstate eq '0' }">
                    <a href="/<%=PropKit.get("project_name") %>/admin/complaint/handle?id=${comp.id }" class="btn btn-green" data-toggle="navtab" data-id="info_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="处理">处理</a>
                	</c:if>
                	<a href="/<%=PropKit.get("project_name") %>/admin/complaint/del?id=${comp.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                </td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
            
        </tbody>
        <input type="hidden" id ="states" value="${state }" />
    </table>
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
			$("#state option[value=" + $("#states").val() + "]").attr("selected", true);
		});
</script>