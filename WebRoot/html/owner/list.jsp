<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch"
		action="/<%=PropKit.get("project_name")%>/admin/owner/" method="post">
		<input type="hidden" name="pageSize" value="${pageSize}"> <input
			type="hidden" name="pageCurrent" value="${pageCurrent}">
		<label>小区名称：</label>
		<select name="villageid" id="villageid" data-toggle="selectpicker" >
	            <c:forEach items="${villagelist }" var="vill">
	            <option value="${vill.id }">${ vill.villagename}</option>
	    </c:forEach>
		</select>
		<div class="bjui-searchBar">
			<button type="button" class="btn-default"  style="float:left;" onclick="imoprtExcel();">导入</button>
			<button type="submit" class="btn-default" data-icon="search" style="float:left;">查询</button>
			&nbsp;
		</div>
		<div class="bjui-searchBar">
			<div class="pull-right">
				<a href="/<%=PropKit.get("project_name")%>/admin/owner/add/"
					class="btn btn-green" data-toggle="navtab" data-id="property_add"
					data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="新增业主信息">新增业主信息</a>
			</div>
		</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
	<table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
		<thead>
			<tr>
				<th width="20">#</th>
				<th>业主名称</th>
				<th>业主手机号</th>
				<th>小区名称</th>
				<th>栋数</th>
				<th>单元</th>
				<th>楼层数</th>
				<th>门牌号</th>
				<th>住房面积</th>
				<th width="300">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="index">1</c:set>
			<c:forEach items="${ownerlist}" var="owner">
				<tr data-id="${index }">
					<td>${index }</td>
					<td>${owner.ownername }</td>
					<td>${owner.mobile }</td>
					<td>${owner.villagename }</td>
					<td>${owner.building }</td>
					<td>${owner.unit }</td>
					<td>${owner.floor }</td>
					<td>${owner.number }</td>
					<td>${owner.housingarea }</td>
					<td><a
						href="/<%=PropKit.get("project_name") %>/admin/owner/edit?id=${owner.id }"
						class="btn btn-green" data-toggle="navtab" data-id="info_edit"
						data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
						<a
						href="/<%=PropKit.get("project_name") %>/admin/owner/family?id=${owner.id }"
						class="btn btn-green" data-toggle="navtab" data-id="info_family"
						data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="家庭成员">家庭成员</a>
						<a
						href="/<%=PropKit.get("project_name") %>/admin/owner/del?id=${owner.id }"
						class="btn btn-red" data-toggle="doajax"
						data-confirm-msg="确定要删除该行信息吗？">删除</a></td>
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
	<div class="pagination-box" data-toggle="pagination"
		data-total="${pageSize }" data-page-size="1"
		data-page-current="${pageCurrent }"></div>
</div>
<script type="text/javascript">
$(document).ready(
		function() {
			$("#state option[value=" + $("#states").val() + "]").attr("selected", true);
			$("#repairtype option[value=" + $("#repairtypes").val() + "]").attr("selected", true);
			
		});
function imoprtExcel(){
	var villageid = $("select[name = 'villageid'] option:selected").val();
	var url = "/<%=PropKit.get("project_name") %>/admin/owner/importExcel?villageid="+villageid;
	window.open(url, 'newwindow', 'height=800, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');	
}
</script>
