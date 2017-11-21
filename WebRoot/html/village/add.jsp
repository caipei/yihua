<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/village/submit/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">小区信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="villagename" class="control-label x200">小区名称：</label>
	            <input type="text" name="villagename" id="villagename" value="" data-rule="小区名称:required;" size="15">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="villageaddress" class="control-label x200">小区地址：</label>
	            <input type="text" name="villageaddress" id="villageaddress" value=""  size="60">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="leadingoffical" class="control-label x200">小区物业：</label>
	            <select name="proid" id="proid" data-toggle="selectpicker" >
	            <c:forEach items="${propertylist }" var="pro">
	            <option value="${pro.id }">${ pro.propertyname}</option>
	            </c:forEach>
					</select>
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
