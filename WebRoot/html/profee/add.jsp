<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/villageprofee/submit/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
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
	            <input type="text" name="profee" id="profee" value=""  size="25" onkeyup="Num(this)">
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
<script type="text/javascript">
function Num(obj){
	obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
	obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是
	obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
	obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
	obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
	}
</script>
