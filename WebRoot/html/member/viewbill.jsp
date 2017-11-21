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
	            <label class="control-label">账单信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="username" class="control-label x85">客户姓名：</label>
	            ${username }
	        </td>
	        <td>
	            <label for="billtypes" class="control-label x85">账单类型：</label>
	            ${billtypes }
	        </td>
	        </tr>
    	<tr>
	        <td>
	            <label for="billno" class="control-label x85">账单号：</label>
	           ${billno }
	        </td>
	        <td>
	            <label for="paytypes" class="control-label x85">支付方式：</label>
	            ${paytypes }
	        </td>
	        </tr>
    	<tr>
	         <td>
	            <label for="paymentno" class="control-label x85">缴费号：</label>
	            ${paymentno }
	        </td>
	        <td>
	            <label for="paymentinstruction" class="control-label x85">缴费说明：</label>
	            ${paymentinstruction }
	        </td>
        </tr>
        <tr>
	         <td>
	            <label for="cost" class="control-label x85">支付金额：</label>
	            ${cost }
	        </td>
	        <td>
	            <label for="rstates" class="control-label x85">支付状态：</label>
	            ${rstates }
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
