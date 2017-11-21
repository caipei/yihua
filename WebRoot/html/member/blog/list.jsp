<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/member/blog/" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <div class="bjui-searchBar">
        	<label>类型:</label>
            <select name="type" id="type_sel" data-toggle="selectpicker">
                <option value="">全部</option>
                <option value="1">图片</option>
                <option value="2">段子</option>
                <option value="3">视频</option>
            </select>&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="30">#</th>
                <th width="300">描述</th>
                <th>类别</th>
                <th>上传时间</th>
                <th>是否精华</th>
                <th>会员昵称</th>
                <th>会员手机号</th>
                <th width="150">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${bloglist}" var="blog">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
	      		<td title="${blog.description }">${blog.description }</td>
	      		<c:if test="${blog.type eq '1' }">
                <td>图片</td>
                </c:if>
                <c:if test="${blog.type eq '2' }">
                <td>段子</td>
                </c:if>
                <c:if test="${blog.type eq '3' }">
                <td>视频</td>
                </c:if>
	      		<td>${blog.intime_format }</td>
                <c:if test="${blog.elite eq '1' }">
                <td>是</td>
                </c:if>
                <c:if test="${blog.elite eq '0' }">
                <td>否</td>
                </c:if>
                <td>${blog.nickname }</td>
                <td>${blog.mobile }</td>
                <td>
                	<c:if test="${blog.type eq '1' }">
                	<a href="/<%=PropKit.get("project_name") %>/admin/member/blog/showimg?sourceurl=${blog.sourceurl }" class= "btn btn-default" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog-video" data-mask="true">查看图片</a>
                	</c:if>
                	<c:if test="${blog.type eq '3' }">
                	<a href="/<%=PropKit.get("project_name") %>/admin/member/blog/showvideo?sourceurl=${blog.sourceurl }" class= "btn btn-default" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog-video" data-mask="true">查看视频</a>
                	</c:if>
                    <a href="/<%=PropKit.get("project_name") %>/admin/member/blog/del?id=${blog.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
<input type="hidden" id="type" value="${type }" >
<script type="text/javascript">
$(document).ready(function(){
	$("#type_sel option[value="+$("#type").val()+"]").attr("selected", true);
	$("#type_sel").change(function(e) {
		$("#pagerForm").submit();
	});
});

</script>