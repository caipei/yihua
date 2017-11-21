<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/city/update/" id="city_editform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
    	<tr>
	        <td>
	            <label for="name" class="control-label x85">名称：</label>
	            <input type="text" name="name" id="name" value="${name }" data-rule="名称:required;" placeholder="名称" size="80">
	        </td>
        </tr>
        <tr>
        	<td>
	            <label for="name" class="control-label x85">热点城市：</label>
	            <select name="hot_sel" id="hot_sel" data-toggle="selectpicker" data-rule="required">
                    <option value="0">否</option>
                    <option value="1">是</option>
                </select>
	        </td>
	    </tr>
        </tbody>
    </table>
    <input type="hidden" id="id" name="id" value="${id }" />
    <input type="hidden" id="ishot" name="ishot" value="${ishot }" />
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button id="city_update" type="button" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#city_editform #hot_sel option[value="+$("#city_editform #ishot").val()+"]").attr("selected", true);
	
	$("#city_update").click(function() {
		$("#city_editform").submit();
	});
});
	
</script>