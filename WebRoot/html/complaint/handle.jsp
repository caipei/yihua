<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/complaint/submit" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">投诉信息</label>
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
	            <label for="complaintstype" class="control-label x85">投诉类型：</label>
	            <c:if test="${complaintstype == 1 }">
	            	设备投诉
	            </c:if>
	            <c:if test="${complaintstype == 2 }">
	                                                       管理服务投诉
	            </c:if>
	            <c:if test="${complaintstype == 3 }">
	                                                        收费投诉
	            </c:if>
	            <c:if test="${complaintstype == 4 }">
	                                                        突发事件投诉
	            </c:if>
	        </td>
	        <td>
	            <label for="complaintscontent" class="control-label x85">投诉内容：</label>
	            ${complaintscontent }
	        </td>
	        </tr>
        </tbody>
        <input type="hidden" value="${id }" id="id" name="id"/>
    </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="submit" class="btn-default" data-icon="save">处理完成</button></li>
        <li><button type="button" class="btn-close" data-icon="close">暂不处理</button></li>
    </ul>
</div>
