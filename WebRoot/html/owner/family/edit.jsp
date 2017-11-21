<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/owner/updatefamily/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
         <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">业主家庭成员信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="name" class="control-label x200">成员姓名：</label>
	            <input type="text" name="name" id="name" value="${name }" data-rule="成员姓名:required;" size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="relationship" class="control-label x200">与业主关系：</label>
	            <input type="text" name="relationship" id="relationship" value="${relationship }" data-rule="与业主关系:required;" size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="telephone" class="control-label x200">联系方式：</label>
	            <input type="text" name="telephone" id="telephone" value="${telephone }" data-rule="联系方式:required;" size="25">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="idcard" class="control-label x200">身份证号：</label>
	           <input type="text" name="idcard" id="idcard" value="${idcard }" data-rule="身份证号:required;" size="25">
	        </td>
	     </tr>
        </tbody>
    </table>
     <input id = "familyid" value="${familyid }" type ="hidden" name="familyid"/>
     <input id = "ownerid" value="${ownerid }" type ="hidden" name="ownerid"/>
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