<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/leysen/yzcczx/update_num" id="leysen_yzcczx_num_editform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
    	<tr>
	        <td>
	            <label for="content" class="control-label x100">届数：</label>
	            <input type="number" name="num" id="num" value="${num }" data-rule="届数:required;" placeholder="届数">
	        </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" id="id" name="id" value="${id }">
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button id="leysen_yzcczx_num_submit" type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
});

</script>