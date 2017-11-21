<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/user/update/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
    	<tr>
	        <td>
	            <label for="" class="control-label x85">用户名：</label>
	            <input type="text" name="username" id="username" value="${username }" data-rule="用户名:required;" disabled size="30">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="" class="control-label x85">密码：</label>
	            <input type="password" name="password" id="password" value="" data-rule="密码:required" size="30">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="" class="control-label x85">确认密码：</label>
	            <input type="password" name="password-qr" id="password-qr" value="" data-rule="确认密码:required;match(password)" size="30">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="" class="control-label x85">昵称：</label>
	            <input type="text" name="nickname" id="nickname" value="${nickname }" data-rule="昵称:required" size="30">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="" class="control-label x85">角色：</label>
	            <select name="role_sel" id="role_sel" data-toggle="selectpicker" data-rule="required" onchange="change()">
	            	<c:forEach items="${rolelist}" var="role">
                    <option value="${role.id }">${role.rolename }</option>
                    </c:forEach>
                </select>
	        </td>
        </tr>
         <tr id="propll" style="display:none">
	        <td>
	            <label for="" class="control-label x85">物业公司：</label>
	            <select name="pro_sel" id="pro_sel" data-toggle="selectpicker" data-rule="required">
	            	<c:forEach items="${propertylist}" var="prop">
                    <option value="${prop.id }">${prop.propertyname }</option>
                    </c:forEach>
                </select>
	        </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" id="userid" name="userid" value="${userid}" />
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<input type="hidden" id="roleid" value="${roleid}" />
<input type="hidden" id="propertyid" value="${propertyid}" />
<script type="text/javascript">
$(document).ready(function(){
	$("#role_sel option[value="+$("#roleid").val()+"]").attr("selected", true);
	$("#pro_sel option[value="+$("#propertyid").val()+"]").attr("selected", true);
	var role = $("#role_sel option:selected").text();
	if(role == "物业公司"){
		$("#propll").show();
	}else{
		$("#propll").hide();
	}
});
function change(){
	var role = $("#role_sel option:selected").text();
	if(role == "物业公司"){
		$("#propll").show();
	}else{
		$("#propll").hide();
	}
}
</script>
