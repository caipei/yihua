<%@page import="com.jfinal.kit.PropKit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/updatepwd/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
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

        </tbody>
    </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
