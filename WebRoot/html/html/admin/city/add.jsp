<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/city/submit/" id="city_addform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
    	<tr>
	        <td>
	            <label for="name" class="control-label x85">名称：</label>
	            <input type="text" name="name" id="name" value="" placeholder="名称" size="80">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="names" class="control-label x85">名称：</label>
	            <textarea style="width: 800px;height:100px" id="names" name="names"></textarea>
	        </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" id="pid" name="pid" value="${pid }"> 
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
});
	
</script>