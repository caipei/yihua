<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <tbody>
	      	<tr>
                <td><a onclick="ztxl_add(1)" href="javascript:;">幻灯片</a></td>
            </tr>
            <tr>
                <td><a onclick="ztxl_add(2)" href="javascript:;">一个</a></td>
            </tr>
            <tr>
                <td><a onclick="ztxl_add(3)" href="javascript:;">左大右小</a></td>
            </tr>
            <tr>
                <td><a onclick="ztxl_add(4)" href="javascript:;">左小又大</a></td>
            </tr>
            <tr style="display:none;">
                <td><a onclick="ztxl_add(5)" href="javascript:;">两个均分</a></td>
            </tr>
            <tr>
                <td><a onclick="ztxl_add(6)" href="javascript:;">三个</a></td>
            </tr>
        </tbody>
    </table>
</div>
<div id="ztlx_dialog_footer" class="bjui-pageFooter">
    <ul>
        <li><button id="close" type="button" class="btn-close" data-icon="close">取消</button></li>
    </ul>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
});

function ztxl_add(type) {
	
	$.CurrentNavtab.navtab({id:'brand_theme_ztxl_add', url:'/<%=PropKit.get("project_name") %>/admin/brand/ztxl_add?type=' + type, title:'新增主题类型'});
	$('#ztlx_dialog_footer #close').click();
}
</script>
