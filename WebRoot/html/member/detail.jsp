<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/member" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">客户信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="username" class="control-label x85">客户姓名：</label>
	            ${username }
	        </td>
	        <td>
	            <label for="mobile" class="control-label x85">联系方式：</label>
	            ${mobile }
	        </td>
	        </tr>
    	<tr>
	        <td>
	            <label for="sex" class="control-label x85">性别：</label>
	            <c:if test="${sex == 1 }">
	            	男
	            </c:if>
	            <c:if test="${sex != 1 }">
	                                                         女
	            </c:if>
	        </td>
	        <td>
	            <label for="address" class="control-label x85">住址：</label>
	            ${address }
	        </td>
	        </tr>
    	<tr>
	         <td>
	            <label for="housearea" class="control-label x85">住房面积：</label>
	            ${housearea }
	        </td>
	        <td>
	            <label for="villagename" class="control-label x85">所在小区：</label>
	            ${villagename }
	        </td>
        </tr>
        <tr>
	         <td>
	            <label for="building" class="control-label x85">小区栋数：</label>
	            ${building }
	        </td>
	        <td>
	            <label for="unit" class="control-label x85">单元楼：</label>
	            ${unit }
	        </td>
        </tr>
        <tr>
	         <td>
	            <label for="floor" class="control-label x85">楼层数：</label>
	            ${floor }
	        </td>
	        <td>
	            <label for="number" class="control-label x85">门牌号：</label>
	            ${number }
	        </td>
        </tr>
        </tbody>
    </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">返回</button></li>
    </ul>
</div>
