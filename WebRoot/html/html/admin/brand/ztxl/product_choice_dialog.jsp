<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div id="product_choice_dialog_header" class="bjui-pageHeader">
</div>
<div id="product_choice_dialog_content" class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="20">#</th>
                <th width="300">名称</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${infolist }" var="info">
        <tr>
			<td><input type="radio" name="product_choice_dialog_radio" objname="${info.name }" id="radio_${info.id }" value="${info.id }" data-toggle="icheck"></td>
			<td>${info.name }</td>
		</tr>
		</c:forEach>
        </tbody>
    </table>
</div>
<div id="product_choice_dialog_footer" class="bjui-pageFooter">
    <ul>
        <li><button id="close" type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button id="submit" type="button" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<input type="hidden" id="controlname" name="controlname" value="${controlname }" />
<script type="text/javascript">
$(document).ready(function(){
	
	$('#product_choice_dialog_footer #submit').click(function() {
		var checkedid = $('#product_choice_dialog_content input[type="radio"][name="product_choice_dialog_radio"]:checked').val();
		if ($.isEmptyObject(checkedid)) {
			return;
		}
		var controlname = $('#controlname').val();
		$('#brand_ztxl_addform #' + controlname + '_dialog_id').val(checkedid);
		var objname = $('#product_choice_dialog_content #radio_' + checkedid).attr('objname');
		var content = '<a href="/<%=PropKit.get("project_name") %>/brand/product?id='+checkedid+'" class= "btn btn-green" target="_blank">'+objname+'</a>';
		$('#brand_ztxl_addform #' + controlname + '_dialog_span').html(content);
		$('#product_choice_dialog_footer #close').click();
	});
});
</script>