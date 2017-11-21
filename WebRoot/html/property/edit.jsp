<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/property/update/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">物业公司信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="propertyname" class="control-label x200" >物业公司名称：</label>
	            <input type="text" name="propertyname" id="propertyname" value="${propertyname }" data-rule="物业公司名称:required;" size="15">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="propertyaddress" class="control-label x200">物业公司地址：</label>
	            <input type="text" name="propertyaddress" id="propertyaddress" value="${propertyaddress }"  size="60">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="leadingoffical" class="control-label x200">物业公司负责人：</label>
	            <input type="text" name="leadingoffical" id="leadingoffical" value="${leadingoffical }"  size="15">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="leadingmobile" class="control-label x200">负责人联系方式：</label>
	           <input type="text" name="leadingmobile" id="leadingmobile" value="${leadingmobile }"  size="15">
	        </td>
	     </tr>
				
        </tbody>
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

</script>