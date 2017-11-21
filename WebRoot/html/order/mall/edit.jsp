<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/good/mallgood/update/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">订单信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="orderno" class="control-label x85">订单号：</label>
	           ${orderno}
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="cost" class="control-label x85">客户名称：</label>
	            ${khxm}
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="cost" class="control-label x85">联系方式：</label>
	            ${lxfs}
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="expresscompany" class="control-label x85">快递公司：</label>
	            <input type="text" name="expresscompany" id="expresscompany" value="${expresscompany}"  size="25">
	        </td>
	     </tr>
	      <tr>
	        <td>
	            <label for="expressno" class="control-label x85">快递单号：</label>
	            <input type="text" name="expressno" id="expressno" value="${expressno}"  size="50">
	        </td>
	     </tr>
        </tbody>
    </table>
     <input id = "orderid" value="${orderid }" type ="hidden" name="orderid"/>
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