<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/repair/submit" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">报修信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="repairname" class="control-label x85">报修联系人：</label>
	            ${repairname }
	        </td>
	        <td>
	            <label for="repairtelephone" class="control-label x85">报修人联系方式：</label>
	            ${repairtelephone }
	        </td>
	        </tr>
    	<tr>
    	<td>
    	 <label for="villagename" class="control-label x85">报修小区：</label>
	            ${villagename }
    	</td>
	        <td>
	            <label for="repairtype" class="control-label x85">报修类型：</label>
	            <c:if test="${repairtype == 1 }">
	            	公共部位报修 
	            </c:if>
	            <c:if test="${repairtype == 2 }">
	                                                       自用部位报修
	            </c:if>
	        </td>
	        
	        </tr>
	        <tr>
	        <td colspan="3">
	            <label for="content" class="control-label x85">报修内容：</label>
	            <textarea name="content" cols=100 rows=10 disabled="disabled">
	            ${content }
	            </textarea>
	        </td>
	        </tr>
        </tbody>
        <input type="hidden" value="${id }" id="id" name="id"/>
    </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="submit" class="btn-default" data-icon="save">处理报修</button></li>
        <li><button type="button" class="btn-close" data-icon="close">返回</button></li>
    </ul>
</div>
