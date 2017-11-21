<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/villageprofee/update/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">小区物业费信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="villagename" class="control-label x200">小区名称：</label>
	             <select name="villageid" id="villageid" data-toggle="selectpicker" >
	            <c:forEach items="${villagelist }" var="vill">
	            <option value="${vill.id }">${ vill.villagename}</option>
	            </c:forEach>
					</select>
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="profee" class="control-label x200">物业费标准：</label>
	            <input type="text" name="profee" id="profee" value="${profee }"  size="25" onkeyup="Num(this)">
	        </td>
	     </tr>
	     
        </tbody>
        <input type="hidden" name="villid" id="villid"
			value="${villageid }" /> 
    </table>
     <input id = "id" value="${id }" type ="hidden" name="id"/>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(
		function() {
			$("#villageid option[value=" + $("#villid").val() + "]").attr("selected", true);
		});

</script>