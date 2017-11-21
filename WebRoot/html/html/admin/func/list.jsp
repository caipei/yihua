<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="bjui-searchBar">
		<a href="/<%=PropKit.get("project_name") %>/admin/user/add/" class="btn btn-green" data-toggle="navtab" data-id="user_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增用户">新增</a>
	</div>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>功能名称</th>
                <th width="200">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${funclist}" var="func">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${func.funcname }</td>
                <td>
                	<c:if test="${user.delflag eq '1' }">
                    <a href="/<%=PropKit.get("project_name") %>/admin/user/edit/${user.id }" class="btn btn-green" data-toggle="navtab" data-id="user_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="/<%=PropKit.get("project_name") %>/admin/user/del/${user.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                	</c:if>
                </td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
            
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter" style="display: none">
    <div class="pages">
        <span>每页10条，共 600 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="600" data-page-size="30" data-page-current="1">
    </div>
</div>