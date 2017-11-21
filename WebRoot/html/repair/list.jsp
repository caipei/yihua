<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">

	<form id="pagerForm" data-toggle="ajaxsearch" action="/<%=PropKit.get("project_name") %>/admin/repair/" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
            <label>报修类别：</label>
			<select name="repairtype" id="repairtype" data-toggle="selectpicker" >
	            <option value="">请选择</option>
	            <option value="1">公共部位维修</option>
	            <option value="2">自用部位维修</option>
			</select>
			<label>修复状态：</label>
			<select name="state" id="state" data-toggle="selectpicker" >
	            <option value="">请选择</option>
	            <option value="1">待处理</option>
	            <option value="2">处理中</option>
	            <option value="3">已解决</option>
	            <option value="4">已删除</option>
			</select>
			<label>栋：</label><input type="text" id="building"
			value="${building }" name="building" class="form-control" size="10">&nbsp;
			<label>单元：</label><input type="text" id="unit"
			value="${unit }" name="unit" class="form-control" size="10">&nbsp;
			<label>楼层数：</label><input type="text" id="floor"
			value="${floor }" name="floor" class="form-control" size="10">&nbsp;
			<label>门牌号：</label><input type="text" id="number"
			value="${number }" name="number" class="form-control" size="10">&nbsp;
			</br>
			<div align="right">
			<button type="submit" class="btn-default" data-icon="search" >查询</button>
			<button type="button" class="btn-default" onclick="exportExcel();" style="float:left;">导出</button>
			</div>
            
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th>报修联系人</th>
                <th>报修人联系方式</th>
                <th>报修小区</th>
                <th>报修类型</th>
                <th>报修状态</th>
                <th>报修时间</th>
                <th width="300">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="index">1</c:set>
	      	<c:forEach items="${repairlist}" var="repa">
	      	<tr data-id="${index }">
	      		<td>${index }</td>
                <td>${repa.repairname }</td>
                <td>${repa.repairtelephone }</td>
                <td>${repa.villagename }</td>
                <td>${repa.repairtypes }</td>
                <td>${repa.rstates }</td>
                <td>${repa.createtimes }</td>
                <td>
                <a href="/<%=PropKit.get("project_name") %>/admin/repair/imagelist?id=${repa.id }" class="btn btn-green" data-toggle="navtab" data-id="info_image"  data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？"  data-title="报修图片列表">图片列表</a>
                <c:if test="${repa.rstate == 1 }">
                <a href="/<%=PropKit.get("project_name") %>/admin/repair/handle?id=${repa.id }" class="btn btn-green" data-toggle="navtab" data-id="info_edit" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="处理">处理</a>
                </c:if>
                <c:if test="${repa.rstate != 1 }">
                <a href="/<%=PropKit.get("project_name") %>/admin/repair/view?id=${repa.id }" class="btn btn-green" data-toggle="navtab" data-id="info_view"  data-title="查看">查看</a>
                </c:if>
                <a href="/<%=PropKit.get("project_name") %>/admin/repair/del?id=${repa.id }" class= "btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                </td>
            </tr>
	      	<c:set var="index">${index + 1}</c:set>
	      	</c:forEach>
            
        </tbody>
    </table>
    <input type="hidden" id ="states" value="${state }" />
    <input type="hidden" id ="repairtypes" value="${repairtype }" />
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
			$("#repairtype option[value=" + $("#repairtypes").val() + "]").attr("selected", true);
			
		});
function exportExcel(){
	var repairtype = $("select[name = 'repairtype'] option:selected").val();
	var state = $("select[name = 'state'] option:selected").val();
	var building = $("#building").val();
	var unit = $("#unit").val();
	var floor = $("#floor").val();
	var number = $("#number").val();
	var pageSize = $("#pageSize").val();
	var pageCurrent = $("#pageCurrent").val();
	var url = "/<%=PropKit.get("project_name") %>/admin/repair/exportExcel?repairtype="+repairtype+"&state="+state+"&building="+building+"&unit="+unit
	+"&floor="+floor+"&number="+number+"&pageSize="+pageSize+"&pageCurrent="+pageCurrent;
	window.location.href=url;	

	
	
}
</script>