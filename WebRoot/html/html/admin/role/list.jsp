<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="bjui-searchBar">
       	<div class="pull-right">
           <button type="button" class="btn-blue" data-url="/<%=PropKit.get("project_name") %>/admin/role/add/" data-toggle="navtab" data-id="role_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增角色">新增角色</button>
    	</div>
    </div>
</div>

<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="30">#</th>
                <th>角色名称</th>
                <th width="150">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${rolelist}" var="role">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${role.rolename }</td>
                <td>
                	<a href="/<%=PropKit.get("project_name") %>/admin/role/auth/${role.id }" class="btn btn-green" data-toggle="navtab" data-id="role_auth" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="${role.rolename }-授权">授权</a>
                	<c:if test="${role.delflag eq '1' }">
                    <a href="/<%=PropKit.get("project_name") %>/admin/role/edit/${role.id }" class="btn btn-green" data-toggle="navtab" data-id="role_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="/<%=PropKit.get("project_name") %>/admin/role/del/${role.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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