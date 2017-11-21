<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/owner/submit/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">业主信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="ownername" class="control-label x200">业主名称：</label>
	            <input type="text" name="ownername" id="ownername" value="" data-rule="业主名称:required;" size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="mobile" class="control-label x200">业主联系方式：</label>
	            <input type="text" name="mobile" id="mobile" value=""  size="25">
	        </td>
	     </tr>
	    <tr>
	        <td>
	            <label for="villagedd" class="control-label x200">小区名：</label>
	            <select name="villageid" id="villageid" data-toggle="selectpicker" >
	            <c:forEach items="${villagelist }" var="vill">
	            <option value="${vill.id }">${ vill.villagename}</option>
	            </c:forEach>
					</select>
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="building" class="control-label x200">小区栋数：</label>
	            <input type="text" name="building" id="building" value=""  size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="unit" class="control-label x200">单元数：</label>
	           <input type="text" name="unit" id="unit" value=""  size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="floor" class="control-label x200">楼层数：</label>
	           <input type="text" name="floor" id="floor" value=""  size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="number" class="control-label x200">门牌号：</label>
	           <input type="text" name="number" id="number" value=""  size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="housingarea" class="control-label x200">住房面积：</label>
	           <input type="text" name="housingarea" id="housingarea" value=""  size="25" onkeyup="Num(this)" >
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="decorations" class="control-label x200">装修情况：</label>
	            <select name="decoration" id="decoration" data-toggle="selectpicker" >
	            <option value="1">毛坯</option>
	            <option value="2">简装</option>
	            <option value="3">精修</option>
	            <option value="4">豪装</option>
					</select>
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="repossessions" class="control-label x200">收楼情况：</label>
	            <select name="repossession" id="repossession" data-toggle="selectpicker" >
	            <option value="1">未收楼</option>
	            <option value="2">已收楼</option>
					</select>
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="checkstas" class="control-label x200">入住情况：</label>
	            <select name="checksta" id="checksta" data-toggle="selectpicker" >
	            <option value="1">未入住</option>
	            <option value="2">已入住</option>
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
<script type="text/javascript">
function Num(obj){
	obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
	obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是
	obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
	obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
	obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
	}
</script>