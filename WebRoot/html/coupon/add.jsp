<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/coupon/submit/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">优惠券信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	           <label for="choosetype_sel" class="control-label x85">优惠券发放策略：</label>
	            <select name="choosetype_sel" id="choosetype_sel" data-toggle="selectpicker" onchange="changetype();">
                    <option value="1">全员发放</option>
                    <option value="2">按手机号发放</option>
                </select>
	        </td>
	     </tr>
	     <tr style="display: none" id="mobilestr">
	        <td>
	            <label for="mobile" class="control-label x85">手机号码：</label>
	            <input type="text" name="mobile" id="mobile" value=""  size="15">
	        </td>
	     </tr>
	     <tr>
	        <td>
	             <label for="amount" class="control-label x85">优惠券金额：</label>
	            <input type="text" name="amount" id="amount" value=""  size="15">
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
function changetype(){
	var s = $("#choosetype_sel").find("option:selected").val();
	if(s == 1){
		$("#mobilestr").hide();
	}else if(s == 2){
		$("#mobilestr").show();
	}
}
	
</script>