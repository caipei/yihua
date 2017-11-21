<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div class="pull-right">
    	<button type="button" class="btn-blue" data-url="/<%=PropKit.get("project_name") %>/admin/leysen/ckmxj/jyft_add/" data-toggle="navtab" data-id="leysen/jyft_add" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增">新增</button>
 	</div>
	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/leysen/ckmxj/jyft" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th width="100">图片</th>
                <th width="100">排序</th>
                <th width="200">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${infolist}" var="info">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td><a href="/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=${info.imgpath }" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog-img" data-mask="true"><img src="${info.imgpath }" style="max-width:100px; max-height:100px;" /></a></td>
                <td><input type="number" id="seq_${info.id }" value="${info.seq }" onblur="change_seq(${info.id}, this)" name="seq_name" class="input-nm" style="width:50px"></td>
                <td>
                <a href="/<%=PropKit.get("project_name") %>/admin/leysen/ckmxj/jyft_edit?id=${info.id }" class= "btn btn-blue" data-toggle="navtab" data-id="jyft_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                <a href="/<%=PropKit.get("project_name") %>/admin/leysen/ckmxj/jyft_del?id=${info.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                </td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
</div>
<script type="text/javascript">
$(document).ready(function(){
	
});

function change_seq(id, obj) {
	$.post("/<%=PropKit.get("project_name") %>/admin/leysen/ckmxj/jyft_change_seq", {id: id, seq: $(obj).val()}, function(returnJson){
		var rescode = returnJson.rescode;
		if (rescode == '0000') {
			$.CurrentNavtab.find("#pagerForm").submit();
		}
	}, "json");
}
</script>